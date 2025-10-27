### Skema Database - Aplikasi Aplikasi Daftar Belanjaku

**Database Engine:** SQLite (melalui Drift)

---

**1. Tabel: `shopping_lists`**
Tabel ini akan menyimpan informasi tentang setiap daftar belanja yang dibuat oleh pengguna.

*   **Tujuan:** Menyimpan daftar-daftar belanja utama.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap daftar belanja.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Nama daftar belanja (misal: "Belanja Mingguan", "Supermarket").
    *   `created_at` (INTEGER)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Timestamp saat daftar dibuat (Unix timestamp dalam UTC).
    *   `updated_at` (INTEGER)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Timestamp saat daftar terakhir diubah (Unix timestamp dalam UTC).

---

**2. Tabel: `shopping_items`**
Tabel ini akan menyimpan detail item-item yang ada di dalam setiap daftar belanja.

*   **Tujuan:** Menyimpan item-item spesifik dalam daftar belanja.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap item belanja.
    *   `list_id` (INTEGER)
        *   **Constraint:** NOT NULL, FOREIGN KEY REFERENCES `shopping_lists(id)` ON DELETE CASCADE
        *   **Deskripsi:** ID daftar belanja tempat item ini berada. `ON DELETE CASCADE` berarti jika daftar belanja dihapus, semua item di dalamnya juga akan terhapus.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Nama barang (misal: "Beras", "Saus Tomat").
    *   `price` (REAL)
        *   **Constraint:** NULLABLE (dapat kosong)
        *   **Deskripsi:** Harga barang (dalam format desimal).
    *   `quantity` (REAL)
        *   **Constraint:** NULLABLE (dapat kosong)
        *   **Deskripsi:** Kuantitas barang (misal: 2, 0.5).
    *   `unit` (TEXT)
        *   **Constraint:** NULLABLE (dapat kosong)
        *   **Deskripsi:** Satuan barang (misal: "kg", "buah", "pack").
    *   `is_bought` (INTEGER)
        *   **Constraint:** NOT NULL, DEFAULT 0 (0 for false, 1 for true)
        *   **Deskripsi:** Status apakah item sudah dibeli atau belum.
    *   `order_index` (INTEGER)
        *   **Constraint:** NOT NULL, DEFAULT 0
        *   **Deskripsi:** Indeks urutan item dalam daftar. Digunakan untuk *drag-and-drop ordering*.

---

**3. Tabel: `item_categories`**
Tabel ini akan menyimpan kategori-kategori preset (misal: "Supermarket", "Pasar Tradisional") yang dapat digunakan sebagai template saat membuat daftar baru.

*   **Tujuan:** Mendefinisikan kategori-kategori preset untuk pengisian otomatis.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap kategori.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL, UNIQUE
        *   **Deskripsi:** Nama kategori (misal: "Supermarket", "Pasar Tradisional", "Rumah Tangga").

---

**4. Tabel: `preset_items`**
Tabel ini akan menyimpan item-item default yang terkait dengan setiap kategori preset.

*   **Tujuan:** Menyimpan item-item default yang akan diisi ketika user memilih kategori preset.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap item preset.
    *   `category_id` (INTEGER)
        *   **Constraint:** NOT NULL, FOREIGN KEY REFERENCES `item_categories(id)` ON DELETE CASCADE
        *   **Deskripsi:** ID kategori preset tempat item ini berada. `ON DELETE CASCADE` berarti jika kategori dihapus, item preset di dalamnya juga akan terhapus.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Nama item preset (misal: "Beras", "Susu", "Telur").
    *   `default_price` (REAL)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Harga default opsional untuk item preset.
    *   `default_quantity` (REAL)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Kuantitas default opsional untuk item preset.
    *   `default_unit` (TEXT)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Satuan default opsional untuk item preset.
    *   `order_index` (INTEGER)
        *   **Constraint:** NOT NULL, DEFAULT 0
        *   **Deskripsi:** Indeks urutan item dalam kategori preset.

---

---

**5. Tabel: `pantry_items`**
Tabel ini menyimpan inventaris item yang sudah dibeli oleh pengguna, yang dipindahkan dari daftar belanja.

*   **Tujuan:** Melacak stok barang di rumah dan tanggal kedaluwarsanya.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap item di pantry.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Nama barang.
    *   `quantity` (REAL)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Kuantitas barang.
    *   `unit` (TEXT)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Satuan barang.
    *   `purchase_date` (INTEGER)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Timestamp saat item ditambahkan ke pantry.
    *   `expiry_date` (INTEGER)
        *   **Constraint:** NULLABLE
        *   **Deskripsi:** Timestamp tanggal kedaluwarsa item.

---

### Diagram Hubungan Entitas (ERD - Konseptual)

```
+-----------------+      +-----------------+      +-----------------+
| shopping_lists  |      | shopping_items  |      | item_categories |
+-----------------+      +-----------------+      +-----------------+
| id (PK)         |<-----| list_id (FK)    |      | id (PK)         |<---+
| name            |      | id (PK)         |      | name            |    |
| created_at      |      | name            |      +-----------------+    |
| updated_at      |      | price           |                             |
+-----------------+      | quantity        |      +-----------------+    |
                         | unit            |      | pantry_items    |    |
                         | is_bought       |      +-----------------+    |
                         | order_index     |      | id (PK)         |    |
                         +-----------------+      | name            |    |
                                                  | quantity        |    |
                                                  | purchase_date   |    |
                                                  | expiry_date     |    |
                                                  +-----------------+    |
                                                                         |
                                             +-----------------+         |
                                             | preset_items    |         |
                                             +-----------------+         |
                                             | id (PK)         |         |
                                             | category_id (FK)|---------+
                                             | name            |
                                             | default_price   |
                                             | default_quantity|
                                             | default_unit    |
                                             | order_index     |
                                             +-----------------+
```

---

Skema ini mencakup semua entitas dan properti yang kita diskusikan, termasuk hubungan dan batasan yang diperlukan untuk menjaga integritas data dalam aplikasi yang *simple* dan *ringan*. Kolom `order_index` ditambahkan ke `shopping_items` dan `preset_items` untuk mendukung fitur *drag-and-drop ordering*.