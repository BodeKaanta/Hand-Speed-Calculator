import 'package:flutter/material.dart';
import 'pages/hand_speed_calculator_page.dart';

void main() {
  runApp(const HandSpeedCalculator ());
}

class HandSpeedCalculator extends StatelessWidget {
  const HandSpeedCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HandSpeedCalculatorPage(),
    );
  }
}