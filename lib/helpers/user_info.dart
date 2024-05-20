import 'package:shared_preferences/shared_preferences.dart';//menyimpan dan mengambil data pengguna dari penyimpanan lokal perangkat.

const String TOKEN = "token";//konstanta yang digunakan untuk menyimpan token pengguna
const String USER_ID = "userID";//sebuah konstanta yang digunakan untuk menyimpan ID pengguna
const String USERNAME = "username";//sebuah konstanta yang digunakan untuk menyimpan nama pengguna

class UserInfo {//mengelola informasi pengguna dalam aplikasi.
  Future setToken(String value) async {//menyimpan token pengguna ke penyimpanan lokal yang berisi hasil penyimpanan token. 
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

// getToken(): metode ini digunakan untuk mengambil token pengguna dari 
//penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi 
//token pengguna jika ada, atau null jika tidak ada.
  Future<String?> getToken() async {//
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

// setUserID(String value): metode ini digunakan untuk menyimpan ID pengguna ke 
//penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi hasil 
//penyimpanan ID pengguna.
  Future setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USER_ID, value);
  }

// getUserID(): metode ini digunakan untuk mengambil ID pengguna dari 
//penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi ID 
//pengguna jika ada, atau string kosong jika tidak ada.
  Future<String> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USER_ID).toString();
  }

// setUsername(String value): metode ini digunakan untuk menyimpan nama pengguna 
//ke penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi hasil 
//penyimpanan nama pengguna.
  Future setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USERNAME, value);
  }
// getUsername(): metode ini digunakan untuk mengambil nama pengguna dari 
//penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi nama 
//pengguna jika ada, atau string kosong jika tidak ada.
  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USERNAME).toString();
  }

// logout(): metode ini digunakan untuk menghapus semua data pengguna dari 
//penyimpanan lokal. Metode ini mengembalikan nilai Future yang berisi hasil 
//penghapusan data.
  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}