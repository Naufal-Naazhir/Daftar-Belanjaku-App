### Software Requirements Specification (SRS) - Aplikasi Daftar Belanjaku

**Versi:** 1.0
**Tanggal:** 16 september 2025

---

### 1. Pendahuluan

**1.1 Tujuan**
Dokumen ini menyediakan spesifikasi persyaratan perangkat lunak yang detail untuk aplikasi mobile "BelanjaPraktis" versi 1.0. Tujuannya adalah untuk memberikan pemahaman yang jelas dan tidak ambigu tentang fungsionalitas dan batasan sistem kepada tim pengembang, tim pengujian (QA), dan pemangku kepentingan lainnya.

**1.2 Ruang Lingkup Produk**
Aplikasi "BelanjaPraktis" adalah sebuah aplikasi mandiri (*standalone*) untuk platform iOS dan Android yang memungkinkan pengguna membuat dan mengelola daftar belanja secara lokal di perangkat mereka. Versi 1.0 akan fokus pada fungsionalitas inti pengelolaan daftar, kalkulasi total belanja, penggunaan template, dan model monetisasi sederhana melalui iklan dan opsi pembelian untuk menghilangkannya.

**Ruang lingkup versi 1.0 TIDAK mencakup:**
*   Sinkronisasi data antar perangkat (Cloud Sync).
*   Fitur berbagi daftar belanja dengan pengguna lain.
*   Sistem akun pengguna atau otentikasi.
*   Analitik atau laporan pengeluaran belanja.

**1.3 Definisi, Akronim, dan Singkatan**
*   **SRS:** Software Requirements Specification
*   **PRD:** Product Requirement Document
*   **UI:** User Interface (Antarmuka Pengguna)
*   **UX:** User Experience (Pengalaman Pengguna)
*   **FAB:** Floating Action Button
*   **IAP:** In-App Purchase (Pembelian Dalam Aplikasi)
*   **CRUD:** Create, Read, Update, Delete
*   **Daftar:** Kumpulan dari beberapa Item Belanja.
*   **Item:** Satu entitas barang yang akan dibeli, memiliki properti seperti nama, harga, kuantitas, dll.
*   **Preset:** Kumpulan item default yang dapat digunakan untuk membuat daftar baru dengan cepat.

**1.4 Referensi**
*   Product Requirement Document (PRD) - Aplikasi BelanjaPraktis v1.0
*   Dokumen Skema Database - Aplikasi BelanjaPraktis v1.0

**1.5 Ikhtisar Dokumen**
Dokumen ini terbagi menjadi beberapa bagian. Bagian 1 memberikan pendahuluan. Bagian 2 memberikan deskripsi umum tentang produk, pengguna, dan batasan. Bagian 3 merinci persyaratan fungsional, non-fungsional, antarmuka, dan database secara spesifik.

---

### 2. Deskripsi Umum

**2.1 Perspektif Produk**
Aplikasi ini adalah produk perangkat lunak baru yang akan dikembangkan dari awal menggunakan framework Flutter. Aplikasi ini akan berinteraksi dengan database lokal (SQLite) melalui pustaka Drift untuk persistensi data. Aplikasi juga akan terintegrasi dengan SDK iklan (misalnya, Google AdMob) dan API Store (Google Play Billing/Apple StoreKit) untuk IAP.

**2.2 Fungsi Produk**
Fungsi utama dari aplikasi ini adalah sebagai berikut:
1.  Membuat, melihat, mengedit, dan menghapus daftar belanja.
2.  Menambah, mengedit, menghapus, dan menandai item dalam daftar.
3.  Menghitung total harga belanja secara otomatis.
4.  Menyediakan template daftar belanja untuk mempercepat pembuatan.
5.  Menampilkan iklan dan menyediakan opsi untuk menghilangkannya.

**2.3 Karakteristik Pengguna**
Target pengguna adalah individu yang melek teknologi dasar, memiliki smartphone, dan membutuhkan alat bantu digital sederhana untuk mengatur belanja mereka tanpa fitur yang kompleks.

