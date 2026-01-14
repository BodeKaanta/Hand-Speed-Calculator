import 'package:flutter_test/flutter_test.dart';
import 'package:hand_speed_calculator/logic/calculator.dart';
import 'package:hand_speed_calculator/logic/rhythm_type.dart';

void main() {
  final calculator = Calculator();

  group('Calculator BPM conversion', () {
    test('176 BPM fivelets to sixteenth notes equals 220 BPM', () {
      final result = calculator.calculateHandSpeed(
        RhythmType.SIXTEENTH_NOTE_FIVELET,
        RhythmType.SIXTEENTH_NOTE,
        176,
      );

      expect(result, closeTo(220.0, 0.0001));
    });

    test('Quarter notes to eighth notes doubles BPM', () {
      final result = calculator.calculateHandSpeed(
        RhythmType.EIGHTH_NOTE,
        RhythmType.QUARTER_NOTE,
        120,
      );

      expect(result, 240);
    });

        test('Sixlets at 240 to triplets', () {
      final result = calculator.calculateHandSpeed(
        RhythmType.SIXLET,
        RhythmType.EIHTH_NOTE_TRIPLET,
        240,
      );

      expect(result, 480);
    });

            test('Seven let to 16th notes at 76', () {
      final result = calculator.calculateHandSpeed(
        RhythmType.SEVENLET,
        RhythmType.SIXTEENTH_NOTE,
        76,
      );

      expect(result, 133);
    });

    test('Invalid BPM throws error', () {
      expect(
        () => calculator.calculateHandSpeed(
          RhythmType.QUARTER_NOTE,
          RhythmType.EIGHTH_NOTE,
          0,
        ),
        throwsArgumentError,
      );
    });
  });
}
