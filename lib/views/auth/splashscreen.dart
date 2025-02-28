import 'package:Matrix.sc/constants/constants.dart';

import 'package:Matrix.sc/views/auth/loginscreen.dart';
import 'package:Matrix.sc/views/auth/nointernet.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>
      //  ConnectivityWidget()
      login()
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Matrix.S.c",
            style: GoogleFonts.robotoSerif(
                fontStyle: FontStyle.italic,
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: primarycolor),
          ),
          SizedBox(
            height: 20,
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                      colors: [Colors.black, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)
                  .createShader(bounds);
            },
            child: Image.asset(
              "assets/icon/icon.png",
            ),
          ),
          // Image.asset("assets/icon/icon.png"),
        ],
      ),
    );
  }
}
