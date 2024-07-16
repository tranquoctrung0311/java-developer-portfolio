package Process;

/**
 *
 * @author acer
 */
public class HaveSkill {

    private String SKILLNAME;
    private int LEVEL_APL, YEARSOFEXPERIENCE;

    public HaveSkill() {
    }

    public HaveSkill(String SKILLNAME, int LEVEL_APL, int YEARSOFEXPERIENCE) {
        this.SKILLNAME = SKILLNAME;
        this.LEVEL_APL = LEVEL_APL;
        this.YEARSOFEXPERIENCE = YEARSOFEXPERIENCE;
    }

    public String getSKILLNAME() {
        return SKILLNAME;
    }

    public void setSKILLNAME(String SKILLNAME) {
        this.SKILLNAME = SKILLNAME;
    }

    public int getLEVEL_APL() {
        return LEVEL_APL;
    }

    public void setLEVEL_APL(int LEVEL_APL) {
        this.LEVEL_APL = LEVEL_APL;
    }

    public int getYEARSOFEXPERIENCE() {
        return YEARSOFEXPERIENCE;
    }

    public void setYEARSOFEXPERIENCE(int YEARSOFEXPERIENCE) {
        this.YEARSOFEXPERIENCE = YEARSOFEXPERIENCE;
    }
}
