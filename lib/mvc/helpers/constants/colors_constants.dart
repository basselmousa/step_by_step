import 'package:flutter/material.dart';

class ColorConstants {
  /// The Color That used In All App
  static const Color COLOR_White = Colors.white;
  static const Color COLOR_Red = Colors.red;
  static const Color COLOR_Black = Colors.black;
  static const Color COLOR_Black54 = Colors.black54;
  static const Color COLOR_Blue = Colors.blue;

  static Map<String, Color> statusColors = {
    'pending' : Colors.orange,
    'success' : Colors.green,
    'declined' : COLOR_Red
};
}
