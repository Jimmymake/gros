import 'package:flutter/material.dart';

class Categorywidget extends StatelessWidget {
  final List<String> _categorylable = [
    "Fashion",
    "Home",
    "Living",
    "Health",
    "Beauty",
    "Groceries,",
    "Food",
    "Sports",
    "Books",
  ];

  Categorywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: 19),
            ),
            Container(
              height: 40, 
              child: Row(
                children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categorylable.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ActionChip(
                                  onPressed: () {},
                                  backgroundColor: Colors.yellow.shade900,
                                  label: Center(
                                    child: Text(
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        _categorylable[index]),
                                  )),
                            );
                          })),
                  IconButton(
                      color: Colors.transparent,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
