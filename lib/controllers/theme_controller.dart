import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController {
  static final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(
    _defaultTheme,
  );

  static const _primaryKey = 'primaryColor';
  static const _secondaryKey = 'secondaryColor';

  static Color _defaultPrimary = const Color.fromRGBO(155, 59, 218, 1);
  static Color _defaultSecondary = const Color.fromRGBO(240, 241, 245, 1);

  static ThemeData get _defaultTheme => ThemeData(
    primaryColor: _defaultPrimary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _defaultPrimary,
      secondary: _defaultSecondary,
    ),
    useMaterial3: true,
  );

  static Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final primaryValue = prefs.getInt(_primaryKey);
    final secondaryValue = prefs.getInt(_secondaryKey);

    final primaryColor =
        primaryValue != null ? Color(primaryValue) : _defaultPrimary;
    final secondaryColor =
        secondaryValue != null ? Color(secondaryValue) : _defaultSecondary;

    _updateTheme(primaryColor, secondaryColor);
  }

  static void updateColors(Color primary, Color secondary) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_primaryKey, primary.value);
    await prefs.setInt(_secondaryKey, secondary.value);
    _updateTheme(primary, secondary);
  }

  static void _updateTheme(Color primary, Color secondary) {
    themeNotifier.value = ThemeData(
      primaryColor: primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        secondary: secondary,
      ),
      useMaterial3: true,
    );
  }
}
