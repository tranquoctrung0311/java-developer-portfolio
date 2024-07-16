package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;
/**
 *
 * @author acer
 */
public class PositionDao {
    public int takePOSITIONNO(String name) throws Exception {
        String sql = "SELECT POSITIONNO "
                + " FROM POSITION "
                + " WHERE POSITIONNAME = ?";
        
        int positionno = 0;
        
        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setString(1, name);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    positionno = rs.getInt("POSITIONNO");
                }
                return positionno;
            }
        }
    }
}
