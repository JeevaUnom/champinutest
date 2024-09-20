// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavItem();
  }
}

class NavItem extends StatefulWidget {
  const NavItem({super.key});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  int _selectedIndex = 2;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Training Page',
      style: optionStyle,
    ),
    Text(
      'Competition Page',
      style: optionStyle,
    ),
    Text(
      'DashBoard',
      style: optionStyle,
    ),
    Text(
      'Reports Page',
      style: optionStyle,
    ),
    Text(
      'COMETS Page',
      style: optionStyle,
    ),
  ];

  void _showPopup(
      BuildContext context, String title, String content1, String content2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content1),
              const SizedBox(
                height: 10,
              ),
              Text(content2),
            ],
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                _showInfoText(context);
              },
              icon: const Icon(Icons.info_outlined),
              label: const Text('Info'),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close_rounded),
              label: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showInfoText(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: const Text('info text...'),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_sharp),
                label: const Text('Close'),
              )
            ],
          );
        });
  }

  void _onItemTapped(int index) {
    if (index != 2) {
      String title = '';
      String content1 = '';
      String content2 = '';
      if (index == 0) {
        title = 'Training';
        content1 = 'Goals';
        content2 = 'Drills';
      } else if (index == 1) {
        title = 'Competition';
        content1 = 'Tournaments';
        content2 = 'Practice';
      } else if (index == 3) {
        title = 'Reports';
        content1 = 'Match report';
        content2 = 'Leaderboard';
      } else if (index == 4) {
        title = 'COMETS';
        content1 = 'Rally tracker';
        content2 = 'Footwork';
      }
      _showPopup(context, title, content1, content2);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 2
            ? _widgetOptions.elementAt(_selectedIndex)
            : const SizedBox.shrink(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis_outlined),
            label: 'Training',
            // backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games_outlined),
            label: 'Competition',
            // backgroundColor: Color.fromARGB(255, 255, 81, 69),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note_sharp),
            label: 'Reports',
            // backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stadium_outlined),
            label: 'COMETS',
            // backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
