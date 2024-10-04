import 'package:flutter/material.dart';

class TennisTerms extends StatelessWidget {
  const TennisTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tennis Terms'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title(
                color: Colors.black,
                child: const Text(
                  'Scoring System',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            // const Text('1. Points'),
            // const Text('2. Games'),
            // const Text('3. Sets'),
            // const Text('4. Match'),
            // const Text('\n'),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Points',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            // const Text(
            //     "0th point: Love(0) \n" '1st point: 15 \n' "2nd point: 30 "),
            // const Text('1st point: 15'),
            // const Text('2nd point: 30'),
            // const Text('3rd point: 40'),
            // const Text('4th point: Game'),
            // const Text('Deuce point: 40-40'),
            // const Text('Ad'),
            // const Text('\n'),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Ad-In & Ad-Out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Break',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Hold',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'BreakPoints',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Deuce Court',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Ad Court',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Tie-Breaker',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'General Terms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(
              height: 30,
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  'Other Terms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Divider(height: 30),
          ],
        ),
      ),
    );
  }
}
