import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/electronics.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/materialmotion/bottomnav.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/materialmotion/closedcontainerfinal.dart';
import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cardas extends StatelessWidget {
  Cardas({super.key});
  String _loremIpsumParagraph =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
      'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
      'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
      'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
      'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
      'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
      'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
      'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
      'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
      'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
      'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
      'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
      'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
      'vitae.\n'
      '\n'
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
      'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
      'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
      'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
      'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
      'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
      'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
      'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
      'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
      'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
      'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
      'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
      'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
      'vitae';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OpenContainer(
                onClosed: (data) {
                  print("...........${data}");
                },
                tappable: false,
                closedElevation: 0,
                openElevation: 0,
                transitionType: ContainerTransitionType.fadeThrough,
                // transitionDuration: Duration(milliseconds: 600),
                closedBuilder: (BuildContext _, VoidCallback opencontainer) {
                  return InkWell(
                    onTap: () {
                      opencontainer();
                    },
                    child: Card(
                      child: SizedBox(
                        height: 285,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Icon(
                                    Icons.note,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              maxLines: 8,
                              "${_loremIpsumParagraph}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                openBuilder: (BuildContext _,
                    CloseContainerActionCallback closecontainer) {
                  return Closedcontainerfinal();
                }),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  child: Icon(
                                    Icons.note,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              maxLines: 5,
                              "${_loremIpsumParagraph}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: SizedBox(
                        height: 220,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Center(
                                child: SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Icon(
                                    Icons.note,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              maxLines: 5,
                              "${_loremIpsumParagraph}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: SizedBox(
                        height: 125,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Center(
                                child: SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: Icon(
                                    Icons.note,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            // Hero(tag: "msgy6".,
                            //   child: Material(
                            //       child: Title(
                            //           color: Colors.black, child: Text("Title"))),
                            // ),
                            Hero(
                              tag: "$_loremIpsumParagraph",
                              child: SizedBox(
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Closedcontainerfinal();
                                      }));
                                    },
                                    child: Text(
                                      maxLines: 3,
                                      "${_loremIpsumParagraph}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ))),
    );
  }
}
  