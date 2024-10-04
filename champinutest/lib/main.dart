import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
