import 'package:Matrix.sc/constants/constants.dart';
import 'package:flutter/material.dart';

class Flashsale extends StatefulWidget {
  const Flashsale({super.key});

  @override
  State<Flashsale> createState() => _FlashsaleState();
}

class _FlashsaleState extends State<Flashsale> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primarycolor, Colors.lightBlue])),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Flash sale",
            style: TextStyle(fontSize: 23),
          ),
          Text(
            "12:23:45",
            style: TextStyle(fontSize: 23),
          ),
          Text(
            "See more",
            style:
                TextStyle(decoration: TextDecoration.underline, fontSize: 23),
          )
        ],
      ),
    );
  }
}
