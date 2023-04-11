import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
      },
      child: Card(
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/test_img.jpg'),
                    colorFilter: pressed
                        ? ColorFilter.mode(
                            Colors.red.withOpacity(0.7), BlendMode.overlay)
                        : null),
              ),
            ),
            Visibility(
              visible: pressed,
              child: Icon(
                Icons.check,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
