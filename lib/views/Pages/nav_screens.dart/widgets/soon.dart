import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Soon extends StatelessWidget {
  const Soon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: primarycolor,),
        body: Center(
      child: Text(
        "Comming soon",
        style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
      ),
    ));
  }
}
