/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.category;

import dangddt.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Tam Dang
 */
public class CategoryDAO implements Serializable, ServletContextListener {

    private Vector<CategoryDTO> listCategory;

    public CategoryDAO() {
        listCategory = new Vector<>();
    }

    public Vector<CategoryDTO> getListCategory() {
        return listCategory;
    }

    public void setListCategory(Vector<CategoryDTO> listCategory) {
        this.listCategory = listCategory;
    }

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

    private void getNameCategory() {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT cateID, name\n"
                        + "FROM Categories";
                stm = con.prepareStatement(sql);
                if (null != stm) {
                    rs = stm.executeQuery();
                    if (rs != null) {
                        listCategory = new Vector<>();
                        while (rs.next()) {
                            listCategory.add(new CategoryDTO(rs.getString("cateID"), rs.getString("name")));
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeConnection(con, stm, rs);
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        getNameCategory();
        sce.getServletContext().setAttribute("CATEGORY", listCategory);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().removeAttribute("CATEGORY");
    }

}
