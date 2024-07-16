package Process;

import java.sql.Date;

/**
 *
 * @author acer
 */
public class Company {

    private int COMPANYNO, ACCOUNTID;
    private String COMPANYNAME, ADDRESS, HOTLINE, GMAIL;
    private Date STARTDATE;

    public Company() {
    }

    public Company(int COMPANYNO, int ACCOUNTID, String COMPANYNAME,
            String ADDRESS, String HOTLINE, String GMAIL, Date STARTDATE) {
        this.COMPANYNO = COMPANYNO;
        this.ACCOUNTID = ACCOUNTID;
        this.COMPANYNAME = COMPANYNAME;
        this.ADDRESS = ADDRESS;
        this.HOTLINE = HOTLINE;
        this.GMAIL = GMAIL;
        this.STARTDATE = STARTDATE;
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

    public String getCOMPANYNAME() {
        return COMPANYNAME;
    }

    public void setCOMPANYNAME(String COMPANYNAME) {
        this.COMPANYNAME = COMPANYNAME;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
    }

    public String getHOTLINE() {
        return HOTLINE;
    }

    public void setHOTLINE(String HOTLINE) {
        this.HOTLINE = HOTLINE;
    }

    public String getGMAIL() {
        return GMAIL;
    }

    public void setGMAIL(String GMAIL) {
        this.GMAIL = GMAIL;
    }

    public Date getSTARTDATE() {
        return STARTDATE;
    }

    public void setSTARTDATE(Date STARTDATE) {
        this.STARTDATE = STARTDATE;
    }
}
