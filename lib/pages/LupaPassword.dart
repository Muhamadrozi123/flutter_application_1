import 'package:flutter/material.dart';

void main() {
  runApp(const LupaPasswordScreen ());
}

class LupaPassword extends StatelessWidget {
  const LupaPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LupaPasswordScreen(),
    );
  }
}

class LupaPasswordScreen extends StatelessWidget {
  const LupaPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF7), // Warna latar belakang
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Ikon Kembali
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigasi kembali ke layar sebelumnya
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Gambar Ilustrasi
            Center(
              child: Image.asset(
                'assets/img/hand_phone.png', // Ganti dengan jalur file gambar Anda
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 30),
            // Kotak Formulir dengan Judul di Tengah
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Judul Lupa Password
                    const Text(
                      'Lupa Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Input Email
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Yang Terdaftar',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black12, // Stroke warna abu-abu
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black54, // Stroke warna lebih gelap
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF6F6F6), // Background input
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Tombol Kirim
                    ElevatedButton(
                      onPressed: () {
                        // Aksi tombol kirim
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8F1B0), // Hijau lembut
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.black12, // Stroke pada tombol
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minimumSize: const Size(double.infinity, 50),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Kirim',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
