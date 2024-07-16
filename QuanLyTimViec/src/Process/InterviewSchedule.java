package Process;

import java.sql.Date;

/**
 *
 * @author acer
 */
public class InterviewSchedule {

    private int INTERVIEWSCHEDULENO, STATUS, SLOT, INTERVIEWERNO;
    private String LOCATION;
    private Date STARTTIME, ENDTIME;

    public InterviewSchedule() {
    }

    public InterviewSchedule(int INTERVIEWSCHEDULENO, int STATUS, int SLOT, 
            int INTERVIEWERNO, String LOCATION, Date STARTTIME, Date ENDTIME) {
        this.INTERVIEWSCHEDULENO = INTERVIEWSCHEDULENO;
        this.STATUS = STATUS;
        this.SLOT = SLOT;
        this.INTERVIEWERNO = INTERVIEWERNO;
        this.LOCATION = LOCATION;
        this.STARTTIME = STARTTIME;
        this.ENDTIME = ENDTIME;
    }

    public int getINTERVIEWSCHEDULENO() {
        return INTERVIEWSCHEDULENO;
    }

    public void setINTERVIEWSCHEDULENO(int INTERVIEWSCHEDULENO) {
        this.INTERVIEWSCHEDULENO = INTERVIEWSCHEDULENO;
    }

    public int getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(int STATUS) {
        this.STATUS = STATUS;
    }

    public int getSLOT() {
        return SLOT;
    }

    public void setSLOT(int SLOT) {
        this.SLOT = SLOT;
    }

    public int getINTERVIEWERNO() {
        return INTERVIEWERNO;
    }

    public void setINTERVIEWERNO(int INTERVIEWERNO) {
        this.INTERVIEWERNO = INTERVIEWERNO;
    }

    public String getLOCATION() {
        return LOCATION;
    }

    public void setLOCATION(String LOCATION) {
        this.LOCATION = LOCATION;
    }

    public Date getSTARTTIME() {
        return STARTTIME;
    }

    public void setSTARTTIME(Date STARTTIME) {
        this.STARTTIME = STARTTIME;
    }

    public Date getENDTIME() {
        return ENDTIME;
    }

    public void setENDTIME(Date ENDTIME) {
        this.ENDTIME = ENDTIME;
    }
}
