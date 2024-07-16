package Process;

/**
 *
 * @author acer
 */
public class SecondPair {

    private Position pos;
    private int NUMBEROFPERSONNEL;

    public SecondPair() {
    }

    public SecondPair(Position pos, int NUMBEROFPERSONNEL) {
        this.pos = pos;
        this.NUMBEROFPERSONNEL = NUMBEROFPERSONNEL;
    }

    public Position getPos() {
        return pos;
    }

    public void setPos(Position pos) {
        this.pos = pos;
    }

    public int getNUMBEROFPERSONNEL() {
        return NUMBEROFPERSONNEL;
    }

    public void setNUMBEROFPERSONNEL(int NUMBEROFPERSONNEL) {
        this.NUMBEROFPERSONNEL = NUMBEROFPERSONNEL;
    }
}
