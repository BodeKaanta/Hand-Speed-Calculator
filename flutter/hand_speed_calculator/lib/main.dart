import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/hand_speed_calculator_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('darkMode') ?? false;

  runApp(HandSpeedCalculator(isDarkMode: isDark));
}

class HandSpeedCalculator extends StatefulWidget {
  final bool isDarkMode;
  
  const HandSpeedCalculator({super.key, required this.isDarkMode});

  @override
  State<HandSpeedCalculator> createState() =>
    _HandSpeedCalculatorState();
}

class _HandSpeedCalculatorState extends State<HandSpeedCalculator> {
  late ThemeMode _themeMode;

  @override
  void initState(){
    super.initState();
    _themeMode = widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDark);

    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
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
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}