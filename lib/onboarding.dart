import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:snack/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcoome to my app',
          body: 'This is the first page',
          image: Image.asset('image/onboarding_image_01.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcoome to my app',
          body: 'This is the second page',
          image: Image.asset('image/onboarding_image_02.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcoome to my app',
          body: 'This is the third page',
          image: Image.asset('image/onboarding_image_03.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('done'),
      onDone: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MyPage()),
        );
      },
      next: const Text(
        '다음',
      ),
      baseBtnStyle: TextButton.styleFrom(
        backgroundColor: const Color(0xffF96714),
        foregroundColor: Colors.white,
      ),
      showSkipButton: true,
      isTopSafeArea: true,
      isBottomSafeArea: true,
      globalBackgroundColor: Colors.white,
      skip: const Text('skip'),
      nextFlex: 1,
      dotsFlex: 3,
      skipOrBackFlex: 1,
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imageAlignment: Alignment.center,
      imageFlex: 4,
      bodyFlex: 1,
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      imagePadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      pageColor: Colors.white,
    );
  }
}
