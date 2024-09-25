import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';
import 'package:onbording_screens/core/utils/colors.dart';
import 'package:onbording_screens/core/utils/constants/assets_path.dart';
import 'package:onbording_screens/core/utils/constants/strings.dart';
import 'package:onbording_screens/features/on_borading_page/views/onbording_screen.dart';
import 'package:onbording_screens/core/utils/screen_constants.dart';
import 'package:onbording_screens/core/utils/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  late final ValueNotifier<double> _increaseHeightNotifier;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _increaseHeightNotifier.value += ScreenSize.height * zeroPointZeroEight;
    });

    Timer(const Duration(seconds: 3), () {
      _timer.cancel();
      Get.offAll(() => const OnBoardingPage());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize(context);
    _increaseHeightNotifier =
        ValueNotifier<double>(ScreenSize.height * zeroPointOne);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  static const flexEleven = 11;
  static const flexTen = 10;
  static const flexOne = 1;
  static const flexFive = 5;
  static const flexThree = 3;
  static const flexSeven = 7;

  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: flexEleven),
            Expanded(
              flex: flexTen,
              child: Center(
                child: SizedBox(
                  height: ScreenSize.height * zeroPointTwo,
                  child: const Image(image: AssetImage(icon)),
                ),
              ),
            ),
            Expanded(
              flex: flexThree,
              child: Text(
                splashScreenHeading,
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenSize.height * zeroPointZeroThreeZero,
                ),
              ),
            ),
            Expanded(
              flex: flexSeven,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: ScreenSize.height * zeroPointTHreeFive,
                  child: const Text(
                    textAlign: TextAlign.center,
                    splashScreenText,
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: flexOne,
              child: LoadingAnimationWidget.waveDots(
                color: white,
                size: ScreenSize.height * zeroPointZeroFive,
              ),
            ),
            const Spacer(flex: flexFive),
            Expanded(
              flex: flexTen,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder<double>(
                  valueListenable: _increaseHeightNotifier,
                  builder: (context, height, child) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: _increaseHeightNotifier.value,
                      width: ScreenSize.width,
                      child: Image.asset(
                        waves,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
