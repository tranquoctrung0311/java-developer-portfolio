package Process;

import java.sql.Date;

/**
 *
 * @author acer
 */
public class Applicant {

    private int APPLICANTNO, GENDER, ACCOUNTID;
    private String APPLICANTNAME, CITIZENID, ADDRESS, PHONENUMBER, GMAIL;
    private Date DATEOFBIRTH;

    public Applicant() {
    }

    public Applicant(int APPLICANTNO, int GENDER, int ACCOUNTID,
            String APPLICANTNAME, String CITIZENID, String ADDRESS,
            String PHONENUMBER, String GMAIL, Date DATEOFBIRTH) {
        this.APPLICANTNO = APPLICANTNO;
        this.GENDER = GENDER;
        this.ACCOUNTID = ACCOUNTID;
        this.APPLICANTNAME = APPLICANTNAME;
        this.CITIZENID = CITIZENID;
        this.ADDRESS = ADDRESS;
        this.PHONENUMBER = PHONENUMBER;
        this.GMAIL = GMAIL;
        this.DATEOFBIRTH = DATEOFBIRTH;
    }

    public int getAPPLICANTNO() {
        return APPLICANTNO;
    }

    public void setAPPLICANTNO(int APPLICANTNO) {
        this.APPLICANTNO = APPLICANTNO;
    }

    public int getGENDER() {
        return GENDER;
    }

    public void setGENDER(int GENDER) {
        this.GENDER = GENDER;
    }

    public int getACCOUNTID() {
        return ACCOUNTID;
    }

    public void setACCOUNTID(int ACCOUNTID) {
        this.ACCOUNTID = ACCOUNTID;
    }

    public String getAPPLICANTNAME() {
        return APPLICANTNAME;
    }

    public void setAPPLICANTNAME(String APPLICANTNAME) {
        this.APPLICANTNAME = APPLICANTNAME;
    }

    public String getCITIZENID() {
        return CITIZENID;
    }

    public void setCITIZENID(String CITIZENID) {
        this.CITIZENID = CITIZENID;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
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

    public Date getDATEOFBIRTH() {
        return DATEOFBIRTH;
    }

    public void setDATEOFBIRTH(Date DATEOFBIRTH) {
        this.DATEOFBIRTH = DATEOFBIRTH;
    }
}
