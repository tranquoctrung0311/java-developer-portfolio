package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;

/**
 *
 * @author acer
 */
public class ApplicantDao {

    public int takeAPPLICANTNO(int id) throws Exception {
        String sql = "SELECT A.APPLICANTNO "
                + " FROM APPLICANT A JOIN ACCOUNT AC ON A.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE A.ACCOUNTID = ?";
        int applicantno = 0;

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    applicantno = rs.getInt("APPLICANTNO");
                }
                return applicantno;
            }
        }
    }

    public boolean insert(Applicant a) throws Exception {
        String sql = "BEGIN"
                + " proc_insert_applicant(?, ?, ?, ?, ?, ?, ?, ?);"
                + " END;";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, a.getAPPLICANTNAME());
            pstmt.setString(2, a.getCITIZENID());
            pstmt.setDate(3, a.getDATEOFBIRTH());
            pstmt.setInt(4, a.getGENDER());
            pstmt.setString(5, a.getADDRESS());
            pstmt.setString(6, a.getPHONENUMBER());
            pstmt.setString(7, a.getGMAIL());
            pstmt.setInt(8, a.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }

    public Applicant getInformationByAccountID() throws Exception {
        String sql = "SELECT A.*"
                + " FROM APPLICANT A JOIN ACCOUNT AC ON A.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE AC.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Applicant a = new Applicant();
                    a.setAPPLICANTNO(rs.getInt("APPLICANTNO"));
                    a.setAPPLICANTNAME(rs.getString("APPLICANTNAME"));
                    a.setCITIZENID(rs.getString("CITIZENID"));
                    a.setDATEOFBIRTH(rs.getDate("DATEOFBIRTH"));
                    a.setGENDER(rs.getInt("GENDER"));
                    a.setADDRESS(rs.getString("ADDRESS"));
                    a.setPHONENUMBER(rs.getString("PHONENUMBER"));
                    a.setGMAIL(rs.getString("GMAIL"));
                    return a;
                }
            }
        }
        return null;
    }

    public boolean update(Applicant a) throws Exception {
        String sql = "BEGIN"
                + " proc_update_applicant(?, ?, ?, ?, ?, ?, ?, ?, ?);"
                + " END;";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setString(2, a.getAPPLICANTNAME());
            pstmt.setString(3, a.getCITIZENID());
            pstmt.setDate(4, a.getDATEOFBIRTH());
            pstmt.setInt(5, a.getGENDER());
            pstmt.setString(6, a.getADDRESS());
            pstmt.setString(7, a.getPHONENUMBER());
            pstmt.setString(8, a.getGMAIL());
            pstmt.setInt(9, SharedData.useraccount.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }

    public Applicant getInformationAPL(int maApp) throws Exception {
        String sql = "SELECT *"
                + " FROM APPLICANT"
                + " WHERE APPLICANTNO = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, maApp);

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Applicant a = new Applicant();
                    a.setAPPLICANTNO(rs.getInt("APPLICANTNO"));
                    a.setAPPLICANTNAME(rs.getString("APPLICANTNAME"));
                    a.setCITIZENID(rs.getString("CITIZENID"));
                    a.setDATEOFBIRTH(rs.getDate("DATEOFBIRTH"));
                    a.setGENDER(rs.getInt("GENDER"));
                    a.setADDRESS(rs.getString("ADDRESS"));
                    a.setPHONENUMBER(rs.getString("PHONENUMBER"));
                    a.setGMAIL(rs.getString("GMAIL"));
                    return a;
                }
            }
        }
        return null;
    }
}
