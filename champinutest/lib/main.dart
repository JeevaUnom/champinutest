import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: const HomeScreen(),
        initialRoute: '/home',
        routes: {
          '/': (context) => const SignUpScreen(),
          '/home': (context) => const HomeScreen(),
        });
  }
}
