
### Entity-Relationship Diagram (ERD) - Aplikasi Daftar Belanjaku

#### Legenda Notasi (Crow's Foot Notation)

*   `PK`: Primary Key (Kunci Utama)
*   `FK`: Foreign Key (Kunci Asing)
*   `|` : Menandakan "Satu" (One)
*   `<` : Menandakan "Banyak" (Many)
*   `o` : Menandakan "Opsional" (Zero or...)
*   `||`: Menandakan "Satu dan Hanya Satu" (One and Only One)
*   `|<`: Menandakan "Satu atau Banyak" (One or Many)

---

#### Diagram

Diagram ini menunjukkan dua kelompok hubungan utama:
1.  **Daftar Belanja & Itemnya:** Hubungan antara `shopping_lists` dan `shopping_items`.
2.  **Template & Item Presetnya:** Hubungan antara `item_categories` dan `preset_items`.

```mermaid
erDiagram
    shopping_lists {
        INT id PK "Primary Key"
        TEXT name
        INTEGER created_at
        INTEGER updated_at
    }

    shopping_items {
        INT id PK "Primary Key"
        INT list_id FK "Foreign Key"
        TEXT name
        REAL price "(Nullable)"
        REAL quantity "(Nullable)"
        TEXT unit "(Nullable)"
        INTEGER is_bought
        INTEGER order_index
    }

    item_categories {
        INT id PK "Primary Key"
        TEXT name "Unique"
    }

    preset_items {
        INT id PK "Primary Key"
        INT category_id FK "Foreign Key"
        TEXT name
        REAL default_price "(Nullable)"
        REAL default_quantity "(Nullable)"
        TEXT default_unit "(Nullable)"
        INTEGER order_index
    }

    shopping_lists ||--|{ shopping_items : "memiliki"
    item_categories ||--|{ preset_items : "memiliki"

```

---

#### Penjelasan Hubungan

1.  **`shopping_lists` dan `shopping_items`**
    *   **Jenis Hubungan:** Satu-ke-Banyak (*One-to-Many*)
    *   **Deskripsi:**
        *   Satu `shopping_list` dapat memiliki **satu atau banyak** `shopping_items`.
        *   Setiap `shopping_item` harus terhubung ke **satu dan hanya satu** `shopping_list`.
    *   **Implementasi Teknis:** Hubungan ini diimplementasikan melalui *foreign key* `list_id` di tabel `shopping_items` yang merujuk ke `id` di tabel `shopping_lists`. Jika sebuah `shopping_list` dihapus, semua `shopping_items` yang terkait dengannya juga akan dihapus (karena ada *constraint* `ON DELETE CASCADE`).

2.  **`item_categories` dan `preset_items`**
    *   **Jenis Hubungan:** Satu-ke-Banyak (*One-to-Many*)
    *   **Deskripsi:**
        *   Satu `item_category` (template, misal: "Supermarket") dapat memiliki **satu atau banyak** `preset_items` (item default, misal: "Beras", "Susu").
        *   Setiap `preset_item` harus terhubung ke **satu dan hanya satu** `item_category`.
    *   **Implementasi Teknis:** Hubungan ini diimplementasikan melalui *foreign key* `category_id` di tabel `preset_items` yang merujuk ke `id` di tabel `item_categories`.