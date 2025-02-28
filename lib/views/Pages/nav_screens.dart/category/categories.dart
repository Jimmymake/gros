import 'package:Matrix.sc/cartprovider.dart';
import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/cart/cart.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/Beauty.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/electronics.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/fashion.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/kids.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/groceries.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/health.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/media.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/arts.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  // List to track hover state of each category
  List<bool> _hoverStates = List.generate(9, (index) => false);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    electronics(),
    fashion(),
    Health(),
    Beauty(),
    Groceries(),
    Kids(),
    Sports(),
    Arts(),
    Media(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconcolor),
        centerTitle: true,
        backgroundColor: primarycolor,
        elevation: 5,
        title: SizedBox(
          width: 250,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: "Search From Matrix",
              labelStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white70,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) => InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              },
              child: Badge(
                  label: Text("${value.mylist.length}"),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white70,
                      ))),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 70,
              color: primarycolor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      onTapDown: (_) {
                        setState(() {
                          _hoverStates[index] = true;
                        });
                      },
                      onTapUp: (_) {
                        setState(() {
                          _hoverStates[index] = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _hoverStates[index] = false;
                        });
                      },
                      child: Opacity(
                        opacity: _hoverStates[index] ? 0.5 : 1,
                        child: SizedBox(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                index == 0
                                    ? "assets/svgions/devices-svgrepo-com (1).svg"
                                    : index == 1
                                        ? "assets/svgions/tuxedo-fashion-3-svgrepo-com.svg"
                                        : index == 2
                                            ? "assets/svgions/health-svgrepo-com.svg"
                                            : index == 3
                                                ? "assets/svgions/make-up-svgrepo-com.svg"
                                                : index == 4
                                                    ? "assets/svgions/food-dish-svgrepo-com.svg"
                                                    : index == 5
                                                        ? "assets/svgions/toys-14-svgrepo-com.svg"
                                                        : index == 6
                                                            ? "assets/svgions/sports-volleyball-svgrepo-com.svg"
                                                            : index == 7
                                                                ? "assets/svgions/arts-and-crafts-solid-svgrepo-com.svg"
                                                                
                                                                    : "assets/svgions/media-file-svgrepo-com.svg"
                                                                    
                                // color: iconcolor,
                                ,
                                width: 30,
                                color: Colors.white,
                              ),
                              Text(index == 0
                                  ? "Electronics"
                                  : index == 1
                                      ? "Fashion"
                                      : index == 2
                                          ? "Health"
                                          : index == 3
                                              ? "Beauty"
                                              : index == 4
                                                  ? "Groceries"
                                                  : index == 5
                                                      ? "Kids"
                                                      : index == 6
                                                          ? "Sports"
                                                          : index == 7
                                                              ? "Arts"
                                                                  :"Media"
                                                                  ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
