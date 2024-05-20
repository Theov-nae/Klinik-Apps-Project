import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {//menampilkan form untuk menambah pegawai baru.
  const PegawaiForm({Key? key}) : super(key: key);

  @override
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();// mengelola state dari form.
  final _namaPegawaiCtrl = TextEditingController();//mengelola input dari field nama pegawai.

  @override//mengembalikan Scaffold widget yang berisi SingleChildScrollView widget dengan Form widget di dalamnya.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")), 
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, 
          child: Column(
            children: [
              _fieldNamaPegawai(), 
              SizedBox(height: 20), 
              _tombolSimpan() 
            ],
          ),
        ),
      ),
    );
  }

// mengembalikan TextField widget yang menampilkan field nama pegawai.
  Widget _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(
          labelText: "Nama Pegawai"), 
      controller:
          _namaPegawaiCtrl, 
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(//menampilkan tombol "Simpan". 
      onPressed: () {//Ketika tombol ditekan, akan dibuat objek Pegawai baru dengan nilai 
      //namaPegawai diambil dari _namaPegawaiCtrl. Objek Pegawai baru kemudian akan diteruskan ke PegawaiDetail melalui navigasi.
        if (_formKey.currentState!.validate()) {
          Pegawai pegawai = Pegawai(
              namaPegawai: _namaPegawaiCtrl.text); 
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(
                  pegawai: pegawai), 
            ),
          );
        }
      },
      child: const Text("Simpan"), 
    );
  }

// dipanggil saat widget dihancurkan, dan digunakan untuk membersihkan _namaPegawaiCtrl.
  @override
  void dispose() {
    _namaPegawaiCtrl.dispose();
    super.dispose();
  }
}