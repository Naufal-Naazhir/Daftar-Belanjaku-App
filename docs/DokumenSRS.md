### Software Requirements Specification (SRS) - Aplikasi Daftar Belanjaku

**Nama Tim:** Naufal Naazhir Arkaan,  M. Arya Pratama
**Versi:** 1.0
**Tanggal:** 16 september 2025

---

### 1. Pendahuluan

**1.1 Tujuan**
Dokumen ini menyediakan spesifikasi persyaratan perangkat lunak yang detail untuk aplikasi mobile "BelanjaPraktis" versi 1.0. Tujuannya adalah untuk memberikan pemahaman yang jelas dan tidak ambigu tentang fungsionalitas dan batasan sistem kepada tim pengembang, tim pengujian (QA), dan pemangku kepentingan lainnya.

**1.2 Ruang Lingkup Produk**
Aplikasi "BelanjaPraktis" adalah sebuah aplikasi mandiri (*standalone*) untuk platform iOS dan Android yang berfungsi sebagai asisten belanja pribadi dan manajer inventaris rumah. Versi 1.0 akan fokus pada fungsionalitas inti pengelolaan daftar belanja, dan fitur pembeda yaitu **manajemen pantry cerdas** dengan pelacak kedaluwarsa.

**Ruang lingkup versi 1.0 TIDAK mencakup:**
*   Sinkronisasi data antar perangkat (Cloud Sync).
*   Fitur berbagi daftar belanja dengan pengguna lain.
*   Sistem akun pengguna atau otentikasi.
*   Fitur *drag-and-drop ordering* (ditunda).

**1.3 Definisi, Akronim, dan Singkatan**
*   **SRS:** Software Requirements Specification
*   **PRD:** Product Requirement Document
*   **UI/UX:** User Interface/User Experience
*   **FAB:** Floating Action Button
*   **IAP:** In-App Purchase
*   **CRUD:** Create, Read, Update, Delete
*   **Daftar:** Kumpulan dari beberapa Item Belanja.
*   **Item:** Satu entitas barang yang akan dibeli.
*   **Pantry:** Inventaris virtual untuk item yang sudah dibeli dan disimpan di rumah.
*   **Preset:** Kumpulan item default untuk membuat daftar baru.

**1.4 Referensi**
*   Product Requirement Document (PRD) - BelanjaPraktis v2.0
*   Dokumen Skema Database - BelanjaPraktis v2.0

**1.5 Ikhtisar Dokumen**
Dokumen ini terbagi menjadi beberapa bagian. Bagian 1 memberikan pendahuluan. Bagian 2 memberikan deskripsi umum tentang produk. Bagian 3 merinci persyaratan fungsional dan non-fungsional.

---

### 2. Deskripsi Umum

**2.1 Perspektif Produk**
Aplikasi ini adalah produk perangkat lunak baru yang dikembangkan dari awal menggunakan framework Flutter. Aplikasi ini akan berinteraksi dengan database lokal (SQLite) melalui pustaka Drift untuk persistensi data. Aplikasi juga akan terintegrasi dengan SDK iklan dan API Store untuk IAP, serta pustaka notifikasi lokal.

**2.2 Fungsi Produk**
Fungsi utama dari aplikasi ini adalah sebagai berikut:
1.  Membuat, melihat, mengedit, dan menghapus daftar belanja.
2.  Menambah, mengedit, menghapus, dan menandai item dalam daftar.
3.  Menghitung total harga belanja secara otomatis.
4.  **Memindahkan item yang sudah dibeli ke dalam Pantry virtual.**
5.  **Mengelola item di Pantry, termasuk melacak tanggal kedaluwarsa.**
6.  **Memberikan notifikasi lokal untuk item yang akan kedaluwarsa.**
7.  Menyediakan template daftar belanja untuk mempercepat pembuatan.
8.  Menampilkan iklan (pada versi gratis) dan menyediakan fitur premium "Analisis & Laporan Pantry".

**2.3 Karakteristik Pengguna**
Target pengguna adalah individu atau keluarga yang membutuhkan alat bantu digital untuk mengatur belanja dan mengurangi pemborosan makanan di rumah.

**2.4 Batasan Umum**
*   Aplikasi dikembangkan menggunakan Flutter, BLoC, Freezed, Drift, GoRouter, Fpdart, dan Logger.
*   Semua data pengguna akan disimpan secara lokal di perangkat.
*   Aplikasi harus mendukung orientasi potret (*portrait mode*) saja.

**2.5 Asumsi dan Ketergantungan**
*   Pengguna memiliki koneksi internet untuk menampilkan iklan dan melakukan proses IAP.
*   Sistem operasi perangkat mendukung pengiriman notifikasi lokal.

---

### 3. Persyaratan Spesifik

**3.1 Persyaratan Fungsional**

