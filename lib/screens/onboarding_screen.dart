import 'package:flutter/material.dart';
import 'package:snack/component/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage(
            image: Image.asset(
              'image/onboarding_image_01.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            title: "",
            description: "이번 주말 답답한 공간을 벗어나 새로운 공간을 찾아 떠나고 싶으신가요?",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: Image.asset(
              'image/onboarding_image_02.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            title: "",
            description: "새로운 브랜드를 통해 좋은 아이템들을 얻고 싶으신가요?",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          OnboardingPage(
            image: Image.asset(
              'image/onboarding_image_03.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            title: "",
            description: "새로운 트렌드 항목들을 계속해서 얻고 싶으신가요?",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
        ],
      ),
    );
  }

  void changeScreen(int nextScreenNo) {
    controller.animateToPage(
      nextScreenNo,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
