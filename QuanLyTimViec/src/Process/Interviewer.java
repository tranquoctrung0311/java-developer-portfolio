package Process;

/**
 *
 * @author acer
 */
public class Interviewer {

    private int INTERVIEWERNO, COMPANYNO, ACCOUNTID;
    private String INTERVIEWERNAME, PHONENUMBER, GMAIL;

    public Interviewer() {
    }

    public Interviewer(int INTERVIEWERNO, int COMPANYNO, int ACCOUNTID,
            String INTERVIEWERNAME, String PHONENUMBER, String GMAIL) {
        this.INTERVIEWERNO = INTERVIEWERNO;
        this.COMPANYNO = COMPANYNO;
        this.ACCOUNTID = ACCOUNTID;
        this.INTERVIEWERNAME = INTERVIEWERNAME;
        this.PHONENUMBER = PHONENUMBER;
        this.GMAIL = GMAIL;
    }

    public int getINTERVIEWERNO() {
        return INTERVIEWERNO;
    }

    public void setINTERVIEWERNO(int INTERVIEWERNO) {
        this.INTERVIEWERNO = INTERVIEWERNO;
    }

    public int getCOMPANYNO() {
        return COMPANYNO;
    }

    public void setCOMPANYNO(int COMPANYNO) {
        this.COMPANYNO = COMPANYNO;
    }

    public int getACCOUNTID() {
        return ACCOUNTID;
    }

    public void setACCOUNTID(int ACCOUNTID) {
        this.ACCOUNTID = ACCOUNTID;
    }

    public String getINTERVIEWERNAME() {
        return INTERVIEWERNAME;
    }

    public void setINTERVIEWERNAME(String INTERVIEWERNAME) {
        this.INTERVIEWERNAME = INTERVIEWERNAME;
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
}
