public class Calculator {
    public double calculateHandSpeed(RhythmType rhythm1, RhythmType rhythm2, double initalBpm){
        double newBPM;
        double desiredRhythm = rhythm1.getDuration();
        double actualRhythm = rhythm2.getDuration();

        newBPM = initalBpm * (actualRhythm / desiredRhythm);

        return newBPM;
    }
}
