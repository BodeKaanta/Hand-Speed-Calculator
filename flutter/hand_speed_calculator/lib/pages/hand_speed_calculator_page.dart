import 'package:flutter/material.dart';
import 'package:hand_speed_calculator/widgets/result_display.dart';
import 'package:hand_speed_calculator/widgets/rhythm_dropdown.dart';
import '../widgets/bpm_input.dart';
import '../logic/calculator.dart';
import '../logic/rhythm_type.dart';

class HandSpeedCalculatorPage extends StatefulWidget {
  const HandSpeedCalculatorPage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
   }) : super(key: key);

  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  @override
  State<HandSpeedCalculatorPage> createState() =>
    _HandSpeedCalculatorPageState();
  
}

class _HandSpeedCalculatorPageState extends State<HandSpeedCalculatorPage> {
    double _initalBpm = 120.0;
    RhythmType _actualRhythm = RhythmType.QUARTER_NOTE;
    RhythmType _desiredRhythm = RhythmType.SIXTEENTH_NOTE;
    double? _resultBpm;

    final Calculator _calculator = Calculator();

    void _calculate() {
      setState(() {
        _resultBpm = _calculator.calculateHandSpeed(_actualRhythm, _desiredRhythm, _initalBpm);
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hand Speed Calculator'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text('Settings'),
                ),
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: widget.isDarkMode,
                  onChanged: widget.onThemeChanged,
                  ),
            ],
          )
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              BpmInput(bpm: _initalBpm, 
              onChanged: (value) {
                setState(() {
                  _initalBpm = value;
                });
              }),
              const SizedBox(height: 24),

              RhythmDropdown(
                label: 'Starting Rhythm',
                value: _actualRhythm,
                onChanged: (rhythm) {
                  setState(() {
                    _actualRhythm = rhythm;
                  });
                }
              ),
              const SizedBox(height: 24),

              RhythmDropdown(label: 'Target Rhythm',
              value: _desiredRhythm,
              onChanged: (rhythm){
                setState(() {
                  _desiredRhythm = rhythm;
                });
              }),

              const SizedBox(height: 32),

              ElevatedButton(onPressed: _calculate,
              child: const Text('Calculate'),
              ),

              const SizedBox(height: 32),

              ResultDisplay(resultBpm: _resultBpm),
            ],
          ),
        )
      );
    }
  }
