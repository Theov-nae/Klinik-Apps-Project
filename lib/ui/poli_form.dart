import 'package:flutter/material.dart';
import '../model/poli.dart'; // Impor kelas model Poli
import '../ui/poli_detail.dart'; // Impor kelas UI PoliDetail

// mendefinisikan widget PoliForm sebagai StatefulWidget
class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);

  // mendefinisikan kelas state pribadi untuk PoliForm
  @override
  _PoliFormState createState() => _PoliFormState();
}

// Kelas state pribadi untuk PoliForm
class _PoliFormState extends State<PoliForm> {
  // membuat GlobalKey<FormState> untuk mengakses state Form
  final _formKey = GlobalKey<FormState>();

  // membuat TextEditingController untuk mengontrol input teks pada bidang "Nama Poli"
  final _namaPoliCtrl = TextEditingController();

  // Membuat bidang "Nama Poli"
  Widget _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  // Membuat tombol "Simpan"
  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // membuat objek Poli baru dengan input teks dari _namaPoliCtrl
        Poli poli = PolPoli(namaPoli: _namaPoliCtrl.text);

        // menggunakan Navigator untuk berpindah ke halaman PoliDetail dengan objek Poli baru sebagai parameter
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PoliDetail(poli: poli)),
        );
      },
      child: const Text("Simpan"),
    );
  }

  // Metode build untuk membuat tampilan widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }
}