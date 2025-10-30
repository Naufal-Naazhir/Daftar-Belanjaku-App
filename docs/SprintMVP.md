### Checklist Timeline Sprint untuk MVP "Aplikasi Daftar Belanjaku"

**Versi:** 2.0 (Dengan Fitur Pantry)

#### Sprint 0: Fondasi & Penyiapan Proyek (Minggu 1-2)
*Tujuan: Menyiapkan seluruh kerangka kerja, arsitektur, dan alat yang dibutuhkan.*
**Status: SELESAI**

-   [x] Inisialisasi Proyek (Flutter, Git).
-   [x] Manajemen Dependensi (`pubspec.yaml`).
-   [x] Struktur Proyek (Sederhana).
-   [x] Konfigurasi Database Awal (Drift, tabel `shopping_lists` & `shopping_items`).
-   [x] Konfigurasi Dasar Aplikasi (`main.dart`, `GoRouter`, `AppTheme`).

---

#### Sprint 1: Fungsionalitas Inti Daftar Belanja (CRUD Lists) (Minggu 3-4)
*Tujuan: Pengguna dapat membuat, melihat, mengedit, dan menghapus daftar belanja.*
**Status: SELESAI**

-   [x] Business & Data Layer untuk `ShoppingList`.
-   [x] Presentation Layer (`ShoppingListsScreen`, `ShoppingListBloc`).
-   [x] Fungsionalitas UI untuk menambah, mengedit, dan menghapus daftar.

---

#### Sprint 2: Fungsionalitas Inti Item Belanja & Finalisasi (Minggu 5-6)
*Tujuan: Pengguna dapat mengelola item dalam daftar dan navigasi aplikasi berfungsi penuh.*
**Status: SEBAGIAN BESAR SELESAI**

-   [x] Business & Data Layer untuk `ShoppingItem`.
-   [x] Presentation Layer (`ListDetailScreen`, `ListDetailBloc`).
-   [x] Logika untuk menambah, mengedit, menghapus, dan menandai item.
-   [x] Logika kalkulasi total belanja.


---

#### **(BARU)** Sprint 3: Fitur AI untuk Saran Item & Stok Rumahku (Bagian 1 - Data & Logika) (Minggu 7-8)
*Tujuan: Membangun seluruh fondasi data dan logika bisnis untuk fitur AI dan Stok Rumahku.*

-   [ ] **Database:**
    -   [ ] Definisikan dan implementasikan tabel `stok_rumahku_items` di `app_database.dart` (id, name, added_at).
    -   [ ] Jalankan *build runner* untuk menghasilkan kode Drift yang baru.
-   [ ] **Business Logic Layer:**
    -   [ ] Buat *entity* `StokRumahkuItem`.
    -   [ ] Definisikan *interface* `StokRumahkuRepository`.
    -   [ ] Definisikan *interface* `AIRepository`.
-   [ ] **Data Layer:**
    -   [ ] Buat `StokRumahkuLocalDataSource` yang berinteraksi dengan tabel `stok_rumahku_items`.
    -   [ ] Implementasikan `StokRumahkuRepository` (`StokRumahkuRepositoryImpl`).
    -   [ ] Buat `AIDataSource` untuk interaksi dengan API AI eksternal.
    -   [ ] Implementasikan `AIRepository` (`AIRepositoryImpl`).
-   [ ] **Logika Lintas Fitur:**
    -   [ ] Perbarui `ShoppingListRepository` dengan metode untuk "memindahkan" item ke Stok Rumahku.
    -   [ ] Perbarui `ShoppingListRepository` untuk menerima daftar item saat membuat daftar baru (untuk item dari AI).

---

#### **(BARU)** Sprint 4: Fitur AI & Stok Rumahku (Bagian 2 - UI & Interaksi) (Minggu 9-10)
*Tujuan: Menghadirkan fitur AI dan Stok Rumahku kepada pengguna dan memastikan alur kerja yang mulus.*

-   [ ] **Navigasi Utama:**
    -   [ ] Implementasikan `BottomNavigationBar` untuk beralih antara "Daftar Belanja" dan "Stok Rumahku".
    -   [ ] Perbarui konfigurasi `GoRouter` untuk mendukung navigasi berbasis tab.
-   [ ] **Presentation Layer (Stok Rumahku):**
    -   [ ] Buat `StokRumahkuScreen` untuk menampilkan semua item di Stok Rumahku.
    -   [ ] Buat `StokRumahkuBloc` beserta `Event` dan `State`.
    -   [ ] Implementasikan UI untuk menampilkan item Stok Rumahku, termasuk status keberadaan (ada/habis).
    -   [ ] Implementasikan fungsionalitas untuk menghapus item dari Stok Rumahku.
-   [ ] **Integrasi Antar Fitur:**
    -   [ ] Tambahkan tombol/logika di `ListDetailScreen` untuk memicu proses "Pindahkan ke Stok Rumahku".
    -   [ ] Implementasikan logika peringatan di `ShoppingListsScreen` atau `ListDetailScreen` jika item yang ditambahkan sudah ada di Stok Rumahku.

---

#### **(BARU)** Sprint 5: Fitur Premium (Monetisasi), Pengaturan & Notifikasi (Minggu 11-12)
*Tujuan: Menyelesaikan fitur premium, fitur pendukung, dan notifikasi.*

-   [ ] **Fitur Premium (Monetisasi):**
    -   [ ] Implementasikan logika untuk melacak penggunaan fitur AI dan Stok Rumahku untuk pengguna gratis.
    -   [ ] Implementasikan UI untuk menawarkan pembelian "AI & Stok Rumahku Tanpa Batas" jika batasan tercapai.
    -   [ ] Integrasikan IAP untuk membuka fitur premium "AI & Stok Rumahku Tanpa Batas".
    -   [ ] Implementasikan logika untuk mengumpulkan data yang dibutuhkan untuk analisis belanja.
    -   [ ] Buat UI untuk dashboard "Laporan" yang menampilkan analisis pengeluaran.
    -   [ ] Integrasikan IAP untuk membuka fitur premium "Analisis & Laporan Belanja".
-   [ ] **Integrasi Iklan:**
    -   [ ] Integrasikan SDK Google AdMob untuk menampilkan iklan *banner* pada versi gratis.
-   [ ] **Layar Pengaturan:**
    -   [ ] Buat `SettingsScreen` dengan semua tautan yang diperlukan.

---

#### **(BARU)** Sprint 6: Pengujian Akhir, Bug Fixing & Persiapan Rilis (Minggu 13-14)
*Tujuan: Memastikan aplikasi stabil, bebas dari bug kritis, dan siap untuk diluncurkan.*

-   [ ] **Quality Assurance (QA):**
    -   [ ] Lakukan pengujian *end-to-end* pada semua fitur, termasuk alur Stok Rumahku.
-   [ ] **Bug Fixing:**
    -   [ ] Prioritaskan dan perbaiki semua *bug* yang ditemukan.
-   [ ] **Persiapan Rilis:**
    -   [ ] Siapkan aset visual (App Icon, Splash Screen, Screenshot).
    -   [ ] Finalisasi deskripsi aplikasi, catatan rilis, dan kebijakan privasi.
-   [ ] **Build & Submit:**
    -   [ ] Hasilkan *build* rilis dan kirim ke Google Play Store & Apple App Store.