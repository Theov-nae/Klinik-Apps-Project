import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pegawai.dart';

class PegawaiService {//berinteraksi dengan endpoint API 'pegawai'.
  Future<List<Pegawai>> listData() async {//mengambil daftar semua data 'pegawai' dari API.
    final Response response = await ApiClient().get('pegawai');//permintaan GET ke endpoint API 'pegawai'.
    final List data = response.data as List;//Konversi data respons ke dalam bentuk daftar.
    List<Pegawai> result = data.map((json) => Pegawai.fromJson(json)).toList();// Map setiap objek JSON dalam daftar ke dalam objek 'Pegawai'.
    return result;// Kembali dengan daftar objek 'Pegawai'.
  }

  Future<Pegawai> simpan(Pegawai pegawai) async {//menyimpan 'pegawai' baru ke API.
    var data = pegawai.toJson();// Mengkonversi objek 'Pegawai' ke dalam bentuk JSON.
    final Response response = await ApiClient().post('pegawai', data);//permintaan POST ke endpoint API 'pegawai' dengan data JSON.
    Pegawai result = Pegawai.fromJson(response.data);// Mengkonversi data respons ke dalam bentuk objek 'Pegawai'.
    return result;
  }

  Future<Pegawai> ubah(Pegawai pegawai, String id) async {//memperbarui 'pegawai' yang sudah ada di API.
    var data = pegawai.toJson();
    final Response response = await ApiClient().put('pegawai/${id}', data);//permintaan PUT ke endpoint API 'pegawai' dengan data JSON dan 'id' 'pegawai' untuk diupdate.
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }

  Future<Pegawai> getById(String id) async {//mengambil 'pegawai' spesifik berdasarkan 'id' dari API.
    final Response response = await ApiClient().get('pegawai/${id}');//permintaan GET ke endpoint API 'pegawai' dengan 'id' 'pegawai' untuk diambil.
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }

  Future<Pegawai> hapus(Pegawai pegawai) async {//menghapus 'pegawai' dari API.
    final Response response = await ApiClient().delete('pegawai/${pegawai.id}');//permintaan DELETE ke endpoint API 'pegawai' dengan 'id' 'pegawai' untuk dihapus.
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }
}