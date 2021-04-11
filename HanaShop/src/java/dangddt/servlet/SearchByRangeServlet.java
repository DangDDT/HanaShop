/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.servlet;

import dangddt.product.ProductDAO;
import dangddt.product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tam Dang
 */
@WebServlet(name = "SearchByRangeServlet", urlPatterns = {"/SearchByRangeServlet"})
public class SearchByRangeServlet extends HttpServlet {
    private static final int MAX_PRODUCT_IN_PAGE = 20;
    private final static String SEARCH_PAGE = "index.jsp";
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
        String url = SEARCH_PAGE;
        int page = 0;
        try {
            String min_priceString = request.getParameter("min_price").trim();
            float min_priceFloat = Float.parseFloat(min_priceString);
            String max_priceString = request.getParameter("max_price").trim();
            float max_priceFloat = Float.parseFloat(max_priceString);
            String pageIndexString = request.getParameter("pageIndex").trim();
            int pageIndexInt = Integer.parseInt(pageIndexString);
            Vector<ProductDTO> result = ProductDAO.searchProByRange(min_priceFloat, max_priceFloat, pageIndexInt);
            page = (int) Math.ceil((double) ProductDAO.countProByRange(min_priceFloat, max_priceFloat) / MAX_PRODUCT_IN_PAGE);
            request.setAttribute("RESULT_SEARCH", result);
            if (result.size() > 0) {
                if (page == 0) {
                    page = 1;
                }
            }
            request.setAttribute("PAGE_COUNT", page);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchByRangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchByRangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SearchByRangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
