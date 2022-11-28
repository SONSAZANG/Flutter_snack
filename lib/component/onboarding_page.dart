import 'package:flutter/material.dart';
import 'package:snack/component/rounded_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo})
      : super(key: key);

  final Image image;

  final String title;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: image,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: !isLastScreen,
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 25,
                      child: RoundedButton(
                        title: "시작하기",
                        onPressed: () {
                          openLoginScreen(context);
                        },
                      ),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(
                    //   width: 70,
                    //   height: 25,
                    //   child: RoundedButton(
                    //     title: "Skip",
                    //     onPressed: () {
                    //       openHomeScreen(context);
                    //     },
                    //   ),
                    // ),
                    // Row(
                    //   children: [
                    //     for (int index = 0; index < noOfScreen; index++)
                    //       createProgressDots(
                    //           (index == currentScreenNo) ? true : false)
                    //   ],
                    // ),
                    SizedBox(
                      width: 70,
                      height: 25,
                      child: RoundedButton(
                        title: "다음",
                        onPressed: () {
                          onNextPressed(currentScreenNo + 1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createProgressDots(bool isActiveScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: isActiveScreen ? 10 : 5,
      width: isActiveScreen ? 10 : 5,
      decoration: BoxDecoration(
          color: isActiveScreen ? Colors.deepOrange : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void openHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  void openLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
}
