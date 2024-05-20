import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

// menampilkan item pegawai.
class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiItem({Key? key, required this.pegawai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // item pegawai sebagai kartu yang dapat disentuh.
    return GestureDetector(
      // menghandle sentuhan item pegawai.
      child: Card(
        // isi kartu dengan judul nama pegawai.
        child: ListTile(
          title: Text("${pegawai.namaPegawai}"),
        ),
      ),
      // menghandle sentuhan item pegawai.
      onTap: () {
        // Navigasi ke layar detail pegawai dengan data pegawai yang dipilih.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PegawaiDetail(pegawai: pegawai,)),
        );
      },
    );
  }
}