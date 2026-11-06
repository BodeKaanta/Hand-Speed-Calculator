import 'package:hand_speed_calculator/logic/rhythm_type.dart';

class Calculator {
  double calculateHandSpeed(
    RhythmType desiredRhythmParameter,
    RhythmType actualRhythmParameter,
    double initialBpm, {
    bool desiredDotted = false,
    bool actualDotted = false,
  }) {
    final double newBPM;
    double desiredRhythm = desiredRhythmParameter.durationWithDot(desiredDotted);
    double actualRhythm = actualRhythmParameter.durationWithDot(actualDotted);

    if (initialBpm <= 0) {
      throw ArgumentError("Invalid BPM, choose a larger bpm");
    }else if (initialBpm.isInfinite) {
      throw ArgumentError("Invalid BPM, choose a smaller BPM");
    }

    newBPM = initialBpm * (actualRhythm / desiredRhythm);

    if (newBPM.isInfinite) {
      throw ArgumentError("New BPM too large");
    }else if (newBPM <= 0) {
      throw ArgumentError("New bpm is less than 0");
    }else {
      return newBPM;
    }
  }
}
