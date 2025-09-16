### Checklist Timeline Sprint untuk MVP "Aplikasi Daftar Belanjaku"

#### Sprint 0: Fondasi & Penyiapan Proyek (Minggu 1-2)
*Tujuan: Menyiapkan seluruh kerangka kerja, arsitektur, dan alat yang dibutuhkan agar pengembangan fitur dapat berjalan lancar.*

-   [ ] **Inisialisasi Proyek:**
    -   [ ] Buat proyek Flutter baru.
    -   [ ] Inisialisasi Git repository.
-   [ ] **Manajemen Dependensi:**
    -   [ ] Tambahkan semua dependensi yang dibutuhkan ke `pubspec.yaml` (flutter, riverpod_generator, freezed, drift, go_router, fpdart, logger, dll).
-   [ ] **Struktur Proyek:**
    -   [ ] Buat struktur direktori sesuai SDD (Clean Architecture: `core`, `features`, `config`, `data`, `di`, `main.dart`).
-   [ ] **Konfigurasi Database:**
    -   [ ] Buat file definisi database menggunakan Drift (`app_database.dart`).
    -   [ ] Definisikan skema tabel untuk `shopping_lists` dan `shopping_items`.
    -   [ ] Pastikan *build runner* dapat menghasilkan kode Drift dengan benar.
-   [ ] **Konfigurasi Dasar Aplikasi:**
    -   [ ] Siapkan `main.dart` dengan `ProviderScope` dari Riverpod.
    -   [ ] Konfigurasi `GoRouter` dengan rute placeholder untuk layar utama dan layar detail.
    -   [ ] Buat file tema dasar (`AppTheme`) untuk *light* dan *dark mode*.

---

#### Sprint 1: Fungsionalitas Inti Daftar Belanja (CRUD Lists) (Minggu 3-4)
*Tujuan: Pengguna dapat membuat, melihat, mengedit, dan menghapus daftar belanja.*

-   [ ] **Domain Layer:**
    -   [ ] Buat *entity* `ShoppingList` menggunakan Freezed.
    -   [ ] Definisikan *interface* `ShoppingListRepository`.
    -   [ ] Buat *Use Cases*: `AddShoppingList`, `GetAllShoppingLists`, `UpdateShoppingList`, `DeleteShoppingList`.
-   [ ] **Data Layer:**
    -   [ ] Implementasikan `ShoppingListRepository` (`ShoppingListRepositoryImpl`).
    -   [ ] Buat `LocalDataSource` untuk `ShoppingList` yang berinteraksi dengan Drift DAO.
-   [ ] **Presentation Layer:**
    -   [ ] Buat `ShoppingListsScreen` untuk menampilkan semua daftar belanja.
    -   [ ] Buat `ShoppingListNotifier` (Riverpod) untuk mengelola *state* daftar belanja.
    -   [ ] Implementasikan UI untuk menampilkan daftar belanja dalam bentuk kartu (*card*).
    -   [ ] Implementasikan UI (dialog atau layar baru) untuk menambah daftar baru.
    -   [ ] Implementasikan fungsionalitas untuk menghapus daftar (termasuk dialog konfirmasi).
    -   [ ] Implementasikan fungsionalitas untuk mengedit nama daftar.
-   [ ] **Pengujian:**
    -   [ ] Tulis *unit test* untuk *Use Cases* dan *Repository*.

---

#### Sprint 2: Fungsionalitas Inti Item Belanja & Kalkulasi Total (Minggu 5-6)
*Tujuan: Pengguna dapat menambah, mengedit, menghapus, dan menandai item di dalam daftar, serta melihat total belanja.*

-   [ ] **Domain & Data Layers:**
    -   [ ] Buat *entity* `ShoppingItem`.
    -   [ ] Perbarui *interface* dan implementasi *repository* untuk menangani CRUD `ShoppingItem`.
    -   [ ] Buat *Use Cases* untuk item: `AddItem`, `GetItemsForList`, `UpdateItem`, `DeleteItem`.
-   [ ] **Presentation Layer:**
    -   [ ] Buat `ListDetailScreen` yang menerima `listId` sebagai parameter.
    -   [ ] Buat `ListDetailNotifier` untuk mengelola *state* item di dalam daftar.
    -   [ ] Implementasikan UI untuk menampilkan item-item belanja.
    -   [ ] Implementasikan UI (dialog atau layar baru) untuk menambah/mengedit item (nama, harga, kuantitas).
    -   [ ] Implementasikan fungsi *checkbox* untuk menandai item sebagai `is_bought`.
    -   [ ] Implementasikan logika di *Notifier* atau *view* untuk menghitung `Unchecked`, `Checked`, dan `Total` harga.
    -   [ ] Tampilkan hasil kalkulasi total di `ListDetailScreen`.
