import 'package:flutter/material.dart';
import 'package:tokobola/screens/menu.dart';
import 'package:tokobola/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = ""; 
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "Jersey";
  bool _isFeatured = false;

  final List<String> _categories = [
    'Jersey',
    'Sepatu',
    'Bola',
    'Aksesoris',
    'random',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'tambah product baru',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==== Nama Produk ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // ==== Harga Produk ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga (IDR)",
                    labelText: "Harga (IDR)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _price = int.tryParse(value) ?? 0;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    if (int.parse(value) <= 0) {
                      return "Harga harus lebih besar dari nol!";
                    }
                    return null;
                  },
                ),
              ),
              // ==== Deskripsi ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _description = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              // ==== Kategori ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
                  onChanged: (newValue) =>
                      setState(() => _category = newValue!),
                ),
              ),
              // ==== URL THUMBANAIL ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _thumbnail = value,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final uri = Uri.tryParse(value);
                      if (uri == null ||
                          !uri.hasAbsolutePath ||
                          (!uri.scheme.startsWith('http'))) {
                        return "Masukkan URL yang valid (http:// atau https://)";
                      }
                    }
                    return null; // Opsional, jadi boleh kosong
                  },
                ),
              ),
              // ==== IS FEATURED ====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (value) => setState(() {
                    _isFeatured = value;
                  }),
                ),
              ),
              // ==== TOMBOL SAVE====
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Tampilkan pop-up
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Deskripsi: $_description'),
                                    Text('Kategori: $_category'),
                                    Text('Thumbnail: $_thumbnail'),
                                    Text(
                                      'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  // Ganti dengan kode ini
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // TODO: Ganti URL ini dengan URL di backend Django tokobola Anda
                                      // Misalnya: "http://localhost:8000/create-product-flutter/"
                                      // Pastikan URL-nya benar (10.0.2.2 untuk emulator Android jika Django di localhost)

                                      final response = await request.postJson(
                                        "http://localhost:8000/create-flutter/", // <-- PASTIKAN URL INI BENAR
                                        jsonEncode({
                                          'name': _name,
                                          'price': _price,
                                          'description': _description,
                                          'thumbnail': _thumbnail,
                                          'category': _category,
                                          'is_featured': _isFeatured,
                                          // Pastikan nama field ini (name, price, dll.)
                                          // sama persis dengan yang ada di model Product Django Anda
                                        }),
                                      );

                                      if (context.mounted) {
                                        if (response['status'] == 'success') {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Produk baru berhasil disimpan!",
                                              ),
                                            ),
                                          );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage(),
                                            ), // Ganti MyHomePage() jika perlu
                                          );
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Terjadi kesalahan, silakan coba lagi.",
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
