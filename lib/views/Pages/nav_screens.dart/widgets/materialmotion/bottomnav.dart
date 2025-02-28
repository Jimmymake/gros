import 'package:Matrix.sc/views/Pages/nav_screens.dart/home/homescreen.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/messages/messages.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class Openedcontainer extends StatefulWidget {
  Openedcontainer({super.key});

  @override
  State<Openedcontainer> createState() => _OpenedcontainerState();
}

class _OpenedcontainerState extends State<Openedcontainer> {
  int intialindex = 0;

  List<Widget> _pages = [
    homescreen(),
    messages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("material desighn"),
      ),
      body: PageTransitionSwitcher(
          reverse: intialindex == 0,
          duration: Duration(seconds: 2),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            // return FadeThroughTransition(
            //     child: child,  
            //     animation: primaryAnimation,
            //     secondaryAnimation: secondar yAnimation);

            // return FadeScaleTransition(
            //     child: child, animation: primaryAnimation);
            return SharedAxisTransition(
                child: child,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal);
          },
          child: _pages[intialindex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: intialindex,
        onTap: (value) {
          setState(() {
            intialindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message")
        ],
      ),
    );
  }
}
