import 'package:flutter/material.dart';
import 'package:nubank/controllers/theme_controller.dart';
import 'package:nubank/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.loadTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          title: 'Nubank',
          theme: theme,
          home: const HomePage(),
        );
      },
    );
  }
}
