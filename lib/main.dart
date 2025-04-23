import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MindRippleApp());
}

class MindRippleApp extends StatelessWidget {
  const MindRippleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindRipple',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
