// import 'dart:js';

import 'package:flutter/material.dart';

class SidebarGoal extends StatefulWidget {
  const SidebarGoal({super.key});

  @override
  State<SidebarGoal> createState() => _SidebarGoalState();
}

class _SidebarGoalState extends State<SidebarGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Open Goals'),),
      body:  Column(children: [
      Row(
        children: [
          Text('Dream'),
          IconButton(icon: Icon(Icons.add), onPressed: () => _addDream(context),)
        ],
      ),
      Row(
        children: [
          Text('Long Term'),
                    IconButton(icon: Icon(Icons.add), onPressed: () => _addLongGoal(context),)
        ],
      ),
      Row(
        children: [
          Text('Mid Term'),
                    IconButton(icon: Icon(Icons.add), onPressed: () => _addMidGoal(context),)
        ],
      ),
      Row(
        children: [
          Text('Short Term'),
                    IconButton(icon: Icon(Icons.add), onPressed: () => _addShortGoal(context),)

        ],
      ),
      ],),
    );
  }
}

_addDream(BuildContext context) {
}
_addLongGoal(BuildContext context) {

}
_addMidGoal(BuildContext context) {
}
_addShortGoal(BuildContext context) {
}

