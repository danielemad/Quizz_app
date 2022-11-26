import "package:flutter/material.dart";
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:quizz_app/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/logo.png"),
      title: const Text(
        "Quizz App",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      gradientBackground: const LinearGradient(
        begin: Alignment.topLeft,
        end:  Alignment.bottomRight,
        colors: <Color>[
          Color.fromARGB(255, 0, 121, 220),
          Color.fromARGB(255, 33, 129, 255)
        ]
      ),
      showLoader: true,
      navigator: HomeScreen(),
      durationInSeconds: 5,
    );
  }
}
