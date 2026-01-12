public class Calculator {
    public double calculateHandSpeed(RhythmType rhythm1, RhythmType rhythm2, double initalBpm){

        if (rhythm1 == null) {
            throw new IllegalArgumentException("Can't have null rhythm");
        }else if (rhythm2 == null) {
            throw new IllegalArgumentException("Can't have null rhythm");
        }        

        double newBPM;
        double desiredRhythm = rhythm1.getDuration();
        double actualRhythm = rhythm2.getDuration();

        if (initalBpm <= 0) {
            throw new IllegalArgumentException("Invalid BPM, choose a larger bpm");
        }else if (Double.isInfinite(initalBpm)) {
            throw new IllegalArgumentException("Invalid BPM, choose a smaller BPM");
        }

        newBPM = initalBpm * (actualRhythm / desiredRhythm);

        if (Double.isInfinite(newBPM)) {
            throw new IllegalArgumentException("New BPM too large");
        }else{
            return newBPM;
        }
    }
}
