import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_expense/utils/app_routes.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigatorClass.navigatorKey,
        routes: AppRoutes().routes,
        title: 'Daily Expense App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.homeScreen);
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: MonthSelector(),
//         ),
//       ),
//     );
//   }
// }

// class MonthSelector extends StatefulWidget {
//   @override
//   _MonthSelectorState createState() => _MonthSelectorState();
// }

// class _MonthSelectorState extends State<MonthSelector> {
//   final FixedExtentScrollController _controller =
//       FixedExtentScrollController(initialItem: DateTime.now().month - 1);

//   // List of months for display
//   final List<String> months = [
//     "January",
//     "February",
//     "March",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50, // Fixed height for the container
//       width: 100, // Fixed width for the container
//       decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: ListWheelScrollView.useDelegate(
//         controller: _controller,
//         itemExtent: 50, // Height of each item to snap each month into view
//         perspective: 0.005,
//         physics: FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           builder: (context, index) {
//             return Center(
//               child: Text(
//                 months[index % 12], // Loop over months
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             );
//           },
//           childCount: months.length,
//         ),
//         onSelectedItemChanged: (index) {
//           print("Selected month: ${months[index % 12]}");
//         },
//       ),
//     );
//   }
// }
