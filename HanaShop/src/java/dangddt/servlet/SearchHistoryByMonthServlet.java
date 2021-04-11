/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.servlet;

import dangddt.account.AccountDTO;
import dangddt.bill.BillDAO;
import dangddt.bill.BillDTO;
import dangddt.bill_detail.BillDetailDTO;
import dangddt.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "SearchHistoryByMonthServlet", urlPatterns = {"/SearchHistoryByMonthServlet"})
public class SearchHistoryByMonthServlet extends HttpServlet {
    private final static String CART = "history.jsp";
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
        String url = CART;
        String userID = null;
        boolean isAdmin = false;
        try{
            HttpSession session = request.getSession(false);
            String monthString = request.getParameter("month");
            int monthInt = Integer.parseInt(monthString);
            if (session.getAttribute("ACCOUNT") instanceof GooglePojo){
                userID = ((GooglePojo) session.getAttribute("ACCOUNT")).getUserID();
            }else{
                userID = ((AccountDTO) session.getAttribute("ACCOUNT")).getUserID();
                isAdmin = ((AccountDTO) session.getAttribute("ACCOUNT")).isIsAdmin();
            }
            ArrayList<BillDTO> bills = new ArrayList();
            if (isAdmin){
                bills = BillDAO.searchBillByMonth(monthInt);
            }else{
                bills = BillDAO.searchBillByMonth(userID, monthInt);
            }
            request.setAttribute("BILLS_HISTORY", bills);
            BillDetailDTO billDetailDTO = new BillDetailDTO();
            for (BillDTO bill : bills) {
                billDetailDTO.getBillDetail().put(bill.getBillID(), ProductDAO.loadProductInBillDetail(bill.getBillID()));
            }
            request.setAttribute("BILLS_DETAIL_HISTORY", billDetailDTO);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchHistoryByMonthServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchHistoryByMonthServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SearchHistoryByMonthServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            request.getRequestDispatcher(url).forward(request, response);
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
