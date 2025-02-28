// import 'package:Matrix.sc/constants/constants.dart';
// import 'package:Matrix.sc/views/Pages/internetcheck.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/account.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/cart/cart.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/categories.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/home/homescreen.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/messages/messages.dart';
// import 'package:Matrix.sc/views/auth/nointernet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class mainscreen extends StatefulWidget {
//   const mainscreen({super.key});

//   @override
//   State<mainscreen> createState() => _mainscreenState();
// }

// class _mainscreenState extends State<mainscreen> {
//     bool isConnected = true;

//   @override
//   void initState() {
//     super.initState();
//     checkInternetStatus();
//   }

//   void checkInternetStatus() async {
//     bool status = await NetworkService().checkInternet();
//     setState(() {
//       isConnected = status;
//     });
//   }
//   int _pageindex = 0;

//   List<Widget>   _pages = [
//     homescreen(),
//     categories(),
//     Cart(),
//     messages(),
//     Account()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _pageindex,
//           onTap: (value) {
//             setState(() {
//               _pageindex = value;
//             });
//           },
//           unselectedItemColor: Colors.black,
//           selectedItemColor: primarycolor,
//           items: [
//             BottomNavigationBarItem(
//                 label: "Home",
//                 icon: Icon(
//                   Icons.home,
//                 )),
//             BottomNavigationBarItem(
//                 label: "Categories",
//                 icon: SvgPicture.asset(
//                   "assets/icons/explore.svg",
//                   width: 20,
//                 )),
//             BottomNavigationBarItem(
//                 label: "Cart",
//                 icon: SvgPicture.asset(
//                   "assets/icons/cart.svg",
//                   width: 20,
//                 )),
//             BottomNavigationBarItem(
//                 label: "Messages", icon: Icon(Icons.message)),
//             BottomNavigationBarItem(
//                 label: "Account",
//                 icon: SvgPicture.asset(
//                   "assets/icons/account.svg",
//                   width: 20,
//                 )),
//           ]),
//       body: isConnected ?  _pages[_pageindex]   : Nointernet(),
//     );
//   }
// }

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:Matrix.sc/constants/constants.dart';
// import 'package:Matrix.sc/views/Pages/internetcheck.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/account.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/cart/cart.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/categories.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/home/homescreen.dart';
// import 'package:Matrix.sc/views/Pages/nav_screens.dart/messages/messages.dart';
// import 'package:Matrix.sc/views/auth/nointernet.dart';
// // import 'package:Matrix.sc/network_service.dart'; // Ensure this is imported
// import 'dart:async';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   bool isConnected = true;
//   late StreamSubscription<List<ConnectivityResult>> subscription;

//   @override
//   void initState() {
//     super.initState();
//     startMonitoring();
//   }

//   void startMonitoring() {
//     // Initial check
//     checkInternetStatus();

//     // Continuous monitoring for changes
//     subscription = NetworkService().onConnectivityChanged.listen((List<ConnectivityResult> result) {
//       bool status = result.contains(ConnectivityResult.mobile) ||
//                     result.contains(ConnectivityResult.wifi) ||
//                     result.contains(ConnectivityResult.ethernet);

//       print("🔍 Connectivity changed: $result");

//       if (mounted) {
//         setState(() {
//           isConnected = status;
//         });
//       }
//     });
//   }

//   void checkInternetStatus() async {
//     bool status = await NetworkService().checkInternet();
//     print("🔍 Initial Connectivity Check: $status");

//     if (mounted) {
//       setState(() {
//         isConnected = status;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   int _pageIndex = 0;

//   List<Widget>

//    _pages = [

//     homescreen(),
//     categories(),
//     Cart(),
//     messages(),
//     Account()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _pageIndex,
//           onTap: (value) {
//             setState(() {
//               _pageIndex = value;
//             });
//           },
//           unselectedItemColor: Colors.black,
//           selectedItemColor: primarycolor,
//           items: [
//             BottomNavigationBarItem(
//                 label: "Home",
//                 icon: Icon(Icons.home)),
//             BottomNavigationBarItem(
//                 label: "Categories",
//                 icon: SvgPicture.asset(
//                   "assets/icons/explore.svg",
//                   width: 20,
//                 )),
//             BottomNavigationBarItem(
//                 label: "Cart",
//                 icon: SvgPicture.asset(
//                   "assets/icons/cart.svg",
//                   width: 20,
//                 )),
//             BottomNavigationBarItem(
//                 label: "Messages", icon: Icon(Icons.message)),
//             BottomNavigationBarItem(
//                 label: "Account",
//                 icon: SvgPicture.asset(
//                   "assets/icons/account.svg",
//                   width: 20,
//                 )),
//           ]),
//       body: isConnected ?
//       _pages[_pageIndex] : Nointernet() ,
//     );
//   }
// }
import 'dart:async';
import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/internetcheck.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/account.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/cart/cart.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/categories.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/home/homescreen.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/messages/messages.dart';
import 'package:Matrix.sc/views/auth/nointernet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isConnected = true;
  StreamSubscription<List<ConnectivityResult>>? subscription;

  @override
  void initState() {
    super.initState();
    startMonitoring();
  }

  void startMonitoring() {
    checkInternetStatus();
    subscription = NetworkService()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      bool status = result.contains(ConnectivityResult.mobile)
      ||
      result.contains(ConnectivityResult.wifi) ||
      result.contains(ConnectivityResult.ethernet);

      if (mounted) {
        setState(() {
          isConnected = status;
        });
      }
    });
  }

  void checkInternetStatus() async {
    bool status = await NetworkService().checkInternet();
    if (mounted) {
      setState(() {
        isConnected = status;
      });
    }
  }

  void retryConnection() {
    setState(() {
      checkInternetStatus(); // Recheck connectivity and rebuild
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  int _pageIndex = 0;

  final List<Widget> _pages = [
    homescreen(),
    categories(),
    Cart(),
    messages(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          unselectedItemColor: Colors.black,
          selectedItemColor: primarycolor,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Categories",
                icon: SvgPicture.asset("assets/icons/explore.svg", width: 20)),
            BottomNavigationBarItem(
                label: "Cart",
                icon: SvgPicture.asset("assets/icons/cart.svg", width: 20)),
            BottomNavigationBarItem(
                label: "Messages", icon: Icon(Icons.message)),
            BottomNavigationBarItem(
                label: "Account",
                icon: SvgPicture.asset("assets/icons/account.svg", width: 20)),
          ]),
      body: isConnected
          ? _pages[_pageIndex]
          : Nointernet(onRetry: retryConnection),
    );
  }
}