-   [ ] **Pengujian:**
    -   [ ] Tulis *unit test* untuk *Use Cases* item.
    -   [ ] Tulis *widget test* untuk memverifikasi logika kalkulasi total di UI.

---

#### Sprint 3: Template Preset & Peningkatan UX (Minggu 7-8)
*Tujuan: Memudahkan pengguna dengan menyediakan template dan meningkatkan pengalaman penggunaan dengan fitur ordering.*

-   [ ] **Fitur Template Preset:**
    -   [ ] **Data:** Definisikan dan implementasikan tabel `item_categories` dan `preset_items` di Drift.
    -   [ ] **Data:** Buat *seeder* untuk mengisi data awal template ke database.
    -   [ ] **Domain/Data:** Buat *repository* dan *use cases* untuk mengambil data preset.
    -   [ ] **Presentation:** Modifikasi alur "Buat Daftar Baru" untuk menyertakan opsi pemilihan template.
    -   [ ] **Logika:** Implementasikan logika untuk mengisi daftar baru dengan item dari preset yang dipilih.
-   [ ] **Fitur Drag-and-Drop Ordering:**
    -   [ ] **Database:** Tambahkan kolom `order_index` pada tabel `shopping_lists` dan `shopping_items`.
    -   [ ] **Domain/Data:** Perbarui *repository* dan *use cases* untuk menangani logika penyimpanan urutan baru.
    -   [ ] **Presentation:** Implementasikan UI *drag-and-drop* pada `ShoppingListsScreen`.
    -   [ ] **Presentation:** Implementasikan UI *drag-and-drop* pada `ListDetailScreen`.
-   [ ] **UI Polish:**
    -   [ ] Perbaiki animasi dan transisi antar halaman.

---

#### Sprint 4: Pengaturan & Monetisasi (Minggu 9-10)
*Tujuan: Menyelesaikan fitur-fitur pendukung dan mengintegrasikan model monetisasi.*

-   [ ] **Layar Pengaturan:**
    -   [ ] Buat `SettingsScreen`.
    -   [ ] Tambahkan tautan ke Kebijakan Privasi, "Beri Rating", dan "Kirim Umpan Balik".
    -   [ ] Implementasikan fungsionalitas untuk beralih antara *light/dark mode*.
-   [ ] **Integrasi Iklan:**
    -   [ ] Integrasikan SDK Google AdMob.
    -   [ ] Tampilkan iklan *banner* di lokasi yang telah ditentukan (misal: bagian bawah `ShoppingListsScreen`).
-   [ ] **Integrasi In-App Purchase (IAP):**
    -   [ ] Integrasikan *package* `in_app_purchase`.
    -   [ ] Konfigurasikan produk "Hapus Iklan" di Google Play Console dan App Store Connect.
    -   [ ] Implementasikan tombol dan alur pembelian "Hapus Iklan" di `SettingsScreen`.
    -   [ ] Implementasikan logika untuk menyimpan status pembelian dan menyembunyikan iklan secara permanen setelah pembelian berhasil.
-   [ ] **Pengujian:**
    -   [ ] Lakukan pengujian pada alur IAP menggunakan akun *sandbox*.

---

#### Sprint 5: Pengujian Akhir, Bug Fixing & Persiapan Rilis (Minggu 11-12)
*Tujuan: Memastikan aplikasi stabil, bebas dari bug kritis, dan siap untuk diluncurkan.*

-   [ ] **Quality Assurance (QA):**
    -   [ ] Lakukan pengujian *end-to-end* secara manual pada seluruh fitur aplikasi.
    -   [ ] Uji aplikasi di berbagai ukuran layar dan versi OS (Android & iOS).
    -   [ ] Lakukan pengujian regresi untuk memastikan perbaikan bug tidak merusak fitur lain.
-   [ ] **Bug Fixing:**
    -   [ ] Prioritaskan dan perbaiki semua *bug* yang ditemukan selama fase QA.
-   [ ] **Optimasi Kinerja:**
    -   [ ] Lakukan *profiling* pada aplikasi untuk mencari *memory leak* atau masalah kinerja.
-   [ ] **Persiapan Rilis:**
    -   [ ] Buat *App Icon* dan *Splash Screen*.
    -   [ ] Siapkan *screenshot* dan materi promosi untuk halaman *store*.
    -   [ ] Tulis deskripsi aplikasi, catatan rilis, dan kebijakan privasi.
    -   [ ] Lakukan konfigurasi akhir di Google Play Console dan App Store Connect.
-   [ ] **Build & Submit:**
    -   [ ] Hasilkan *build* rilis yang sudah ditandatangani (*signed*).
    -   [ ] Unggah dan kirim aplikasi untuk proses peninjauan (*review*) oleh Google dan Apple.