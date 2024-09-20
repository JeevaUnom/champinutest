import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text('Jeeva'),
                accountEmail: Text('jeevass@gmail.com')),
            Divider(
              height: 0.8,
            ),
            ListTile(
              title: Text('My Profile'),
              leading: Icon(Icons.person_pin_rounded),
            ),
            ListTile(
              title: Text('My Goals'),
              leading: Icon(Icons.follow_the_signs),
            ),
            ListTile(
              title: Text('My Events'),
              leading: Icon(Icons.edit_calendar_rounded),
            ),
            ListTile(
              title: Text('My Physique'),
              leading: Icon(Icons.sports_gymnastics),
            ),
            Divider(
              height: 0.8,
            ),
            ListTile(
              title: Text('Academy Change'),
              leading: Icon(Icons.change_circle),
            ),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.key),
            ),
            ListTile(
              title: Text('Delete Account'),
              leading: Icon(Icons.delete_forever),
            ),
            Divider(
              height: 0.8,
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
            ),
            ListTile(
              title: Text('Mentoring Videos'),
              leading: Icon(Icons.video_collection_sharp),
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
