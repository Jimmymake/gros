import 'package:flutter/material.dart';

class Closedcontainerfinal extends StatelessWidget {
  Closedcontainerfinal({super.key});
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
      appBar: AppBar(
        title: Text(
          "Material design",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 100,
                      child: Center(
                        child: Icon(
                          Icons.note,
                          size: 34,
                        ),
                      ),
                    ),
                    // Text(
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 25,
                    //     "${_loremIpsumParagraph}"),
                            Hero(
                              tag: "${_loremIpsumParagraph}",
                              child: SizedBox(
                                child: Material(
                                  child: Text(
                                    maxLines: 3,
                                    "${_loremIpsumParagraph}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                  ],
                ),
              )),
            )
          ],
        ),
      )),
    );
  }
}
