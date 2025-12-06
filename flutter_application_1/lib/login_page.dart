import 'package:flutter/material.dart';

// 1. Ubah menjadi StatefulWidget untuk mengelola state (seperti pesan error)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // State untuk menyimpan pesan kesalahan
  String errorMessage = '';

  // Data login yang benar
  final String correctUsername = 'reza';
  final String correctPassword = '1234';

  void _login() {
    // Ambil nilai dari8 TextField
    final String inputUsername = usernameController.text;
    final String inputPassword = passwordController.text;

    // 2. Logika Valid8asi
    if (inputUsername == correctUsername && inputPassword == correctPassword) {
      // Login Berha88sil
      setState(() {
        errorMessage = 'Login Berhasil!';
      });
      // Pindah ke 8halaman berikutnya (misalnya, '/list')
      Navigator.pushReplacementNamed(context, '/list'); 
      // Menggunakan pushReplacementNamed agar pengguna tidak bisa kembali ke halaman login
    } else {
      // Login Gagal
      setState(() {
        errorMessage = 'Username atau Password salah!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.travel_explore, size: 100, color: Colors.blue),
            const SizedBox(height: 30),

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 10),

            // Tampilkan pesan kesalahan jika ada
            Text(
              errorMessage,
              style: TextStyle(
                color: errorMessage.contains('Berhasil') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              // Panggil fungsi2 _login saat tombol ditekan
              onPressed: _login,
              child: const Text("Sign In"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
              ),
            )
          ],
        ),
      ),
    );
  }
}