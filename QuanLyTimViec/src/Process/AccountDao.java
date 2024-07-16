package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;

/**
 *
 * @author acer
 */
public class AccountDao {
    
    public int getAccountIDByUsername(String name) throws Exception {
        String sql = "SELECT ACCOUNTID"
                + " FROM ACCOUNT"
                + " WHERE USERNAME = ?";
        int accountid = 0;
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            
            pstmt.setString(1, name);
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                
                while (rs.next()) {
                    accountid = rs.getInt("ACCOUNTID");
                }
                return accountid;
            }
        }
    }
    
    public Account checkLogin(String username, String password) throws Exception {
        String sql = "SELECT * FROM ACCOUNT WHERE USERNAME = ? AND PASSWORD = ?";
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Account a = new Account();
                    a.setACCOUNTID(rs.getInt("ACCOUNTID"));
                    a.setUSERNAME(rs.getString("USERNAME"));
                    a.setROLE(rs.getString("ROLE"));
                    if (rs.getString("LINKIMAGE") == null) {
                        a.setLINKIMAGE("");
                    } else {
                        a.setLINKIMAGE(rs.getString("LINKIMAGE"));
                    }
                    return a;
                }
            }
        }
        return null;
    }
    
    public boolean checkForget(String username, String role, String gmail)
            throws Exception {
        String sql;
        if (role.equalsIgnoreCase("Cong ty")) {
            sql = "SELECT GMAIL FROM ACCOUNT A JOIN COMPANY C "
                    + " ON A.ACCOUNTID = C.ACCOUNTID WHERE USERNAME = ?";
            
        } else if (role.equalsIgnoreCase("Nha tuyen dung")) {
            sql = "SELECT GMAIL FROM ACCOUNT A JOIN INTERVIEWER I "
                    + " ON A.ACCOUNTID = I.ACCOUNTID WHERE USERNAME = ?";
        } else {
            sql = "SELECT GMAIL FROM ACCOUNT A JOIN APPLICANT APL "
                    + " ON A.ACCOUNTID = APL.ACCOUNTID WHERE USERNAME = ?";
        }
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, username);
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    if (rs.getString("GMAIL").equalsIgnoreCase(gmail)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    
    public boolean insert(Account a) throws Exception {
        String sql = "BEGIN proc_insert_account(?, ?, ?); END;";
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, a.getUSERNAME());
            pstmt.setString(2, a.getPASSWORD());
            pstmt.setString(3, a.getROLE());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean update(Account a) throws Exception {
        String sql = "BEGIN proc_update_account(?, ?, ?, ?); END;";
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setString(1, a.getUSERNAME());
            pstmt.setString(2, a.getUSERNAME());
            pstmt.setString(3, a.getPASSWORD());
            pstmt.setString(4, a.getROLE());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public String getPasswordByAccountID() throws Exception {
        String sql = "SELECT PASSWORD"
                + " FROM ACCOUNT"
                + " WHERE ACCOUNTID = ?";
        String password = null;
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                
                while (rs.next()) {
                    password = rs.getString("PASSWORD");
                }
                return password;
            }
        }
    }
    
    public boolean updateImage(String url) throws Exception {
        String sql = "UPDATE ACCOUNT SET LINKIMAGE = ? WHERE ACCOUNTID = ?";
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            
            pstmt.setString(1, url);
            pstmt.setInt(2, SharedData.useraccount.getACCOUNTID());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    
    
    public boolean checkUsername(String name) throws Exception {
        String sql = "SELECT *"
                + " FROM ACCOUNT"
                + " WHERE USERNAME = ?";
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            
            pstmt.setString(1, name);
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                
                while (rs.next()) {
                    return true;
                }
                return false;
            }
        }
    }
}
