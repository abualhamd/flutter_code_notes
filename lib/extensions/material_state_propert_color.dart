import 'package:flutter/material.dart';

extension GetMaterialStateProperty on Color {
  get getMaterialPropertyColor => MaterialStatePropertyAll(this);
}