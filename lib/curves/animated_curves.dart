import 'package:flutter/material.dart';
//TODO

class AnimatedCurves extends StatelessWidget {
  const AnimatedCurves({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: RPSCustomPainter(),
          ),
          // bottom: AppBar(),
          //  ClipPath(
          //   clipper: RPSCustomClipper(),
          //   child: Container(
          //     width: double.infinity,
          //     height: 600,
          //     color: Colors.purpleAccent,
          //   ),
          // ),
          ),
      
    );
  }
}

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path0 = Path();

    path0.moveTo(size.width * 0.6674000, size.height * 0.2857143);
    path0.quadraticBezierTo(size.width * 0.4168500, size.height * 0.2857143,
        size.width * 0.3333333, size.height * 0.2857143);
    path0.quadraticBezierTo(size.width * 0.3333333, size.height * 0.6071429,
        size.width * 0.3333333, size.height * 0.7142857);
    path0.cubicTo(
        size.width * 0.4166667,
        size.height * 0.5714286,
        size.width * 0.5833333,
        size.height * 0.8571429,
        size.width * 0.6666667,
        size.height * 0.7142857);
    path0.cubicTo(
        size.width * 0.6668500,
        size.height * 0.6071429,
        size.width * 0.6668500,
        size.height * 0.6071429,
        size.width * 0.6674000,
        size.height * 0.2857143);
    path0.close();

    return path0;
    // canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.quadraticBezierTo(size.width,size.height*0.5892857,size.width,size.height*0.7857143);
    path0.cubicTo(size.width*0.7513917,size.height*1.0000429,size.width*0.2500000,size.height*0.5713857,0,size.height*0.7857143);
    path0.quadraticBezierTo(0,size.height*0.5892857,0,0);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
