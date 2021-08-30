/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.News;
import DAO.NewsDao;
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
public class PaginNewAdmin extends HttpServlet {

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
            NewsDao dao = new NewsDao();
            int id = Integer.parseInt(request.getParameter("iPagin"));
            List<News> ls = dao.getTop16(id);
            for (News news : ls) {
                out.println(" <tr>\n"
                        + "                                            <td>"+news.getId()+"</td>\n"
                        + "                                            <td class=\"product-img-admin\">\n"
                        + "                                                <img src=\""+news.getImg()+"\" loading=\"lazy\" style=\"max-width: 40px;\" alt=\"img\">\n"
                        + "                                            </td>\n"
                        + "\n"
                        + "                                            <td>"+news.getName()+"</td>\n"
                        + "                                            <td>"+news.getDescription()+"</td>\n"
                        + "                                            <td>"+news.getDataSubmit()+"</td>\n"
                        + "                                            <td>"+news.getCateid().getName()+"</td>  \n"
                        + "                                            <td>"+news.getLink()+"</td>\n"
                        + "                                            <td>\n"
                        + "                                                <a href=\"NewServlet?action=EditArticle&id="+news.getId()+"\"><button type=\"button\" class=\"btn btn-primary\">Sửa</button></a>\n"
                        + "                                                <a href=\"NewServlet?action=DeleteNewsView&id="+news.getId()+"\"><button type=\"button\" class=\"btn btn-secondary\">Xoá</button></a>\n"
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