**2.4 Batasan Umum**
*   Aplikasi dikembangkan menggunakan Flutter, Riverpod Generator, Freezed, Drift, GoRouter, Fpdart, dan Logger.
*   Semua data pengguna akan disimpan secara lokal di perangkat. Tidak ada *backend server* untuk data pengguna.
*   Aplikasi harus mendukung orientasi potret (*portrait mode*) saja.

**2.5 Asumsi dan Ketergantungan**
*   Pengguna memiliki koneksi internet untuk menampilkan iklan dan melakukan proses IAP.
*   Aplikasi akan didistribusikan melalui Google Play Store dan Apple App Store.

---

### 3. Persyaratan Spesifik

**3.1 Persyaratan Fungsional**

**3.1.1 Pengelolaan Daftar Belanja (List Management)**
*   **FUNC-LM-001:** Sistem harus menyediakan fungsi untuk membuat daftar belanja baru. Pengguna dapat memberikan nama untuk daftar tersebut.
*   **FUNC-LM-002:** Sistem harus menampilkan semua daftar belanja yang ada di layar utama. Setiap entri daftar harus menampilkan nama dan progres item (contoh: "5/10").
*   **FUNC-LM-003:** Sistem harus mengizinkan pengguna untuk mengubah nama daftar belanja yang sudah ada.
*   **FUNC-LM-004:** Sistem harus menyediakan fungsi untuk menghapus daftar belanja. Sebuah dialog konfirmasi harus ditampilkan sebelum penghapusan.
*   **FUNC-LM-005:** Sistem harus mengizinkan pengguna untuk mengubah urutan daftar belanja di layar utama melalui mekanisme *drag-and-drop*.

**3.1.2 Pengelolaan Item Belanja (Item Management)**
*   **FUNC-IM-001:** Sistem harus mengizinkan pengguna menambahkan item baru ke daftar belanja. Input yang dibutuhkan adalah: nama (wajib), harga (opsional), kuantitas (opsional), dan satuan (opsional).
*   **FUNC-IM-002:** Sistem harus menampilkan semua item dalam sebuah daftar. Setiap item harus menampilkan nama, harga (jika ada), dan sebuah *checkbox*.
*   **FUNC-IM-003:** Pengguna harus dapat menandai atau membatalkan tanda sebuah item sebagai "sudah dibeli" dengan menekan *checkbox*.
*   **FUNC-IM-004:** Sistem harus mengizinkan pengguna untuk mengedit detail dari item yang sudah ada.
*   **FUNC-IM-005:** Sistem harus mengizinkan pengguna untuk menghapus item dari daftar belanja.
*   **FUNC-IM-006:** Sistem harus mengizinkan pengguna untuk mengubah urutan item dalam daftar belanja melalui mekanisme *drag-and-drop*.

**3.1.3 Kalkulasi Total Belanja**
*   **FUNC-CALC-001:** Sistem harus secara otomatis menghitung dan menampilkan total harga dari semua item yang belum ditandai (`Unchecked Total`).
*   **FUNC-CALC-002:** Sistem harus secara otomatis menghitung dan menampilkan total harga dari semua item yang sudah ditandai (`Checked Total`).
*   **FUNC-CALC-003:** Sistem harus secara otomatis menghitung dan menampilkan total harga keseluruhan (`Grand Total`).
*   **FUNC-CALC-004:** Semua nilai total harus diperbarui secara *real-time* setiap kali ada perubahan pada item (tambah, edit, hapus, tandai).

**3.1.4 Template Preset**
*   **FUNC-PRES-001:** Saat membuat daftar baru, sistem harus menawarkan opsi kepada pengguna untuk memilih dari daftar template yang telah ditentukan (misal: "Supermarket").
*   **FUNC-PRES-002:** Jika template dipilih, sistem harus secara otomatis mengisi daftar baru dengan item-item default yang sesuai dengan template tersebut.

