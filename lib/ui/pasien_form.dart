import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail.dart';

class PasienForm extends StatefulWidget {//Kelas PasienForm yang mewarisi StatefulWidget
  const PasienForm({Key? key}) : super(key: key);

  @override
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {//Kelas _PasienFormState yang mewarisi State<PasienForm>
  final _formKey = GlobalKey<FormState>();//kunci global untuk form
  // controller untuk mengontrol nilai dari input nama pasien dan nomor pasien.
  final _namaPasien = TextEditingController();
  final _nomorPasien = TextEditingController();

  //  
  @override
  Widget build(BuildContext context) {//untuk membangun tampilan form
    return Scaffold(//struktur dasar dari tampilan Flutter.
      appBar: AppBar(
          title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(//digunakan untuk membuat tampilan dapat di-scroll jika konten melebihi ukuran layar.
        child: Form(//widget yang digunakan untuk mengelola form.
          key: _formKey,
          child: Column(//digunakan untuk membuat tata letak tegak.
            children: [
              _fieldNamaPasien(),
              SizedBox(height: 20),
              _fieldNomorPasien(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPasien() {//membuat field input nama pasien
    return TextFormField(//widget yang digunakan untuk membuat field input teks.
      controller: _namaPasien, //digunakan untuk mengontrol nilai dari input teks.
      decoration: const InputDecoration(//digunakan untuk menentukan tampilan dari field input teks.
        labelText: 'Nama Pasien', 
      ),
    );
  }

  _fieldNomorPasien() {//membuat field input nomor pasien
    return TextFormField(
      controller: _nomorPasien, 
      decoration: const InputDecoration(
        labelText: 'Nomor Antrean Pasien', 
      ),
    );
  }

    _tombolSimpan() {//membuat tombol simpan
    return ElevatedButton(//widget yang digunakan untuk membuat tombol.
      onPressed: () {//digunakan untuk menjalankan kode saat tombol diklik.
        Pasien pasien = new Pasien(
            namaPasien: _namaPasien.text,
            nomorPasien: _nomorPasien.text);
        Navigator.pushReplacement(//digunakan untuk mengalihkan ke halaman
          context,
          MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)),//halaman yang akan ditampilkan setelah mengklik tombol simpan.
        );
      },
      child: const Text("Simpan"),
    );
  }
}
