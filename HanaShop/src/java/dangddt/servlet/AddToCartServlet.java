/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.servlet;

import dangddt.product.ProductDTO;
import dangddt.cart.CartObject;
import dangddt.product.ProductDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author tamda
 */

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    private final String ERROR_PAGE = "error";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //B1. Tạo view cho chức năng AddToCart trong shopping.jsp
    //B2. Map label của form với tên resource:AddToCartServlet trong file indexPage.txt
    //B3. Tạo Servlet chức năng.
    //B4. Response HTML String về để hiển thị cho Client.
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String response_tail = request.getParameter("response_tail");
        String url = ERROR_PAGE;
        try {
            //1. Đi đến chỗ để giỏ
            HttpSession session = request.getSession();
            if (session != null) {
                //2.Lấy cái giỏ
                CartObject cart = (CartObject) session.getAttribute("CART");
                if (cart==null){
                    cart = new CartObject();
                }
                //3. Lấy món hàng cần thêm vào giỏ ở chỗ để món hàng
                String proID = request.getParameter("proID").trim();
                String proName = request.getParameter("proName").trim();
                String proImg = request.getParameter("proImg").trim();
                String proPriceString = request.getParameter("proPrice").trim();
                Float proPriceFloat = Float.parseFloat(proPriceString);
                ProductDTO dto = new ProductDTO(proID, proName, 1, proImg, proPriceFloat);
                //4.Thêm món hàng vào giỏ
                cart.addItemToCart(dto);
                session.setAttribute("CART", cart);
                Vector<ProductDTO> suggestProducts = ProductDAO.loadSuggestProducts(proID);
                request.setAttribute("SUGGEST_PRODUCTS", suggestProducts);
                url = "MainController?"+response_tail;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
