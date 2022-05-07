import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nba_app/screens/home_screen.dart';
import 'package:nba_app/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/intro.gif',
      fit: BoxFit.cover,
    );
  }
}
