import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../ui/pasien_form.dart';
import '../../model/pasien.dart';
import '../ui/pasien_update_form.dart';

// menampilkan detail pasien.
class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

// menangani state dari layar detail pasien.
class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    // layar detail pasien dengan judul "Detail Pasien".
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pasien"),
        actions: [
          // tombol untuk menambahkan pasien baru.
          GestureDetector(
            child: Container(
              child: const Icon(Icons.add),
              padding: EdgeInsets.all(20),
            ),
            onTap: () {
              // Navigasi ke layar form pasien untuk menambahkan pasien baru.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: // isi layar detail pasien.
        Column(
          children: [
            // tabel detail pasien.
            _tabelPasien(),
            // spasi dengan jarak 20.
            SizedBox(height: 20),
            // informasi ID pasien.
            Text(
              "ID Pasien : ${widget.pasien.id}",
              style: TextStyle(fontSize: 20),
            ),
            // spasi dengan jarak 20.
            SizedBox(height: 20),
            // tombol untuk mengubah dan menghapus pasien.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol untuk mengubah pasien.
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke layar form pasien untuk mengubah pasien.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasienUpdateForm(
                                  pasien: widget.pasien,
                                )));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Ubah"),
                ),
                // Tombol untuk menghapus pasien.
                ElevatedButton(
                  onPressed: () {
                    // menghapus pasien
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus"),
                ),
              ],
            )
          ],
        ),
    );
  }

  // membuat tabel detail pasien.
  _tabelPasien() {
    // tabel dengan kolom untuk ID pasien, nama pasien, nomor antrean, tanggal lahir, alamat, dan nomor telepon.
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
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
        // detail pasien yang dipilih.
        DataRow(
          cells: <DataCell>[
            DataCell(Text(widget.pasien.id.toString())),
            DataCell(Text(widget.pasien.namaPasien)),
            DataCell(Text(widget.pasien.nomorPasien.toString())),
            DataCell(Text(widget.pasien.tanggalLahir.toString())),
            DataCell(Text(widget.pasien.alamatPasien)),
            DataCell(Text(widget.pasien.noTelp.toString())),
          ],
        ),
      ],
    );
  }
}