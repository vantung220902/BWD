/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Product;
import DAO.ProductDAO;
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
public class PaginProAmin extends HttpServlet {

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
            ProductDAO daopro = new ProductDAO();
            int idpage = Integer.parseInt(request.getParameter("iPagin"));
            List<Product> lspro = daopro.getNext16(idpage);
            for (Product pro : lspro) {
                out.println("<tr>\n"
                        + "                                            <td>"+pro.getId()+"</td>\n"
                        + "                                            <td class=\"product-img-admin\">\n"
                        + "                                                <img loading=\"lazy\" src=\""+pro.getImgFont()+"\" style=\"max-width: 40px;\" alt=\"img\">\n"
                        + "                                            </td>\n"
                        + "                                            <td class=\"product-img-admin\">\n"
                        + "                                                <img loading=\"lazy\" src=\""+pro.getImgBehind()+"\" style=\"max-width: 40px;\" alt=\"img\">\n"
                        + "                                            </td>\n"
                        + "                                            <td>"+pro.getName()+"</td>\n"
                        + "                                            <td>"+pro.getPriceOld()+"</td>\n"
                        + "                                            <td>"+pro.getPriceNew()+"</td>\n"
                        + "                                            <td style=\"text-align:center\"><b>"+pro.getQuantity()+"</b></td>\n"
                        + "                                            <td>"+pro.getCateID().getName()+"</td>  \n"
                        + "                                            <td>"+pro.getDescription()+"</td>\n"
                        + "                                            <td>"+pro.getMannufactureDate()+"</td> \n"
                        + "                                            <td>"+pro.getRerentageDiscoint()+"</td> \n"
                        + "                                            <td>\n"
                        + "                                                <a href=\"ProductServlet?action=EditProduct&id="+pro.getId()+"\"><button type=\"button\" class=\"btn btn-primary\">Sửa</button></a>\n"
                        + "                                                <a href=\"ProductServlet?action=DeleteProductView&id="+pro.getId()+"\"><button type=\"button\" class=\"btn btn-secondary\">Xoá</button></a>\n"
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
