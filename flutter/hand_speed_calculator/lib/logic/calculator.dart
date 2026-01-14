import 'package:hand_speed_calculator/logic/rhythm_type.dart';

class Calculator {
  double calculateHandSpeed(RhythmType desiredRhythmParameter, RhythmType actualRhythmParameter, double initalBpm){
    final double newBPM;
    double desiredRhythm = desiredRhythmParameter.duration;
    double actualRhythm = actualRhythmParameter.duration;

    if (initalBpm <= 0) {
      throw ArgumentError("Invalid BPM, choose a larger bpm");
    }else if (initalBpm.isInfinite) {
      throw ArgumentError("Invalid BPM, choose a smaller BPM");
    }

    newBPM = initalBpm * (actualRhythm / desiredRhythm);

    if (newBPM.isInfinite) {
      throw ArgumentError("New BPM too large");
    }else if (newBPM <= 0) {
      throw ArgumentError("New bpm is less than 0");
    }else {
      return newBPM;
    }
  }
}
