import 'package:flutter/material.dart';

void main() {
  runApp(const HandSpeedCalculator ());
}

class HandSpeedCalculator extends StatelessWidget {
  const HandSpeedCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text('Hand Speed Calculator')
        ),
        body: Center(
          child: Text('BPM goes here')
        ),
      )
    );
  }
}