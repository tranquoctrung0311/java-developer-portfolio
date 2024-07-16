package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class InterviewerDao {

    public int takeINTERVIEWERNO(int id) throws Exception {
        String sql = "SELECT I.INTERVIEWERNO "
                + " FROM INTERVIEWER I JOIN ACCOUNT AC ON I.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE I.ACCOUNTID = ?";
        int interviewer = 0;

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    interviewer = rs.getInt("INTERVIEWERNO");
                }
                return interviewer;
            }
        }
    }

    public boolean insert(Interviewer i) throws Exception {
        String sql = "BEGIN"
                + " proc_insert_interviewer(?, ?, ?, ?, ?);"
                + " END;";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, i.getINTERVIEWERNAME());
            pstmt.setString(2, i.getPHONENUMBER());
            pstmt.setString(3, i.getGMAIL());
            pstmt.setInt(4, i.getCOMPANYNO());
            pstmt.setInt(5, i.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean update(Interviewer i) throws Exception {
        String sql = "BEGIN"
                + " proc_update_interviewer(?, ?, ?, ?, ?, ?);"
                + " END;";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, takeINTERVIEWERNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setString(2, i.getINTERVIEWERNAME());
            pstmt.setString(3, i.getPHONENUMBER());
            pstmt.setString(4, i.getGMAIL());
            pstmt.setInt(5, i.getCOMPANYNO());
            pstmt.setInt(6, SharedData.useraccount.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }

    public Interviewer getInformationByAccountID() throws Exception {
        String sql = "SELECT I.*"
                + " FROM INTERVIEWER I JOIN ACCOUNT AC ON I.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE AC.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Interviewer i = new Interviewer();
                    i.setINTERVIEWERNO(rs.getInt("INTERVIEWERNO"));
                    i.setINTERVIEWERNAME(rs.getString("INTERVIEWERNAME"));
                    i.setPHONENUMBER(rs.getString("PHONENUMBER"));
                    i.setGMAIL(rs.getString("GMAIL"));
                    i.setCOMPANYNO(rs.getInt("COMPANYNO"));
                    return i;
                }
            }
        }
        return null;
    }

    public List<Interviewer> findByAccountID() throws Exception {
        String sql = "SELECT I.*"
                + " FROM INTERVIEWER I JOIN COMPANY C ON I.COMPANYNO = C.COMPANYNO"
                + " WHERE C.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Interviewer> list = new ArrayList<>();
                while (rs.next()) {
                    Interviewer i = CreateInterviewer(rs);
                    list.add(i);
                }
                return list;
            }
        }
    }

    private Interviewer CreateInterviewer(final ResultSet rs) throws SQLException {
        Interviewer i = new Interviewer();
        i.setINTERVIEWERNO(rs.getInt("INTERVIEWERNO"));
        i.setINTERVIEWERNAME(rs.getString("INTERVIEWERNAME"));
        i.setPHONENUMBER(rs.getString("PHONENUMBER"));
        i.setGMAIL(rs.getString("GMAIL"));
        i.setCOMPANYNO(rs.getInt("COMPANYNO"));
        i.setACCOUNTID(rs.getInt("ACCOUNTID"));
        return i;
    }
}
