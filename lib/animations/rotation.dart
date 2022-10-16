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

    final curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);

    _animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          // ..addListener(() {
          //   setState(() {});
          // })
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
        body: RotatingTransition(
          angleAnimation: _animation,
          child: const TestImage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class RotatingTransition extends StatelessWidget {
  const RotatingTransition(
      {super.key, required this.angleAnimation, required this.child});

  final Animation<double> angleAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angleAnimation,
      builder: ((context, child) {
        return Transform.rotate(
          angle: angleAnimation.value,
          child: child,
        );
      }),
      child: child,
    );
  }
}

class TestImage extends StatelessWidget {
  //AnimatedWidget {
  const TestImage({super.key}); //, required Animation<double> animation})
  // : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // final animation = super.listenable as Animation<double>;
    return
        // Transform.rotate(
        //   angle: animation.value,
        //   child: const
        const Center(
      child: Material(
        shape: CircleBorder(side: BorderSide.none),
        elevation: 50,
        child: CircleAvatar(
          foregroundImage: AssetImage('assets/test_img.jpg'),
          radius: 130,
        ),
      ),
    );
    // );
  }
}
