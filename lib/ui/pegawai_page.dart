import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../ui/poli_page.dart';
import '../widget/sidebar.dart';
import '../model/pegawai.dart';
import '../model/pasien.dart';
import 'pegawai_item.dart';
import 'pasien_item.dart';
import 'poli_item.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {//menampilkan daftar pegawai, pasien, dan poli.
  const PegawaiPage({Key? key}) : super(key: key);

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}
class _PegawaiPageState extends State<PegawaiPage> {//_PegawaiPageState adalah state dari PegawaiPage.
  @override
  Widget build(BuildContext context) {  // build method mengembalikan Scaffold widget yang berisi Sidebar widget,
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data RS"),
        actions: [
          GestureDetector(
            child: Container(
              child: const Icon(Icons.add),
              padding: EdgeInsets.all(20),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(//daftar pegawai, pasien, dan poli.
        children: [// menampilkan item dari pegawai, pasien, dan poli.
          PegawaiItem(pegawai: Pegawai(namaPegawai: "Pegawai 1")),
          PasienItem(pasien: Pasien(namaPasien: "Pasien 1")),
          PoliItem(poli: Poli(namaPoli: "Poli 1")),
          GestureDetector(
            child: Card(
              child: ListTile(title: Text("Poli")),
            ),
            onTap: () {
              Navigator.push(// Ketika item poli ditekan, akan ditampilkan halaman PoliPage dengan navigasi.
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
        ],
      ),
    );
  }
}