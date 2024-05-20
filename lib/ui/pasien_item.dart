import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {// Mendefinisikan kelas PasienItem sebagai StatelessWidget
  final Pasien pasien;

  const PasienItem({Key? key, required this.pasien}) : super(key: key);

  @override// Membangun sebuah tampilan widget
  Widget build(BuildContext context) {
    return GestureDetector(// Menggunakan GestureDetector untuk mendeteksi interaksi pengguna
      child: Card(// Menggunakan Card untuk membuat kotak dengan bayangan
        child: ListTile(// Menggunakan ListTile untuk membuat tampilan item pasien dalam bentuk daftar
          title: Text("${pasien.namaPasien}"),// Menggunakan Text untuk menampilkan teks namapasien
        ),
      ),
      onTap: () {
        Navigator.push(context,//Navigator.push digunakan untuk mengalihkan ke halaman berikutnya.
            MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)));// Navigasi ke halaman PasienDetail dengan objek Poli baru sebagai parameter
      },
    );
  }
}