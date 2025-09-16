# Software Design Document (SDD) - Aplikasi Daftar Belanjaku

**Versi:** 1.0
**Tanggal:** 16 September 2025

---

### 1. Pendahuluan

#### 1.1 Tujuan
Dokumen ini merinci desain teknis tingkat tinggi dan tingkat rendah untuk aplikasi "BelanjaPraktis". Tujuannya adalah untuk menjadi panduan bagi tim pengembang dalam mengimplementasikan sistem sesuai dengan arsitektur yang telah disepakati. Dokumen ini merupakan terjemahan dari persyaratan yang tercantum dalam SRS (Software Requirements Specification) v.1.0 ke dalam spesifikasi desain teknis.

#### 1.2 Ruang Lingkup
Desain yang dijelaskan dalam dokumen ini mencakup struktur arsitektur, desain komponen, desain database, dan strategi penanganan error untuk versi 1.0 aplikasi. Ini mencakup semua fungsionalitas yang didefinisikan dalam SRS, termasuk pengelolaan daftar dan item, kalkulasi total, template, dan monetisasi.

#### 1.3 Referensi
*   Software Requirements Specification (SRS) - BelanjaPraktis v1.0
*   Product Requirement Document (PRD) - BelanjaPraktis v1.0
*   Dokumen Skema Database - BelanjaPraktis v1.0

---

### 2. Desain Arsitektur

#### 2.1 Pola Arsitektur: Clean Architecture
Aplikasi ini akan mengadopsi pola **Clean Architecture** untuk memisahkan *concerns* dan meningkatkan *maintainability*, *scalability*, dan *testability*. Arsitektur ini akan dibagi menjadi tiga lapisan utama:

1.  **Presentation Layer (Lapisan Presentasi):**
    *   **Tanggung Jawab:** Menampilkan UI dan menangani input dari pengguna. Lapisan ini tidak boleh berisi logika bisnis apa pun.
    *   **Komponen:** Widgets (Views), State Management (Notifiers/ViewModels).
    *   **Teknologi:** Flutter, Riverpod.

2.  **Domain Layer (Lapisan Domain):**
    *   **Tanggung Jawab:** Berisi logika bisnis inti aplikasi (Use Cases/Interactors) dan definisi entitas bisnis. Lapisan ini murni dan tidak bergantung pada lapisan lain (termasuk Flutter).
    *   **Komponen:** Entities, Repository Interfaces, Use Cases.
    *   **Teknologi:** Dart murni, Freezed, Fpdart.

3.  **Data Layer (Lapisan Data):**
    *   **Tanggung Jawab:** Mengelola pengambilan dan penyimpanan data dari sumber data (database lokal). Lapisan ini mengimplementasikan *interface* repository yang didefinisikan di Domain Layer.
    *   **Komponen:** Repository Implementations, Data Sources (Local/Remote), Data Transfer Objects (DTOs).
    *   **Teknologi:** Drift.

**Aliran Ketergantungan:** `Presentation` → `Domain` ← `Data`. Lapisan Domain tidak mengetahui keberadaan lapisan lainnya.

#### 2.2 Diagram Komponen Tingkat Tinggi

```
[ Antarmuka Pengguna (UI) ] <--> [ State Management (Riverpod) ]
              |
              V
      [ Use Cases (Domain) ]
              |
              V
[ Repository Interfaces (Domain) ]
              ^
              | (Implementasi)
              |
    [ Repositories (Data) ]
              |
              V
   [ Local Data Source (Drift) ]
              |
              V
       [ SQLite Database ]
```

---

### 3. Desain Rinci

#### 3.1 Presentation Layer
*   **Struktur UI (Views/Widgets):** UI akan dibangun menggunakan Flutter. Setiap layar (misalnya, `ShoppingListsScreen`, `ListDetailScreen`) akan menjadi `ConsumerWidget` atau `ConsumerStatefulWidget` dari Riverpod. Widget akan bersifat *declarative* dan hanya akan bereaksi terhadap perubahan *state*.
*   **Manajemen State (State Management):** Riverpod, dengan `riverpod_generator`, akan digunakan untuk mengelola *state*. Untuk setiap fitur atau layar yang memiliki *state* kompleks, akan dibuat sebuah `Notifier` atau `AsyncNotifier`. *Notifier* ini akan:
    1.  Memanggil *Use Cases* dari Domain Layer untuk menjalankan logika bisnis.
    2.  Menerima hasil (data atau error) dari *Use Cases*.
    3.  Memperbarui *state* yang kemudian akan didengarkan oleh UI untuk di-*render* ulang.
*   **Navigasi:** `GoRouter` akan digunakan untuk menangani semua navigasi dalam aplikasi. Konfigurasi rute akan terpusat, mendefinisikan semua jalur, parameter (seperti `listId`), dan transisi halaman.

#### 3.2 Domain Layer
*   **Entities:** Entitas bisnis inti (misalnya, `ShoppingList`, `ShoppingItem`) akan didefinisikan sebagai kelas *immutable* menggunakan `freezed`. Entitas ini mewakili objek bisnis murni tanpa anotasi atau logika yang terkait dengan database atau UI.
*   **Repository Interfaces:** *Abstract class* akan mendefinisikan "kontrak" untuk operasi data (CRUD). Misalnya, `ShoppingListRepository` akan memiliki metode seperti `Future<Either<Failure, void>> addList(ShoppingList list)` atau `Stream<List<ShoppingList>> watchAllLists()`.
*   **Use Cases (Interactors):** Setiap aksi pengguna yang melibatkan logika bisnis akan dienkapsulasi dalam kelas *Use Case* tersendiri. Contoh: `AddShoppingListUseCase`, `GetItemsForListUseCase`, `ToggleItemBoughtStatusUseCase`. Setiap *Use Case* akan memiliki satu metode publik (misalnya, `execute()`) dan akan bergantung pada satu atau lebih *Repository Interfaces*.

