import 'package:flutter/material.dart';
import '../components/Navbar.dart';
import '../components/Sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChampinU'),
        backgroundColor: Colors.cyan,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            // Center(
            //     child: Text(
            //   'Welcome!!! \n'
            //   'Champion',
            //   style: Theme.of(context).textTheme.displayMedium,
            // )),
            Expanded(
              child: NavBar(),
            ),
          ],
        ),
      ),
      drawer: const Sidebar(),
    );
  }
}
