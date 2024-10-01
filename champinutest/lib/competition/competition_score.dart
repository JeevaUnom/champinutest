import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ScoreTracker extends StatefulWidget {
  const ScoreTracker({super.key});

  @override
  State<ScoreTracker> createState() => ScoreTrackerState();
}

class ScoreTrackerState extends State<ScoreTracker> {
  int player1Game = 0;
  int player2Game = 0;

  void incrementScore(int player) {
    setState(() {
      if (player == 1) {
        if (canIncrementScore(player1Game, player2Game)) {
          player1Game++;
        }
      } else if (player == 2) {
        if (canIncrementScore(player2Game, player1Game)) {
          player2Game++;
        }
      }
    });
  }

  bool canIncrementScore(int currentPlayerScore, int opponentScore) {
    if (currentPlayerScore < 6) {
      return true;
    } else if (currentPlayerScore == 6 && opponentScore < 5) {
      return true;
    } else if (currentPlayerScore > 6 &&
        currentPlayerScore - opponentScore < 2) {
      return true;
    }
    return false;
  }

  void decrementScore(int player) {
    setState(() {
      if (player == 1 && player1Game > 0) {
        player1Game--;
      } else if (player == 2 && player2Game > 0) {
        player2Game--;
      }
    });
  }

  String getScore() {
    if (player1Game == 7 && player2Game == 6) {
      return 'player 1 wins 7-6';
    } else if (player2Game == 7 && player1Game == 6) return 'Player 2 wins 7-6';
    if (player1Game >= 6 && player1Game - player2Game >= 2) {
      return 'Player 1 wins $player1Game - $player2Game';
    } else if (player2Game >= 6 && player2Game - player1Game >= 2) {
      return 'Player 2 wins $player2Game - $player1Game';
    }
    return '$player1Game - $player2Game \n';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' ${getScore()}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Player 1',
                      style: TextStyle(fontSize: 18),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => incrementScore(1),
                            icon: const Icon(Icons.arrow_drop_up)),
                        Text(
                          player1Game.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () => decrementScore(1),
                            icon: const Icon(Icons.arrow_drop_down))
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text('Player 2', style: TextStyle(fontSize: 18)),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => incrementScore(2),
                            icon: const Icon(Icons.arrow_drop_up)),
                        Text(
                          player2Game.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () => decrementScore(2),
                            icon: const Icon(Icons.arrow_drop_down))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


  // TextEditingController _player1Controller = TextEditingController();
  // TextEditingController _player2Controller = TextEditingController();
  // @override
  // void initState() {
  //   super.initState();
  //   _player1Controller.text = '0';
  //   _player2Controller.text = '0';
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Score Board'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           _buildScoreInput('Player 1', _player1Controller,
  //               (int currentValue) {
  //             _updateScore(
  //                 _player1Controller, currentValue + 1, _player2Controller);
  //           }, (int currentValue) {
  //             _updateScore(_player1Controller,
  //                 currentValue > 0 ? currentValue - 1 : 0, _player2Controller);
  //           }),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           _buildScoreInput('Player 2', _player2Controller,
  //               (int currentValue) {
  //             _updateScore(
  //                 _player2Controller, currentValue + 1, _player1Controller);
  //           }, (int currentValue) {
  //             _updateScore(_player2Controller,
  //                 currentValue > 0 ? currentValue - 1 : 0, _player1Controller);
  //             ;
  //           }),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void _updateScore(TextEditingController currentController, int newValue,
  //     TextEditingController opponentController) {
  //   int opponentScore = int.parse(opponentController.text);
  //   if (newValue == 6 && opponentScore < 5) {
  //     return;
  //   }
  //   if (newValue < 6) {
  //     setState(() {
  //       currentController.text = newValue.toString();
  //     });
  //   }
  //   if (currentController == _player1Controller &&
  //       opponentScore >= 5 &&
  //       newValue > 5) {
  //     setState(() {
  //       currentController.text = newValue.toString();
  //     });
  //   } else if (currentController == _player2Controller &&
  //       opponentScore >= 5 &&
  //       newValue > 5) {
  //     if (newValue - opponentScore >= 2) {
  //       setState(() {
  //         currentController.text = newValue.toString();
  //       });
  //     }
  //   }
  // }

  // Widget _buildScoreInput(String playerName, TextEditingController controller,
  //     Function increment, Function decrement) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Expanded(
  //         flex: 1,
  //         child: TextFormField(
  //           textAlign: TextAlign.center,
  //           decoration: InputDecoration(
  //               labelText: playerName,
  //               contentPadding: const EdgeInsets.all(8.0),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5.0),
  //               )),
  //           controller: controller,
  //           keyboardType: TextInputType.number,
  //           inputFormatters: <TextInputFormatter>[
  //             FilteringTextInputFormatter.digitsOnly
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 38.0,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             InkWell(
  //                 onTap: (() {
  //                   int currentValue = int.parse(controller.text);
  //                   increment(currentValue);
  //                 }),
  //                 child: const Icon(
  //                   Icons.arrow_drop_up,
  //                   size: 18.0,
  //                 )),
  //             InkWell(
  //                 onTap: (() {
  //                   int currentValue = int.parse(controller.text);
  //                   decrement(currentValue);
  //                 }),
  //                 child: const Icon(
  //                   Icons.arrow_drop_down,
  //                   size: 18.0,
  //                 )),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
// }
