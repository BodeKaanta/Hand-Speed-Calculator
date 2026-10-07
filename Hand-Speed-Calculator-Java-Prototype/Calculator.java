public class Calculator {
    public double calculateHandSpeed(RhythmType rhythm1, RhythmType rhythm2, double initialBpm){

        if (rhythm1 == null) {
            throw new IllegalArgumentException("Can't have null rhythm");
        }else if (rhythm2 == null) {
            throw new IllegalArgumentException("Can't have null rhythm");
        }        

        double newBPM;
        double desiredRhythm = rhythm1.getDuration();
        double actualRhythm = rhythm2.getDuration();

        if (initialBpm <= 0) {
            throw new IllegalArgumentException("Invalid BPM, choose a larger bpm");
        }else if (Double.isInfinite(initialBpm)) {
            throw new IllegalArgumentException("Invalid BPM, choose a smaller BPM");
        }

        newBPM = initialBpm * (actualRhythm / desiredRhythm);

        if (Double.isInfinite(newBPM)) {
            throw new IllegalArgumentException("New BPM too large");
        }else{
            return newBPM;
        }
    }
}
