package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class InterviewScheduleDao {

    public InterviewSchedule getInformation(int maLich) throws Exception {
        String sql = "SELECT * FROM INTERVIEW_SCHEDULE WHERE INTERVIEWSCHEDULENO = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maLich);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    InterviewSchedule is = new InterviewSchedule();
                    is.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
                    is.setSTARTTIME(rs.getDate("STARTTIME"));
                    is.setENDTIME(rs.getDate("ENDTIME"));
                    is.setLOCATION(rs.getString("LOCATION"));
                    is.setSTATUS(rs.getInt("STATUS"));
                    is.setSLOT(rs.getInt("SLOT"));
                    return is;
                }
            }
        }
        return null;
    }

    public List<InterviewSchedule> ListSchedule() throws Exception {
        String sql = "SELECT ITS.*"
                + " FROM INTERVIEW_SCHEDULE ITS JOIN INTERVIEWER I ON ITS.INTERVIEWERNO = I.INTERVIEWERNO"
                + " WHERE I.ACCOUNTID = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<InterviewSchedule> list = new ArrayList<>();
                while (rs.next()) {
                    InterviewSchedule is = new InterviewSchedule();
                    is.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
                    is.setSTARTTIME(rs.getDate("STARTTIME"));
                    is.setENDTIME(rs.getDate("ENDTIME"));
                    is.setLOCATION(rs.getString("LOCATION"));
                    is.setSTATUS(rs.getInt("STATUS"));
                    is.setSLOT(rs.getInt("SLOT"));
                    list.add(is);
                }
                return list;
            }
        }
    }

    public boolean insert(InterviewSchedule is) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_interview_schedule(?, ?, ?, ?, ?, ?);"
                + " END;";

        InterviewerDao dao = new InterviewerDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setDate(1, is.getSTARTTIME());
            pstmt.setDate(2, is.getENDTIME());
            pstmt.setString(3, is.getLOCATION());
            pstmt.setInt(4, is.getSTATUS());
            pstmt.setInt(5, is.getSLOT());
            pstmt.setInt(6, dao.takeINTERVIEWERNO(SharedData.useraccount.getACCOUNTID()));

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean update(InterviewSchedule is) throws Exception {
        String sql = "BEGIN "
                + " proc_update_interview_schedule(?, ?, ?, ?, ?, ?, ?);"
                + " END;";

        InterviewerDao dao = new InterviewerDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, is.getINTERVIEWSCHEDULENO());
            pstmt.setDate(2, is.getSTARTTIME());
            pstmt.setDate(3, is.getENDTIME());
            pstmt.setString(4, is.getLOCATION());
            pstmt.setInt(5, is.getSTATUS());
            pstmt.setInt(6, is.getSLOT());
            pstmt.setInt(7, dao.takeINTERVIEWERNO(SharedData.useraccount.getACCOUNTID()));

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean delete(int maLich) throws Exception {
        String sql = "BEGIN "
                + " proc_delete_interview_schedule(?);"
                + " END;";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, maLich);

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public List<InterviewSchedule> findListByInterviewerNo(int maITV) throws Exception {
        String sql = "SELECT *"
                + " FROM INTERVIEW_SCHEDULE"
                + " WHERE INTERVIEWERNO = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, maITV);

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<InterviewSchedule> list = new ArrayList<>();
                while (rs.next()) {
                    InterviewSchedule is = new InterviewSchedule();
                    is.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
                    is.setSTARTTIME(rs.getDate("STARTTIME"));
                    is.setENDTIME(rs.getDate("ENDTIME"));
                    is.setLOCATION(rs.getString("LOCATION"));
                    is.setSTATUS(rs.getInt("STATUS"));
                    is.setSLOT(rs.getInt("SLOT"));
                    list.add(is);
                }
                return list;
            }
        }
    }
}
