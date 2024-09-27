// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class SidebarGoal extends StatefulWidget {
  const SidebarGoal({super.key});

  @override
  State<SidebarGoal> createState() => _SidebarGoalState();
}

class _SidebarGoalState extends State<SidebarGoal> {
  Map<String, List<Goal>> goalData = {
    'Dream': [],
    'Long Term': [],
    'Mid Term': [],
    'Short Term': [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Goals'),
      ),
      body: ListView(
        children: [
          _buildGoalRow('Dream', Icons.add, _addDream),
          _buildGoalRow('Long Term', Icons.add, _addLongGoal),
          _buildGoalRow('Mid Term', Icons.add, _addMidGoal),
          _buildGoalRow('Short Term', Icons.add, _addShortGoal),
        ],
      ),
    );
  }

  Widget _buildGoalRow(String goalType, IconData icon,
      Function(BuildContext, String) onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(goalType, style: const TextStyle(fontSize: 16)),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Icon(icon),
                  onPressed: () => onPressed(context, goalType),
                ),
              ),
            ],
          ),
          if (goalData[goalType] != null && goalData[goalType]!.isNotEmpty)
            ...goalData[goalType]!
                .map((goal) => _buildGoalItem(goalType, goal))
                .toList(),
        ],
      ),
    );
  }

  Widget _buildGoalItem(String goalType, Goal goal) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(goal.description, style: const TextStyle(fontSize: 14)),
          ),
          PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String choice) {
                switch (choice) {
                  case 'View':
                    _viewGoal(goalType, goal);
                    break;
                  case 'Edit':
                    _editGoal(goalType, goal);
                    break;
                  case 'Delete':
                    _deleteGoal(goalType, goal);
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return ['View', 'Edit', 'Delete'].map((String choice) {
                  return PopupMenuItem(value: choice, child: Text(choice));
                }).toList();
              }),
        ],
      ),
    );
  }

  void _showGoalDialog(BuildContext context, String goalType, int minDuration,
      int maxDuration, String durationType) {
    double _sliderValue = minDuration.toDouble();
    TextEditingController _descriptionController = TextEditingController();
    DateTime _targetDate = DateTime.now().add(durationType == 'years'
        ? Duration(days: (_sliderValue * 365).round())
        : Duration(days: (_sliderValue * 30).round()));

    int _remainingDays = _targetDate.difference(DateTime.now()).inDays;

    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Center(child: Text('$goalType Goal')),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Description Field with validation
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description'; // Validation message
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Slider for Duration
                    Text(
                      'Duration (${durationType == 'years' ? 'Years' : 'Months'}): ${_sliderValue.toStringAsFixed(0)}',
                    ),
                    Slider(
                      value: _sliderValue,
                      min: minDuration.toDouble(),
                      max: maxDuration.toDouble(),
                      divisions: max(1, maxDuration - minDuration),
                      label: _sliderValue.toStringAsFixed(0),
                      onChanged: (double value) {
                        setStateDialog(() {
                          _sliderValue = value;
                          _targetDate = DateTime.now().add(
                              durationType == 'years'
                                  ? Duration(days: (value * 365).round())
                                  : Duration(days: (value * 30).round()));
                          _remainingDays =
                              _targetDate.difference(DateTime.now()).inDays;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Target Date and Remaining Days
                    Text(
                        'Target Date: ${DateFormat('dd-MMM-yyyy').format(_targetDate)}'),
                    const SizedBox(height: 10),
                    Text('Remaining Days: $_remainingDays'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Update the state of the parent widget when saving the goal
                      setState(() {
                        goalData[goalType]!.add(
                          Goal(
                            description: _descriptionController.text,
                            duration: _sliderValue.toStringAsFixed(0),
                            targetDate: _targetDate,
                            remainingDays: _remainingDays,
                          ),
                        );
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addDream(BuildContext context, String goalType) {
    _showGoalDialog(context, goalType, 7, 30, 'years');
  }

  void _addLongGoal(BuildContext context, String goalType) {
    _showGoalDialog(context, goalType, 3, 7, 'years');
  }

  void _addMidGoal(BuildContext context, String goalType) {
    _showGoalDialog(context, goalType, 13, 36, 'months');
  }

  void _addShortGoal(BuildContext context, String goalType) {
    _showGoalDialog(context, goalType, 1, 12, 'months');
  }

  void _viewGoal(String goalType, Goal goal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$goalType Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Description: ${goal.description}'),
              Text(
                  'Target Date: ${DateFormat('dd-MMM-yyyy').format(goal.targetDate)}'),
              Text('Remaining Days: ${goal.remainingDays}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _editGoal(String goalType, Goal goal) {}

  void _deleteGoal(String goalType, Goal goal) {
    setState(() {
      goalData[goalType]!.remove(goal);
    });
  }
}

class Goal {
  String description;
  String duration;
  DateTime targetDate;
  int remainingDays;

  Goal({
    required this.description,
    required this.duration,
    required this.targetDate,
    required this.remainingDays,
  });
}
