package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class RecruitDao {

    public List<Recruit> findAll() throws Exception {
        String sql = "SELECT C.COMPANYNAME, D.DEPARTMENTNAME, P.POSITIONNAME, "
                + " R.NUMBEROFPERSONNEL"
                + " FROM RECRUIT R JOIN COMPANY C ON R.COMPANYNO = C.COMPANYNO "
                + " JOIN DEPARTMENT D ON R.DEPARTMENTNO = D.DEPARTMENTNO "
                + " JOIN POSITION P ON P.POSITIONNO = R.POSITIONNO";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Recruit> list = new ArrayList<>();
                while (rs.next()) {
                    Company c = new Company();
                    c.setCOMPANYNAME(rs.getString("COMPANYNAME"));

                    Department d = new Department();
                    d.setDEPARTMENTNAME(rs.getString("DEPARTMENTNAME"));

                    Position p = new Position();
                    p.setPOSITIONNAME(rs.getString("POSITIONNAME"));

                    Recruit r = new Recruit();
                    r.setNUMBEROFPERSONNEL(rs.getInt("NUMBEROFPERSONNEL"));
                    r.setC(c);
                    r.setD(d);
                    r.setP(p);

                    list.add(r);
                }
                return list;
            }
        }
    }

    public Company InformationCompany(String tencty) throws Exception {
        String sql = "SELECT *"
                + " FROM COMPANY "
                + " WHERE COMPANYNAME = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, tencty);

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Company c = new Company();
                    c.setCOMPANYNO(rs.getInt("COMPANYNO"));
                    c.setCOMPANYNAME(rs.getString("COMPANYNAME"));
                    c.setADDRESS(rs.getString("ADDRESS"));
                    c.setHOTLINE(rs.getString("HOTLINE"));
                    c.setGMAIL(rs.getString("GMAIL"));
                    c.setSTARTDATE(rs.getDate("STARTDATE"));
                    c.setACCOUNTID(rs.getInt("ACCOUNTID"));
                    return c;
                }
            }
        }
        return null;
    }

    public Department InformationDepartment(String tenpban) throws Exception {
        String sql = "SELECT *"
                + " FROM DEPARTMENT "
                + " WHERE DEPARTMENTNAME = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, tenpban);

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Department d = new Department();
                    d.setDEPARTMENTNO(rs.getInt("DEPARTMENTNO"));
                    d.setDEPARTMENTNAME(rs.getString("DEPARTMENTNAME"));
                    return d;
                }
            }
        }
        return null;
    }

    public Position InformationPosition(String tenvt) throws Exception {
        String sql = "SELECT *"
                + " FROM POSITION "
                + " WHERE POSITIONNAME = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, tenvt);

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Position p = new Position();
                    p.setPOSITIONNO(rs.getInt("POSITIONNO"));
                    p.setPOSITIONNAME(rs.getString("POSITIONNAME"));
                    return p;
                }
            }
        }
        return null;
    }

    public List<Require> findRequire(String tencty, String tenpban, String tenvt)
            throws Exception {
        String sql = "SELECT RQ.REQUIREMENTNAME, R.LEVEL_RE, R.YEARSOFEXPERIENCE "
                + " FROM REQUIRE R JOIN REQUIREMENT RQ ON R.REQUIREMENTNO = RQ.REQUIREMENTNO "
                + "	JOIN POSITION P ON P.POSITIONNO = R.POSITIONNO "
                + "	JOIN RECRUIT RE ON RE.POSITIONNO = P.POSITIONNO "
                + "	JOIN DEPARTMENT D ON D.DEPARTMENTNO = RE.DEPARTMENTNO "
                + "	JOIN COMPANY C ON C.COMPANYNO = RE.COMPANYNO "
                + " WHERE COMPANYNAME = ? AND DEPARTMENTNAME = ? AND POSITIONNAME = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            
            pstmt.setString(1, tencty);
            pstmt.setString(2, tenpban);
            pstmt.setString(3, tenvt);

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Require> list = new ArrayList<>();
                while (rs.next()) {
                    Require r = new Require();
                    r.setREQUIREMENTNAME(rs.getString("REQUIREMENTNAME"));
                    r.setLEVEL_RE(rs.getInt("LEVEL_RE"));
                    r.setYEARSOFEXPERIENCE(rs.getInt("YEARSOFEXPERIENCE"));
                    list.add(r);
                }
                return list;
            }
        }
    }

    public List<InterviewSchedule> findSchedule(String tencty) throws Exception {
        String sql = "SELECT ITS.INTERVIEWSCHEDULENO, ITS.STARTTIME, ITS.ENDTIME, ITS.LOCATION, ITS.SLOT, ITS.STATUS"
                + " FROM INTERVIEW_SCHEDULE ITS JOIN INTERVIEWER I ON ITS.INTERVIEWERNO = I. INTERVIEWERNO"
                + "	JOIN COMPANY C ON C.COMPANYNO  = I.COMPANYNO"
                + " WHERE C.COMPANYNAME = ?";

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, tencty);

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<InterviewSchedule> list = new ArrayList<>();
                while (rs.next()) {
                    InterviewSchedule is = new InterviewSchedule();
                    is.setINTERVIEWSCHEDULENO(rs.getInt("INTERVIEWSCHEDULENO"));
                    is.setSTARTTIME(rs.getDate("STARTTIME"));
                    is.setENDTIME(rs.getDate("ENDTIME"));
                    is.setLOCATION(rs.getString("LOCATION"));
                    is.setSLOT(rs.getInt("SLOT"));
                    is.setSTATUS(rs.getInt("STATUS"));
                    list.add(is);
                }
                return list;
            }
        }
    }
    
    public boolean Register(int INTERVIEWSCHEDULENO,int DEPARTMENTNO, 
            int POSITIONNO) throws Exception {
    
        String sql = "BEGIN"
                + " proc_insert_register(?, ?, ?, ?, ?);"
                + " END;";
        
        ApplicantDao dao = new ApplicantDao();
        
        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setInt(1, INTERVIEWSCHEDULENO);
            pstmt.setInt(2, dao.takeAPPLICANTNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(3, DEPARTMENTNO);
            pstmt.setInt(4, POSITIONNO);
            pstmt.setInt(5, 0);

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean insert(Recruit r) throws Exception {
        String sql = "BEGIN "
                + " PROC_INSERT_DEPARTMENT_OF_RECRUIT(?, ?, ?, ?);"
                + " END;";
        
        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setString(2, r.getD().getDEPARTMENTNAME());
            pstmt.setString(3, r.getP().getPOSITIONNAME());
            pstmt.setInt(4, r.getNUMBEROFPERSONNEL());
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean checkDuplicate(String name) throws Exception {
        String sql = "SELECT *"
                + " FROM RECRUIT "
                + " WHERE COMPANYNO = ? AND DEPARTMENTNO = ?";
        
        CompanyDao cdao = new CompanyDao();
        DepartmentDao pdao = new DepartmentDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, cdao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, pdao.takeDEPARTMENTNO(name));

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    return true;
                }
            }
        }
        return false;
    }
}
