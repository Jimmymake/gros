import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/internetcheck.dart';
import 'package:Matrix.sc/views/auth/splashscreen.dart';
import 'package:Matrix.sc/cartprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  // NetworkImage.n
   NetworkService().startMonitoring(); // Start monitoring internet connection
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final storedValue = prefs.getString('key');
  await Firebase.initializeApp(
      //  options: kIsWeb || Platform.isAndroid
      //         ? const FirebaseOptions(
      //             apiKey: "AIzaSyAKQW92CvFm6Xk7gBJxJqufu74ULQToBw4",
      //             authDomain: "grosaryapp-d67bf.firebaseapp.com",
      //             projectId: "grosaryapp-d67bf",
      //             storageBucket: "grosaryapp-d67bf.appspot.com",
      //             messagingSenderId: "299180950715",
      //             appId: "1:299180950715:web:4316fe0de0784e55eed59e")
      //         : null
      );

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primarycolor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matrix.sc',
      theme: ThemeData(
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.white,elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        tooltipTheme: TooltipThemeData(
            decoration: BoxDecoration(color: Colors.lightBlue)),
        fontFamily: "Brand-Bold",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: SplashScreen()),
      builder: EasyLoading.init(),
    );
  }
}





// class CustomScrollViewExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Custom Scroll View'),
//               background: Image.network(
//                 'https://via.placeholder.com/400',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             floating: false,
//             pinned: true,
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return ListTile(
//                   leading: Icon(Icons.star),
//                   title: Text('Item #$index'),
//                   subtitle: Text('Subtitle for item #$index'),
//                 );
//               },
//               childCount: 50, // Number of items in the list
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

