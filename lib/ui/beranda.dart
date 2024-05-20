import 'package:flutter/material.dart';//membuat tampilan aplikasi
import '../widget/sidebar.dart';//menghandle sidebar pada tampilan aplikasi

class Beranda extends StatelessWidget {//Kelas Beranda sebagai halaman utama dari aplikasi
  const Beranda({super.key});// Konstruktor kosong

  @override//membuat tampilan aplikasi
  Widget build(BuildContext context) {
    return Scaffold(//Mengembalikan tampilan Scaffold dari Flutter
      drawer: Sidebar(),//Menambahkan sidebar pada tampilan aplikasi
      appBar: AppBar(title: Text("Beranda")),//Menambahkan judul pada AppBar
      body: Center(//Menambahkan konten pada tampilan aplikasi
        child: Text("Selamat Datang"),// Menambahkan teks "Selamat Datang" pada konten
      ),
    );
  }
}