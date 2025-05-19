import 'package:flutter/material.dart';

class ThemeNotifier extends ValueNotifier<ThemeData> {
  ThemeNotifier(ThemeData theme) : super(theme);

  void updateTheme({
    required Color primaryColor,
    required Color secondaryColor,
  }) {
    value = ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        secondary: secondaryColor,
      ),
      useMaterial3: true,
    );
  }
}
