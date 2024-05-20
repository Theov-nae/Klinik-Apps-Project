import 'package:dio/dio.dart';//melakukan request ke API
import '../helpers/api_client.dart';//mengakses fungsi ApiClient
import '../model/poli.dart';//menghandle data poli

class PoliService {//menghandle proses CRUD (Create, Read, Update, Delete) pada data poli
  Future<List<Poli>> listData() async {//mengambil list data poli dari API
    final Response response = await ApiClient().get('poli');//Melakukan request GET ke API untuk mengambil list data poli
    final List data = response.data as List;// Mengkonversi data dari response menjadi list of Poli objects
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;//Mengembalikan list data poli
  }

  Future<Poli> simpan(Poli poli) async {// Fungsi untuk menyimpan data poli baru ke API
    var data = poli.toJson(); // Mengkonversi data poli menjadi JSON
    final Response response = await ApiClient().post('poli', data);// Melakukan request POST ke API untuk menyimpan data poli
    Poli result = Poli.fromJson(response.data);// Mengkonversi data dari response menjadi Poli object
    return result;// Mengembalikan data poli yang telah disimpan
  }

  Future<Poli> ubah(Poli poli, String id) async {//mengubah data poli yang sudah ada di API
    var data = poli.toJson();// Mengkonversi data poli menjadi JSON
    final Response response = await ApiClient().put('poli/${id}', data);// Melakukan request PUT ke API untuk mengubah data poli
    print(response);//Mencetak respon ke console untuk debug
    Poli result = Poli.fromJson(response.data);//Mengkonversi data dari response menjadi Poli object
    return result;//Mengembalikan data poli yang telah diubah
  }

  Future<Poli> getById(String id) async {//mengambil data poli berdasarkan ID dari API
    final Response response = await ApiClient().get('poli/${id}');// Melakukan request GET ke API untuk mengambil data poli berdasarkan ID
    Poli result = Poli.fromJson(response.data);//Mengkonversi data dari response menjadi Poli object
    return result;//Mengembalikan data poli yang telah diambil
  }

  Future<Poli> hapus(Poli poli) async {//menghapus data poli dari API
    final Response response = await ApiClient().delete('poli/${poli.id}');//Melakukan request DELETE ke API untuk menghapus data poli
    Poli result = Poli.fromJson(response.data);// Mengkonversi data dari response menjadi Poli object
    return result;//Mengembalikan data poli yang telah dihapus
  }
}