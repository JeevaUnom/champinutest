import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class SelfAssessment extends StatefulWidget {
  const SelfAssessment({super.key});

  @override
  State<SelfAssessment> createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  DateTime _selectDate = DateTime.now();
  final DatePickerController _controller = DatePickerController();
  double _slider1 = 0;
  double _slider2 = 50;

  final List<String> words = [
    'Zero',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.animateToDate(_selectDate);
    });
  }

  Future<void> _selectedDateFromCalendar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectDate,
        firstDate: DateTime(2024),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectDate) {
      setState(() {
        _selectDate = picked;
        _controller.animateToDate(_selectDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Self Assessment'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const Text('Select Date'),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectedDateFromCalendar(context),
                    ),
                    Text(DateFormat('dd MMM yyyy').format(_selectDate))
                  ],
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: DatePicker(
                    DateTime(2024),
                    controller: _controller,
                    initialSelectedDate: _selectDate,
                    selectionColor: Colors.blue,
                    selectedTextColor: Colors.black,
                    deactivatedColor: Colors.grey,
                    onDateChange: (date) {
                      if (date.isBefore(DateTime.now()) ||
                          date.isAtSameMomentAs(DateTime.now())) {
                        setState(() {
                          _selectDate = date;
                        });
                      }
                    },
                    daysCount:
                        DateTime.now().difference(DateTime(2024)).inDays + 1,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Rate of Perceived Exertion'),
                Slider(
                    value: _slider1,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: '${_slider1.toInt()}',
                    onChanged: (value) {
                      setState(() {
                        _slider1 = value;
                      });
                    }),
                const SizedBox(height: 20),
                const Text('Completion of Exercise'),
                Slider(
                    value: _slider2,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: '${_slider2.toInt()}',
                    onChanged: (value) {
                      setState(() {
                        _slider2 = value;
                      });
                    })
              ],
            ),
          ),
        ));
  }
}
