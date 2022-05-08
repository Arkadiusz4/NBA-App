import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black87.withOpacity(0.1),
              Colors.black,
            ],
          ),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboarding3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Align(
        alignment: const Alignment(-1, 0.5),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 20),
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText(
                  'Do you love basketball?',
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      overflow: TextOverflow.clip),
                  duration: const Duration(seconds: 3),
                ),
                RotateAnimatedText(
                  'Are you a huge fan of NBA?',
                  textStyle: const TextStyle(color: Colors.white, fontSize: 35),
                  duration: const Duration(seconds: 3),
                ),
                RotateAnimatedText(
                  'This app is exactly for you!',
                  textStyle: const TextStyle(color: Colors.white, fontSize: 35),
                  duration: const Duration(seconds: 3),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
