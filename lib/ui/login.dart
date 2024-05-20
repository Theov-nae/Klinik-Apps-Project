import 'package:flutter/material.dart';

//menampilkan layar login untuk admin.
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

//menangani state dari layar login.
class _LoginState extends State<Login> {
  // Kunci global untuk form.
  final _formKey = GlobalKey<FormState>();
  // Kontroler untuk input username.
  final _username = TextEditingController();
  // Kontroler untuk input password.
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Menampilkan layar login dengan judul "Login Admin".
    return Scaffold(
      body: // Menampilkan konten yang dapat disesuaikan ukurannya.
        SingleChildScrollView(
          child: // Menampilkan area yang aman untuk konten.
            SafeArea(
              child: // Menampilkan kontainer dengan tinggi yang sama dengan tinggi layar.
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: // Menampilkan kolom dengan isi tengah.
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Menampilkan teks "Login Admin" dengan ukuran 22 dan font bold.
                        Text("Login Admin",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                        // Menampilkan spasi 50.
                        SizedBox(
                          height: 50,
                        ),
                        // form dengan judul "Login Admin".
                        Center(
                          child: // form dengan kunci global.
                            Form(
                              key: _formKey,
                              child: // kontainer dengan lebar yang sama dengan lebar layar.
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.3,
                                  child: // Menampilkan kolom dengan isi.
                                    Column(
                                      children: [
                                        // Menampilkan input username.
                                        _usernameTextField(),
                                        // Menampilkan spasi 20.
                                        SizedBox(height: 20),
                                        // Menampilkan input password.
                                        _passwordTextField(),
                                        // Menampilkan spasi 40.
                                        SizedBox(height: 40),
                                        // Menampilkan tombol login.
                                        _tombolLogin(),
                                      ],
                                    ),
                                ),
                            ),
                        )
                      ],
                    ),
                ),
            ),
        ),
    );
  }

  // membuat input username.
  Widget _usernameTextField() {
    // input text dengan label "Username".
    return TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      controller: _username,
      validator: (value) {
        // Jika input username kosong, tampilkan pesan error.
        if (value == null || value.isEmpty) {
          return 'Silakan masukkan username';
        }
        // Jika input username valid, kembali null.
        return null;
      },
    );
  }

  // membuat input password.
  Widget _passwordTextField() {
    // input text dengan label "Password" dan opsi untuk memasukkan password.
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _password,
      validator: (value) {
        // Jika input password kosong, tampilkan pesan error.
        if (value == null || value.isEmpty) {
          return 'Silakan masukkan password';
        }
        // Jika input password valid, kembali null.
        return null;
      },
    );
  }

  // membuat tombol login.
  Widget _tombolLogin() {
    // tombol dengan label "Login".
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () {
          // Jika form valid, lakukan sesuatu disini.
          if (_formKey.currentState!.validate()) {
          }
        },
      ),
    );
  }
}