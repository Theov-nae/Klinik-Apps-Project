import 'package:flutter/material.dart'; // Mengimpor library Flutter material
import '../model/poli.dart'; // Mengimpor model Poli
//import 'poli_detail.dart'; // Mengimpor PoliDetail widget
import 'poli_item.dart'; // Mengimpor PoliItem widget
import 'poli_form.dart'; // Mengimpor PoliForm widget
import '../widget/sidebar.dart'; // Mengimpor sidebar widget

class PoliPage extends StatefulWidget {// Membuat kelas PoliPage yang merupakan widget stateful
  const PoliPage({super.key});

  @override// Membuat state untuk kelas PoliPage
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {// Membuat kelas _PoliPageState sebagai state dari kelas PoliPage
  @override// Menentukan tampilan untuk widget PoliPage
  Widget build(BuildContext context) {
    return Scaffold( // Menggunakan Scaffold widget untuk membangun struktur dasar halaman
      drawer: Sidebar(), // Menambahkan Sidebar widget ke property drawer Scaffold
      appBar: AppBar( // Menambahkan AppBar widget ke Scaffold
        title: const Text("Data Poli"), // Menetapkan judul AppBar
        actions: [ // Menambahkan aksi ke AppBar
          GestureDetector( // Menggunakan GestureDetector widget untuk mendeteksi sentuhan
            child: const Icon(Icons.add), // Menambahkan ikon tambah ke AppBar
            onTap: () { // Menentukan aksi saat ikon tambah ditekan
              Navigator.push( // Menggunakan Navigator widget untuk navigasi ke halaman baru
                context,
                MaterialPageRoute(builder: (context) => PoliForm())); // Navigasi ke halaman PoliForm
            },
          )
        ],
      ),
      body: ListView( // Menggunakan ListView widget untuk membangun daftar scrollable
        children: [ // Menambahkan anak ke daftar
          PoliItem(poli: Poli(namaPoli: "Poli Anak")), // Menambahkan PoliItem widget dengan nama "Poli Anak"
          PoliItem(poli: Poli(namaPoli: "Poli Kandungan")), // Menambahkan PoliItem widget dengan nama "Poli Kandungan"
          PoliItem(poli: Poli(namaPoli: "Poli Gigi")), // Menambahkan PoliItem widget dengan nama "Poli Gigi"
          PoliItem(poli: Poli(namaPoli: "Poli THT")), // Menambahkan PoliItem widget dengan nama "Poli THT"
        ],
      ),
    );
  }
}