## Product Requirement Document (PRD) - Aplikasi Daftar Belanjaku

**1. Pendahuluan**

*   **Nama Produk:** BelanjaPraktis (Nama Tentatif)
*   **Versi:** 1.0.0
*   **Tanggal Dokumen:** 16 September 2025
*   **Penulis:** [M. Arya Pratama, Naufal Naazhir Arkaan]

**1.1 Tujuan**
Dokumen ini bertujuan untuk menjelaskan secara detail fungsionalitas, persyaratan, dan ruang lingkup aplikasi "BelanjaPraktis". Aplikasi ini akan menjadi alat bantu bagi pengguna untuk membuat, mengelola, dan melacak daftar belanja mereka dengan mudah, cepat, dan efisien. Fokus utama adalah kesederhanaan, keringanan, dan pengalaman pengguna yang intuitif.

**1.2 Visi Produk**
Menjadi aplikasi daftar belanja pilihan yang paling mudah digunakan, cepat, dan ringan, membantu jutaan pengguna mengelola kebutuhan belanja mereka tanpa kerumitan, dengan fitur-fitur esensial yang sangat fungsional.

**1.3 Audiens Target**
Individu atau keluarga yang ingin mengelola daftar belanja harian, mingguan, atau bulanan secara digital, dengan prioritas pada kemudahan penggunaan dan fungsionalitas inti.

---

**2. Lingkup Fungsionalitas**

Berikut adalah daftar fitur utama yang akan diimplementasikan pada versi 1.0.0.

**2.1 Fitur Inti Aplikasi**

*   **2.1.1 Pengelolaan Daftar Belanja:**
    *   **FR-1.1.1:** Pengguna dapat membuat daftar belanja baru (misal: "Belanja Mingguan", "Supermarket").
    *   **FR-1.1.2:** Pengguna dapat memberi nama daftar belanja.
    *   **FR-1.1.3:** Pengguna dapat melihat semua daftar belanja yang telah dibuat di halaman utama.
    *   **FR-1.1.4:** Setiap daftar belanja menampilkan nama dan ringkasan progres (jumlah item yang sudah dibeli / total item).
    *   **FR-1.1.5:** Pengguna dapat mengedit nama daftar belanja.
    *   **FR-1.1.6:** Pengguna dapat menghapus daftar belanja.
    *   **FR-1.1.7:** Pengguna dapat mengurutkan daftar belanja secara manual (drag-and-drop).

*   **2.1.2 Pengelolaan Item Belanja:**
    *   **FR-1.2.1:** Pengguna dapat menambahkan item baru ke dalam daftar belanja yang spesifik.
    *   **FR-1.2.2:** Untuk setiap item, pengguna dapat memasukkan:
        *   Nama barang (wajib).
        *   Harga barang (opsional, format numerik/desimal).
        *   Kuantitas (opsional, format numerik, misal: "2", "0.5").
        *   Satuan (opsional, misal: "kg", "buah", "pack").
    *   **FR-1.2.3:** Pengguna dapat menandai item sebagai "sudah dibeli" (checkbox).
    *   **FR-1.2.4:** Pengguna dapat mengedit nama, harga, kuantitas, dan satuan item yang sudah ada.
    *   **FR-1.2.5:** Pengguna dapat menghapus item dari daftar belanja.
    *   **FR-1.2.6:** Pengguna dapat mengurutkan item dalam daftar belanja secara manual (drag-and-drop).

*   **2.1.3 Kalkulasi Total Belanja:**
    *   **FR-1.3.1:** Di halaman detail daftar belanja, aplikasi akan menampilkan total harga dari semua item yang belum dibeli (`Unchecked Total`).
    *   **FR-1.3.2:** Di halaman detail daftar belanja, aplikasi akan menampilkan total harga dari semua item yang sudah dibeli (`Checked Total`).
    *   **FR-1.3.3:** Di halaman detail daftar belanja, aplikasi akan menampilkan total harga dari semua item (`Grand Total`).
    *   **FR-1.3.4:** Total kalkulasi akan diperbarui secara real-time saat item ditambahkan, diubah, atau ditandai.

*   **2.1.4 Kategori Preset / Template Daftar:**
    *   **FR-1.4.1:** Saat membuat daftar belanja baru, pengguna akan diberikan opsi untuk memilih dari template kategori preset (misal: "Supermarket", "Pasar Tradisional", "Perlengkapan Rumah Tangga").
    *   **FR-1.4.2:** Jika pengguna memilih template, daftar belanja akan otomatis terisi dengan item-item default yang relevan dengan kategori tersebut.
    *   **FR-1.4.3:** Item-item default dari template ini dapat diedit atau dihapus oleh pengguna.

**2.2 Antarmuka Pengguna (UI) & Pengalaman Pengguna (UX)**

*   **FR-2.2.1:** Desain antarmuka harus minimalis, bersih, dan intuitif (mengacu pada contoh Listonic dengan penyederhanaan).
*   **FR-2.2.2:** Navigasi antar halaman harus jelas dan mudah.
*   **FR-2.2.3:** Penggunaan `Floating Action Button (FAB)` untuk aksi utama seperti "Tambah Daftar Baru" atau "Tambah Item".
*   **FR-2.2.4:** Tampilan harus responsif di berbagai ukuran layar perangkat mobile.
*   **FR-2.2.5:** Dukungan untuk *Light Mode* dan *Dark Mode*.

**2.3 Fitur Pengaturan (Disimplifikasi)**

*   **FR-2.3.1:** Halaman pengaturan sederhana yang mencakup:
    *   Link ke Kebijakan Privasi (`Privacy Policy`).
    *   Link ke Syarat & Ketentuan (`Terms of Service`).
    *   Informasi Versi Aplikasi.
    *   Tombol untuk memberi rating aplikasi (`Rate Us` - link ke Play Store/App Store).
    *   Tombol untuk mengirim umpan balik (`Send Feedback` - membuka klien email).

