import '../helpers/user_info.dart';// Import file helper untuk mengakses fungsi UserInfo

class LoginService {// Kelas LoginService untuk menghandle proses login
  Future<bool> login(String username, String password) async {// Fungsi login yang mengembalikan nilai boolean
    bool isLogin = false;// Variabel untuk menyimpan status login
    if (username == 'admin' && password == 'admin') {// Cek apakah username dan password sesuai dengan kredensial yang diharapkan
      await UserInfo().setToken("admin");// Jika sesuai, maka set token, user ID, dan username menggunakan fungsi dari UserInfo
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;// Set status login menjadi true
    }
    return isLogin;//Mengembalikan status LogIn
  }
}