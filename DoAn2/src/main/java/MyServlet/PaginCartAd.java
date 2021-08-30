/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Cart;
import DAO.CartDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class PaginCartAd extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            CartDao dao = new CartDao();
            int id = Integer.parseInt(request.getParameter("iPagin"));
            List<Cart> ls = dao.getNext16(id);
            for (Cart cart : ls) {
                out.println("<tr>\n"
                        + "                                            <td>" + cart.getId() + "</td>\n"
                        + "                                            <td>\n"
                        + "                                                " + cart.getProid() + "\n"
                        + "                                            </td>\n"
                        + "                                            <td>" + cart.getQuantity() + "</td>\n"
                        + "                                            <td>" + cart.getPrice() + "</td>\n"
                        + "                                            <td>" + cart.getStatus() + "</td>\n"
                        + "                                            <td>" + cart.getUsername() + "</td>  \n"
                        + "                                            <td>" + cart.getName() + "</td>\n"
                        + "                                            <td>" + cart.getCreateDate() + "</td>\n"
                        + "                                            <td>\n"
                        + "                                                <a href=\"CartADServlet?action=Edit&cart_id="+cart.getId()+"\"><button type=\"button\" class=\"btn btn-primary\">Sửa</button></a>\n"
                        + "                                                <a href=\"CartADServlet?action=Delete&cart_id="+cart.getId()+"\"><button type=\"button\" class=\"btn btn-secondary\">Xoá</button></a>"
                        + "                                            </td> \n"
                        + "                                        </tr>");
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
