import 'package:get/get.dart';
import 'package:onbording_screens/core/utils/constants/assets_path.dart';
import 'package:onbording_screens/core/utils/constants/strings.dart';
import 'package:onbording_screens/features/on_borading_page/model/onboarding_model.dart';

class OnBoardingController extends GetxController {
  final List<OnBoardingModel> pages = [
    OnBoardingModel(heading: firstHeading, text: firstText, image: firstImage),
    OnBoardingModel(
        heading: secondHeading, text: secondText, image: secondImage),
    OnBoardingModel(heading: thirdHeading, text: thirdText, image: thirdImage),
  ];

  var currentIndex = 0.obs;
  var shouldResetAnimation = true;

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      currentIndex++;
      shouldResetAnimation = true;
    } else {
      shouldResetAnimation = false;
      Get.snackbar(
        snackHeading,
        snackText,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }
}
