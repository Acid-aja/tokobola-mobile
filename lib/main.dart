import 'package:flutter/material.dart';
import 'package:tokobola/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'TOKOBOLA',
        theme: ThemeData(
          // 1. Mengaktifkan Dark Mode
          brightness: Brightness.dark,

          // 2. Mengganti warna primer dari Biru ke Merah
          primarySwatch: Colors.red,

          // 3. Menyesuaikan warna utama agar cocok dengan web
          scaffoldBackgroundColor: const Color(
            0xFF111111,
          ), // Latar belakang hitam pekat 
          cardColor: const Color(0xFF1C1C1C), // Warna kartu
          // 4. Menyesuaikan AppBar
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(
              0xFF111111,
            ), // Latar belakang AppBar (spt nav bg-black)
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          // 5. Menetapkan skema warna utama
          colorScheme:
              ColorScheme.fromSwatch(
                primarySwatch: Colors.red,
                brightness: Brightness.dark,
              ).copyWith(
                primary: Colors.red[600], 
                secondary: Colors.redAccent[400],
                surface: const Color(
                  0xFF1C1C1C,
                ), 
                background: const Color(0xFF111111), 
              ),

          // 6. Menyesuaikan tema input field
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF222222), 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xFF444444),
              ), 
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.red[600]!,
              ), 
            ),
            labelStyle: const TextStyle(color: Colors.grey),
          ),

          // 7. Menyesuaikan tema tombol
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600], 
              foregroundColor: Colors.white,
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
