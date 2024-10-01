import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: const Sidebar(),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PieChartCard(title: 'Training'),
                  PieChartCard(title: 'Practice '),
                ],
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            ListTileBorder(title: 'Tactical'),
            ListTileBorder(title: 'Technical'),
            ListTileBorder(title: 'Psychological'),
            Expanded(
              flex: 1,
              child: NavBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartCard extends StatelessWidget {
  final String title;

  const PieChartCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Spacer(),
        const SizedBox(height: 8.0),
        Text(
          title,
        ),
        Container(
          height: 150,
          width: 150,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PieChart(
                PieChartData(
                  sections: showingSections(),
                  centerSpaceRadius: 0,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      // final double fontSize = 16;
      final double radius = 70;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 76, 255, 82),
            value: 40,
            title: 'Won',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 255, 128, 119),
            value: 35,
            title: 'Lost',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 255, 175, 56),
            value: 25,
            title: 'In Progress',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class ListTileBorder extends StatelessWidget {
  final String title;

  const ListTileBorder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.cyan,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(title),
        onTap: () {},
      ),
    );
  }
}
