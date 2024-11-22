import 'package:flutter/material.dart';

class RoundedRectangleExample extends StatelessWidget {
  const RoundedRectangleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rounded Rectangle Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 200, // Sesuaikan lebar
          height: 100, // Sesuaikan tinggi
          decoration: BoxDecoration(
            color: Colors.grey, // Warna latar belakang abu-abu
            borderRadius: BorderRadius.circular(20), // Sudut melengkung
            border: Border.all(
              color: Colors.blue, // Warna garis tepi biru
              width: 2, // Ketebalan garis tepi
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RoundedRectangleExample(),
    debugShowCheckedModeBanner: false,
  ));
}
