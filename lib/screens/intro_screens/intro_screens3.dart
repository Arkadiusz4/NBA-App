import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              image: AssetImage('assets/onboarding2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-1, 0.9),
          child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Do you want to try?',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                        overflow: TextOverflow.clip),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Press the button to register.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        overflow: TextOverflow.clip),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
