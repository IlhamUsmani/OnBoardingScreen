import 'package:flutter/material.dart';
import 'package:onbording_screens/core/utils/colors.dart';
import 'package:onbording_screens/core/utils/screen_constants.dart';
import 'package:onbording_screens/core/utils/screen_size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingContent extends StatelessWidget {
  final String image, text, heading;
  final Animation<double> scaleAnimation;
  final PageController controller;

  const OnBoardingContent(
      {super.key,
      required this.image,
      required this.scaleAnimation,
      required this.heading,
      required this.text,
      required this.controller});

  static const int flexFifteen = 15;
  static const int flexFour = 4;
  static const int flexTwo = 2;
  static const int flexThree = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: flexFifteen,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Center(
                child: SizedBox(
                    height: ScreenSize.height * zeroPointFourFive,
                    child: Image.asset(fit: BoxFit.fill, image)),
              ),
            )),
        Expanded(
            flex: flexFour,
            child: SizedBox(
              width: ScreenSize.width * zeroPointEight,
              child: Text(
                textAlign: TextAlign.center,
                heading,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenSize.height * zeroPointZeroThreeZero),
              ),
            )),
        Expanded(
            flex: flexTwo,
            child: SizedBox(
              width: ScreenSize.width * zeroPointEight,
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(
                    color: grey,
                    fontSize: ScreenSize.height * zeroPointZeroOneSeven),
              ),
            )),
        Expanded(
          flex: flexThree,
          child: SmoothPageIndicator(
            controller: controller,
            count: three,
            effect: WormEffect(
              activeDotColor: blue,
              dotColor: lightGrey,
              dotHeight: ScreenSize.height * zeroPointZeroZeroSeven,
              dotWidth: ScreenSize.width * zeroPointZeroFourZero,
              spacing: ScreenSize.width * zeroPointZeroOne,
            ),
          ),
        ),
      ],
    );
  }
}
