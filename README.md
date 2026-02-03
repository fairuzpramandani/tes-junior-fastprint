# Tes Seleksi Fairuz Pramandani - Junior Programmer - FastPrint

Proyek ini adalah aplikasi CRUD sederhana untuk manajemen produk menggunakan Django dan MySQL.

## Video Demonstrasi
Link Video Face Cam + Penjelasan: https://drive.google.com/file/d/10s8T36KMKGj9X-GyLHUYcxCb8yxXgLTe/view?usp=sharing

## Tech Stack
- Framework: Django 5.2.10
- Database: MySQL

## Cara Menjalankan
1. Clone repositori ini.
2. Buat database kosong bernama `tes_fastprint` di MySQL.
3. Sesuaikan koneksi database di `config/settings.py`.
4. Install library: `pip install -r requirements.txt`.
5. Migrasi database: `python manage.py migrate`.
6. Import data dari API: `python manage.py import_data`.
7. Jalankan server: `python manage.py runserver`.