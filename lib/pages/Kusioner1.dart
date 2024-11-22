import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Kusioner2.dart'; // Import halaman Kusioner2

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  String? selectedOption; // Untuk menyimpan jawaban yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Warna latar belakang
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
                      "Berapakah Usia Anda",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Opsi Jawaban
                  buildOption("12-15", "Apakah Usia Anda 12-15"),
                  const SizedBox(height: 15),
                  buildOption("15-18", "Apakah Usia Anda 15-18"),
                  const SizedBox(height: 15),
                  buildOption("18-25", "Apakah Usia Anda 18-25"),

                  const SizedBox(height: 20),

                  // Tombol Next
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedOption != null) {
                          // Navigasi ke halaman Kuesioner2
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GenderScreen(),
                            ),
                          );
                        } else {
                          // Aksi ketika tidak ada jawaban yang dipilih
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
                          color: Colors.black, // Warna teks hitam
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

  Widget buildOption(String value, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedOption == value
              ? Colors.teal // Hijau tosca untuk opsi yang dipilih
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedOption == value
                ? Colors.teal // Hijau tosca jika dipilih
                : Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: selectedOption == value
                  ? Colors.white // Ikon menjadi putih jika dipilih
                  : Colors.teal,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selectedOption == value
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
