package Process;

/**
 *
 * @author acer
 */
public class Position {

    private int POSITIONNO;
    private String POSITIONNAME;

    public Position() {
    }

    public Position(int POSITIONNO, String POSITIONNAME) {
        this.POSITIONNO = POSITIONNO;
        this.POSITIONNAME = POSITIONNAME;
    }

    public int getPOSITIONNO() {
        return POSITIONNO;
    }

    public void setPOSITIONNO(int POSITIONNO) {
        this.POSITIONNO = POSITIONNO;
    }

    public String getPOSITIONNAME() {
        return POSITIONNAME;
    }

    public void setPOSITIONNAME(String POSITIONNAME) {
        this.POSITIONNAME = POSITIONNAME;
    }
}