**2.4 Monetisasi**

*   **FR-2.4.1:** Aplikasi akan menampilkan iklan *banner* di lokasi strategis yang tidak mengganggu (misal: di bagian bawah halaman `My Lists` dan `Detail List`, atau di halaman `Add New Item`).
*   **FR-2.4.2:** Pengguna dapat membeli "Remove Ads" melalui pembelian dalam aplikasi (`In-App Purchase - IAP`) untuk menghilangkan semua iklan secara permanen.

---

**3. Lingkup Non-Fungsional**

*   **3.1 Kinerja:**
    *   **NFR-3.1.1:** Waktu muat aplikasi harus cepat (< 2 detik).
    *   **NFR-3.1.2:** Responsivitas UI harus lancar tanpa *lag*.
    *   **NFR-3.1.3:** Penggunaan memori dan baterai harus minimal.

*   **3.2 Skalabilitas:**
    *   **NFR-3.2.1:** Arsitektur harus dirancang agar mudah ditambahkan fitur-fitur baru di masa depan tanpa *refactoring* besar.

*   **3.3 Keamanan:**
    *   **NFR-3.3.1:** Data pengguna (daftar belanja) harus disimpan secara lokal dan aman di perangkat.
    *   **NFR-3.3.2:** Tidak ada pengumpulan data sensitif pengguna.

*   **3.4 Kompatibilitas:**
    *   **NFR-3.4.1:** Aplikasi harus kompatibel dengan Android (versi tertentu, misal: Android 7.0 ke atas) dan iOS (versi tertentu, misal: iOS 13.0 ke atas).

*   **3.5 Pemeliharaan:**
    *   **NFR-3.5.1:** Kode harus ditulis dengan standar *clean code*, teruji, dan mudah dipelihara.
    *   **NFR-3.5.2:** Dokumentasi internal (komentar kode, README) harus memadai.

---

**4. Teknologi yang Digunakan**

*   **Framework:** Flutter
*   **State Management:** Riverpod Generator
*   **Immutable Data Models:** Freezed
*   **Database Lokal:** Drift
*   **Navigasi:** GoRouter
*   **Functional Programming Utilities:** Fpdart
*   **Logging:** Logger

---

**5. Alur Pengguna (User Flow)**

**5.1 Alur Umum Penggunaan Aplikasi:**

1.  **Mulai Aplikasi:** Pengguna membuka aplikasi.
2.  **Halaman Daftar:** Pengguna melihat `My Lists` (jika sudah ada daftar) atau halaman kosong dengan opsi "Buat Daftar Baru".
3.  **Buat Daftar Baru:** Pengguna mengetuk `+ New List`.
4.  **Detail Daftar Baru:**
    *   Memasukkan nama daftar.
    *   Opsional: Memilih dari template kategori.
    *   Mengetuk `Create`.
5.  **Halaman Detail Daftar:** Pengguna dibawa ke halaman detail daftar yang baru dibuat (atau yang dipilih).
6.  **Tambah Item:** Pengguna mengetuk `+ Add`.
7.  **Halaman Tambah Item:**
    *   Memasukkan nama item.
    *   Opsional: memasukkan harga, kuantitas, satuan.
    *   Mengetuk `Add` (atau `+` di samping item saran).
8.  **Kembali ke Detail Daftar:** Item muncul di daftar.
9.  **Belanja:** Pengguna menandai item saat dibeli. Total belanja otomatis diperbarui.
10. **Selesai:** Pengguna dapat kembali ke `My Lists`.

---

**6. Model Data (Gambaran Awal)**

*   **ShoppingList:**
    ```dart
    @freezed
    class ShoppingList with _$ShoppingList {
      const factory ShoppingList({
        @DriftPrimaryKey() required int id,
        required String name,
        required DateTime createdAt,
        required DateTime updatedAt,
      }) = _ShoppingList;
    }
    ```

*   **ShoppingItem:**
    ```dart
    @freezed
    class ShoppingItem with _$ShoppingItem {
      const factory ShoppingItem({
        @DriftPrimaryKey() required int id,
        required int listId, // Foreign Key to ShoppingList
        required String name,
        double? price, // Nullable
        double? quantity, // Nullable
        String? unit, // Nullable (e.g., "kg", "pcs")
        @Default(false) bool isBought,
      }) = _ShoppingItem;
    }
    ```

*   **ItemCategory (untuk Preset):**
    ```dart
    @freezed
    class ItemCategory with _$ItemCategory {
      const factory ItemCategory({
        @DriftPrimaryKey() required int id,
        required String name, // e.g., "Supermarket", "Vegetables"
      }) = _ItemCategory;
    }
    ```

*   **PresetItem (untuk Item Default dalam Kategori):**
    ```dart
    @freezed
    class PresetItem with _$PresetItem {
      const factory PresetItem({
        @DriftPrimaryKey() required int id,
        required int categoryId, // Foreign Key to ItemCategory
        required String name,
        double? defaultPrice, // Optional default price for preset
        double? defaultQuantity, // Optional default quantity
        String? defaultUnit, // Optional default unit
      }) = _PresetItem;
    }
    ```

---

**7. Lampiran (Opsional)**

*   Sketsa Desain UI/UX (yang sudah kamu berikan, atau gambar tambahan).
*   Daftar Item Default untuk setiap Kategori Preset.

---

Dokumen PRD ini seharusnya sudah cukup untuk memulai proses pengembangan. Apakah ada bagian yang ingin kamu perjelas atau tambahkan?