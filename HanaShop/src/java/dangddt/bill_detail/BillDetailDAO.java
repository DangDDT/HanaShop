/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.bill_detail;

import dangddt.product.ProductDTO;
import dangddt.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Tam Dang
 */
public class BillDetailDAO {
     public static boolean createBillDetail(int billId, List<ProductDTO> listProduct)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            int row = 0;
            int totalrow = 0;
            if (con != null) {
                for (ProductDTO productDTO : listProduct) {
                    String productID = productDTO.getProID();
                    int product_quantity = productDTO.getQuantity();
                    String sql = "Insert Bill_Details Values (?,?,?)";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, billId);
                    stm.setString(2, productID);
                    stm.setInt(3, product_quantity);
                    row = stm.executeUpdate();
                    totalrow = totalrow + row;
                }
            }
            if (totalrow == listProduct.size()) {
                return true;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
