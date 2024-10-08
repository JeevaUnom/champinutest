import 'package:champinutest/reports/Match_report.dart';
import 'package:flutter/material.dart';
import '../competition/competition_score.dart';
import '../pages/Reports.dart';
import '../pages/Competition.dart';
import '../pages/Training.dart';
import '../pages/Comets.dart';
import '../training/Goals.dart';
import '../training/SelfAssessment.dart';

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

  void _showTrainingPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Training'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Goals'),
                onTap: () {
                  // Navigator.of(context).pop(); // Close the popup
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GoalPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Drills'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TrainingPage(option: 'Drills'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Techniques'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TrainingPage(option: 'Techniques'),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Fitness Self Assessment'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelfAssessment(),
                    ),
                  );
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.info_outline),
              label: const Text('Info'),
              onPressed: () {
                // Navigator.of(context).pop();
                _showTrainingInfo(context);
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.close),
              label: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showTrainingInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Training Info'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Goals: Set and track your goals.'),
              Text('Drills: Practice specific drills.'),
              Text('Techniques: Improve your techniques.'),
              Text('Fitness: Track your fitness levels.'),
            ],
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.close),
              label: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCometsPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('COMETS'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: const Text('Rally Tracker'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CometsPage(option: 'Rally Tracker'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Swing BioMechanics'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CometsPage(option: 'Swing BioMechanics'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Foot Work'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CometsPage(option: 'Foot Work'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Energy Metrics'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CometsPage(option: 'Energy Metrics'),
                      ),
                    );
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text('Info'),
                onPressed: () {
                  _showCometsInfo(context);
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showCometsInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('COMETS Info'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Rally Tracker: Used to show the ball track'),
                Text(''),
                Text(''),
                Text(''),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showReportsPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Reports'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: const Text('Match Reports'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MatchReport(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Fitness Evaluation Report'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReportsPage(
                            option: 'Fitness Evaluation Report'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Self Assessment Report'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ReportsPage(option: 'Self Assessment Report'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('LeaderBoard'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ReportsPage(option: 'LeaderBoard'),
                      ),
                    );
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text('Info'),
                onPressed: () {
                  _showReportsInfo(context);
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showReportsInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Reports Info'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Match Reports: Summary of your match '),
                Text(''),
                Text(
                    'Self Assessment Report: Rate of your exercise completeness '),
                Text('LeaderBoard: List of player details'),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showCompetitionPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Competition'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: const Text('Match Preparation & Score Update'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScoreTracker(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Match Analysis'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CompetitionPage(option: 'Match Analysis'),
                      ),
                    );
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text('Info'),
                onPressed: () {
                  _showCompetitionInfo(context);
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showCompetitionInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Competition Info'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Match Preparation & Score Update: Used to update the score board'),
                Text(''),
              ],
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      _showTrainingPopup(context);
    } else if (index == 1) {
      _showCompetitionPopup(context);
    } else if (index == 3) {
      _showReportsPopup(context);
    } else if (index == 4) {
      _showCometsPopup(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis_outlined),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games_outlined),
            label: 'Competition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note_sharp),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stadium_outlined),
            label: 'COMETS',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
