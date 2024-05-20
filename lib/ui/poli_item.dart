import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {// Mendefinisikan kelas PoliItem sebagai StatelessWidget
  final Poli poli;

  const PoliItem({Key? key, required this.poli}) : super(key: key);// Konstruktor untuk kelas PoliItem
  
  @override// Metode build untuk membuat tampilan widget
  Widget build(BuildContext context) {
    return GestureDetector( // Menggunakan GestureDetector untuk mendeteksi interaksi pengguna
      child: Card(// Menggunakan Card untuk membuat kotak dengan bayangan
        child: ListTile(// Menggunakan ListTile untuk membuat tampilan item poli dalam bentuk daftar
          title: Text("${poli.namaPoli}"),// Menggunakan Text untuk menampilkan teks nama poli
        ),
      ),
      onTap: () {      // Pada callback onTap, gunakan Navigator untuk berpindah ke halaman PoliDetail dengan objek Poli sebagai parameter
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));// Navigasi ke halaman PoliDetail dengan objek Poli baru sebagai parameter
      },
    );
  }
}