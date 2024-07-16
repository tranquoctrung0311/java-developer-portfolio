package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author acer
 */
public class RegisterDao {
    public List<Register> ListRegister(int maLich) throws Exception {
        String sql = "SELECT A.APPLICANTNO, A.APPLICANTNAME, P.POSITIONNAME "
                + " FROM APPLICANT A JOIN REGISTER R ON A.APPLICANTNO = R.APPLICANTNO "
                + " JOIN POSITION P ON P.POSITIONNO = R.POSITIONNO "
                + " WHERE R.INTERVIEWSCHEDULENO = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ) {
            pstmt.setInt(1, maLich);

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Register> list = new ArrayList<>();
                while (rs.next()) {
                    Register r = CreateRegister(rs);
                    list.add(r);
                }
                return list;
            }
        }
    }

    private Register CreateRegister(final ResultSet rs) throws SQLException {
        Register r = new Register();
        r.setAPPLICANTNO(rs.getInt("APPLICANTNO"));
        r.setAPPLICANTNAME(rs.getString("APPLICANTNAME"));
        r.setPOSITIONNAME(rs.getString("POSITIONNAME"));
        return r;
    }
    
    public boolean confirmComplete(int applicantno, int interviewscheduleno) throws Exception {
        String sql = "UPDATE REGISTER"
                + " SET STATUS = 2"
                + " WHERE APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setInt(1, applicantno);
            pstmt.setInt(2, interviewscheduleno);

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean confirmNotEngaged(int applicantno, int interviewscheduleno) throws Exception {
        String sql = "UPDATE REGISTER"
                + " SET STATUS = 3"
                + " WHERE APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setInt(1, applicantno);
            pstmt.setInt(2, interviewscheduleno);

            return pstmt.executeUpdate() > 0;
        }
    }
}
