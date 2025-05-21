import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<ThemeData> themeNotifier = ValueNotifier(_defaultTheme);

const _primaryKey = 'primaryColor';
const _secondaryKey = 'secondaryColor';

Color _defaultPrimary = const Color.fromRGBO(155, 59, 218, 1);
Color _defaultSecondary = const Color.fromRGBO(240, 241, 245, 1);

ThemeData get _defaultTheme => ThemeData(
  primaryColor: _defaultPrimary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _defaultPrimary,
    secondary: _defaultSecondary,
  ),
  useMaterial3: true,
);

Future<void> loadTheme() async {
  final prefs = await SharedPreferences.getInstance();
  final primaryValue = prefs.getInt(_primaryKey);
  final secondaryValue = prefs.getInt(_secondaryKey);

  final primaryColor =
      primaryValue != null ? Color(primaryValue) : _defaultPrimary;
  final secondaryColor =
      secondaryValue != null ? Color(secondaryValue) : _defaultSecondary;

  updateTheme(primaryColor, secondaryColor);
}

Future<void> updateColors(Color primary, Color secondary) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(_primaryKey, primary.value);
  await prefs.setInt(_secondaryKey, secondary.value);
  updateTheme(primary, secondary);
}

Future<void> updateTheme(Color primary, Color secondary) async {
  themeNotifier.value = ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, secondary: secondary),
    useMaterial3: true,
  );
}

Future<void> saveColor(String key, Color color) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, color.value);
}

Future<Color> loadColor(String key, {required Color defaultColor}) async {
  final prefs = await SharedPreferences.getInstance();
  final colorValue = prefs.getInt(key);
  return colorValue != null ? Color(colorValue) : defaultColor;
}
