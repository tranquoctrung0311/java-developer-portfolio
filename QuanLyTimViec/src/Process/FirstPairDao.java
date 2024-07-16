package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author acer
 */
public class FirstPairDao {
    public List<FirstPair> findByAccountID() throws Exception {
        String sql = "SELECT I.INTERVIEWSCHEDULENO, I.STARTTIME, I.ENDTIME, "
                + " I.LOCATION, R.STATUS, P.POSITIONNAME"
                + " FROM INTERVIEW_SCHEDULE I JOIN REGISTER R ON I.INTERVIEWSCHEDULENO = R.INTERVIEWSCHEDULENO"
                + " JOIN APPLICANT A ON A.APPLICANTNO = R.APPLICANTNO"
                + " JOIN POSITION P ON P.POSITIONNO = R.POSITIONNO"
                + " WHERE A.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<FirstPair> list = new ArrayList<>();
                while (rs.next()) {
                    InterviewSchedule is = new InterviewSchedule();
                    is.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
                    is.setSTARTTIME(rs.getDate("STARTTIME"));
                    is.setENDTIME(rs.getDate("ENDTIME"));
                    is.setLOCATION(rs.getString("LOCATION"));
                    is.setSTATUS(rs.getInt("STATUS"));
                    
                    Position p = new Position();
                    p.setPOSITIONNAME(rs.getString("POSITIONNAME"));
                    
                    FirstPair fp = new FirstPair(is, p);
                    list.add(fp);
                }
                return list;
            }
        }
    }
    
    public boolean cancel(int id) throws Exception {
        String sql = "BEGIN "
                + " huy_lich(?, ?);"
                + " END;";
        
        ApplicantDao dao = new ApplicantDao();

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ) {
            pstmt.setInt(1, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, id);

            return pstmt.executeUpdate() > 0;
        }
    }
}
