package Process;

/**
 *
 * @author acer
 */
public class Complete {

    private int APPLICANTNO, INTERVIEWSCHEDULENO;
    private String APPLICANTNAME, PHONENUMBER, GMAIL, POSITIONNAME;

    public Complete() {
    }

    public Complete(int APPLICANTNO, int INTERVIEWSCHEDULENO, String APPLICANTNAME, String PHONENUMBER, String GMAIL, String POSITIONNAME) {
        this.APPLICANTNO = APPLICANTNO;
        this.INTERVIEWSCHEDULENO = INTERVIEWSCHEDULENO;
        this.APPLICANTNAME = APPLICANTNAME;
        this.PHONENUMBER = PHONENUMBER;
        this.GMAIL = GMAIL;
        this.POSITIONNAME = POSITIONNAME;
    }

    public int getAPPLICANTNO() {
        return APPLICANTNO;
    }

    public void setAPPLICANTNO(int APPLICANTNO) {
        this.APPLICANTNO = APPLICANTNO;
    }

    public int getINTERVIEWSCHEDULENO() {
        return INTERVIEWSCHEDULENO;
    }

    public void setINTERVIEWSCHEDULENO(int INTERVIEWSCHEDULENO) {
        this.INTERVIEWSCHEDULENO = INTERVIEWSCHEDULENO;
    }

    public String getAPPLICANTNAME() {
        return APPLICANTNAME;
    }

    public void setAPPLICANTNAME(String APPLICANTNAME) {
        this.APPLICANTNAME = APPLICANTNAME;
    }

    public String getPHONENUMBER() {
        return PHONENUMBER;
    }

    public void setPHONENUMBER(String PHONENUMBER) {
        this.PHONENUMBER = PHONENUMBER;
    }

    public String getGMAIL() {
        return GMAIL;
    }

    public void setGMAIL(String GMAIL) {
        this.GMAIL = GMAIL;
    }

    public String getPOSITIONNAME() {
        return POSITIONNAME;
    }

    public void setPOSITIONNAME(String POSITIONNAME) {
        this.POSITIONNAME = POSITIONNAME;
    }
}
