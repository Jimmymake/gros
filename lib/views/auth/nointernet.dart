// import 'package:Matrix.sc/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'dart:async';
// // import 'package:connectivity_plus/connectivity_plus.dart'
// // import 'dart:async';
// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:flutter/material.dart';

// // class ConnectivityWidget extends StatefulWidget {
// //   const ConnectivityWidget({super.key});

// //   @override
// //   State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
// // }

// // class _ConnectivityWidgetState extends State<ConnectivityWidget> {

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Connectivity Check")),
// //       body: Center(
// //         child: Text(
// //           hasInternet ? "✅ Internet Available" : "🚫 No Internet",
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: hasInternet ? Colors.green : Colors.red),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class Nointernet extends StatefulWidget {
//   // final bool hasintenet;
// //  Nointernet({super.key, required this.hasintenet});

//   @override
//   State<Nointernet> createState() => _NointernetState();
// }

// class _NointernetState extends State<Nointernet> {

//   // late StreamSubscription<List<ConnectivityResult>> subscription;
//   // bool hasInternet = true;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   startMonitoring();
//   // }

//   // void startMonitoring() {
//   //   subscription = Connectivity()
//   //       .onConnectivityChanged
//   //       .listen((List<ConnectivityResult> result) {
//   //     bool isConnected = result.contains(ConnectivityResult.mobile) ||
//   //         result.contains(ConnectivityResult.wifi) ||
//   //         result.contains(ConnectivityResult.ethernet);

//   //     setState(() {
//   //       hasInternet = isConnected;
//   //     });

//   //     if (isConnected) {
//   //       print("✅ Internet is available!");
//   //     } else {
//   //       print("🚫 No internet available!");
//   //     }
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   subscription.cancel();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 45,
//               child: Icon(
//                 Icons.wifi_off_rounded,
//                 color: primarycolor,
//                 size: 60,
//               ),
//             ),
//             Text(
//               "No Connection",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text('An internet error has occured,Please Try Again'),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 70,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         backgroundColor: primarycolor),
//                     onPressed: () {},
//                     child: Text(
//                       "Try Again",
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:connectivity_plus/connectivity_plus.dart';

// // class NetworkAwareWidget extends StatefulWidget {
// //   @override
// //   _NetworkAwareWidgetState createState() => _NetworkAwareWidgetState();
// // }

// // class _NetworkAwareWidgetState extends State<NetworkAwareWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<ConnectivityResult>(
// //       stream: Connectivity().onConnectivityChanged,
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.active) {
// //           final result = snapshot.data;
// //           if (result == ConnectivityResult.none) {
// //             return Scaffold(
// //               body: Center(
// //                 child: Text(
// //                   "No Internet Connection!",
// //                   style: TextStyle(fontSize: 20, color: Colors.red),
// //                 ),
// //               ),
// //             );
// //           }
// //         }
// //         return Scaffold(
// //           body: Center(child: Text("You are online!")),
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:connectivity_plus/connectivity_plus.dart';

// // class NetworkAwareWidget extends StatefulWidget {
// //   @override
// //   _NetworkAwareWidgetState createState() => _NetworkAwareWidgetState();
// // }

// // class _NetworkAwareWidgetState extends State<NetworkAwareWidget> {
// //   late Stream<ConnectivityResult> connectivityStream;

// //   @override
// //   void initState() {
// //     super.initState();
// //     connectivityStream = Connectivity().onConnectivityChanged; // Correct type
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<ConnectivityResult>(
// //       stream: connectivityStream,
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.active) {
// //           final result = snapshot.data;
// //           if (result == ConnectivityResult.none) {
// //             return Scaffold(
// //               body: Center(
// //                 child: Text(
// //                   "No Internet Connection!",
// //                   style: TextStyle(fontSize: 20, color: Colors.red),
// //                 ),
// //               ),
// //             );
// //           }
// //         }
// //         return Scaffold(
// //           body: Center(child: Text("You are online!")),
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'dart:async';

// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:flutter/material.dart';

// // class connectivity extends StatefulWidget {
// //   const connectivity({super.key});

// //   @override
// //   State<connectivity> createState() => _connectivityState();
// // }

// // class _connectivityState extends State<connectivity> {
// //   StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
// //       .onConnectivityChanged
// //       .listen((List<ConnectivityResult> result) {
// //          bool hasInternet = result.contains(ConnectivityResult.mobile) ||
// //                          result.contains(ConnectivityResult.wifi) ||
// //                          result.contains(ConnectivityResult.ethernet);
// //     if (hasInternet ) {
// //       // print("Vpn available");
// //        print("Internet is available!");

// //     } else {
// //       print("${"no internet available"}");
// //     }
// //   });
// //   @override
// //   initState() {
// //     super.initState();
// //     subscription;
// //     // subscription.c
// //     // subscription.onError(handleError)
// //   }

// // // Be sure to cancel subscription after you are done
// //   @override
// //   dispose() {
// //     subscription.cancel();
// //     super.dispose();
// //   }
// //   // StreamSubscripti

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Nointernet extends StatefulWidget {
  final VoidCallback onRetry;

  const Nointernet({super.key, required this.onRetry});

  @override
  State<Nointernet> createState() => _NointernetState();
}

class _NointernetState extends State<Nointernet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: Icon(Icons.wifi_off_rounded, color: primarycolor, size: 60),
            ),
            const Text(
              "No Connection",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('An internet error has occurred, Please Try Again'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: primarycolor),
                    onPressed:(){  
                     widget.onRetry;},
                   // Calls the function from MainScreen
                    child: const Text(
                      "Try Again",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
