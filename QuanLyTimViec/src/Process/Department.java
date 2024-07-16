package Process;

/**
 *
 * @author acer
 */
public class Department {

    private int DEPARTMENTNO;
    private String DEPARTMENTNAME;

    public Department() {
    }

    public Department(int DEPARTMENTNO, String DEPARTMENTNAME) {
        this.DEPARTMENTNO = DEPARTMENTNO;
        this.DEPARTMENTNAME = DEPARTMENTNAME;
    }

    public int getDEPARTMENTNO() {
        return DEPARTMENTNO;
    }

    public void setDEPARTMENTNO(int DEPARTMENTNO) {
        this.DEPARTMENTNO = DEPARTMENTNO;
    }

    public String getDEPARTMENTNAME() {
        return DEPARTMENTNAME;
    }

    public void setDEPARTMENTNAME(String DEPARTMENTNAME) {
        this.DEPARTMENTNAME = DEPARTMENTNAME;
    }
}
