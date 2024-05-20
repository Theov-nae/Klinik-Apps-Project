import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_update_form.dart';
import 'pegawai_page.dart';
import '../service/pegawai_service.dart';

//  menampilkan detail pegawai.
class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

//  menangani state dari layar detail pegawai.
class _PegawaiDetailState extends State<PegawaiDetail> {
  // Stream untuk mendapatkan data pegawai.
  Stream<Pegawai> getData() async* {
    //  data pegawai dengan ID yang dipilih.
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    yield data;
  }

  // menformat tanggal.
  String formatDate(DateTime date) {
    // Format tanggal menjadi 'YYYY-MM-DD'.
    String formattedDate =
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // layar detail pegawai dengan judul "Detail Pegawai".
    return WillPopScope(
      // menghandle back navigation.
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Pegawai"),
        ),
        body: // isi layar detail pegawai.
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // spasi 50.
              const SizedBox(height: 50),
              // baris dengan informasi pegawai.
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // kolom untuk informasi pegawai.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(textAlign: TextAlign.left, 'Nama'),
                      Text(textAlign: TextAlign.left, 'NIP'),
                      Text(textAlign: TextAlign.left, 'Email'),
                      Text(textAlign: TextAlign.left, 'Tanggal Lahir'),
                      Text(textAlign: TextAlign.left, 'Nomor Telepon')
                    ]),
                  // kolom untuk nilai informasi pegawai.
                  Column(children: const [
                    Text(' : '),
                    Text(' : '),
                    Text(' : '),
                    Text(' : '),
                    Text(' : ')
                  ]),
                  // kolom untuk nilai informasi pegawai.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.pegawai.nama}"),
                      Text("${widget.pegawai.nip}"),
                      Text("${widget.pegawai.email}"),
                      Text(
                        formatDate(widget.pegawai.tanggalLahir),
                      ),
                      Text("${widget.pegawai.nomorTelepon}")
                    ],
                  )
                ],
              ),
              // spasi 50.
              const SizedBox(height: 50),
              // baris dengan tombol untuk mengubah dan menghapus pegawai.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol untuk mengubah pegawai.
                  _tombolUbah(),
                  // Tombol untuk menghapus pegawai.
                  _tombolHapus(),
                ],
              )
            ],
          ),
      ),
    );
  }

  // menghandle back navigation.
  Future<bool> _onBackPressed() async {
    // Navigasi ke halaman sebelumnya dengan menggantikan layar.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PegawaiPage()),
    );
    return true; // Izinkan navigasi kembali
  }

  // membuat tombol ubah pegawai.
  _tombolUbah() {
    // tombol dengan label "Ubah".
    return ElevatedButton(
      onPressed: () {
        // Navigasi ke layar form untuk mengubah pegawai.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  // membuat tombol hapus pegawai.
  _tombolHapus() {
    // tombol dengan label "Hapus".
    return ElevatedButton(
      onPressed: () {
        // dialog konfirmasi untuk menghapus pegawai.
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            // Tombol untuk menghapus pegawai.
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  // Hapus pegawai dan navigasi ke halaman sebelumnya.
                  await PegawaiService().hapus(snapshot.data).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PegawaiPage()),
                    );
                  });
                },
                child: const Text("YA"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            // Tombol untuk membatalkan penghapusan pegawai.
            ElevatedButton(
              onPressed: () {
                // Tutup dialog.
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
        // Menampilkan dialog.
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"),
    );
  }
}