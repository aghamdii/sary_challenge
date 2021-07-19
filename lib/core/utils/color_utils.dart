import 'package:flutter/painting.dart';

class ColorUtility {
  // This function job is to help you use the color stored in hex form
  static Color color(String color) {
    if (color.contains("#")) color = color.replaceAll("#", "");
    return Color(int.parse('0XFF$color'));
  }
}
