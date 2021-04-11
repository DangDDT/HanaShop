/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.bill;

import dangddt.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author Tam Dang
 */
public class BillDAO implements Serializable {

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

    public static int createBill(String fullname, String address, String phone, float totalPrice, String userID)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int bill_id = -1;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Bills (fullname,address,phone,totalPrice,date_checkout,userID) Values (?,?,?,ROUND(?,2),GETDATE(),?)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setString(1, fullname);
                stm.setString(2, address);
                stm.setString(3, phone);
                stm.setFloat(4, totalPrice);
                stm.setString(5, userID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    rs = stm.getGeneratedKeys();
                    rs.next();
                    bill_id = rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return bill_id;
    }

    public static ArrayList<BillDTO> loadBillByUserID(String userID) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<BillDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT B.bill_ID, B.fullname, B.phone, B.date_checkout, B.totalPrice, B.address, B.userID\n"
                        + "FROM Bills B\n"
                        + "WHERE B.userID = ?\n"
                        + "ORDER BY B.bill_ID DESC";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, userID);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new ArrayList();
                        while (rs.next()) {
                            result.add(new BillDTO(rs.getInt("bill_ID"), userID, rs.getString("fullname"), rs.getString("address"), rs.getString("phone"), rs.getFloat("totalPrice"), rs.getDate("date_checkout")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }

    public static ArrayList<BillDTO> searchBillByMonth(String userID, int month) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<BillDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT B.bill_ID, B.fullname, B.phone, B.date_checkout, B.totalPrice, B.address, B.userID\n"
                        + "FROM Bills B\n"
                        + "WHERE B.userID = ? AND MONTH(B.date_checkout) = ?\n"
                        + "ORDER BY B.bill_ID DESC";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, userID);
                    stm.setInt(2, month);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new ArrayList();
                        while (rs.next()) {
                            result.add(new BillDTO(rs.getInt("bill_ID"), userID, rs.getString("fullname"), rs.getString("address"), rs.getString("phone"), rs.getFloat("totalPrice"), rs.getDate("date_checkout")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }
    public static ArrayList<BillDTO> searchBillByMonth(int month) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<BillDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT B.bill_ID, B.fullname, B.phone, B.date_checkout, B.totalPrice, B.address, B.userID\n"
                        + "FROM Bills B\n"
                        + "WHERE MONTH(B.date_checkout) = ?\n"
                        + "ORDER BY B.bill_ID DESC";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setInt(1, month);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new ArrayList();
                        while (rs.next()) {
                            result.add(new BillDTO(rs.getInt("bill_ID"), rs.getString("userID"), rs.getString("fullname"), rs.getString("address"), rs.getString("phone"), rs.getFloat("totalPrice"), rs.getDate("date_checkout")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }
    public static ArrayList<BillDTO> searchBillByName(String keyword) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<BillDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT B.bill_ID, B.fullname, B.phone, B.date_checkout, B.totalPrice, B.address, B.userID\n"
                        + "FROM Bills B\n"
                        + "WHERE B.fullname LIKE ?\n"
                        + "ORDER BY B.bill_ID DESC";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, "%"+keyword+"%");
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new ArrayList();
                        while (rs.next()) {
                            result.add(new BillDTO(rs.getInt("bill_ID"), rs.getString("userID"), rs.getString("fullname"), rs.getString("address"), rs.getString("phone"), rs.getFloat("totalPrice"), rs.getDate("date_checkout")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }
}