#### 3.3 Data Layer
*   **Data Sources:** Akan ada satu sumber data utama: `LocalDataSource`. Sumber data ini akan berinteraksi langsung dengan database SQLite menggunakan Drift. Ini akan berisi implementasi DAO (Data Access Objects) yang dihasilkan oleh Drift untuk melakukan operasi query ke database.
*   **Data Models (Tables):** Drift akan digunakan untuk mendefinisikan skema tabel database. Model ini akan berbeda dari *Domain Entities* dan mungkin berisi anotasi spesifik database.
*   **Repository Implementations:** Kelas ini akan mengimplementasikan *Repository Interfaces* dari Domain Layer. Tanggung jawabnya adalah:
    1.  Memanggil metode yang sesuai pada `LocalDataSource`.
    2.  Menangkap data dari database (dalam bentuk *Data Models* Drift).
    3.  Memetakan (*map*) *Data Models* ke *Domain Entities* sebelum mengembalikannya ke Domain Layer.
    4.  Menangani *exception* dari database dan mengubahnya menjadi tipe *Failure* yang telah didefinisikan.

#### 3.4 Penanganan Error (Error Handling)
*   Aplikasi akan menggunakan pustaka `fpdart` dengan tipe `Either<L, R>` untuk menangani operasi yang dapat gagal (misalnya, panggilan database).
*   **L (Left):** Mewakili kegagalan. Akan dibuat sebuah kelas `Failure` dengan sub-kelas spesifik (misalnya, `DatabaseFailure`).
*   **R (Right):** Mewakili keberhasilan dan berisi data yang diharapkan.
*   **Alur:** Data Layer akan mengembalikan `Either`. Domain Layer akan meneruskannya. Presentation Layer (Notifier) akan melakukan `fold` pada `Either` untuk memperbarui *state* UI menjadi kondisi error atau sukses.

---

### 4. Desain Database
Desain database akan mengikuti skema yang telah didefinisikan sebelumnya, menggunakan Drift untuk mengelola database SQLite.
*   **Tabel Utama:** `shopping_lists`, `shopping_items`, `item_categories`, `preset_items`.
*   **Relasi:**
    *   `shopping_lists` (one) → `shopping_items` (many)
    *   `item_categories` (one) → `preset_items` (many)
*   **Integritas Data:** *Foreign key constraints* dengan `ON DELETE CASCADE` akan digunakan untuk memastikan integritas data antara `shopping_lists` dan `shopping_items`, serta `item_categories` dan `preset_items`.

---

### 5. Struktur Direktori Proyek

Struktur direktori akan diatur berdasarkan fitur (*feature-first*) di dalam lapisan arsitektur.

```
belanja_praktis/
├── lib/
│   ├── core/                   # Kode inti yang tidak terkait fitur
│   │   ├── error/              # Definisi Failure, Exceptions
│   │   ├── usecases/           # Definisi UseCase generik
│   │   └── utils/              # Helper, Constants, Extensions
│   │
│   ├── features/               # Folder untuk setiap fitur aplikasi
│   │   └── shopping_list/      # Contoh fitur: daftar belanja
│   │       ├── data/
│   │       │   ├── datasources/ # Implementasi data source (local)
│   │       │   │   └── shopping_list_local_data_source.dart
│   │       │   ├── models/      # Model data untuk Drift (DTOs)
│   │       │   │   └── shopping_list_model.dart
│   │       │   └── repositories/ # Implementasi repository
│   │       │       └── shopping_list_repository_impl.dart
│   │       │
│   │       ├── domain/
│   │       │   ├── entities/    # Entitas bisnis (Freezed)
│   │       │   │   └── shopping_list.dart
│   │       │   ├── repositories/ # Interface repository
│   │       │   │   └── shopping_list_repository.dart
│   │       │   └── usecases/    # Logika bisnis
│   │       │       ├── add_shopping_list.dart
│   │       │       └── get_all_shopping_lists.dart
│   │       │
│   │       └── presentation/
│   │           ├── notifiers/     # State management (Riverpod Notifiers)
│   │           │   └── shopping_list_notifier.dart
│   │           └── screens/     # Layar/Halaman UI
│   │           │   ├── list_detail_screen.dart
│   │           │   └── shopping_lists_screen.dart
│   │           └── widgets/     # Widget yang dapat digunakan kembali untuk fitur ini
│   │               └── shopping_list_card.dart
│   │
│   ├── config/                 # Konfigurasi aplikasi
│   │   ├── router/             # Konfigurasi GoRouter
│   │   │   └── app_router.dart
│   │   └── theme/              # Konfigurasi tema (light/dark)
│   │       └── app_theme.dart
│   │
│   ├── data/                   # Konfigurasi database global
│   │   └── database/
│   │       └── app_database.dart # Definisi database Drift
│   │
│   ├── di/                     # Dependency Injection
│   │   └── service_locator.dart  # (Jika tidak murni Riverpod, opsional)
│   │
│   └── main.dart               # Titik masuk aplikasi
│
├── test/
│   ├── features/
│   │   └── shopping_list/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   └── ...
│
└── pubspec.yaml
```