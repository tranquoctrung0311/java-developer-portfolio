package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class SecondPairDao {

    public List<SecondPair> findSecondPair(int maPhong) throws Exception {
        String sql = "SELECT P.POSITIONNO, P.POSITIONNAME, R.NUMBEROFPERSONNEL "
                + " FROM RECRUIT R JOIN POSITION P ON P.POSITIONNO = R.POSITIONNO"
                + " WHERE R.DEPARTMENTNO = ? AND R.COMPANYNO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {
            pstmt.setInt(1, maPhong);
            pstmt.setInt(2, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));

            try ( ResultSet rs = pstmt.executeQuery();) {
                List<SecondPair> list = new ArrayList<>();
                while (rs.next()) {
                    SecondPair sp = new SecondPair();
                    Position p = new Position();

                    p.setPOSITIONNO(rs.getInt("POSITIONNO"));
                    p.setPOSITIONNAME(rs.getString("POSITIONNAME"));

                    sp.setPos(p);
                    sp.setNUMBEROFPERSONNEL(rs.getInt("NUMBEROFPERSONNEL"));
                    list.add(sp);
                }
                return list;
            }
        }
    }

    public SecondPair findByID(int mapban, int mavt) throws Exception {
        String sql = "SELECT P.POSITIONNAME, R.NUMBEROFPERSONNEL"
                + " FROM POSITION P JOIN RECRUIT R ON P.POSITIONNO = R.POSITIONNO"
                + " WHERE R.COMPANYNO = ? AND R.DEPARTMENTNO = ? AND P.POSITIONNO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, mapban);
            pstmt.setInt(3, mavt);

            try ( ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    SecondPair sp = new SecondPair();
                    Position p = new Position();
                    p.setPOSITIONNAME(rs.getString("POSITIONNAME"));

                    sp.setPos(p);
                    sp.setNUMBEROFPERSONNEL(rs.getInt("NUMBEROFPERSONNEL"));
                    return sp;
                }
                return null;
            }
        }
    }

    public boolean insert(SecondPair sp, int mapban) throws Exception {
        String sql = "BEGIN "
                + " PROC_INSERT_POSITION_OF_RECRUIT(?, ?, ?, ?); "
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, mapban);
            pstmt.setString(3, sp.getPos().getPOSITIONNAME());
            pstmt.setInt(4, sp.getNUMBEROFPERSONNEL());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean delete(SecondPair sp, int mapban) throws Exception {
        String sql = "BEGIN "
                + " PROC_DELETE_POSITION_OF_RECRUIT(?, ?, ?); "
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, mapban);
            pstmt.setString(3, sp.getPos().getPOSITIONNAME());
            
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean update(SecondPair sp, int mapban) throws Exception {
        String sql = "BEGIN "
                + " PROC_UPDATE_POSITION_OF_RECRUIT(?, ?, ?, ?); "
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, mapban);
            pstmt.setString(3, sp.getPos().getPOSITIONNAME());
            pstmt.setInt(4, sp.getNUMBEROFPERSONNEL());

            
            return pstmt.executeUpdate() > 0;
        }
    }
}
