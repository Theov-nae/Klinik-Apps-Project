import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail.dart';

// menampilkan form untuk mengubah data pasien.
class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien})
      : super(key: key);

  @override
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

// menangani state dari form mengubah data pasien.
class _PasienUpdateFormState extends State<PasienUpdateForm> {
  // Kunci global untuk form.
  final _formKey = GlobalKey<FormState>();
  // Kontroler untuk input ID pasien.
  final _idPasien = TextEditingController();
  // Kontroler untuk input nomor pasien.
  final _nomorPasien = TextEditingController();
  // Kontroler untuk input nama pasien.
  final _namaPasien = TextEditingController();
  // Kontroler untuk input alamat pasien.
  final _alamatPasien = TextEditingController();
  // Kontroler untuk input nomor HP pasien.
  final _noHpPasien = TextEditingController();
  // Kontroler untuk input tanggal lahir pasien.
  final _ttlPasien = TextEditingController();

  // Inisialisasi state dengan nilai awal dari pasien yang dipilih.
  @override
  void initState() {
    super.initState();
    setState(() {
      _idPasien.text = widget.pasien.id!;
      _nomorPasien.text = widget.pasien.nomorPasien!;
      _namaPasien.text = widget.pasien.namaPasien!;
      _alamatPasien.text = widget.pasien.alamatPasien!;
      _noHpPasien.text = widget.pasien.noTelp!;
      _ttlPasien.text = widget.pasien.tanggalLahir!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // layar form untuk mengubah data pasien.
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Data Pasien"),
      ),
      body: // form dengan kunci global.
        Form(
          key: _formKey,
          child: // isi form.
            Column(
              children: [
                //  input ID pasien.
                _fieldIDPasien(),
                //  spasi 20.
                SizedBox(height: 20),
                // input nomor pasien.
                _fieldNomorPasien(),
                //  spasi 20.
                SizedBox(height: 20),
                //  input nama pasien.
                _fieldNamaPasien(),
                // spasi 20.
                SizedBox(height: 20),
                // input alamat pasien.
                _fieldAlamatPasien(),
                //  spasi 20.
                SizedBox(height: 20),
                //  input nomor HP pasien.
                _fieldnoHpPasien(),
                //  spasi 20.
                SizedBox(height: 20),
                //  input tanggal lahir pasien.
                _fieldTtlPasien(),
                //  spasi 20.
                SizedBox(height: 20),
                //  tombol simpan.
                _tombolSimpan(),
                //  spasi 20.
                SizedBox(height: 20),
                //  tombol hapus.
                _tombolHapus(),
              ],
            ),
        ),
    );
  }

  //  membuat input ID pasien.
  _fieldIDPasien() {
    //  input text dengan label "ID Pasien".
    return TextFormField(
      controller: _idPasien,
      decoration: InputDecoration(
        labelText: "ID Pasien",
      ),
    );
  }

  //  membuat input nomor pasien.
  _fieldNomorPasien() {
    //  input text dengan label "Nomor Antrean Pasien".
    return TextFormField(
      controller: _nomorPasien,
      decoration: InputDecoration(
        labelText: "Nomor Antrean Pasien",
      ),
    );
  }

  //  membuat input nama pasien.
  _fieldNamaPasien() {
    //  input text dengan label "Nama Pasien".
    return TextFormField(
      controller: _namaPasien,
      decoration: InputDecoration(
        labelText: "Nama Pasien",
      ),
    );
  }

  //  membuat input tanggal lahir pasien.
  _fieldTtlPasien() {
    //  input text dengan label "Tanggal Lahir".
    return TextFormField(
      controller: _ttlPasien,
      decoration: InputDecoration(
        labelText: "Tanggal Lahir",
      ),
    );
  }

  //  membuat input nomor HP pasien.
  _fieldnoHpPasien() {
    //  input text dengan label "No HP Pasien".
    return TextFormField(
      controller: _noHpPasien,
      decoration: InputDecoration(
        labelText: "No HP Pasien",
      ),
    );
  }

  //  membuat input alamat pasien.
  _fieldAlamatPasien() {
    //  input text dengan label "Alamat Pasien".
    return TextFormField(
      controller: _alamatPasien,
      decoration: InputDecoration(
        labelText: "Alamat Pasien",
      ),
    );
  }

  //  membuat tombol simpan.
  _tombolSimpan() {
    //  tombol dengan label "Simpan".
    return ElevatedButton(
      onPressed: () {
        // Navigasi ke layar detail pasien dengan data yang diubah.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasienDetail(
              pasien: Pasien(
                namaPasien: _namaPasien.text,
                nomorPasien: _nomorPasien.text,
                tanggalLahir: _ttlPasien.text,
                noTelp: _noHpPasien.text,
                id: _idPasien.text,
                alamatPasien: _alamatPasien.text,
              ),
            ),
          ),
        );
      },
      child: Text("Simpan"),
    );
  }

  //  membuat tombol hapus.
  _tombolHapus() {
    //  tombol dengan label "Hapus".
    return ElevatedButton(
      onPressed: () {
        // Kembali ke layar sebelumnya.
        Navigator.pop(context);
      },
      child: Text("Hapus"),
    );
  }
}