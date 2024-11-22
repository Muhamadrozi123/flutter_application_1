import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Kusioner3.dart'; // Import halaman Kusioner3

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderQuestionnaireScreenState createState() =>
      _GenderQuestionnaireScreenState();
}

class _GenderQuestionnaireScreenState extends State<GenderScreen> {
  String? selectedOption; // Untuk menyimpan jawaban yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6F6), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAF6F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10), // Tambahkan padding atas
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Letakkan di atas
            children: [
              // Gambar Ilustrasi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  'assets/img/questionnaire.png', // Ganti dengan jalur gambar Anda
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Kotak Kuisioner
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    const Center(
                      child: Text(
                        "Kuesioner",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Pertanyaan
                    const Center(
                      child: Text(
                        "Apa Jenis Kelamin Anda",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Opsi Jawaban
                    buildOption("Laki-Laki"),
                    const SizedBox(height: 15),
                    buildOption("Perempuan"),

                    const SizedBox(height: 20),

                    // Tombol Back dan Next
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Aksi tombol Back
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00BFA6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25,
                            ),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black, // Teks tombol hitam
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedOption != null) {
                              // Navigasi ke halaman Kuesioner3
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EducationScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Silakan pilih salah satu jawaban!"),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00BFA6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25,
                            ),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.black, // Teks tombol hitam
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedOption == option
              ? Colors.teal // Background hijau tosca jika dipilih
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedOption == option
                ? Colors.teal // Border hijau tosca jika dipilih
                : Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: selectedOption == option
                  ? Colors.white // Ikon menjadi putih jika dipilih
                  : Colors.teal,
            ),
            const SizedBox(width: 10),
            Text(
              option,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selectedOption == option
                    ? Colors.white // Teks menjadi putih jika dipilih
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
