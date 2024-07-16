package Process;

/**
 *
 * @author acer
 */
public class Require {

    private String REQUIREMENTNAME;
    private int LEVEL_RE, YEARSOFEXPERIENCE;

    public Require() {
    }

    public Require(String REQUIREMENTNAME, int LEVEL_RE, int YEARSOFEXPERIENCE) {
        this.REQUIREMENTNAME = REQUIREMENTNAME;
        this.LEVEL_RE = LEVEL_RE;
        this.YEARSOFEXPERIENCE = YEARSOFEXPERIENCE;
    }

    public String getREQUIREMENTNAME() {
        return REQUIREMENTNAME;
    }

    public void setREQUIREMENTNAME(String REQUIREMENTNAME) {
        this.REQUIREMENTNAME = REQUIREMENTNAME;
    }

    public int getLEVEL_RE() {
        return LEVEL_RE;
    }

    public void setLEVEL_RE(int LEVEL_RE) {
        this.LEVEL_RE = LEVEL_RE;
    }

    public int getYEARSOFEXPERIENCE() {
        return YEARSOFEXPERIENCE;
    }

    public void setYEARSOFEXPERIENCE(int YEARSOFEXPERIENCE) {
        this.YEARSOFEXPERIENCE = YEARSOFEXPERIENCE;
    }
}
