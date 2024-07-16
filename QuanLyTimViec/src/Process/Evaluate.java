package Process;

/**
 *
 * @author acer
 */
public class Evaluate {

    private int MARK;
    private String COMMENT;

    public Evaluate() {
    }

    public Evaluate(int MARK, String COMMENT) {
        this.MARK = MARK;
        this.COMMENT = COMMENT;
    }

    public int getMARK() {
        return MARK;
    }

    public void setMARK(int MARK) {
        this.MARK = MARK;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT;
    }
}
