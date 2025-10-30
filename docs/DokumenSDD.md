# Software Design Document (SDD) - Aplikasi BelanjaPraktis

**Versi:** 2.0
**Tanggal:** 10 Oktober 2025

---

### 1. Pendahuluan

#### 1.1 Tujuan
Dokumen ini merinci desain teknis tingkat tinggi dan tingkat rendah untuk aplikasi "BelanjaPraktis". Tujuannya adalah untuk menjadi panduan bagi tim pengembang dalam mengimplementasikan sistem sesuai dengan arsitektur yang telah disepakati. Dokumen ini merupakan terjemahan dari persyaratan yang tercantum dalam SRS (Software Requirements Specification) v.1.0 ke dalam spesifikasi desain teknis.

#### 1.2 Ruang Lingkup
Desain yang dijelaskan dalam dokumen ini mencakup struktur arsitektur, desain komponen, desain database, dan strategi penanganan error untuk versi 1.0 aplikasi. Ini mencakup semua fungsionalitas yang didefinisikan dalam SRS, termasuk pengelolaan daftar dan item, kalkulasi total, fitur AI untuk saran item, pengelolaan Stok Rumahku, dan monetisasi.

#### 1.3 Referensi
*   Software Requirements Specification (SRS) - BelanjaPraktis v1.0
*   Product Requirement Document (PRD) - BelanjaPraktis v1.0
*   Dokumen Skema Database - BelanjaPraktis v1.0

---

### 2. Desain Arsitektur

#### 2.1 Pola Arsitektur: Layered Architecture
Aplikasi ini akan mengadopsi pola **Layered Architecture** untuk memisahkan *concerns* dan meningkatkan *maintainability*, *scalability*, dan *testability*. Arsitektur ini akan dibagi menjadi tiga lapisan utama:

1.  **Presentation Layer (Lapisan Presentasi):**
    *   **Tanggung Jawab:** Menampilkan UI (Widgets) dan menangani input dari pengguna. Lapisan ini juga berisi komponen state management (BLoC) yang merespons interaksi pengguna dan pembaruan data.
    *   **Komponen:** Widgets (Screens), State Management (BLoC).
    *   **Teknologi:** Flutter, flutter_bloc.

2.  **Business Logic Layer (Lapisan Logika Bisnis):**
    *   **Tanggung Jawab:** Berisi logika bisnis inti aplikasi. Lapisan ini mendefinisikan "kontrak" untuk pengambilan data melalui *Repository Interfaces* dan berisi model data domain (*Entities*).
    *   **Komponen:** Entities, Repository Interfaces.
    *   **Teknologi:** Dart murni, Freezed, Fpdart.

3.  **Data Layer (Lapisan Data):**
    *   **Tanggung Jawab:** Mengelola pengambilan dan penyimpanan data dari berbagai sumber (dalam kasus ini, database lokal). Lapisan ini mengimplementasikan *interface* repository yang didefinisikan di Business Logic Layer.
    *   **Komponen:** Repository Implementations, Data Sources (Local), Data Transfer Objects (DTOs).
    *   **Teknologi:** Drift.

**Aliran Ketergantungan:** `Presentation` → `Business Logic` ← `Data`. Lapisan Business Logic tidak bergantung pada lapisan lainnya.

#### 2.2 Diagram Komponen Tingkat Tinggi

```
[ Antarmuka Pengguna (UI Widgets) ]
     |           ^
(User Events)    | (State Updates)
     |           |
     V           |
[ BLoC (State Management) ]
     |
     | (Memanggil metode)
     V
[ Repository Interface (Business Logic) ]
     ^
     | (Implementasi)
     |
[ Repository Implementation (Data) ]
     |
     V
[ Local Data Source (Drift) ]
     |
     V
[ SQLite Database ]

[ AI Service/Repository (Eksternal) ]

[ Stok Rumahku Service/Repository (Eksternal) ]
```

---

### 3. Desain Rinci

#### 3.1 Presentation Layer
*   **Struktur UI (Views/Widgets):** UI akan dibangun menggunakan Flutter. Setiap layar (misalnya, `ShoppingListsScreen`, `ListDetailScreen`, `StokRumahkuScreen`) akan menggunakan widget dari pustaka `flutter_bloc` seperti `BlocProvider`, `BlocBuilder`, dan `BlocListener` untuk terhubung dengan BLoC dan bereaksi terhadap perubahan *state*. `ShoppingListsScreen` akan menyediakan opsi untuk membuat daftar baru secara manual atau dengan bantuan AI (memasukkan tema untuk saran item).
*   **Manajemen State (State Management):** **BLoC (Business Logic Component)** akan digunakan untuk mengelola state aplikasi. Pola ini memisahkan logika bisnis dari UI dengan jelas.
    *   **Event:** Kelas-kelas sederhana yang merepresentasikan aksi pengguna atau kejadian sistem (misalnya, `LoadShoppingLists`, `AddListRequested`, `GenerateListFromAI`, `LoadStokRumahkuItems`). Event dikirim dari UI ke BLoC.
    *   **State:** Kelas *immutable* yang merepresentasikan kondisi UI pada satu waktu (misalnya, `ShoppingListLoading`, `ShoppingListLoaded`, `ShoppingListError`, `StokRumahkuLoaded`). UI akan me-*render* dirinya sendiri berdasarkan *state* saat ini.
    *   **Bloc:** Kelas utama yang menerima *Events*, memprosesnya (dengan bantuan *repositories* dan *AI service*), dan mengeluarkan *States* baru. BLoC akan berisi logika untuk memetakan event ke state.