**3.1.5 Monetisasi**
*   **FUNC-MON-001:** Sistem harus menampilkan iklan *banner* di lokasi yang telah ditentukan (misalnya, di bagian bawah layar utama).
*   **FUNC-MON-002:** Sistem harus menyediakan opsi di halaman pengaturan untuk melakukan pembelian dalam aplikasi (IAP) "Hapus Iklan".
*   **FUNC-MON-003:** Setelah pembelian "Hapus Iklan" berhasil, sistem harus berhenti menampilkan semua iklan secara permanen di seluruh aplikasi.

**3.2 Persyaratan Non-Fungsional**

*   **NONFUNC-PERF-001 (Kinerja):** Aplikasi harus dapat dimulai dari kondisi *cold start* dalam waktu kurang dari 3 detik.
*   **NONFUNC-PERF-002 (Kinerja):** Semua animasi dan *scrolling* di UI harus berjalan mulus dengan target 60 *frame per second* (FPS) pada perangkat target.
*   **NONFUNC-USE-001 (Usabilitas):** Antarmuka pengguna harus bersih, minimalis, dan intuitif, sehingga pengguna baru dapat menggunakannya tanpa perlu tutorial.
*   **NONFUNC-USE-002 (Usabilitas):** Aplikasi harus mendukung tema terang (*Light Mode*) dan tema gelap (*Dark Mode*), mengikuti pengaturan sistem operasi secara default.
*   **NONFUNC-REL-001 (Keandalan):** Data yang telah disimpan oleh pengguna tidak boleh hilang saat aplikasi ditutup secara normal, dihentikan oleh sistem, atau setelah perangkat di-*restart*.
*   **NONFUNC-SEC-001 (Keamanan):** Semua data aplikasi harus disimpan dalam direktori pribadi aplikasi yang tidak dapat diakses oleh aplikasi lain.
*   **NONFUNC-COMP-001 (Kompatibilitas):** Aplikasi harus kompatibel dengan:
    *   Android 7.0 (Nougat) dan versi yang lebih baru.
    *   iOS 13.0 dan versi yang lebih baru.

**3.3 Persyaratan Antarmuka Eksternal**

**3.3.1 Antarmuka Pengguna (GUI)**
*   **GUI-001:** **Layar Utama (Daftar List):** Menampilkan daftar dari `shopping_lists`. Terdapat FAB untuk menambah daftar baru.
*   **GUI-002:** **Layar Detail Daftar:** Menampilkan item-item dari `shopping_items` yang terkait dengan daftar yang dipilih. Terdapat FAB untuk menambah item baru. Menampilkan ringkasan total belanja.
*   **GUI-003:** **Layar Tambah/Edit Daftar:** Sebuah dialog atau layar sederhana untuk memasukkan/mengedit nama daftar.
*   **GUI-004:** **Layar Tambah/Edit Item:** Sebuah dialog atau layar untuk memasukkan/mengedit detail item.
*   **GUI-005:** **Layar Pengaturan:** Berisi opsi-opsi seperti "Hapus Iklan", "Beri Rating", dan tautan ke kebijakan privasi.
*   **GUI-006:** **Navigasi:** Menggunakan `Bottom Navigation Bar` untuk navigasi utama (misal: antara Layar Utama dan Layar Pengaturan) dan `GoRouter` untuk navigasi antar halaman.

**3.4 Persyaratan Database**
*   **DB-001:** Aplikasi harus menggunakan database SQLite untuk penyimpanan data lokal.
*   **DB-002:** Interaksi dengan database harus dikelola oleh pustaka Drift.
*   **DB-003:** Skema database harus mengimplementasikan tabel, kolom, dan relasi seperti yang didefinisikan dalam dokumen "Skema Database - Aplikasi BelanjaPraktis v1.0". Ini mencakup tabel `shopping_lists`, `shopping_items`, `item_categories`, dan `preset_items`.