import 'dart:async';

import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/dot_indicators.dart';
import 'package:flutter/material.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  late PageController _pageController;
  late Timer _timer;
  int _selectedIndex = 0;
  // Offers List
  List offers = [
    Image.asset(
      "assets/images/20240930_190455.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/20240930_190439.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/20240930_190509.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/20240930_190516.jpg",
      fit: BoxFit.cover,
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: 1.87,
          child: ClipRRect(borderRadius: BorderRadius.circular(7),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                PageView.builder(
                    controller: _pageController,
                    itemCount: offers.length,
                    onPageChanged: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: offers[index],
                        )
                    // offers[index],
                    ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 16,
                      child: Row(
                        children: List.generate(
                          offers.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16 / 4),
                              child: DotIndicator(
                                isActive: index == _selectedIndex,
                                activeColor: Colors.white70,
                                inActiveColor: Colors.white54,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
