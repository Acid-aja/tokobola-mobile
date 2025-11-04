# 🏪 TokoBola mobile 
Program ini dibuat untuk memenuhi tugas individu PBP

---
# TUGAS 7
## 🌳 Apa itu Widget Tree?

Pada Flutter, **semua elemen UI dibangun menggunakan widget**.  
Setiap widget memiliki posisi di dalam **_widget tree_** — yaitu struktur hierarki yang menunjukkan hubungan antar widget.

- **Widget tree** menggambarkan bagaimana widget saling bersarang (_nested_).  
- **Parent widget (induk)** berisi **child widget (anak)** yang membentuk tampilan secara keseluruhan.  
- Setiap child widget mewarisi **context** dari widget induknya.

---
## 🧩 Daftar Widget yang Digunakan dan Fungsinya

| Widget | Fungsi |
|--------|---------|
| **MaterialApp** | Widget root aplikasi yang menyediakan tema, navigasi, dan struktur dasar aplikasi berbasis Material Design. |
| **Scaffold** | Menyediakan struktur halaman lengkap (AppBar, Body, FloatingButton, Drawer, dll). |
| **AppBar** | Menampilkan bagian atas halaman dengan judul “TokoBola”. |
| **Text** | Menampilkan teks seperti judul, nama, dan label menu. |
| **Padding** | Memberi jarak di sekitar widget agar tampilan lebih rapi. |
| **Column** | Menyusun widget secara vertikal. |
| **Row** | Menyusun widget secara horizontal. |
| **Card** | Menampilkan informasi dalam bentuk kartu dengan efek bayangan (_elevation_). |
| **Container** | Menampung dan mengatur ukuran, padding, dan tata letak widget lain. |
| **SizedBox** | Memberikan jarak vertikal antara widget. |
| **Center** | Memusatkan posisi child widget. |
| **GridView.count** | Membuat grid dengan jumlah kolom tertentu. |
| **Icon** | Menampilkan ikon dari paket Material Design. |
| **Material** | Memberikan efek visual khas Material Design seperti warna dan bentuk sudut. |
| **InkWell** | Memberikan efek “ripple” saat widget ditekan, sekaligus mendeteksi interaksi pengguna. |
| **SnackBar** | Menampilkan notifikasi sementara di bagian bawah layar saat tombol ditekan. |
| **MediaQuery** | Mendapatkan informasi ukuran layar untuk membuat tampilan responsif. |

---
## 🏗️ Fungsi dari Widget `MaterialApp`

`MaterialApp` adalah **root widget** dari aplikasi Flutter berbasis Material Design.  
Fungsinya antara lain:

- Menyediakan **tema global** (warna, font, ikon) yang digunakan di seluruh aplikasi.  
- Mengatur **navigasi halaman** (melalui properti `home`, `routes`, dan `navigator`).  
- Mengatur **localization** (bahasa dan format).  
- Menentukan **judul aplikasi** (`title`) yang muncul di task manager.

👉 Karena fungsinya yang luas, `MaterialApp` biasanya menjadi **widget paling atas** (_root widget_) dalam setiap proyek Flutter berbasis Material Design.

---
## ⚖️ Perbedaan antara StatelessWidget dan StatefulWidget

| Aspek | StatelessWidget | StatefulWidget |
|-------|------------------|----------------|
| **Kegunaan** | Untuk tampilan statis yang tidak berubah setelah dibuat. | Untuk tampilan dinamis yang bisa berubah karena interaksi pengguna atau data. |
| **Penyimpanan state** | Tidak memiliki `State`, semua data bersifat konstan. | Memiliki objek `State` untuk menyimpan dan mengubah data selama aplikasi berjalan. |
| **Metode utama** | Hanya `build(BuildContext context)` | Dua bagian: `StatefulWidget` (kerangka) dan `State` (isi logika & perubahan). |
| **Contoh penggunaan** | Tampilan teks, ikon, atau layout sederhana. | Form input, animasi, tombol toggle, atau counter. |

📘 Dalam proyek ini, **semua widget bersifat stateless** karena:
- Tidak ada data yang berubah secara real-time.
- Semua konten (nama, NPM, kelas, dan menu) bersifat tetap.

## 🧱 Apa itu `BuildContext` dan Mengapa Penting?

`BuildContext` adalah **objek yang merepresentasikan lokasi sebuah widget di dalam widget tree**.  
Setiap kali Flutter memanggil metode `build()`, ia memberikan `BuildContext` agar widget tahu di mana posisinya dan bagaimana mengakses widget induknya.

**Fungsi utama:**
- Mengakses tema dan warna global dari `Theme.of(context)`.
- Menampilkan dialog, snackbar, dan navigasi melalui `ScaffoldMessenger.of(context)` atau `Navigator.of(context)`.
- Meneruskan data antar-widget.

📘 Contoh dalam proyek:
```dart
backgroundColor: Theme.of(context).colorScheme.primary,
```

---
## 🔁 Konsep “Hot Reload” dan “Hot Restart”
| Fitur           | Penjelasan                                                                                                                   | Kapan digunakan                                                                     |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| **Hot Reload**  | Menyimpan perubahan kode ke aplikasi **tanpa menghapus state yang sedang berjalan**. Cepat untuk melihat hasil perubahan UI. | Saat memperbarui tampilan, teks, atau warna tanpa ingin mengulang seluruh aplikasi. |
| **Hot Restart** | Memuat ulang seluruh aplikasi **dari awal** dan **menghapus semua state**.                                                   | Saat ada perubahan struktur widget besar atau inisialisasi ulang data diperlukan.   |


---
## ✨ Credit
Program ini dibuat oleh Izzudin Abdul Rasyid - 2406495786 - PBP D
