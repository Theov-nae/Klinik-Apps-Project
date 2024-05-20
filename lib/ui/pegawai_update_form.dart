import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {// Kelas PegawaiUpdateForm sebagai form untuk mengubah data Pegawai
  final Pegawai pegawai;// Variabel pegawai untuk menyimpan data Pegawai yang akan diubah

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);// Konstruktor dengan parameter pegawai
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();// Membuat StatefulWidget dengan nama _PegawaiUpdateFormState
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();// Variabel _formKey untuk membuat Form
  final _namaPegawaiCtrl = TextEditingController();// Variabel _namaPegawaiCtrl untuk mengontrol input Nama Pegawai

  @override// Melakukan inisialisasi saat State di-create
  void initState() {
    super.initState();
    setState(() {// Mengatur nilai TextEditingController dengan nama Pegawai yang akan diubah
      _namaPegawaiCtrl.text = widget.pegawai.namaPegawai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data")),// Menambahkan judul pada AppBar tampilan aplikasi
      body: SingleChildScrollView(// Menambahkan konten pada tampilan aplikasi
        child: Form( // Membuat Form dengan key _formKey
          key: _formKey,
          child: Column(
            children: [// Menambahkan list children pada kolom
              _fieldNamaPegawai(),// Memanggil fungsi _fieldNamaPegawai untuk membuat field Nama Pegawai
              SizedBox(height: 20),// Menambahkan jarak antar field dan tombol
              _tombolSimpan()// Memanggil fungsi _tombolSimpan untuk membuat tombol Simpan Perubahan
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Data"),// Menambahkan label pada field Nama Pegawai
      controller: _namaPegawaiCtrl,// Menghubungkan TextEditingController dengan field Nama Pegawai
    );
  }

  _tombolSimpan() {//Membuat tombol Simpan Perubahan
    return ElevatedButton(
          onPressed: () {// Menangani event ketika tombol ditekan
            Pegawai pegawai = new Pegawai(namaPegawai: _namaPegawaiCtrl.text);// Membuat objek Pegawai baru dengan nilai nama Pegawai yang diinputkan
            Navigator.pop(context);
            Navigator.pushReplacement(// Menuju ke halaman PegawaiDetail dengan data Pegawai yang telah diubah
                context,
                MaterialPageRoute(
                    builder: (context) => PegawaiDetail(pegawai: pegawai)));
          },
        child: const Text("Simpan Perubahan"));
  }
}