package Process;

/**
 *
 * @author acer
 */
public class Account {

    private int ACCOUNTID;
    private String USERNAME, PASSWORD, ROLE, LINKIMAGE;

    public Account() {
    }

    public Account(int ACCOUNTID, String USERNAME, String PASSWORD, String ROLE,
            String LINKIMAGE) {
        this.ACCOUNTID = ACCOUNTID;
        this.USERNAME = USERNAME;
        this.PASSWORD = PASSWORD;
        this.ROLE = ROLE;
        this.LINKIMAGE = LINKIMAGE;
    }

    public int getACCOUNTID() {
        return ACCOUNTID;
    }

    public void setACCOUNTID(int ACCOUNTID) {
        this.ACCOUNTID = ACCOUNTID;
    }

    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String USERNAME) {
        this.USERNAME = USERNAME;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }

    public String getLINKIMAGE() {
        return LINKIMAGE;
    }

    public void setLINKIMAGE(String LINKIMAGE) {
        this.LINKIMAGE = LINKIMAGE;
    }
}
