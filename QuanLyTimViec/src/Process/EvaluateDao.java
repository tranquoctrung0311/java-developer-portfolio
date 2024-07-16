package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;

/**
 *
 * @author acer
 */
public class EvaluateDao {

    public boolean isEvaluateAPL(int maApp, int maITS) throws Exception {
        String sql = "SELECT *"
                + " FROM EVALUATE_APL"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isEvaluateCO(int maCom, int maITS) throws Exception {
        String sql = "SELECT *"
                + " FROM EVALUATE_CO"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maCom);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean insertEvaluateAPL(int maApp, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_evaluate_apl(?, ?, ?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean updateEvaluateAPL(int maApp, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_update_evaluate_apl(?, ?, ?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteEvaluateAPL(int maApp, int maITS) throws Exception {
        String sql = "BEGIN "
                + " proc_delete_evaluate_apl(?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            return pstmt.executeUpdate() > 0;
        }
    }

    public Evaluate getInformationAPL(int maApp, int maITS) throws Exception {
        String sql = "SELECT MARK_APL, COMMENT_APL"
                + " FROM EVALUATE_APL"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Evaluate e = new Evaluate();
                    e.setMARK(rs.getInt("MARK_APL"));
                    e.setCOMMENT(rs.getString("COMMENT_APL"));
                    return e;
                }
            }
        }
        return null;
    }
    
    public Evaluate getInformationCO(int maCom, int maITS) throws Exception {
        String sql = "SELECT MARK_CO, COMMENT_CO"
                + " FROM EVALUATE_CO"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maCom);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Evaluate e = new Evaluate();
                    e.setMARK(rs.getInt("MARK_CO"));
                    e.setCOMMENT(rs.getString("COMMENT_CO"));
                    return e;
                }
            }
        }
        return null;
    }

    public int getCompanynoByInterviewScheduleno(int id) throws Exception {
        String sql = "SELECT C.COMPANYNO "
                + " FROM INTERVIEW_SCHEDULE ITS JOIN INTERVIEWER I"
                + " ON ITS.INTERVIEWERNO = I.INTERVIEWERNO"
                + " JOIN COMPANY C ON I.COMPANYNO = C.COMPANYNO"
                + " WHERE ITS.INTERVIEWSCHEDULENO = ?";
        int companyno = 0;

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    companyno = rs.getInt("COMPANYNO");
                }
                return companyno;
            }
        }
    }

    public boolean insertEvaluateCO(int maCom, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_evaluate_co(?, ?, ?, ?, ?);"
                + " END;";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maCom);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean updateEvaluateCO(int maCom, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_update_evaluate_co(?, ?, ?, ?, ?);"
                + " END;";

        ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maCom);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteEvaluateCO(int maCom, int maITS) throws Exception {
        String sql = "BEGIN "
                + " proc_delete_evaluate_co(?, ?, ?);"
                + " END;";

         ApplicantDao dao = new ApplicantDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maCom);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, maITS);

            return pstmt.executeUpdate() > 0;
        }
    }
}
