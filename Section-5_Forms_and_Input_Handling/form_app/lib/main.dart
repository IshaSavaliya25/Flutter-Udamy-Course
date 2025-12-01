import 'package:flutter/material.dart';
import 'screens/registration_form.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Demo App",
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistrationForm(),
        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}
