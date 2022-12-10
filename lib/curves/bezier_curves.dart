import 'package:flutter/material.dart';

class CurvesScreen extends StatelessWidget {
  const CurvesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppbarCurves(),
    );
  }
}

class AppbarCurves extends StatelessWidget {
  const AppbarCurves({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppbarClipper(),
      child: Container(
        width: double.infinity,
        // height: 200,
        color: Colors.deepPurple,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    var firstControlPoint = Offset(size.width / 5, size.height * 2 / 3);
    var firstEndPoint = Offset(size.width / 2, size.height * 5 / 6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 4 / 5, size.height );
    var secondEndPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AppbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 5/7);

    var firstControlPoint = Offset(size.width * .7/ 6, size.height * 5.2 / 7);
    var firstEndPoint = Offset(size.width * 1.1/6, size.height * 6 / 7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 1.8 / 6, size.height*1.1);
    var secondEndPoint = Offset(size.width * 2.64/6, size.height *  6.2/7);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 3.1 / 6, size.height* 5.5/7);
    var thirdEndPoint = Offset(size.width * 3.6/6, size.height *  6.2/7);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width * 4.8 / 6, size.height* 1.1);
    var fourthEndPoint = Offset(size.width, size.height*.91);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

