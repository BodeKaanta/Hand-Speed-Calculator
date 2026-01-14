import 'package:flutter/material.dart';
import '../widgets/bpm_input.dart';
import '../logic/calculator.dart';
import '../logic/rhythm_type.dart';

class HandSpeedCalculatorPage extends StatefulWidget {
  const HandSpeedCalculatorPage({Key? key}) : super(key: key);

  @override
  State<HandSpeedCalculatorPage> createState() =>
    _HandSpeedCalculatorPageState();
  
}

class _HandSpeedCalculatorPageState
  extends State<HandSpeedCalculatorPage> {

    double _initalBpm = 120.0;
    RhythmType actualRhythm = RhythmType.QUARTER_NOTE;
    RhythmType desiredRhythm = RhythmType.SIXTEENTH_NOTE;
    double? _resultBpm;

    final Calculator _calculator = Calculator();

    void _calculate() {
      setState(() {
        _resultBpm = _calculator.calculateHandSpeed(desiredRhythm, actualRhythm , _initalBpm);
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hand Speed Calculator'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BpmInput(bpm: _initalBpm,
              onChanged: (value) {
                setState(() {
                  _initalBpm = value;
                });
              }
              )
            ]
          ),
        )
      );
    }
  }
