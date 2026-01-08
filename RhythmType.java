public enum RhythmType {
    DOT(2),
    WHOLE_NOTE(4.0),
    HALF_NOTE(2),
    EIGHTH_NOTE_FIVELET(2/5),
    QUARTER_NOTE_TRIPLET(2/3),
    NINELET(2/9),
    QUARTER_NOTE(1),
    EIGHTH_NOTE(1/2),
    EIHTH_NOTE_TRIPLET(1/3),
    SIXTEENTH_NOTE(1/4),
    SIXTEENTH_NOTE_FIVELET(1/5),
    SIXLET(1/6),
    SEVENLET(1/7),
    THIRTYSECOND_NOTE(1/8),
    EIGHTH_NOTE_NINELET(1/9),
    TENLET(1/10);

    private final double duration;

    private RhythmType(double duration) {
        this.duration = duration;
    }

    public double getDuration(){
        return this.duration;
    }
}
