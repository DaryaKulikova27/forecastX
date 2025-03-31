// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color green = Color.fromRGBO(61, 220, 151, 1);
  static const Color green08 = Color.fromRGBO(61, 220, 151, 0.08);
  static const Color green04 = Color.fromRGBO(61, 220, 151, 0.04);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color white08 = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color white04 = Color.fromRGBO(251, 251, 251, 0.04);
  static const Color white02 = Color.fromRGBO(251, 251, 251, 0.02);
  static const Color grey = Color.fromRGBO(255, 255, 255, 0.64);
  static const Color red = Color.fromRGBO(236, 89, 89, 1);
  static const Color black = Color.fromRGBO(4, 5, 10, 1);
  static const Color light_black = Color.fromRGBO(11, 14, 18, 1);
  static const Color dark = Color.fromRGBO(16, 19, 28, 0.96);
  static const Color primacy = Color.fromRGBO(114, 248, 59, 1);
  static const Color primacy012 = Color.fromRGBO(114, 248, 59, 0.12);
}

extension HexColor on Color {
  static Color? fromHex(String? hexString) {
    if (hexString == null) return null;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    final colorInt = int.tryParse(buffer.toString(), radix: 16);
    if (colorInt == null) return null;
    return Color(colorInt);
  }
}
