import 'package:flutter/material.dart';
import 'package:ecom_app/screens/splash_screen.dart';
import 'package:ecom_app/screens/dashboard_screen.dart';
import 'package:ecom_app/screens/login_screen.dart';
import 'package:ecom_app/screens/registration_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => const RegistrationScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/dashboard") {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (context) => DashboardScreen(username: args['username']));
        }
        return null;
      },
    );
  }
}
