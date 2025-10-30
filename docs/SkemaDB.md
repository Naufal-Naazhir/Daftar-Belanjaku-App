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

**5. Tabel: `stok_rumahku_items`**
Tabel ini menyimpan inventaris item yang sudah dibeli oleh pengguna, yang dipindahkan dari daftar belanja.

*   **Tujuan:** Melacak stok barang di rumah untuk mencegah pembelian duplikat.
*   **Kolom:**
    *   `id` (INTEGER)
        *   **Constraint:** PRIMARY KEY, AUTOINCREMENT
        *   **Deskripsi:** ID unik untuk setiap item di Stok Rumahku.
    *   `name` (TEXT)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Nama barang.
    *   `added_at` (INTEGER)
        *   **Constraint:** NOT NULL
        *   **Deskripsi:** Timestamp saat item ditambahkan ke Stok Rumahku.

---

### Diagram Hubungan Entitas (ERD - Konseptual)

```
+-----------------+
| shopping_lists  |
+-----------------+
| id (PK)         |<-----|
| name            |
| created_at      |
| updated_at      |
+-----------------+

+-----------------+
| shopping_items  |
+-----------------+
| id (PK)         |
| list_id (FK)    |
| name            |
| price           |
| quantity        |
| unit            |
| is_bought       |
| order_index     |
+-----------------+

+-----------------+
| stok_rumahku_items |
+-----------------+
| id (PK)         |
| name            |
| added_at        |
+-----------------+
```

---

Skema ini mencakup semua entitas dan properti yang kita diskusikan, termasuk hubungan dan batasan yang diperlukan untuk menjaga integritas data dalam aplikasi yang *simple* dan *ringan*. Kolom `order_index` ditambahkan ke `shopping_items` dan `preset_items` untuk mendukung fitur *drag-and-drop ordering*.