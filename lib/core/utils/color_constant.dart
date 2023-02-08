import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA70000 = fromHex('#00ffffff');

  static Color gray400 = fromHex('#bebebe');

  static Color black9002b = fromHex('#2b000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color redA200 = fromHex('#ff576d');

  static Color gray800 = fromHex('#505050');

  static Color redA400 = fromHex('#ff2744');

  static Color red300 = fromHex('#f8766e');

  static Color gray200 = fromHex('#f0f0f0');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50 = fromHex('#fafafa');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
