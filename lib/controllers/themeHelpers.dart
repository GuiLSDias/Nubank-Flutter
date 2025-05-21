// theme_helper.dart
import 'package:flutter/material.dart';
import 'package:nubank/controllers/theme_controller.dart';
import 'package:nubank/pages/home/model/ConfigurationAccount.dart';

class ThemeHelper {
  static Future<Color> getPrimaryColor() async {
    return await loadColor('primaryColor', defaultColor: backgroundColor);
  }

  static Future<Color> getSecondaryColor() async {
    return await loadColor('secondaryColor', defaultColor: secondaryColor);
  }
}
