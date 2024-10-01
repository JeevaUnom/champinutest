import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This is $title page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
