import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/pages/SignIn.dart'; // Sesuaikan dengan lokasi file Signin Anda

void main() {
  testWidgets('SignInScreen has a back button that pops the screen', (WidgetTester tester) async {
    // Membuat widget MaterialApp untuk navigasi
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Home Screen')),
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text('Go to Sign In'),
              );
            },
          ),
        ),
      ),
    );

    // Tekan tombol untuk membuka layar SignInScreen
    await tester.tap(find.text('Go to Sign In'));
    await tester.pumpAndSettle(); // Tunggu sampai animasi navigasi selesai

    // Verifikasi bahwa kita sudah berada di layar SignInScreen
    expect(find.text('Sign In'), findsOneWidget);

    // Cari tombol back di AppBar
    final backButton = find.byTooltip('Back');

    // Verifikasi bahwa tombol back ada
    expect(backButton, findsOneWidget);

    // Tekan tombol back
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    // Verifikasi bahwa kita telah kembali ke layar sebelumnya
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Sign In'), findsNothing);
  });
}
