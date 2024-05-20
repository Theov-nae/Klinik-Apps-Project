import 'package:flutter/material.dart';
import '../ui/pasien_form.dart';
import '../ui/poli_page.dart';
import '../widget/sidebar.dart';
import '../../model/pasien.dart';
import '../ui/pasien_item.dart';

// Kelas PasienPage yang mewarisi StatefulWidget
class PasienPage extends StatefulWidget {
  final Pasien pasien;//objek dari kelas Pasien yang akan ditampilkan.

  const PasienPage({super.key, required this.pasien});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

// kelas yang berisi widget-widget yang akan ditampilkan di halaman ini.
class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//widget yang menyediakan struktur dasar untuk halaman Flutter.
      drawer: Sidebar(),//widget sidebar yang menampilkan menu navigasi.
      appBar: AppBar(//menampilkan judul dan tombol-tombol di atas halaman.
        title: const Text("Data RS"),
        actions: [
          GestureDetector(
            child: Container(
              child: const Icon(Icons.add),
              padding: EdgeInsets.all(20),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: ListView(//menampilkan daftar item.
        children: [
          PasienItem(//menampilkan item pasien.
            pasien: Pasien(
                namaPasien: "Belum ada"),
          ),
          GestureDetector(//mendeteksi gesur dan tapping.
            child: Card(//menampilkan kartu.
              child: ListTile(//menampilkan tampilan daftar.
                title: Text("Pasien"),//menampilkan text 'pasien'.
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
          _tabelPasien(),
        ],
      ),
    );
  }

  Widget _tabelPasien() {
    return DataTable(//menampilkan tabel data.
      columns: const <DataColumn>[
        DataColumn(//menampilkan kolom pada tabel.
          label: Expanded(
            child: Text(
              'ID Pasien',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Nama Pasien',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Nomor Antrean',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Tanggal Lahir',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Alamat',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Nomor Telepon',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(//menampilkan baris pada tabel.
          cells: <DataCell>[//menampilkan sel pada tabel.
            DataCell(Text(widget.pasien.id.toString())),
            DataCell(Text(widget.pasien.namaPasien.toString())),
            DataCell(Text(widget.pasien.nomorPasien.toString())),
            DataCell(Text(widget.pasien.tanggalLahir.toString())),
            DataCell(Text(widget.pasien.alamatPasien.toString())),
            DataCell(Text(widget.pasien.noTelp.toString())),
          ],
        ),
      ],
    );
  }
}