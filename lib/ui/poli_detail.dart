import 'package:flutter/material.dart';
import '../ui/poli_page.dart';
import '../ui/poli_update_form.dart';
import '../model/poli.dart';

class PoliDetail extends StatefulWidget {//menampilkan detail poli.
  final Poli poli;

  const PoliDetail({Key? key, required this.poli}) : super(key: key);

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

// _PoliDetailState adalah state dari PoliDetail.
class _PoliDetailState extends{
// build method mengembalikan Scaffold widget yang berisi AppBar widget dan Column widget.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Poli")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),//membuat tombol ubah poli.
              _tombolHapus(),//membuat tombol hapus poli.
            ],
          )
        ],
      ),
    );
  }

  ElevatedButton _tombolUbah() {//membuat tombol ubah poli.
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PoliUpdateForm(poli: widget.poli)),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  ElevatedButton _tombolHapus() {//membuat tombol hapus poli.
    return ElevatedButton(
      onPressed: () {//Ketika tombol hapus ditekan, akan muncul dialog konfirmasi untuk menghapus poli.
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Apakah anda yakin menghapus data ini?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => PoliPage()));
              },
              child: Text("Ya"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}