// // // // import 'dart:async';
// // // import 'dart:async';

// // // import 'package:connectivity_plus/connectivity_plus.dart';

// // // class NetworkService {
// // //   static final NetworkService _instance = NetworkService._internal();
// // //   factory NetworkService() => _instance;

// // //   NetworkService._internal();

// // //   final Connectivity _connectivity = Connectivity();
// // //   late StreamSubscription<List<ConnectivityResult>> _subscription;
// // //   bool isConnected = true;

// // //   get onConnectivityChanged => null;

// // //   void startMonitoring() {
// // //     _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
// // //       isConnected = result.contains(ConnectivityResult.mobile) ||
// // //                     result.contains(ConnectivityResult.wifi) ||
// // //                     result.contains(ConnectivityResult.ethernet);

// // //       print(isConnected ? "✅ Internet Available" : "🚫 No Internet");
// // //     });
// // //   }

// // //   void stopMonitoring() {
// // //     _subscription.cancel();
// // //   }

// // //   Future<bool> checkInternet() async {
// // //     var result = await _connectivity.checkConnectivity();
// // //     return result.contains(ConnectivityResult.mobile) ||
// // //            result.contains(ConnectivityResult.wifi) ||
// // //            result.contains(ConnectivityResult.ethernet);
// // //   }
// // // }
// // import 'dart:async';
// // import 'package:connectivity_plus/connectivity_plus.dart';

// // class NetworkService {
// //   static final NetworkService _instance = NetworkService._internal();
// //   factory NetworkService() => _instance;
// //   NetworkService._internal();

// //   final Connectivity _connectivity = Connectivity();
// //   late StreamController<List<ConnectivityResult>> _controller;
// //   Stream<List<ConnectivityResult>> get onConnectivityChanged => _controller.stream;

// //   void startMonitoring() {
// //     if (_controller == null || _controller.isClosed) {
// //       _controller = StreamController<List<ConnectivityResult>>.broadcast();
// //     }

// //     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
// //       print("🔍 NetworkService detected change: $result");
// //       _controller.add(result);
// //     });
// //   }

// //   void stopMonitoring() {
// //     _controller.close();
// //   }

// //   Future<bool> checkInternet() async {
// //     var result = await _connectivity.checkConnectivity();
// //     print("🔍 NetworkService Initial Check: $result");
// //     return result.contains(ConnectivityResult.mobile) ||
// //            result.contains(ConnectivityResult.wifi) ||
// //            result.contains(ConnectivityResult.ethernet);
// //   }
// // }
// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkService {
//   static final NetworkService _instance = NetworkService._internal();
//   factory NetworkService() => _instance;

//   final Connectivity _connectivity = Connectivity();
//   late StreamController<List<ConnectivityResult>> _controller;
//   Stream<List<ConnectivityResult>> get onConnectivityChanged => _controller.stream;

//   NetworkService._internal() {
//     _controller = StreamController<List<ConnectivityResult>>.broadcast();
//     startMonitoring();
//   }

//   void startMonitoring() {
//     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
//       print("🔍 NetworkService detected change: $result");
//       _controller.add(result);
//     });
//   }

//   void stopMonitoring() {
//     _controller.close();
//   }

//   Future<bool> checkInternet() async {
//     var result = await _connectivity.checkConnectivity();
//     print("🔍 NetworkService Initial Check: $result");
//     return result.contains(ConnectivityResult.mobile) ||
//            result.contains(ConnectivityResult.wifi) ||
//            result.contains(ConnectivityResult.ethernet);
//   }
// }
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  final Connectivity _connectivity = Connectivity();
  late StreamController<List<ConnectivityResult>> _controller;
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _controller.stream;

  NetworkService._internal() {
    _controller = StreamController<List<ConnectivityResult>>.broadcast();
    startMonitoring();
  }

  void startMonitoring() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      print("🔍 NetworkService detected change: $result");
      _controller.add(result);
    });
  }

  void stopMonitoring() {
    _controller.close();
  }

  Future<bool> checkInternet() async {
    var result = await _connectivity.checkConnectivity();
    print("🔍 NetworkService Initial Check: $result");
    return result.contains(ConnectivityResult.mobile)
    ||
     result.contains(ConnectivityResult.wifi) ||
     result.contains(ConnectivityResult.ethernet)
    ;
  }
}
