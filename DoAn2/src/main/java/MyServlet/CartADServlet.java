/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Cart;
import DAO.CartDao;
import DAO.DateConver;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class CartADServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int id = 0;
            CartDao dao = new CartDao();
            int proid = 0;
            int quantity = 0;
            int price = 0;
            String status = null;
            String username = null;
            String name = null;
            Date date = null;
             Cart cart = null;
            switch (action) {
                case "Save":
                    id = Integer.parseInt(request.getParameter("cart_id"));
                    proid = Integer.parseInt(request.getParameter("pro_id"));
                    quantity = Integer.parseInt(request.getParameter("cart_quantity"));
                    price = Integer.parseInt(request.getParameter("cart_pri"));
                    status = request.getParameter("cart_sa");
                    username = request.getParameter("cart_us");
                    name = (request.getParameter("cart_na"));
                    date = DateConver.todate(request.getParameter("cart_date"));
                   cart = new Cart(id, proid, quantity, price, status, username, name, date);
                    if (dao.findId(id) == null) {
                        dao.insert(cart);
                    } else {
                        dao.Update(cart);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListCart&idpage=1").forward(request, response);
                    break;
                case "Edit":
                    id = Integer.parseInt(request.getParameter("cart_id"));
                    cart = dao.findId(id);
                    request.setAttribute("CART", cart);
                    request.setAttribute("ACTION", "Save");
                    request.getRequestDispatcher("editCart.jsp").forward(request, response);
                    break;
                   case"Delete":
                    id = Integer.parseInt(request.getParameter("cart_id"));
                    dao.delete(id);
                    request.getRequestDispatcher("pageAdminServlet?action=ListCart&idpage=1").forward(request, response);
                    break;
            }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CartADServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CartADServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
