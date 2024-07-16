package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class HaveSkillDao {

    public HaveSkill findBySkillName(String skillname) throws Exception {
        String sql = "SELECT S.SKILLNAME, H.LEVEL_APL, H.YEARSOFEXPERIENCE "
                + " FROM SKILL S JOIN HAVE H ON S.SKILLNO = H.SKILLNO "
                + " JOIN APPLICANT A ON A.APPLICANTNO = H.APPLICANTNO"
                + " WHERE S.SKILLNAME = ? AND A.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, skillname);
            pstmt.setInt(2, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    HaveSkill hs = CreateHaveSkill(rs);
                    return hs;
                }
                return null;
            }
        }
    }

    public List<HaveSkill> findByAccountID() throws Exception {
        String sql = "SELECT S.SKILLNAME, H.LEVEL_APL, H.YEARSOFEXPERIENCE "
                + " FROM SKILL S JOIN HAVE H ON S.SKILLNO = H.SKILLNO"
                + " JOIN APPLICANT A ON H.APPLICANTNO = A.APPLICANTNO"
                + " WHERE A.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<HaveSkill> list = new ArrayList<>();
                while (rs.next()) {
                    HaveSkill hs = CreateHaveSkill(rs);
                    list.add(hs);
                }
                return list;
            }
        }
    }

    private HaveSkill CreateHaveSkill(final ResultSet rs) throws SQLException {
        HaveSkill hs = new HaveSkill();
        hs.setSKILLNAME(rs.getString("SKILLNAME"));
        hs.setLEVEL_APL(rs.getInt("LEVEL_APL"));
        hs.setYEARSOFEXPERIENCE(rs.getInt("YEARSOFEXPERIENCE"));
        return hs;
    }

    public boolean insert(HaveSkill hs) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_have(?, ?, ?, ?); "
                + " END;";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, hs.getSKILLNAME());
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, hs.getLEVEL_APL());
            pstmt.setInt(4, hs.getYEARSOFEXPERIENCE());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean delete(String skillname) throws Exception {
        String sql = "BEGIN "
                + " proc_delete_have(?, ?); "
                + " END;";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, skillname);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean update(HaveSkill hs) throws Exception {
        String sql = "BEGIN "
                + " proc_update_have(?, ?, ?, ?); "
                + " END;";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, hs.getSKILLNAME());
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, hs.getLEVEL_APL());
            pstmt.setInt(4, hs.getYEARSOFEXPERIENCE());
            
            return pstmt.executeUpdate() > 0;
        }
    }

    public List<HaveSkill> findSkill(int maApp) throws Exception {
        String sql = "SELECT S.SKILLNAME, H.LEVEL_APL, H.YEARSOFEXPERIENCE "
                + " FROM SKILL S JOIN HAVE H ON S.SKILLNO = H.SKILLNO"
                + " JOIN APPLICANT A ON H.APPLICANTNO = A.APPLICANTNO"
                + " WHERE A.APPLICANTNO = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, maApp);

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<HaveSkill> list = new ArrayList<>();
                while (rs.next()) {
                    HaveSkill hs = CreateHaveSkill(rs);
                    list.add(hs);
                }
                return list;
            }
        }
    }
}
