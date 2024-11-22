import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Feedback.dart'; // Import halaman Feedback

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 10),

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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Judul
                  const Text(
                    "Kuesioner",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pertanyaan
                  const Text(
                    "Jenjang Pendidikan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Opsi Jawaban
                  buildOption("SMP"),
                  const SizedBox(height: 15),
                  buildOption("SMA/SMK"),
                  const SizedBox(height: 15),
                  buildOption("Mahasiswa"),
                  const SizedBox(height: 20),

                  // Tombol Back dan Next
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Aksi tombol Back
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // Warna teks tombol hitam
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Jarak antar tombol
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedOption != null) {
                              // Navigasi ke halaman Feedback
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeedbackScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Silakan pilih salah satu jawaban!"),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // Warna teks tombol hitam
                            ),
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
              ? Colors.teal // Warna hijau tosca untuk opsi yang dipilih
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedOption == option
                ? Colors.teal // Border hijau tosca jika dipilih
                : const Color(0xFF00BFA6),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: selectedOption == option
                  ? Colors.white // Ikon berubah menjadi putih jika dipilih
                  : Colors.teal,
            ),
            const SizedBox(width: 10),
            Text(
              option,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selectedOption == option
                    ? Colors.white // Teks berubah menjadi putih jika dipilih
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
