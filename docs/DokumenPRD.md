## Product Requirement Document (PRD) - Aplikasi Daftar Belanjaku

**1. Pendahuluan**

*   **Nama Produk:** BelanjaPraktis (Nama Tentatif)
*   **Versi:** 1.0.0
*   **Tanggal Dokumen:** 16 September 2025
*   **Penulis:** [M. Arya Pratama, Naufal Naazhir Arkaan]

**1.1 Tujuan**
Dokumen ini bertujuan untuk menjelaskan secara detail fungsionalitas, persyaratan, dan ruang lingkup aplikasi "BelanjaPraktis". Aplikasi ini akan menjadi alat bantu bagi pengguna untuk membuat, mengelola, dan melacak daftar belanja mereka dengan mudah, cepat, dan efisien. Fokus utama adalah kesederhanaan, keringanan, dan pengalaman pengguna yang intuitif.

**1.2 Visi Produk**
Menjadi asisten belanja dan manajemen stok barang di rumah pribadi yang cerdas, membantu pengguna tidak hanya merencanakan belanjaan tetapi juga mengelola stok barang di rumah untuk mengurangi pemborosan.

**1.3 Audiens Target**
Individu atau keluarga yang ingin mengelola daftar belanja dan inventaris rumah secara digital, dengan prioritas pada kemudahan penggunaan, fungsionalitas inti, dan fitur cerdas untuk menghemat uang dan mengurangi limbah.

---

**2. Lingkup Fungsionalitas**

Berikut adalah daftar fitur utama yang akan diimplementasikan pada versi 1.0.0.

**2.1 Fitur Inti Aplikasi**

*   **2.1.1 Pengelolaan Daftar Belanja:**
    *   **FR-1.1.1:** Pengguna dapat membuat daftar belanja baru.
    *   **FR-1.1.2:** Pengguna dapat memberi nama daftar belanja.
    *   **FR-1.1.3:** Pengguna dapat melihat semua daftar belanja yang telah dibuat di halaman utama.
    *   **FR-1.1.4:** Pengguna dapat mengedit nama daftar belanja.
    *   **FR-1.1.5:** Pengguna dapat menghapus daftar belanja.
    *   **FR-1.1.6:** Pengguna dapat membuat daftar belanja baru dengan memasukkan tema (misal: "bahan soto"), dan sistem akan secara otomatis mengisi daftar dengan item-item yang disarankan AI.
    *   **FR-1.1.7:** Untuk item yang disarankan AI, sistem akan menampilkan perkiraan harga per satuan (jika tersedia).
    *   **FR-1.1.8 (DITUNDA):** Pengguna dapat mengurutkan daftar belanja secara manual (drag-and-drop).

*   **2.1.2 Pengelolaan Item Belanja:**
    *   **FR-1.2.1:** Pengguna dapat menambahkan item baru ke dalam daftar belanja.
    *   **FR-1.2.2:** Untuk setiap item, pengguna dapat memasukkan nama (wajib), harga (opsional), kuantitas (opsional), dan satuan (opsional).
    *   **FR-1.2.3:** Pengguna dapat menandai item sebagai "sudah dibeli".
    *   **FR-1.2.4:** Pengguna dapat mengedit detail item yang sudah ada.
    *   **FR-1.2.5:** Pengguna dapat menghapus item dari daftar belanja.
    *   **FR-1.2.6 (DITUNDA):** Pengguna dapat mengurutkan item dalam daftar belanja secara manual (drag-and-drop).

*   **2.1.3 Kalkulasi Total Belanja:**
    *   **FR-1.3.1:** Aplikasi akan menampilkan total harga dari semua item yang belum dan sudah dibeli.
    *   **FR-1.3.2:** Total kalkulasi akan diperbarui secara real-time.



*   **2.1.4 Pengelolaan Stok Rumahku:**
    *   **FR-1.4.1:** Pengguna dapat memindahkan item yang sudah dibeli dari daftar belanja ke "Stok Rumahku".
    *   **FR-1.4.2:** Terdapat halaman "Stok Rumahku" untuk melihat semua item yang tersimpan di rumah.
    *   **FR-1.4.3:** Item di "Stok Rumahku" hanya akan menampilkan nama item dan status keberadaan (ada/habis).
    *   **FR-1.4.4:** Pengguna dapat menghapus item dari "Stok Rumahku" (misal: saat sudah habis digunakan).
    *   **FR-1.4.5:** Aplikasi akan memberikan peringatan saat pengguna menambahkan item ke daftar belanja yang sudah ada di "Stok Rumahku".

**2.2 Antarmuka Pengguna (UI) & Pengalaman Pengguna (UX)**

*   **FR-2.2.1:** Desain antarmuka harus minimalis, bersih, dan intuitif.
*   **FR-2.2.2:** Navigasi utama menggunakan `BottomNavigationBar` untuk beralih antara "Daftar Belanja" dan "Pantry".
*   **FR-2.2.3:** Penggunaan `Floating Action Button (FAB)` untuk aksi utama.
*   **FR-2.2.4:** Dukungan untuk *Light Mode* dan *Dark Mode*.

