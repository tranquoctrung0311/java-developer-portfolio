package Process;

/**
 *
 * @author acer
 */
public class Register {

    private int APPLICANTNO;
    private String APPLICANTNAME, POSITIONNAME;

    public Register() {
    }

    public Register(int APPLICANTNO, String APPLICANTNAME, String POSITIONNAME) {
        this.APPLICANTNO = APPLICANTNO;
        this.APPLICANTNAME = APPLICANTNAME;
        this.POSITIONNAME = POSITIONNAME;
    }

    public int getAPPLICANTNO() {
        return APPLICANTNO;
    }

    public void setAPPLICANTNO(int APPLICANTNO) {
        this.APPLICANTNO = APPLICANTNO;
    }

    public String getAPPLICANTNAME() {
        return APPLICANTNAME;
    }

    public void setAPPLICANTNAME(String APPLICANTNAME) {
        this.APPLICANTNAME = APPLICANTNAME;
    }

    public String getPOSITIONNAME() {
        return POSITIONNAME;
    }

    public void setPOSITIONNAME(String POSITIONNAME) {
        this.POSITIONNAME = POSITIONNAME;
    }
}
