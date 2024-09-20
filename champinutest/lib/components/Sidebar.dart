import 'Detailspage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text('Jeeva'),
                accountEmail: Text('jeevass@gmail.com')),
            const Divider(
              height: 0.8,
            ),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(Icons.person_pin_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'My Profile'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My Goals'),
              leading: const Icon(Icons.follow_the_signs),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsPage(title: 'My Goals'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My Events'),
              leading: const Icon(Icons.edit_calendar_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsPage(title: 'My Events'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My Physique'),
              leading: const Icon(Icons.sports_gymnastics),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'My Physique'),
                  ),
                );
              },
            ),
            const Divider(
              height: 0.8,
            ),
            ListTile(
              title: const Text('Academy Change'),
              leading: const Icon(Icons.change_circle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'Academy change'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              leading: const Icon(Icons.key),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'Change Password'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Delete Account'),
              leading: const Icon(Icons.delete_forever),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'Delete Account'),
                  ),
                );
              },
            ),
            const Divider(
              height: 0.8,
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsPage(title: 'Settings'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Help'),
              leading: const Icon(Icons.help),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsPage(title: 'Help'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Mentoring Videos'),
              leading: const Icon(Icons.video_collection_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(title: 'Mentoring Videos'),
                  ),
                );
              },
            ),
            const ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
