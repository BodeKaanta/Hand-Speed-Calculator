import 'package:flutter/material.dart';
import 'pages/hand_speed_calculator_page.dart';

void main() {
  runApp(const HandSpeedCalculator ());
}

class HandSpeedCalculator extends StatefulWidget {
  const HandSpeedCalculator({super.key});

  @override
  State<HandSpeedCalculator> createState() =>
    _HandSpeedCalculatorState();
}

class _HandSpeedCalculatorState extends State<HandSpeedCalculator> {
  ThemeMode _themeMode = ThemeMode.light;


  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark: ThemeMode.light;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HandSpeedCalculatorPage(
        onThemeChanged: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}