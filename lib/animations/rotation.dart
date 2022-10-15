import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    final _curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);

    _animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(_curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            switch (status) {
              case AnimationStatus.completed:
                _animationController.reverse();
                break;
              case AnimationStatus.dismissed:
                _animationController.forward();
                break;
              default:
            }
          });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Transform.rotate(
            angle: _animation.value,
            child: const Center(
              child: Material(
                shape: CircleBorder(side: BorderSide.none),
                elevation: 50,
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/test_img.jpg'),
                  radius: 130,
                ),
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
