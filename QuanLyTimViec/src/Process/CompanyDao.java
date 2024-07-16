package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;

/**
 *
 * @author acer
 */
public class CompanyDao {

    public int takeCOMPANYNO(int id) throws Exception {
        String sql = "SELECT C.COMPANYNO "
                + " FROM COMPANY C JOIN ACCOUNT AC ON C.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE C.ACCOUNTID = ?";
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
    
    public String getCompanyNameByCompanyNo(int id) throws Exception {
        String sql = "SELECT COMPANYNAME "
                + " FROM COMPANY"
                + " WHERE COMPANYNO = ?";
        
        String companyname = null;
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    companyname = rs.getString("COMPANYNAME");
                }
                return companyname;
            }
        }
    }
    
    public boolean insert(Company c) throws Exception {
        String sql = "BEGIN"
                + " proc_insert_comp(?, ?, ?, ?, ?, ?);"
                + " END;";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            pstmt.setString(1, c.getCOMPANYNAME());
            pstmt.setString(2, c.getADDRESS());
            pstmt.setString(3, c.getHOTLINE());
            pstmt.setString(4, c.getGMAIL());
            pstmt.setDate(5, c.getSTARTDATE());
            pstmt.setInt(6, c.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean update(Company c) throws Exception {
        String sql = "BEGIN"
                + " proc_update_comp(?, ?, ?, ?, ?, ?, ?);"
                + " END;";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            pstmt.setInt(1, takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setString(2, c.getCOMPANYNAME());
            pstmt.setString(3, c.getADDRESS());
            pstmt.setString(4, c.getHOTLINE());
            pstmt.setString(5, c.getGMAIL());
            pstmt.setDate(6, c.getSTARTDATE());
            pstmt.setInt(7, SharedData.useraccount.getACCOUNTID());

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public int getCompanyNoByCompanyName(String name) throws Exception {
        String sql = "SELECT COMPANYNO"
                + " FROM COMPANY"
                + " WHERE COMPANYNAME = ?";
        int companyno = 0;

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, name);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    companyno = rs.getInt("COMPANYNO");
                }
                return companyno;
            }
        }
    }
    
    public Company getInformationByAccountID() throws Exception {
        String sql = "SELECT C.*"
                + " FROM COMPANY C JOIN ACCOUNT AC ON C.ACCOUNTID = AC.ACCOUNTID "
                + " WHERE AC.ACCOUNTID = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);) 
        {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Company c = new Company();
                    c.setCOMPANYNO(rs.getInt("COMPANYNO"));
                    c.setCOMPANYNAME(rs.getString("COMPANYNAME"));
                    c.setADDRESS(rs.getString("ADDRESS"));
                    c.setHOTLINE(rs.getString("HOTLINE"));
                    c.setGMAIL(rs.getString("GMAIL"));
                    c.setSTARTDATE(rs.getDate("STARTDATE"));
                    return c;
                }
            }
        }
        return null;
    }
}
