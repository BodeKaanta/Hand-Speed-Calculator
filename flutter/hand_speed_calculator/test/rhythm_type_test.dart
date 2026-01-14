import 'package:flutter_test/flutter_test.dart';
import 'package:hand_speed_calculator/logic/rhythm_type.dart';

void main() {
  group('RhythmType durations', () {
    test('Quarter note duration is 1.0', () {
      expect(RhythmType.QUARTER_NOTE.duration, 1.0);
    });

    test('Half note duration is 2.0', () {
      expect(RhythmType.HALF_NOTE.duration, 2.0);
    });

    test('Sixteenth note duration is 0.25', () {
      expect(RhythmType.SIXTEENTH_NOTE.duration, 0.25);
    });

    test('Fivelet duration is correct', () {
      expect(RhythmType.SIXTEENTH_NOTE_FIVELET.duration, 0.2);
    });

    test('Triplet duration is correct', () {
      expect(RhythmType.QUARTER_NOTE_TRIPLET.duration, closeTo(2.0 / 3.0, 0.0001));
    });
  });
}
