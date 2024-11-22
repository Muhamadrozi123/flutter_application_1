import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_application_1/pages/Kusioner1.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _timer;
  int _start = 15;
  bool isResendEnabled = false;
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 15;
    isResendEnabled = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          isResendEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _checkAndNavigate() {
    if (_otpControllers.every((controller) => controller.text.isNotEmpty)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuestionnaireScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Elemen mulai dari atas
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Tambahkan jarak dari AppBar
            Image.asset(
              'assets/img/IlustrasiOTP.png',
              height: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              "Kode OTP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Kode OTP anda sudah kami Kirim\nmelalui email",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  height: 60,
                  child: TextField(
                    controller: _otpControllers[index],
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        _checkAndNavigate(); // Periksa dan navigasi jika semua OTP sudah diisi
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.teal,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.teal.withOpacity(0.2),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isResendEnabled
                    ? TextButton(
                        onPressed: () {
                          _startTimer(); // Mulai ulang timer
                        },
                        child: const Text(
                          "Kirim Ulang",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : Text(
                        "Kirim Ulang: $_start detik",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[700],
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 20), // Jarak tambahan
          ],
        ),
      ),
    );
  }
}