**3.1.1 Pengelolaan Daftar Belanja (List Management)**
*   **FUNC-LM-001:** Sistem harus menyediakan fungsi untuk membuat daftar belanja baru.
*   **FUNC-LM-002:** Sistem harus menampilkan semua daftar belanja yang ada di layar utama.
*   **FUNC-LM-003:** Sistem harus mengizinkan pengguna untuk mengubah nama daftar belanja.
*   **FUNC-LM-004:** Sistem harus menyediakan fungsi untuk menghapus daftar belanja.
*   **FUNC-LM-005 (DITUNDA):** Pengurutan manual daftar belanja ditunda.

**3.1.2 Pengelolaan Item Belanja (Item Management)**
*   **FUNC-IM-001:** Sistem harus mengizinkan pengguna menambahkan item baru ke daftar belanja.
*   **FUNC-IM-002:** Sistem harus menampilkan semua item dalam sebuah daftar.
*   **FUNC-IM-003:** Pengguna harus dapat menandai item sebagai "sudah dibeli".
*   **FUNC-IM-004:** Sistem harus mengizinkan pengguna untuk mengedit detail item.
*   **FUNC-IM-005:** Sistem harus mengizinkan pengguna untuk menghapus item.
*   **FUNC-IM-006 (DITUNDA):** Pengurutan manual item belanja ditunda.

**3.1.3 Kalkulasi Total Belanja**
*   **FUNC-CALC-001:** Sistem harus secara otomatis menghitung dan menampilkan total harga dari item yang ada di daftar belanja.
*   **FUNC-CALC-002:** Total harus diperbarui secara *real-time* saat ada perubahan pada item.

**3.1.4 Template Preset**
*   **FUNC-PRES-001:** Saat membuat daftar baru, sistem harus menawarkan opsi untuk memilih dari template.
*   **FUNC-PRES-002:** Jika template dipilih, sistem harus mengisi daftar baru dengan item default.

**3.1.5 Pengelolaan Pantry (Pantry Management) - BARU**
*   **FUNC-PAN-001:** Sistem harus menyediakan fungsi untuk memindahkan item yang sudah ditandai (`is_bought`) dari daftar belanja ke Pantry.
*   **FUNC-PAN-002:** Saat proses pemindahan, sistem harus mengizinkan pengguna untuk memasukkan tanggal kedaluwarsa (opsional) untuk setiap item.
*   **FUNC-PAN-003:** Sistem harus memiliki layar "Pantry" yang menampilkan semua item yang tersimpan.
*   **FUNC-PAN-004:** Setiap item di Pantry harus menampilkan nama dan sisa hari sebelum kedaluwarsa.
*   **FUNC-PAN-005:** Sistem harus mengizinkan pengguna untuk menghapus item dari Pantry.
*   **FUNC-PAN-006:** Saat pengguna mengetik item di daftar belanja, sistem dapat memberikan saran jika item tersebut sudah ada di Pantry.

**3.1.6 Notifikasi (Notifications) - BARU**
*   **FUNC-NOTIF-001:** Sistem harus dapat mengirimkan notifikasi lokal ke perangkat pengguna.
*   **FUNC-NOTIF-002:** Sistem harus mengirimkan notifikasi jika ada item di Pantry yang akan kedaluwarsa dalam periode waktu yang ditentukan (misal, H-3).

**3.1.7 Monetisasi**
*   **FUNC-MON-001:** Sistem harus menampilkan iklan *banner* pada versi gratis.
*   **FUNC-MON-002:** Sistem harus menyediakan opsi IAP untuk membeli fitur premium **"Analisis & Laporan Pantry"**.
*   **FUNC-MON-003:** Fitur premium ini mencakup akses ke dashboard analisis pengeluaran, laporan pemborosan, dan insight lainnya berdasarkan data Pantry pengguna.

**3.2 Persyaratan Non-Fungsional**
(Tidak ada perubahan signifikan, tetap berlaku)

**3.3 Persyaratan Antarmuka Eksternal**

**3.3.1 Antarmuka Pengguna (GUI)**
*   **GUI-001:** **Layar Daftar Belanja:** Menampilkan daftar dari `shopping_lists`.
*   **GUI-002:** **Layar Detail Daftar:** Menampilkan item-item dari `shopping_items`. Terdapat tombol untuk "Pindahkan ke Pantry".
*   **GUI-003:** **Layar Pantry (BARU):** Menampilkan semua item dari `pantry_items` dengan status kedaluwarsa.
*   **GUI-004:** **Layar Pengaturan:** Berisi opsi-opsi aplikasi.
*   **GUI-005:** **Navigasi:** Menggunakan `BottomNavigationBar` untuk navigasi utama antara "Daftar Belanja" dan "Pantry".

**3.4 Persyaratan Database**
*   **DB-001:** Aplikasi harus menggunakan database SQLite.
*   **DB-002:** Interaksi dengan database harus dikelola oleh pustaka Drift.
*   **DB-003:** Skema database harus mengimplementasikan tabel `shopping_lists`, `shopping_items`, `item_categories`, `preset_items`, dan **`pantry_items`**.