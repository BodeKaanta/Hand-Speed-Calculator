enum RhythmType {
  DOT(1.5),
  WHOLE_NOTE(4.0),
  HALF_NOTE(2.0),
  EIGHTH_NOTE_FIVELET(2.0/5.0),
  QUARTER_NOTE_TRIPLET(2.0/3.0),
  NINELET(2.0/9.0),
  QUARTER_NOTE(1.0),
  EIGHTH_NOTE(1.0/2.0),
  EIHTH_NOTE_TRIPLET(1.0/3.0),
  SIXTEENTH_NOTE(1.0/4.0),
  SIXTEENTH_NOTE_FIVELET(1.0/5.0),
  SIXLET(1.0/6.0),
  SEVENLET(1.0/7.0),
  THIRTYSECOND_NOTE(1.0/8.0),
  EIGHTH_NOTE_NINELET(1.0/9.0),
  TENLET(1.0/10.0);

  final double _duration;

  const RhythmType(this._duration);

  double get getDuration => _duration;
}

