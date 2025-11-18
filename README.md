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
# Tugas 8
## 🔄 Perbedaan Navigator.push() vs Navigator.pushReplacement()
Dalam Flutter, `Navigator` mengelola tumpukan (stack) halaman. Perbedaan utama antara kedua metode ini terletak pada bagaimana mereka berinteraksi dengan stack tersebut:
1.  **`Navigator.push()`**
    * **Apa yang dilakukan:** Mendorong halaman baru ke *atas* tumpukan. Halaman sebelumnya tetap ada di tumpukan, tepat di bawah halaman baru.
    * **Implikasi:** Pengguna dapat menekan tombol "kembali" (baik fisik atau di `AppBar`) untuk kembali ke halaman sebelumnya.
    * **Kapan digunakan di TokoBola:** Metode ini digunakan di `lib/menu.dart` saat menekan tombol "Create Product". Ini adalah pilihan yang tepat karena pengguna mungkin ingin *kembali* ke halaman menu utama setelah selesai (atau batal) mengisi form.

2.  **`Navigator.pushReplacement()`**
    * **Apa yang dilakukan:** Mendorong halaman baru ke tumpukan dan *membuang* halaman saat ini dari tumpukan. Halaman sebelumnya diganti oleh halaman baru.
    * **Implikasi:** Pengguna tidak dapat menekan tombol "kembali" untuk kembali ke halaman yang baru saja mereka tinggalkan, karena halaman tersebut sudah tidak ada di tumpukan.
    * **Kapan digunakan di TokoBola:** Metode ini digunakan di `lib/widgets/left_drawer.dart`. Ini sangat ideal untuk navigasi via *drawer*. Saat pengguna beralih dari "Halaman Utama" ke "Tambah Produk" (atau sebaliknya) melalui *drawer*, kita tidak ingin tumpukan halaman menjadi bertambah. `pushReplacement` memastikan bahwa kita berpindah halaman tanpa membuat tumpukan navigasi yang membingungkan.

---
## 🏗️ Pemanfaatan Hierarki Widget (Padding, SingleChildScrollView, ListView)
Hierarki widget ini adalah fondasi untuk menciptakan struktur visual yang konsisten di seluruh aplikasi TokoBola:
* **`Scaffold`**: Digunakan sebagai widget *root* untuk setiap halaman, baik di `lib/menu.dart` maupun `lib/product_form.dart`. `Scaffold` menyediakan "kerangka" standar yang memiliki slot untuk `appBar`, `body`, dan `drawer`.
* **`AppBar`**: Ditempatkan di properti `appBar` milik `Scaffold`. Dengan menetapkan `AppBar` di setiap halaman, kita memastikan *header* aplikasi selalu terlihat sama, memiliki skema warna yang konsisten (biru dengan teks putih), dan tombol menu (hamburger icon) otomatis muncul jika ada `Drawer`.
* **`Drawer`**: Ditempatkan di properti `drawer` milik `Scaffold`. Dengan memanggil widget `LeftDrawer` yang sama di setiap halaman, kita menjamin bahwa menu navigasi utama aplikasi selalu identik dan mudah diakses dari mana saja.
---
## 🎨 Kelebihan Layout Widget pada Form (Padding, SingleChildScrollView, ListView)
Widget layout ini sangat krusial dalam mendesain form yang fungsional dan rapi:
* **`Padding`**
    * **Kelebihan:** Memberikan "ruang napas" (whitespace) di sekitar elemen UI. Tanpa `Padding`, elemen-elemen form akan menempel satu sama lain dan menempel di tepi layar, membuatnya terlihat sesak dan sulit dibaca.
    * **Contoh di Aplikasi:** Di `lib/product_form.dart`, setiap `TextFormField` dibungkus dalam `Padding(padding: const EdgeInsets.all(8.0), ...)`. Ini menciptakan jarak 8 piksel yang konsisten di sekeliling setiap kotak input.

* **`SingleChildScrollView`**
    * **Kelebihan:** Ini adalah widget fundamental untuk form. Form seringkali memiliki banyak *field* yang total panjangnya melebihi tinggi layar, terutama saat *keyboard virtual* muncul. `SingleChildScrollView` membungkus konten form dan secara otomatis memungkinkan pengguna untuk *menggulir* (scroll) ke atas dan ke bawah, mencegah *overflow error* (UI terpotong atau error kuning-hitam).
    * **Contoh di Aplikasi:** Di `lib/product_form.dart`, seluruh `Form` (yang berisi `Column` dari semua `TextFormField`) dibungkus sebagai *child* dari `SingleChildScrollView`.

* **`ListView`**
    * **Kelebihan:** Mirip dengan `SingleChildScrollView`, `ListView` menyediakan kemampuan *scrolling*. Namun, ia secara spesifik dirancang untuk menyusun *daftar* item secara efisien. Ini adalah widget standar untuk membuat daftar menu.
    * **Contoh di Aplikasi:** `ListView` digunakan di `lib/widgets/left_drawer.dart` untuk menyusun `DrawerHeader` dan `ListTile` (menu "Halaman Utama" dan "Tambah Produk") secara vertikal di dalam *drawer*.

---
## 🖌️ Penyesuaian Warna Tema untuk Identitas Visual
Identitas visual yang konsisten dicapai dengan mendefinisikan tema warna di satu tempat terpusat, yaitu di dalam `MaterialApp` pada file `lib/main.dart`.

