/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.product;

import dangddt.bill_detail.BillDetailDTO;
import dangddt.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Vector;
import javax.naming.NamingException;

/**
 *
 * @author Tam Dang
 */
public class ProductDAO implements Serializable {

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

    public static Vector<ProductDTO> loadFavoriteProducts(String userID) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, P.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', P.cateID\n"
                        + "   FROM Products P JOIN Categories C ON P.cateID = C.cateID \n"
                        + "   WHERE P.productID IN (SELECT BD.productID\n"
                        + "			 FROM Bills B JOIN Bill_Details BD ON B.bill_ID=BD.bill_ID\n"
                        + "			 WHERE B.userID LIKE ? \n"
                        + "			 GROUP BY BD.productID\n"
                        + "			 ORDER BY COUNT(BD.productID) DESC \n"
                        + "			 OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY) AND P.status = 1 AND P.quantity > 0";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, "%" + userID + "%");
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new Vector<>();
                        while (rs.next()) {
                            result.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }
    public static int countPro() throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT Count(name)\n"
                        + "FROM Products where status = 1 and quantity >0\n";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    rs = stm.executeQuery();
                    if (rs != null) {
                        if (rs.next()) {
                            count = rs.getInt(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return count;
    }
    public static Vector<ProductDTO> loadProduct(int pageIndex) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, P.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', P.cateID\n"
                        + "FROM Products P JOIN Categories C ON P.cateID = C.cateID\n"
                        + "WHERE status = 1 and quantity >0\n"
                        + "ORDER BY created_date DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setInt(1, (pageIndex - 1) * 20);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new Vector<>();
                        while (rs.next()) {
                            result.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }

    public static int countProByName(String name) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT Count(name)\n"
                        + "FROM Products\n"
                        + "WHERE name LIKE ? and status = 1 and quantity >0";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, "%" + name + "%");
                    rs = stm.executeQuery();
                    if (rs != null) {
                        if (rs.next()) {
                            count = rs.getInt(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return count;
    }

    public static Vector<ProductDTO> searchProByName(String name, int pageIndex) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, P.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', P.cateID\n"
                        + "FROM Products P JOIN Categories C ON P.cateID = C.cateID\n"
                        + "WHERE P.name LIKE ? and status = 1 and quantity >0\n"
                        + "ORDER BY created_date DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, "%" + name + "%");
                    stm.setInt(2, (pageIndex - 1) * 20);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new Vector<>();
                        while (rs.next()) {
                            result.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }

    public static int countProByCategory(String category) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT Count(P.name)\n"
                        + "FROM Categories C JOIN Products P ON C.cateID = P.cateID\n"
                        + "WHERE C.name = ? and status = 1 and quantity >0";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, category);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        if (rs.next()) {
                            count = rs.getInt(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return count;
    }

    public static Vector<ProductDTO> searchProByCategory(String category, int pageIndex) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, P.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', P.cateID\n"
                        + "FROM Products P JOIN Categories C ON P.cateID = C.cateID\n"
                        + "WHERE C.name = ? and status = 1 and quantity >0\n"
                        + "ORDER BY created_date DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY;";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, category);
                    stm.setInt(2, (pageIndex - 1) * 20);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new Vector<>();
                        while (rs.next()) {
                            result.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }

    public static int countProByRange(float min_price, float max_price) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT Count(P.name)\n"
                        + "FROM Categories C JOIN Products P ON C.cateID = P.cateID\n"
                        + "WHERE (P.price BETWEEN ? AND ?) AND (P.status = 1) AND (P.quantity >0)";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setFloat(1, min_price);
                    stm.setFloat(2, max_price);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        if (rs.next()) {
                            count = rs.getInt(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return count;
    }

    public static Vector<ProductDTO> searchProByRange(float min_price, float max_price, int pageIndex) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> result;
        result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, P.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', P.cateID\n"
                        + "FROM Products P JOIN Categories C ON P.cateID = C.cateID\n"
                        + "WHERE (P.price BETWEEN ? AND ?) AND (P.status = 1) AND (P.quantity > 0)\n"
                        + "ORDER BY created_date DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY;";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setFloat(1, min_price);
                    stm.setFloat(2, max_price);
                    stm.setInt(3, (pageIndex - 1) * 20);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        result = new Vector<>();
                        while (rs.next()) {
                            result.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return result;
    }

    public static void updateProduct(String proID, String name, int quantity, String img, String des, float price, int status, String cateID, String updated_user) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE Products SET name = ?, quantity = ?, image = ?, description = ?, price = ROUND(?,2), updated_date = GETDATE(), status = ?, cateID = ?, updated_user = ? where productID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setInt(2, quantity);
                stm.setString(3, img);
                stm.setString(4, des);
                stm.setFloat(5, price);
                stm.setInt(6, status);
                stm.setString(7, cateID);
                stm.setString(8, updated_user);
                stm.setString(9, proID);
                int row = stm.executeUpdate();
            }
        } finally {
            closeConnection(con, stm, rs);
        }
    }

    public static void deleteProduct(String proID, String updated_user) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE Products SET status = 0, updated_user = ?, updated_date = GETDATE() where productID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, updated_user);
                stm.setString(2, proID);
                int row = stm.executeUpdate();
            }
        } finally {
            closeConnection(con, stm, rs);
        }
    }

    public static Vector<ProductDTO> loadProductInBillDetail(int bill_ID) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> list;
        list = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT B.bill_ID, BD.quantity, P.name, P.image, P.price \n"
                        + "FROM (Bills B JOIN Bill_Details BD ON B.bill_ID=BD.bill_ID) JOIN Products P ON P.productID = BD.productID\n"
                        + "WHERE B.bill_ID = ?";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setInt(1, bill_ID);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        list = new Vector<>();
                        while (rs.next()) {
                            list.add(new ProductDTO(rs.getString("name"), rs.getInt("quantity"), rs.getString("image"), rs.getFloat("price")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return list;
    }

    public static Vector<ProductDTO> loadSuggestProducts(String proID) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<ProductDTO> list;
        list = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productID, Products.name, quantity, image, description, price, created_date, updated_date, updated_user, status, C.name as 'category', Products.cateID\n"
                        + "FROM Products JOIN Categories C ON Products.cateID = C.cateID\n"
                        + "WHERE Products.productID IN \n"
                        + "((SELECT Bill_Details.productID\n"
                        + "FROM Bill_Details\n"
                        + "WHERE bill_ID IN (SELECT Bill_Details.bill_ID\n"
                        + "					FROM Bill_Details\n"
                        + "					WHERE productID = ?)\n"
                        + ")EXCEPT (SELECT Bill_Details.productID\n"
                        + "		FROM Bill_Details\n"
                        + "		WHERE productID = ?)) AND Products.status = 1 AND Products.quantity > 0\n"
                        + "ORDER BY Products.quantity DESC\n"
                        + "OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY ";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, proID);
                    stm.setString(2, proID);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        list = new Vector<>();
                        while (rs.next()) {
                            list.add(new ProductDTO(rs.getString("productID"), rs.getString("name"), rs.getInt("quantity"),
                                    rs.getString("image"), rs.getString("description"), rs.getFloat("price"), rs.getDate("created_date"),
                                    rs.getDate("updated_date"), rs.getString("updated_user"), rs.getBoolean("status"), rs.getString("category"), rs.getString("cateID")));
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return list;
    }
    public static void addProduct(String proID, String name, int quantity, String des, float price, String img, String cateID) throws ClassNotFoundException, SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO Products VALUES (?,?,?,?,?,ROUND(?,2),GETDATE(),NULL,1,?,NULL)";
                stm = con.prepareStatement(sql);
                stm.setString(1, proID);
                stm.setString(2, name);
                stm.setInt(3, quantity);
                stm.setString(4, img);
                stm.setString(5, des);
                stm.setFloat(6, price);
                stm.setString(7, cateID);
                int row = stm.executeUpdate();
            }
        } finally {
            closeConnection(con, stm, rs);
        }
    }
    public static String getNewID() throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String newID = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select CONCAT('P',SUBSTRING('000',1,3-LEN(CAST(SUBSTRING(MAX(productID),2,3) AS INT)+1)),CAST(SUBSTRING(MAX(productID),2,3) AS INT)+1)\n"
                        + "FROM Products";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    rs = stm.executeQuery();
                    if (rs != null) {
                        if (rs.next()) {
                            newID = rs.getString(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return newID;
    }
    public static int getQuantityRemain(String proID) throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quantity_remain = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT quantity\n"
                        + "FROM Products\n"
                        + "WHERE productID = ?";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    stm.setString(1, proID);
                    rs = stm.executeQuery();
                    if (rs != null) {
                        while (rs.next()) {
                          quantity_remain = rs.getInt(1);
                        }
                    }
                }
            }
        } finally {
            closeConnection(con, stm, rs);
        }
        return quantity_remain;
    }
}
