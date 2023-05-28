import 'dart:async';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      final isLastIndex =
          _pageController.page?.toInt() == carouselImages.length - 1;
      if (isLastIndex) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: carouselImages
          .map(
            (image) => SizedBox(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList(),
    );
  }
}

const carouselImages = [
  'res/images/carousel_01.jpeg',
  'res/images/carousel_02.jpeg',
  'res/images/carousel_03.jpeg'
];
