import 'package:flutter/material.dart';

class CometsPage extends StatelessWidget {
  final String option;
  const CometsPage({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(option),
      ),
      body: Center(
          child: Text(
        '$option page',
        style: const TextStyle(fontSize: 25),
      )),
    );
  }
}


