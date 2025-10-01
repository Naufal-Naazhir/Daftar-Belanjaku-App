// script.js

// Tunggu sampai semua konten HTML dimuat
document.addEventListener('DOMContentLoaded', function() {

    // Cari tombol "Tambah List" di halaman index.html
    const addListButton = document.getElementById('add-list-btn');
    if (addListButton) {
        addListButton.addEventListener('click', function() {
            // Arahkan ke halaman tambah_list.html
            window.location.href = 'tambah_list.html';
        });
    }

    // Cari tombol "Tambah Item" di halaman detail_list.html
    const addItemButton = document.getElementById('add-item-btn');
    if (addItemButton) {
        addItemButton.addEventListener('click', function() {
            // Arahkan ke halaman tambah_item.html
            window.location.href = 'tambah_item.html';
        });
    }

    // Kamu bisa menambahkan logika lain di sini jika perlu
});