import 'package:flutter/material.dart';
import 'package:nba_app/screens/intro_screens/intro_screens1.dart';
import 'package:nba_app/screens/intro_screens/intro_screens2.dart';
import 'package:nba_app/screens/intro_screens/intro_screens3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Key? key;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroScreen1(
                key: key,
              ),
              IntroScreen2(
                key: key,
              ),
              IntroScreen3(
                key: key,
              ),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3)),
        ],
      ),
    );
  }
}
