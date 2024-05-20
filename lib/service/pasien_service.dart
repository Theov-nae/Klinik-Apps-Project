import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {//mendapatkan data pasien dari API
    final Response response = await ApiClient().get('pasien');//mengambil data dari endpoint 'pasien'
    final List data = response.data as List;//Mengubah data yang didapat menjadi list of Pasien object
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;//// Mengembalikan list of Pasien object
  }

  Future<Pasien> simpan(Pasien pasien) async {//menyimpan data pasien ke API
    var data = pasien.toJson();//Mengubah data Pasien menjadi JSON
    final Response response = await ApiClient().post('pasien', data);//mengirim data ke endpoint 'pasien'
    Pasien result = Pasien.fromJson(response.data);//Mengubah data yang diterima menjadi Pasien object
    return result;
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {//mengubah data pasien di API
    var data = pasien.toJson();
    final Response response = await ApiClient().put('pasien/${id}', data);//mengirim data ke endpoint 'pasien/{id}'
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> getById(String id) async {//mendapatkan data pasien berdasarkan ID dari API
    final Response response = await ApiClient().get('pasien/${id}');//mengambil data dari endpoint 'pasien/{id}'
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> hapus(Pasien pasien) async {//menghapus data pasien di API
    final Response response = await ApiClient().delete('pasien/${pasien.id}');//menghapus data dari endpoint 'pasien/{id}'
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }
}