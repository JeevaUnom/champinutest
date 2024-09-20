import 'package:champinutest/components/Detailspage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context) => const SignUpScreen(),
          '/home': (context) => const HomeScreen(),
        });
  }
}
