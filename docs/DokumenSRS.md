### Software Requirements Specification (SRS) - Aplikasi Daftar Belanjaku

**Nama Tim:** Naufal Naazhir Arkaan,  M. Arya Pratama
**Versi:** 1.0
**Tanggal:** 16 september 2025

---

### 1. Pendahuluan

**1.1 Tujuan**
Dokumen ini menyediakan spesifikasi persyaratan perangkat lunak yang detail untuk aplikasi mobile "BelanjaPraktis" versi 1.0. Tujuannya adalah untuk memberikan pemahaman yang jelas dan tidak ambigu tentang fungsionalitas dan batasan sistem kepada tim pengembang, tim pengujian (QA), dan pemangku kepentingan lainnya.

**1.2 Ruang Lingkup Produk**
Aplikasi "BelanjaPraktis" adalah sebuah aplikasi mandiri (*standalone*) untuk platform iOS dan Android yang berfungsi sebagai asisten belanja pribadi dan manajer inventaris rumah. Versi 1.0 akan fokus pada fungsionalitas inti pengelolaan daftar belanja, dan fitur pembeda yaitu **manajemen stok rumahku sederhana**.

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
*   **Stok Rumahku:** Inventaris virtual untuk item yang sudah dibeli dan disimpan di rumah.
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
4.  Memindahkan item yang sudah dibeli ke dalam Stok Rumahku virtual.
5.  Mengelola item di Stok Rumahku (menandai ada/habis).
6.  Memberikan peringatan jika item di daftar belanja sudah ada di Stok Rumahku.
7.  Menyediakan fitur cerdas untuk membuat daftar belanja dengan saran item dari AI berdasarkan tema yang diberikan.
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

*   **3.1.1 Pengelolaan Daftar Belanja (List Management)**
*   **FUNC-LM-001:** Sistem harus menyediakan fungsi untuk membuat daftar belanja baru.
*   **FUNC-LM-002:** Sistem harus menampilkan semua daftar belanja yang ada di layar utama.
*   **FUNC-LM-003:** Sistem harus mengizinkan pengguna untuk mengubah nama daftar belanja.
*   **FUNC-LM-004:** Sistem harus menyediakan fungsi untuk menghapus daftar belanja.
*   **FUNC-LM-005:** Sistem harus menyediakan fungsi untuk membuat daftar belanja baru dengan memasukkan tema (misal: "bahan soto"), dan sistem akan secara otomatis mengisi daftar dengan item-item yang disarankan AI.
*   **FUNC-LM-006:** Untuk item yang disarankan AI, sistem harus menampilkan perkiraan harga per satuan (jika tersedia).
*   **FUNC-LM-007 (DITUNDA):** Pengurutan manual daftar belanja ditunda.

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



**3.1.4 Pengelolaan Stok Rumahku**
*   **FUNC-SR-001:** Sistem harus menyediakan fungsi untuk memindahkan item yang sudah ditandai (`is_bought`) dari daftar belanja ke Stok Rumahku.
*   **FUNC-SR-002:** Sistem harus memiliki layar "Stok Rumahku" yang menampilkan semua item yang tersimpan.
*   **FUNC-SR-003:** Setiap item di Stok Rumahku harus menampilkan nama dan status keberadaan (ada/habis).
*   **FUNC-SR-004:** Sistem harus mengizinkan pengguna untuk menghapus item dari Stok Rumahku.
*   **FUNC-SR-005:** Saat pengguna menambahkan item ke daftar belanja, sistem harus memberikan peringatan jika item tersebut sudah ada di Stok Rumahku.



**3.1.7 Monetisasi**
*   **FUNC-MON-001:** Sistem harus menampilkan iklan *banner* pada versi gratis.
*   **FUNC-MON-002:** Sistem harus menyediakan opsi IAP untuk membeli fitur premium **"AI & Stok Rumahku Tanpa Batas"**.
*   **FUNC-MON-003:** Fitur premium ini akan menghapus batasan pembuatan daftar belanja menggunakan AI dan batasan jumlah item di "Stok Rumahku".
*   **FUNC-MON-004:** Sistem harus membatasi pembuatan daftar belanja menggunakan AI menjadi maksimal 3 daftar untuk pengguna versi gratis.
*   **FUNC-MON-005:** Sistem harus membatasi jumlah item yang dapat disimpan di "Stok Rumahku" menjadi maksimal 20 item untuk pengguna versi gratis.
*   **FUNC-MON-006:** Sistem harus menyediakan opsi IAP untuk membeli fitur premium **"Analisis & Laporan Belanja"**.
*   **FUNC-MON-007:** Fitur premium ini mencakup akses ke dashboard analisis pengeluaran, laporan, dan *insight* lainnya berdasarkan data belanja pengguna.

**3.2 Persyaratan Non-Fungsional**
(Tidak ada perubahan signifikan, tetap berlaku)

**3.3 Persyaratan Antarmuka Eksternal**

**3.3.1 Antarmuka Pengguna (GUI)**
*   **GUI-001:** **Layar Daftar Belanja:** Menampilkan daftar dari `shopping_lists`. Menyediakan opsi untuk membuat daftar baru (kosong atau dengan saran AI).
*   **GUI-002:** **Layar Detail Daftar:** Menampilkan item-item dari `shopping_items`. Terdapat tombol untuk "Pindahkan ke Stok Rumahku".
*   **GUI-003:** **Layar Stok Rumahku:** Menampilkan semua item dari `stok_rumahku_items` dengan status keberadaan.
*   **GUI-005:** **Navigasi:** Menggunakan `BottomNavigationBar` untuk navigasi utama antara "Daftar Belanja" dan "Stok Rumahku".

**3.4 Persyaratan Database**
*   **DB-001:** Aplikasi harus menggunakan database SQLite.
*   **DB-002:** Interaksi dengan database harus dikelola oleh pustaka Drift.
*   **DB-003:** Skema database harus mengimplementasikan tabel `shopping_lists`, `shopping_items`, dan **`stok_rumahku_items`**.