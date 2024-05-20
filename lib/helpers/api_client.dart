import 'package:dio/dio.dart';//melakukan request HTTP

final Dio dio = Dio(BaseOptions(// Membuat instance dari kelas Dio dengan beberapa konfigurasi
    // baseUrl: 'https://64746a0a7de100807b1add0a.mockapi.io/',
    connectTimeout: 5000,// Durasi timeout koneksi (dalam milidetik)
    receiveTimeout: 3000));// Durasi timeout response (dalam milidetik)

class ApiClient {//melakukan request HTTP menggunakan Dio
  Future<Response> get(String path) async {//melakukan request GET
    try {
      final response = await dio.get(Uri.encodeFull(path));// Melakukan request GET ke path yang ditentukan
      return response;// Mengembalikan respon
    } on DioError catch (e) {
      throw Exception(e.message);// Menghandle error yang terjadi dan melempar exception
    }
  }

  Future<Response> post(String path, dynamic data) async {//melakukan request POST
    try {
      final response = await dio.post(Uri.encodeFull(path), data: data);// Melakukan request POST ke path yang ditentukan dengan data yang diberikan
      return response;// Mengembalikan respon
    } on DioError catch (e) {
      throw Exception(e.message);// Menghandle error yang terjadi dan melempar exception
    }
  }

  Future<Response> put(String path, dynamic data) async {//melakukan request PUT
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);// Melakukan request PUT ke path yang ditentukan dengan data yang diberikan
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);// Menghandle error yang terjadi dan melempar exception
    }
  }

  Future<Response> delete(String path) async {//melakukan request DELETE
    try {
      final response = await dio.delete(Uri.encodeFull(path));// Melakukan request DELETE ke path
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}