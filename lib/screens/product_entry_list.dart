import 'package:flutter/material.dart';
import 'package:tokobola/models/product_entry.dart'; // Ganti dari football_news dan news_entry
import 'package:tokobola/widgets/left_drawer.dart'; // Ganti dari football_news
import 'package:tokobola/screens/product_detail.dart'; // Ganti dari football_news dan news_detail
import 'package:tokobola/widgets/product_entry_card.dart'; // Ganti dari football_news dan news_entry_card
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget { // Ganti nama kelas
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState(); // Ganti nama kelas
}

class _ProductEntryListPageState extends State<ProductEntryListPage> { // Ganti nama kelas
  Future<List<ProductEntry>> fetchNews(CookieRequest request) async { // Ganti NewsEntry
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listNews = []; // Ganti NewsEntry
    for (var d in data) {
      if (d != null) {
        listNews.add(ProductEntry.fromJson(d)); // Ganti NewsEntry
      }
    }
    return listNews;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'), // Ganti judul
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNews(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in tokobola yet.', // Ganti teks
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard( // Ganti NewsEntryCard
                  product: snapshot.data![index],
                  onTap: () {
                    // Show a snackbar when news card is clicked
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text("You clicked on ${snapshot.data![index].name}"), 
                        ),
                      );
                    // Navigasi ke halaman detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(news: snapshot.data![index]), 
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}