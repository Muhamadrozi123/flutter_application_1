import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF9F9F9),
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
          headlineMedium:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
      home: MenuScreen(),
    );
  }
}
