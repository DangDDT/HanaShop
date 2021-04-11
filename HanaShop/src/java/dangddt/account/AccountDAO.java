/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.account;

import dangddt.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Tam Dang
 */
public class AccountDAO implements Serializable {

    private static void closeConnection(Connection con, PreparedStatement stm, ResultSet rs) throws SQLException {
        if (con != null) {
            con.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    public static AccountDTO checkLogin(String username, String password) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT userID, password, role, fullname FROM Accounts "
                        + "WHERE userID = ? COLLATE SQL_Latin1_General_CP1_CS_AS "
                        + "AND password = ? COLLATE SQL_Latin1_General_CP1_CS_AS";
                stm = con.prepareStatement(sql);
                System.out.println(sql);
                if (null != stm) {
                    stm.setString(1, username);
                    stm.setString(2, password);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        result = new AccountDTO(rs.getString("userID"), rs.getString("password"), rs.getInt("role") == 1, rs.getString("fullname"));
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }
}
