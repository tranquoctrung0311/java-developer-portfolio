package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author acer
 */
public class DepartmentDao {
    public int takeDEPARTMENTNO(String name) throws Exception {
        String sql = "SELECT DEPARTMENTNO "
                + " FROM DEPARTMENT "
                + " WHERE DEPARTMENTNAME = ?";
        
        int departmentno = 0;
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, name);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    departmentno = rs.getInt("DEPARTMENTNO");
                }
                return departmentno;
            }
        }
    }
    
    public List<Department> findByAccountID() throws Exception {
        String sql = "SELECT DISTINCT D.*"
                + " FROM RECRUIT R JOIN COMPANY C ON R.COMPANYNO = C.COMPANYNO "
                + " JOIN DEPARTMENT D ON R.DEPARTMENTNO = D.DEPARTMENTNO "
                + " WHERE C.ACCOUNTID = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ) {
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<Department> list = new ArrayList<>();
                while (rs.next()) {
                    Department d = CreateDepartment(rs);
                    list.add(d);
                }
                return list;
            }
        }
    }

    private Department CreateDepartment(final ResultSet rs) throws SQLException {
        Department d = new Department();
        d.setDEPARTMENTNO(rs.getInt("DEPARTMENTNO"));
        d.setDEPARTMENTNAME(rs.getString("DEPARTMENTNAME"));
        return d;
    }
    
    public boolean insert(Department d) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_dep(?, ?); "
                + " END;";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setString(1, d.getDEPARTMENTNAME());

            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean update(Department d) throws Exception {
        String sql = "BEGIN "
                + " proc_update_dep(?, ?, ?); "
                + " END;";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setString(1, d.getDEPARTMENTNAME());
            pstmt.setString(2, d.getDEPARTMENTNAME());
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean delete(String name) throws Exception {
        String sql = "BEGIN "
                + " PROC_DELETE_DEPARTMENT_OF_RECRUIT(?, ?); "
                + " END;";
        
        CompanyDao cdao = new CompanyDao();
        DepartmentDao pdao = new DepartmentDao();

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ){
            
            pstmt.setInt(1, cdao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, pdao.takeDEPARTMENTNO(name));

            return pstmt.executeUpdate() > 0;
        }
    }

    public Department findByID(int id) throws Exception {
        String sql = "SELECT D.*"
                + " FROM DEPARTMENT D JOIN RECRUIT R ON D.DEPARTMENTNO = R.DEPARTMENTNO"
                + " JOIN COMPANY C ON C.COMPANYNO = R.COMPANYNO"
                + " WHERE C.ACCOUNTID = ?";

        try (
                Connection con = ConnectOracle.openConnection();  
                PreparedStatement pstmt = con.prepareStatement(sql);
            ) {
            
            pstmt.setInt(1, SharedData.useraccount.getACCOUNTID());
            
            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    Department d = CreateDepartment(rs);
                    return d;
                }
                return null;
            }
        }
    }
}
