// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SidebarPhysique extends StatefulWidget {
  const SidebarPhysique({super.key});

  @override
  State<SidebarPhysique> createState() => _SidebarPhysiqueState();
}

class _SidebarPhysiqueState extends State<SidebarPhysique> {
  List<Map<String, String>> _physiqueEnteries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physique Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (_physiqueEnteries.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                itemCount: _physiqueEnteries.length,
                itemBuilder: (context, index) {
                  final entry = _physiqueEnteries[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                          'Measured on: ${entry['date']}, Height: ${entry['height']} cm, Weight: ${entry['weight']} kg'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _editPhysique(index);
                          } else if (value == 'delete') {
                            setState(() {
                              _physiqueEnteries.removeAt(index);
                            });
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
            else
              const Center(
                child: Text('No Physique details entered yet.'),
              )
          ],
        ),
        // Center(
        //   child:
        // )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhysique,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addPhysique() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PhysiqueDialog(
            onSave: (String date, String height, String weight) {
          setState(() {
            _physiqueEnteries
                .add({'date': date, 'height': height, 'weight': weight});
            _physiqueEnteries.sort((a, b) => DateFormat('dd MMM yyyy')
                .parse(b['date']!)
                .compareTo(DateFormat('dd MMM yyyy').parse(a['date']!)));
          });
        });
      },
    );
  }

  void _editPhysique(int index) {
    final entry = _physiqueEnteries[index];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PhysiqueDialog(
            initialDate: entry['date']!,
            initialHeight: entry['height']!,
            initialWeight: entry['weight']!,
            onSave: (String date, String height, String weight) {
              setState(() {
                _physiqueEnteries[index] = {
                  'date': date,
                  'height': height,
                  'weight': weight
                };
                _physiqueEnteries.sort((a, b) => DateFormat('dd MMM yyyy')
                    .parse(b['date']!)
                    .compareTo(DateFormat('dd MMM yyyy').parse(a['date']!)));
              });
            },
          );
        });
  }
}

class PhysiqueDialog extends StatefulWidget {
  final Function(String, String, String) onSave;
  final String? initialDate;
  final String? initialHeight;
  final String? initialWeight;
  const PhysiqueDialog(
      {super.key,
      required this.onSave,
      this.initialDate,
      this.initialHeight,
      this.initialWeight});

  @override
  State<PhysiqueDialog> createState() => _PhysiqueDialogState();
}

class _PhysiqueDialogState extends State<PhysiqueDialog> {
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate != null
        ? DateFormat('dd MMM yyyy').parse(widget.initialDate!)
        : DateTime.now();
    _heightController = TextEditingController(text: widget.initialHeight ?? '');
    _weightController = TextEditingController(text: widget.initialWeight ?? '');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Physique Details'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Measured on',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    controller: TextEditingController(
                      text: DateFormat('dd MMM yyyy').format(_selectedDate),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Height in CMs'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Height';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight in KGs'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Weight';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String height = _heightController.text;
              String weight = _weightController.text;
              String date = DateFormat('dd MMM yyyy').format(_selectedDate);
              widget.onSave(date, height, weight);
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }
}
