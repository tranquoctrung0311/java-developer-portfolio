package Process;

/**
 *
 * @author acer
 */
public class FirstPair {

    private InterviewSchedule is;
    private Position p;

    public FirstPair() {
    }

    public FirstPair(InterviewSchedule is, Position p) {
        this.is = is;
        this.p = p;
    }

    public InterviewSchedule getIs() {
        return is;
    }

    public void setIs(InterviewSchedule is) {
        this.is = is;
    }

    public Position getP() {
        return p;
    }

    public void setP(Position p) {
        this.p = p;
    }
}
