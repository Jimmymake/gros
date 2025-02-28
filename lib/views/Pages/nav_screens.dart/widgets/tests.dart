// import 'package:flutter/material.dart';
// import 'package:timer_count_down/timer_count_down.dart';

// class countdownpackage extends StatelessWidget {
//   final double hours;
//   final double minutes;
//   double seconds;
//   countdownpackage(
//       {super.key, this.hours = 00, this.minutes = 00, this.seconds = 00});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Countdown(
//             interval: Duration(milliseconds: 100),
//             onFinished: () {
//               print("Timer Is done");
//             },
//             seconds: 21600,
//             build: (BuildContext context, double time) {
//               seconds = time;
//               return Text(
//                 seconds.toString(),
//               );
//             }),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:timer_count_down/timer_controller.dart';
// // import 'package:timer_count_down/timer_count_down.dart';

// // void main() => runApp(MyApp());

// // ///
// // /// Test app
// // ///
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Countdown Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(
// //         title: 'Flutter Demo Countdown',
// //       ),
// //     );
// //   }
// // }

// // ///
// // /// Home page
// // ///
// // class MyHomePage extends StatefulWidget {
// //   ///
// //   /// AppBar title
// //   ///
// //   final String title;

// //   /// Home page
// //   MyHomePage({
// //     Key? key,
// //     required this.title,
// //   }) : super(key: key);

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // ///
// // /// Page state
// // ///
// // class _MyHomePageState extends State<MyHomePage> {
// //   // Controller
// //   final CountdownController _controller =
// //       new CountdownController(autoStart: true);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           widget.title,
// //         ),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             Container(
// //               padding: const EdgeInsets.symmetric(
// //                 horizontal: 16,
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: <Widget>[
// //                   // Start
// //                   ElevatedButton(
// //                     child: Text('Start'),
// //                     onPressed: () {
// //                       _controller.start();
// //                     },
// //                   ),
// //                   // Pause
// //                   ElevatedButton(
// //                     child: Text('Pause'),
// //                     onPressed: () {
// //                       _controller.pause();
// //                     },
// //                   ),
// //                   // Resume
// //                   ElevatedButton(
// //                     child: Text('Resume'),
// //                     onPressed: () {
// //                       _controller.resume();
// //                     },
// //                   ),
// //                   // Stop
// //                   ElevatedButton(
// //                     child: Text('Restart'),
// //                     onPressed: () {
// //                       _controller.restart();
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Countdown(
// //               controller: _controller,
// //               seconds: 5,
// //               build: (_, double time) => Text(
// //                 time.toString(),
// //                 style: TextStyle(
// //                   fontSize: 100,
// //                 ),
// //               ),
// //               interval: Duration(milliseconds: 100),
// //               onFinished: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text('Timer is done!'),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }