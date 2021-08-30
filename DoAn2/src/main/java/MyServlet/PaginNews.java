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
public class PaginNews extends HttpServlet {

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
        try {
            NewsDao dao = new NewsDao();
            int idSearchCT = Integer.parseInt(request.getParameter("idSearchCT"));
            int iPagin = Integer.parseInt(request.getParameter("iPagin"));
            List<News> lsnews = dao.getAllByCateNews(idSearchCT, iPagin);
            boolean checkAD = Boolean.parseBoolean("checkAD");
            System.out.println("Succes" + lsnews.size());
            if (checkAD) {
                for (News news : lsnews) {
                    out.println("<div class=\"col l-6 m-6 c-12\">\n"
                            + " <c:if test=\"${sessionScope.privi}\">\n"
                            + "                                    <a class=\"icon__admin-product\" href=\"NewServlet?action=EditArticle&id=" + news.getId() + "\">\n"
                            + "                                        <i class=\"ti-pencil\"></i>\n"
                            + "                                    </a>\n"
                            + "                                </c:if>"
                            + "                                <div class=\"container__news-item \">\n"
                            + "                                    <img src=\"" + news.getImg() + "\" alt=\"\" loading=\"lazy\" class=\"container__news-item-img\">\n"
                            + "                                    <div class=\"container__news-item-desc\">\n"
                            + "                                        <h2>" + news.getCateid().getName() + "</h2>\n"
                            + "                                        <div class=\"container__news-item-date\">\n"
                            + "                                            <span>" + news.getDataSubmit() + "</span>\n"
                            + "                                            <span>23:35 GMT+07:00</span>\n"
                            + "                                        </div>\n"
                            + "                                        <h4>" + news.getName() + "</h4>\n"
                            + "                                        <p>" + news.getDescription() + "</p>\n"
                            + "                                        <a href=\"" + news.getLink() + "\" class=\"btn\">Xem Ngay</a>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + " <c:if test=\"${sessionScope.privi}\">\n"
                            + "                                    <a class=\"icon__admin-product\" href=\"NewServlet?action=DeletePageNews&id=" + news.getId() + "&cateNID=" + news.getCateid().getId() + 1 + "\">\n"
                            + "                                        <i class=\"ti-trash\"></i>\n"
                            + "                                    </a>\n"
                            + "                                </c:if>"
                            + "                            </div>");
                }
            } else {
                for (News news : lsnews) {
                    out.println("<div class=\"col l-6 m-6 c-12\">\n"
                            + "                                <div class=\"container__news-item \">\n"
                            + "                                    <img src=\"" + news.getImg() + "\" alt=\"\" loading=\"lazy\" class=\"container__news-item-img\">\n"
                            + "                                    <div class=\"container__news-item-desc\">\n"
                            + "                                        <h2>" + news.getCateid().getName() + "</h2>\n"
                            + "                                        <div class=\"container__news-item-date\">\n"
                            + "                                            <span>" + news.getDataSubmit() + "</span>\n"
                            + "                                            <span>23:35 GMT+07:00</span>\n"
                            + "                                        </div>\n"
                            + "                                        <h4>" + news.getName() + "</h4>\n"
                            + "                                        <p>" + news.getDescription() + "</p>\n"
                            + "                                        <a href=\"" + news.getLink() + "\" class=\"btn\">Xem Ngay</a>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                            </div>");
                }
            }

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
