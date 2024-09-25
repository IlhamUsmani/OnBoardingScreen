import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onbording_screens/core/utils/colors.dart';
import 'package:onbording_screens/core/utils/constants/strings.dart';
import 'package:onbording_screens/features/on_borading_page/controller/onboarding_controller.dart';
import 'package:onbording_screens/features/on_borading_page/views/widgets/onboarding_content.dart';
import 'package:onbording_screens/core/utils/screen_constants.dart';
import 'package:onbording_screens/core/utils/screen_size.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
  });

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _scaleAnimation;

  late OnBoardingController _controller;

  static const flexThree = 3;
  static const flexTwentyFive = 25;
  static const flexOne = 1;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(OnBoardingController());
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    Future(() => _animationController.forward());
  }

  void _resetAnimations() {
    _animationController.reset();
    Future(() => _animationController.forward());
  }

  void _previousPage() {
    _controller.previousPage();
    _animationController.reset();
    Future(() => _animationController.forward());
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Obx(() {
            return _controller.currentIndex.value == 0
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _previousPage,
                  );
          })),
      body: Column(
        children: [
          Expanded(
              flex: flexTwentyFive,
              child: Obx(() {
                final currentPage =
                    _controller.pages[_controller.currentIndex.value];
                return OnBoardingContent(
                    heading: currentPage.heading,
                    text: currentPage.text,
                    image: currentPage.image,
                    controller: PageController(
                        initialPage: _controller.currentIndex.value),
                    scaleAnimation: _scaleAnimation);
              })),
          Expanded(
              flex: flexThree,
              child: Center(
                child: SizedBox(
                  width: ScreenSize.width * zeroPointEight,
                  height: ScreenSize.height * zeroPointZeroSeven,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      ScreenSize.height *
                                          zeroPointZeroTwoZero))),
                          backgroundColor: const WidgetStatePropertyAll(blue)),
                      onPressed: onPress,
                      child: const Text(
                        next,
                        style: TextStyle(color: white),
                      )),
                ),
              )),
          const Spacer(
            flex: flexOne,
          )
        ],
      ),
    );
  }

  void onPress() {
    _controller.nextPage();

    if (_controller.shouldResetAnimation) {
      _resetAnimations();
    }
  }
}