#### 3.2 Business Logic Layer
*   **Entities:** Entitas bisnis inti (misalnya, `ShoppingList`, `ShoppingItem`) akan didefinisikan sebagai kelas *immutable* menggunakan `freezed`. Entitas ini mewakili objek bisnis murni.
*   **Repository Interfaces:** *Abstract class* akan mendefinisikan "kontrak" untuk operasi data (CRUD) dan interaksi dengan AI serta Stok Rumahku. Misalnya, `ShoppingListRepository` akan memiliki metode seperti `Future<Either<Failure, void>> addList(ShoppingList list)` atau `Stream<List<ShoppingList>> watchAllLists()`, `AIRepository` akan memiliki metode seperti `Future<Either<Failure, List<ShoppingItem>>> generateShoppingItems(String theme)`, dan `StokRumahkuRepository` akan memiliki metode seperti `Future<Either<Failure, void>> addStokRumahkuItem(StokRumahkuItem item)` atau `Stream<List<StokRumahkuItem>> watchAllStokRumahkuItems()`. BLoC akan bergantung pada interface ini, bukan pada implementasinya.

#### 3.3 Data Layer
*   **Data Sources:** Akan ada tiga sumber data utama: `LocalDataSource`, `AIDataSource`, dan `StokRumahkuDataSource`. `LocalDataSource` akan berinteraksi langsung dengan database SQLite menggunakan Drift. `AIDataSource` akan bertanggung jawab untuk berkomunikasi dengan API AI eksternal. `StokRumahkuDataSource` akan mengelola data untuk fitur Stok Rumahku.
*   **Data Models (Tables):** Drift akan digunakan untuk mendefinisikan skema tabel database. Model ini akan berbeda dari *Domain Entities*.
*   **Repository Implementations:** Kelas ini akan mengimplementasikan *Repository Interfaces* dari Business Logic Layer. Tanggung jawabnya adalah:
    1.  Memanggil metode yang sesuai pada `LocalDataSource`, `AIDataSource`, atau `StokRumahkuDataSource`.
    2.  Menangkap data dari database (dalam bentuk *Data Models* Drift) atau dari respons API AI.
    3.  Memetakan (*map*) *Data Models* atau respons API ke *Domain Entities*.
    4.  Menangani *exception* dari database atau API dan mengubahnya menjadi tipe *Failure* yang telah didefinisikan.

#### 3.4 Penanganan Error (Error Handling)
*   Aplikasi akan menggunakan pustaka `fpdart` dengan tipe `Either<L, R>` untuk menangani operasi yang dapat gagal.
*   **L (Left):** Mewakili kegagalan. Akan dibuat sebuah kelas `Failure` dengan sub-kelas spesifik (misalnya, `DatabaseFailure`).
*   **R (Right):** Mewakili keberhasilan dan berisi data yang diharapkan.
*   **Alur:** Data Layer akan mengembalikan `Either`. BLoC akan memanggil metode repository, menerima `Either`, dan melakukan `fold` untuk memetakan hasilnya ke `State` yang sesuai (misalnya, `ShoppingListError` atau `ShoppingListLoaded`).

---

### 4. Desain Database
Desain database akan mengikuti skema yang telah didefinisikan, menggunakan Drift untuk mengelola database SQLite.
*   **Tabel Utama:** `shopping_lists`, `shopping_items`, dan **`stok_rumahku_items`**.
*   **Relasi:**
    *   `shopping_lists` (one) → `shopping_items` (many)
*   **Integritas Data:** *Foreign key constraints* dengan `ON DELETE CASCADE` akan digunakan untuk memastikan integritas data. Tabel `stok_rumahku_items` akan menjadi tabel independen yang menyimpan data item yang sudah dibeli, dengan kolom yang disederhanakan (hanya `id`, `name`, `added_at`).

---

### 5. Struktur Direktori Proyek

Struktur direktori akan diatur dengan pendekatan yang lebih sederhana dan mudah dikelola, memprioritaskan kejelasan dan mengurangi kompleksitas.

```
belanja_praktis/
├── lib/
│   ├── data/                   # Semua yang berhubungan dengan data (database, model, repository)
│   │   ├── app_database.dart     # Definisi database Drift & semua tabel
│   │   ├── models/               # Semua model data (dari Freezed)
│   │       ├── shopping_list.dart
│   │       ├── shopping_item.dart
│   │       └── pantry_item.dart
│   │   └── repositories/         # Implementasi repository
│   │       ├── shopping_list_repository.dart
│   │       ├── pantry_repository.dart
│   │       └── ai_repository.dart # Repository untuk interaksi dengan AI
│   │
```
