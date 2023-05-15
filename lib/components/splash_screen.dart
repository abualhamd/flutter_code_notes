import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../app/config/routes_manager.dart';
import '../../app/utils/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    });
    return SafeArea(
        child: Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Animate(
          effects: [
            FadeEffect(duration: Duration(seconds: 3), curve: Curves.easeIn)
          ],
          child: Image.asset(
            ImagesManager.dopamineBlue,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ));
  }
}
