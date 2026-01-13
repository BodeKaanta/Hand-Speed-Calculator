public class Main{
    
    public static void main(String[] args){
        Calculator calc = new Calculator();
        RhythmType sixteenthNote = RhythmType.SIXTEENTH_NOTE;
        RhythmType fivelet = RhythmType.SIXTEENTH_NOTE_FIVELET;
        System.out.println("this should output 220: " + calc.calculateHandSpeed(fivelet, sixteenthNote, 176));
    }
}
