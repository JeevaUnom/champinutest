// // TrainingPopup.dart
// import 'package:flutter/material.dart';
// import '../pages/Reports.dart';  // Adjust path based on your project structure

// void _showTrainingPopup(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Training'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               title: const Text('Goals'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ReprotsPage(option: 'Goals'),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               title: const Text('Drills'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ReprotsPage(option: 'Drills'),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               title: const Text('Techniques'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ReprotsPage(option: 'Techniques'),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               title: const Text('Fitness'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ReprotsPage(option: 'Fitness'),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton.icon(
//             icon: const Icon(Icons.info_outline),
//             label: const Text('Info'),
//             onPressed: () {
//               _showTrainingInfo(context);
//             },
//           ),
//           TextButton.icon(
//             icon: const Icon(Icons.close),
//             label: const Text('Close'),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close popup
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// void _showTrainingInfo(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Training Info'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             Text('Goals: Set and track your goals.'),
//             Text('Drills: Practice specific drills.'),
//             Text('Techniques: Improve your techniques.'),
//             Text('Fitness: Track your fitness levels.'),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton.icon(
//             icon: const Icon(Icons.close),
//             label: const Text('Close'),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close info dialog
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
