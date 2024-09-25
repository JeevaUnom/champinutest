import 'package:flutter/material.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assign Goals'),
          bottom: const TabBar(tabs: [
            Tab(
              text: ' Technical Goal',
            ),
            Tab(
              text: ' Tactical Goal',
            ),
            Tab(
              text: ' Psychological Goal',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text('Technical')),
          Center(child: Text('Tactical')),
          Center(child: Text('Psychological')),
        ]),
      ),
    );
  }
}
