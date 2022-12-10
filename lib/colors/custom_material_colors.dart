import 'package:flutter/material.dart';

class CustomMaterialColor {
  final Color _color;
  late int _r;
  late int _g;
  late int _b;

  CustomMaterialColor(this._color) {
    _r = _color.red;
    _b = _color.blue;
    _g = _color.green;
  }

  MaterialColor get color {
    final Map<int, Color> colorMap = {
      50: Color.fromRGBO(_r, _g, _b, .1),
      100: Color.fromRGBO(_r, _g, _b, .2),
      200: Color.fromRGBO(_r, _g, _b, .3),
      300: Color.fromRGBO(_r, _g, _b, .4),
      400: Color.fromRGBO(_r, _g, _b, .5),
      500: Color.fromRGBO(_r, _g, _b, .6),
      600: Color.fromRGBO(_r, _g, _b, .7),
      700: Color.fromRGBO(_r, _g, _b, .8),
      800: Color.fromRGBO(_r, _g, _b, .9),
      900: Color.fromRGBO(_r, _g, _b, 1),
    };

    return MaterialColor(_color.value, colorMap);
  }
}