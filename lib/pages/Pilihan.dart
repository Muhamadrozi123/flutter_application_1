import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/SignIn.dart';

class FeatureSelectionScreen extends StatelessWidget {
  const FeatureSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Jarak dari atas layar
            const Text(
              'STRONG-HEART',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20), // Jarak antara judul dan ilustrasi
            Image.asset(
              'assets/img/illustration.png',
              height: 150,
            ),
            const SizedBox(height: 20), // Jarak antara ilustrasi dan teks
            const Text(
              'Silahkan Untuk Memilih Fitur Yang Telah\nkami Sediakan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40), // Jarak antara teks dan fitur
            // Container dengan ikon fitur tanpa BoxShadow
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 35.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
                // Menghapus shadow/stroke
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Image clicked!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/img/fitur1.png', // Ganti dengan jalur file gambar Anda
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/img/fitur2.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/img/fitur3.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/img/fitur4.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