**2.3 Fitur Pengaturan (Disimplifikasi)**

*   **FR-2.3.1:** Halaman pengaturan sederhana yang mencakup link ke Kebijakan Privasi, Syarat & Ketentuan, Versi Aplikasi, Rating, dan Umpan Balik.

*   **2.4 Monetisasi**

*   **FR-2.4.1:** Aplikasi akan menampilkan iklan *banner* di lokasi yang tidak mengganggu pada versi gratis.
*   **FR-2.4.2:** Pengguna dapat membeli fitur premium **"AI & Stok Rumahku Tanpa Batas"** melalui IAP (In-App Purchase).
*   **FR-2.4.3:** Fitur premium ini akan menghapus batasan pembuatan daftar belanja menggunakan AI dan batasan jumlah item di "Stok Rumahku".
*   **FR-2.4.4:** Pada versi gratis, pengguna dibatasi untuk membuat maksimal 3 daftar belanja menggunakan fitur AI.
*   **FR-2.4.5:** Pada versi gratis, pengguna dibatasi untuk menyimpan maksimal 20 item di "Stok Rumahku".
*   **FR-2.4.6:** Pengguna dapat membeli fitur premium **"Analisis & Laporan Belanja"** melalui IAP (In-App Purchase).
*   **FR-2.4.7:** Fitur premium ini akan mencakup akses ke dashboard analisis pengeluaran, laporan, dan *insight* lainnya berdasarkan data belanja pengguna.

---

**3. Lingkup Non-Fungsional**

*   **3.1 Kinerja:**
    *   **NFR-3.1.1:** Waktu muat aplikasi harus cepat (< 2 detik).
    *   **NFR-3.1.2:** Responsivitas UI harus lancar tanpa *lag*.
    *   **NFR-3.1.3:** Penggunaan memori dan baterai harus minimal.

*   **3.2 Skalabilitas:**
    *   **NFR-3.2.1:** Arsitektur harus dirancang agar mudah ditambahkan fitur-fitur baru di masa depan.

*   **3.3 Keamanan:**
    *   **NFR-3.3.1:** Data pengguna harus disimpan secara lokal dan aman di perangkat.

*   **3.4 Kompatibilitas:**
    *   **NFR-3.4.1:** Aplikasi harus kompatibel dengan Android 7.0+ dan iOS 13.0+.

*   **3.5 Pemeliharaan:**
    *   **NFR-3.5.1:** Kode harus ditulis dengan standar *clean code*, teruji, dan mudah dipelihara.

---

**4. Teknologi yang Digunakan**

*   **Framework:** Flutter
*   **State Management:** BLoC / flutter_bloc
*   **Immutable Data Models:** Freezed
*   **Database Lokal:** Drift
*   **Navigasi:** GoRouter
*   **Functional Programming Utilities:** Fpdart
*   **Notifikasi Lokal:** flutter_local_notifications (atau sejenisnya)
*   **Logging:** Logger

---

**5. Alur Pengguna (User Flow)**

**5.1 Alur Umum Penggunaan Aplikasi:**

1.  **Mulai Aplikasi:** Pengguna membuka aplikasi, melihat halaman "Daftar Belanja".
2.  **Buat Daftar Baru:** Pengguna mengetuk `+` untuk membuat daftar baru (bisa daftar kosong atau dengan saran AI berdasarkan tema).
3.  **Halaman Detail Daftar:** Pengguna menambahkan item ke dalam daftar.
4.  **Belanja:** Pengguna menandai item saat dibeli.
5.  **Pindahkan ke Stok Rumahku:** Setelah belanja, pengguna menekan tombol "Pindahkan ke Stok Rumahku" dan memilih item yang ingin dicatat di inventaris.
6.  **Navigasi ke Stok Rumahku:** Pengguna mengetuk tab "Stok Rumahku" di `BottomNavigationBar`.
7.  **Lihat Stok:** Pengguna melihat semua item yang mereka miliki di rumah.
8.  **Gunakan Item:** Pengguna menghapus item dari Stok Rumahku saat sudah habis.

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



*   **StokRumahkuItem (BARU):**
    ```dart
    @freezed
    class StokRumahkuItem with _$StokRumahkuItem {
      const factory StokRumahkuItem({
        @DriftPrimaryKey() required int id,
        required String name,
        required DateTime addedAt, // Tanggal ditambahkan ke Stok Rumahku
      }) = _StokRumahkuItem;
    }
    ```

---

**7. Lampiran (Opsional)**

*   Sketsa Desain UI/UX (yang sudah kamu berikan, atau gambar tambahan).
*   Daftar Item Default untuk setiap Kategori Preset.

---

Dokumen PRD ini seharusnya sudah cukup untuk memulai proses pengembangan. Apakah ada bagian yang ingin kamu perjelas atau tambahkan?