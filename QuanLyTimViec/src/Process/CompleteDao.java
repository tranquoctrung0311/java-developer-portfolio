package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class CompleteDao {

    public List<Complete> findComplete() throws Exception {
        String sql = "SELECT A.APPLICANTNO, A.APPLICANTNAME, A.PHONENUMBER, A.GMAIL, "
                + " P.POSITIONNAME, ITS.INTERVIEWSCHEDULENO"
                + " FROM REGISTER R JOIN APPLICANT A ON  R.APPLICANTNO = A.APPLICANTNO"
                + " JOIN INTERVIEW_SCHEDULE ITS ON R.INTERVIEWSCHEDULENO = ITS.INTERVIEWSCHEDULENO"
                + " JOIN INTERVIEWER I ON I.INTERVIEWERNO = ITS.INTERVIEWERNO"
                + " JOIN POSITION P ON R.POSITIONNO = P.POSITIONNO"
                + " WHERE I.COMPANYNO = ? AND R.STATUS = 2";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Complete> list = new ArrayList<>();
                while (rs.next()) {
                    Complete c = CreateComplete(rs);
                    list.add(c);
                }
                return list;
            }
        }
    }

    private Complete CreateComplete(final ResultSet rs) throws SQLException {
        Complete c = new Complete();
        c.setAPPLICANTNO(rs.getInt("APPLICANTNO"));
        c.setAPPLICANTNAME(rs.getString("APPLICANTNAME"));
        c.setPHONENUMBER(rs.getString("PHONENUMBER"));
        c.setGMAIL(rs.getString("GMAIL"));
        c.setPOSITIONNAME(rs.getString("POSITIONNAME"));
        c.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
        return c;
    }
    
    public boolean confirmedToWork(int applicantno, int interviewscheduleno) throws Exception {
        String sql = "UPDATE REGISTER"
                + " SET STATUS = 4"
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
