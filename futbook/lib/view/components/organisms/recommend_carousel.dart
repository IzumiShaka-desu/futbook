import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:futbook/constant/color_palette.dart';
import 'package:get/get.dart';

class RecommendedCarousel extends StatefulWidget {
  RecommendedCarousel({required this.img});
  final List<String> img;
  @override
  _RecommendedCarouselState createState() => _RecommendedCarouselState();
}

class _RecommendedCarouselState extends State<RecommendedCarousel> {
  late PageController _pageController;
  double currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    initializeTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: widget.img.length,
                  itemBuilder: (ctx, index) => AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    padding: EdgeInsets.all(10),
                    transform: Matrix4.identity()
                      ..scale((index == currentPage) ? 1.toDouble() : 0.7),
                    width: Get.width / 2,
                    child: Stack(children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 5.0,
                child: Text(
                  '${''}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                right: 15,
                bottom: 15,
                child: DotsIndicator(
                  dotsCount: widget.img.length,
                  position: currentPage,
                  decorator: DotsDecorator(
                    color: ColorPallete.backgroundColor,
                    activeColor: ColorPallete.activePrimaryColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void initializeTimer() async {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage < widget.img.length - 1) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }
}
