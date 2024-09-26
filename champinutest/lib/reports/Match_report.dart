import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// import '../sidebar/sidebar_goals.dart';

class MatchReport extends StatelessWidget {
  const MatchReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Reports'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Priority Report'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'match_count',
                      reportTitle: 'Priority Report'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Momentum Changes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'match_count',
                      reportTitle: 'Momentum Changes'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Positive Aspects'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'match_count',
                      reportTitle: 'Positive Aspects'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Aspects To Work On'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'match_count',
                      reportTitle: 'Aspects To Work On'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Opponent Game To Remember'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'player_name',
                      reportTitle: 'Opponent Game to Remember'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Opponent Tactics Report'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'player_name',
                      reportTitle: 'Opponent Tactics Report'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
          ListTile(
            title: const Text('Match Analysis Report'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportPage(
                      reportType: 'date_report',
                      reportTitle: 'Match Analysis Report'),
                ),
              );
            },
          ),
          const Divider(
            height: 0.8,
          ),
        ],
      ),
    );
  }
}

class ReportPage extends StatefulWidget {
  final String reportType;
  final String reportTitle;
  const ReportPage(
      {super.key, required this.reportType, required this.reportTitle});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  var matchCounts = ['5', '10', '15', '20', '25'];
  var players = ['Player 1', 'Player 2', 'Player 3'];
  var reportOptions = [
    'Winner, UFE, FE situations',
    'Games Won After Trailing',
    'Games Lost After Leading',
    'Games Won At',
    'Games Lost At'
  ];

  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reportTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    switch (widget.reportType) {
      case 'match_count':
        return _buildMatchCountDropdown();
      case 'player_name':
        return _buildPlayerDropdown();
      case 'date_report':
        return _buildDateAndReportSelector();
      default:
        return const Center(child: Text('No records to show'));
    }
  }

  Widget _buildMatchCountDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Match Count'),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: const Text('Select Match Count'),
                items: matchCounts.map((String count) {
                  return DropdownMenuItem(
                    value: count,
                    child: Text(count),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                })),
        if (dropdownValue == null)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Select Match Count/No Records to show'),
            ),
          ),
      ],
    );
  }

  Widget _buildPlayerDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Player'),
        Center(
            child: DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: const Text('Select Player'),
                items: players.map((String player) {
                  return DropdownMenuItem(
                    value: player,
                    child: Text(player),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                })),
        if (dropdownValue == null)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Select Player/No Records to show'),
            ),
          ),
      ],
    );
  }

  Widget _buildDateAndReportSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('From Date:  '),
            const SizedBox(
              width: 10,
            ),
            Text(fromDate == null
                ? 'Select Date'
                : DateFormat('dd MMM yyyy').format(fromDate!)),
            IconButton(
              onPressed: () => _selectDate(context, true),
              icon: const Icon(Icons.calendar_today),
            )
          ],
        ),
        Row(
          children: [
            const Text('To Date:  '),
            const SizedBox(
              width: 10,
            ),
            Text(toDate == null
                ? 'Select Date'
                : DateFormat('dd MMM yyyy').format(toDate!)),
            IconButton(
                onPressed: () => _selectDate(context, false),
                icon: const Icon(Icons.calendar_today))
          ],
        ),
        const SizedBox(height: 20),
        const Text('Reports'),
        DropdownButton(
            value: dropdownValue2,
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: const Text('Select Report Type'),
            items: reportOptions.map((String report) {
              return DropdownMenuItem(
                value: report,
                child: Text(report),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue2 = newValue!;
              });
            }),
        if (dropdownValue2 == null)
          const Center(
            // ignore: unnecessary_const
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Select Report Type/No Record to show'),
            ),
          ),
      ],
    );
  }
}