1.  **Definisi Tema:** Di `lib/main.dart`, properti `theme` dari `MaterialApp` diatur ke `ThemeData()`.
2.  **Penetapan Warna Primer:** Warna utama (brand) aplikasi ditetapkan menggunakan `colorScheme`. Secara spesifik, kode `ColorScheme.fromSwatch(primarySwatch: Colors.blue)` memberi tahu Flutter untuk menggunakan palet warna `Colors.blue` sebagai dasar tema.
3.  **Penggunaan Konsisten:** Widget lain di seluruh aplikasi (seperti di `lib/menu.dart` dan `lib/product_form.dart`) tidak menetapkan warna biru secara manual. Sebaliknya, mereka mengambil warna ini secara dinamis dari tema menggunakan `Theme.of(context).colorScheme.primary`.

Keuntungan terbesarnya adalah jika "TokoBola" memutuskan untuk *rebranding* menjadi warna hijau, kita hanya perlu mengubah `Colors.blue` menjadi `Colors.green` di `main.dart`, dan seluruh aplikasi (termasuk `AppBar` dan tombol) akan otomatis ikut berubah warna.

---
# Tugas 9

## 🧩 Mengapa Kita Perlu Membuat Model Dart untuk JSON?
Ketika Flutter berkomunikasi dengan backend Django, data dikirim dalam format JSON. Membuat model Dart sangat penting karena:

* `Validasi Tipe Data` : Menentukan tipe setiap field (String, int, double, dll) sehingga error runtime berkurang.  
* `Null-Safety` : Model memastikan field wajib tidak null dan sesuai aturan Dart modern.  
* `Maintainability` : Jika struktur backend berubah, kita cukup memperbarui model → tidak perlu ubah seluruh aplikasi.  
* `Parsing Konsisten` : Fungsi `fromJson()` dan `toJson()` membuat data mudah dikelola dan rapi.

### ⚠️ Jika Hanya Menggunakan Map<String, dynamic>
* Rawan error tipe data  
* Rawan null & `NoSuchMethodError`  
* Kode lebih berantakan  
* Validasi tersebar di banyak tempat  

---

## 🌐 Fungsi Package `http` dan `CookieRequest`

### 📦 http
* Request HTTP biasa (GET/POST)  
* Tidak menyimpan cookie  
* Cocok untuk API publik atau endpoint non-auth  

### 🍪 CookieRequest (pbp_django_auth)
* Menyimpan cookie session Django otomatis  
* Digunakan untuk login dan request authenticated  
* Mendukung mekanisme autentikasi berbasis session Django  

### 🔍 Perbedaan Utama
| Aspek | http | CookieRequest |
|-------|------|----------------|
| Session login | ❌ Tidak | ✔️ Ya |
| Menyimpan cookie otomatis | ❌ Tidak | ✔️ Ya |
| Cocok untuk | API publik | Django Auth |

---

## 🔁 Mengapa CookieRequest Harus Dibagikan ke Semua Komponen?
Karena session login harus **konsisten** di seluruh aplikasi.

* Jika membuat instance baru → session hilang  
* User dianggap belum login  
* Request authenticated akan gagal  

Dengan **Provider**, CookieRequest dapat:
* Digunakan di semua halaman  
* Mengecek status login  
* Mengirim request protected  
* Melakukan logout dengan benar  

---

## 🔌 Konfigurasi Flutter ↔ Django

### 1️⃣ Tambahkan `10.0.2.2` ke ALLOWED_HOSTS
Android emulator menggunakan alamat ini untuk mengakses komputer host.

### 2️⃣ Aktifkan CORS
Django harus mengizinkan akses dari aplikasi Flutter.

### 3️⃣ Atur Cookie dan SameSite
```python
SESSION_COOKIE_SAMESITE = None
SESSION_COOKIE_SECURE = False
```
### 4️⃣ Tambahkan Permission Internet di Android
```python
<uses-permission android:name="android.permission.INTERNET" />
```
Jika salah konfigurasi → cookie tidak terkirim → login selalu gagal.

---

## 🔄 Mekanisme Pengiriman Data Flutter → Django → Flutter
1. User mengisi input di Flutter
2. Flutter mengirim request(POST/GET)
3. Django memvalidasi dan menyimpan ke database
4. Django mengirim response JSON
5. Flutter mengubah JSON menjadi model DART
6. UI menampilkan data melalui widget
   
---

## 🔐 Mekanisme Autentikasi (Login → Register → Logout)
### 🔹 Register
1. Flutter mengirim data akun ke Django.
2. Django membuat user baru.
3. Flutter menampilkan hasil (sukses/gagal).

### 🔹 Login
1. Flutter memanggil `cookieRequest.login()`.
2. Django memverifikasi kredensial.
3. Django mengirim cookie session.
4. `CookieRequest` menyimpan cookie tersebut.
5. Flutter mengarahkan user ke halaman utama.

### 🔹 Akses Setelah Login
- Semua request selanjutnya menggunakan instance `CookieRequest` yang sama.

### 🔹 Logout
1. Flutter memanggil `cookieRequest.logout()`.
2. Django menghapus session.
3. Flutter diarahkan kembali ke halaman login.

---
## ✨ Credit
Program ini dibuat oleh Izzudin Abdul Rasyid - 2406495786 - PBP D
