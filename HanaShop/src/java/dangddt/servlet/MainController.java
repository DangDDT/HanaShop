/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.servlet;

import dangddt.account.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tam Dang
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String INITIALIZE_CONTROLLER = "LoadDataServlet";
    private static final String LOGIN_CONTROLLER = "LoginServlet";
    private static final String LOGOUT_CONTROLLER = "LogoutServlet";
    private static final String SEARCH_BY_NAME_CONTROLLER = "SearchProductByNameServlet";
    private static final String SEARCH_BY_RANGE_CONTROLLER = "SearchByRangeServlet";
    private static final String SEARCH_BY_CATEGORY_CONTROLLER = "SearchProductByCategoryServlet";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductServlet";
    private static final String DELETE_PRODUCTS_CONTROLLER = "DeleteProductsServlet";
    private static final String ADD_TO_CART_PRODUCTS_CONTROLLER = "AddToCartServlet";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutServlet";
    private static final String REMOVE_FROM_CART_CONTROLLER = "RemoveFromCartServlet";
    private static final String LOAD_HISTORY_BY_USERID = "LoadHistoryServlet";
    private static final String SEARCH_HISTORY_BY_MONTH = "SearchHistoryByMonthServlet";
    private static final String SEARCH_HISTORY_BY_NAME = "SearchHistoryByNameServlet";
    private static final String ADD_PRODUCT = "AddProductServlet";
    
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
        String url = null;
        try {
            String req = request.getParameter("btAction");
            if (null == req) {
//                Cookie[] cookies = request.getCookies();
//                if (cookies[cookies.length-1].getName().equals(" ")){
//                    url = "login.jsp";
//                } else {
//                    url = INITIALIZE_CONTROLLER;
//                }
                url = INITIALIZE_CONTROLLER;
            } else {
                switch (req) {
                    case "":
                        break;
                    case "load_data":
                        url = INITIALIZE_CONTROLLER;
                        break;
                    case "login":
                        url = LOGIN_CONTROLLER;
                        break;
                    case "logout":
                        url = LOGOUT_CONTROLLER;
                        break;
                    case "search_by_name":
                        url = SEARCH_BY_NAME_CONTROLLER;
                        break;
                    case "search_by_range":
                        url = SEARCH_BY_RANGE_CONTROLLER;
                        break;
                    case "search_by_category":
                        url = SEARCH_BY_CATEGORY_CONTROLLER;
                        break;
                    case "update":
                        url = UPDATE_PRODUCT_CONTROLLER;
                        break;
                    case "delete":
                        url = DELETE_PRODUCTS_CONTROLLER;
                        break;
                    case "add_to_cart":
                        url = ADD_TO_CART_PRODUCTS_CONTROLLER;
                        break;
                    case "check_out":
                        url = CHECK_OUT_CONTROLLER;
                        break;
                    case "remove_from_cart":
                        url = REMOVE_FROM_CART_CONTROLLER;
                        break;
                    case "load_history":
                        url = LOAD_HISTORY_BY_USERID;
                        break;
                    case "search_history_by_month":
                        url = SEARCH_HISTORY_BY_MONTH;
                        break;
                    case "search_history_by_name":
                        url = SEARCH_HISTORY_BY_NAME;
                        break;
                    case "add_product":
                        url = ADD_PRODUCT;
                        break;
                }
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
