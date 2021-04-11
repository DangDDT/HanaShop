/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.servlet;

import dangddt.account.AccountDTO;
import dangddt.bill.BillDAO;
import dangddt.bill_detail.BillDetailDAO;
import dangddt.cart.CartObject;
import dangddt.product.ProductDAO;
import dangddt.product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.AccessibleAttribute;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stackjava.com.accessgoogle.common.GooglePojo;

/**
 *
 * @author Tam Dang
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/CheckOutServlet"})
public class CheckOutServlet extends HttpServlet {

    private static final String SUCCESS = "MainController?btAction=load_data&pageIndex=1";
    private static final String OUT_OF_STOCK = "cart.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Integer> out_of_stock = null;
        String url = null;
        try {
            HttpSession session;
            session = request.getSession(false);
            String userID = null;
            if (session.getAttribute("ACCOUNT") instanceof GooglePojo) {
                GooglePojo account = (GooglePojo) session.getAttribute("ACCOUNT");
                userID = account.getUserID().trim();
            } else {
                AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                userID = account.getUserID().trim();
            }
            String fullname = request.getParameter("txtFullname").trim();
            String address = request.getParameter("txtAddress").trim();
            String phone = request.getParameter("txtPhone").trim();
            String totalPriceString = request.getParameter("txtTotalPrice").trim();
            float totalPriceFloat = (float) (Math.ceil((Float.parseFloat(totalPriceString)) * 100) / 100); // Update 15/01/2021
            String[] quantity;
            quantity = request.getParameterValues("txtQuantity");
            List<ProductDTO> list = null;
            session = request.getSession(false);
            CartObject cart = (CartObject) session.getAttribute("CART");
            int quantity_index = 0;
            for (ProductDTO value : cart.getItems().values()) {
                value.setQuantity(Integer.parseInt(quantity[quantity_index]));
                quantity_index++;
                System.out.println(value.getQuantity());
            }
            out_of_stock = new HashMap<>();
            for (String proID : cart.getItems().keySet()) {
                System.out.println(ProductDAO.getQuantityRemain(proID));
                if (cart.getItems().get(proID).getQuantity() > ProductDAO.getQuantityRemain(proID)) {
                    out_of_stock.put(proID, ProductDAO.getQuantityRemain(proID));
                }
            }
            System.out.println(out_of_stock.containsKey(url));
            System.out.println(out_of_stock.size());
            if (!out_of_stock.isEmpty()) {
                url = OUT_OF_STOCK;
                request.setAttribute("OUT_OF_STOCK", out_of_stock);
                request.getRequestDispatcher(url).forward(request, response);
            } else if (out_of_stock.isEmpty()) {
                session = request.getSession(false);
                if (null != session) {
                    int createBill = BillDAO.createBill(fullname, address, phone, totalPriceFloat, userID);
                    if (createBill > 0) {
                        cart = (CartObject) session.getAttribute("CART");
                        if (cart != null) {
                            list = new ArrayList<>();
                            Map<String, ProductDTO> items = cart.getItems();
                            for (ProductDTO value : items.values()) {
                                list.add(value);
                            }
                        }
                        if (list != null) {
                            int billID = createBill;
                            boolean createBillDetail = BillDetailDAO.createBillDetail(billID, list);
                            if (createBill > 0 && createBillDetail) {
                                url = SUCCESS;
                                session.removeAttribute("CART");
                                response.sendRedirect(url);
                            }
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
