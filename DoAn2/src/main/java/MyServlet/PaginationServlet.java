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
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class PaginationServlet extends HttpServlet {

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
            ProductDAO daopro = new ProductDAO();
            int idSearchCT = Integer.parseInt(request.getParameter("idSearchCT"));
            int iPagin = Integer.parseInt(request.getParameter("iPagin"));
            boolean checkAD = Boolean.parseBoolean(request.getParameter("checkAD"));
            List<Product> lsPro = daopro.getAllByCate(idSearchCT, iPagin);
            int sizePro = 16;
            try {
                sizePro = lsPro.size();
            } catch (Exception e) {
            }

            HttpSession session = request.getSession();
            session.setAttribute("sizeProInPage", sizePro);
            if (checkAD) {
                for (Product pro : lsPro) {
                    out.print("<div class=\"main-product-wrap-body-item product-view col l-3 m-4 c-12\" data-aos=\"fade-right\">\n"
                            + "                            <c:if test=\"${sessionScope.privi}\">\n"
                            + "                                <a class=\"icon__admin-product\" href=\"ProductServlet?action=EditProduct&id=<%=pagepro.getId()%>\">\n"
                            + "                                    <i class=\"ti-pencil\"></i>\n"
                            + "                                </a>\n"
                            + "                            </c:if>\n"
                            + "                            <div class=\"user-desginer-product-item-img\">\n"
                            + "                                <img loading=\"lazy\" src=\"" + pro.getImgFont() + "\" alt=\"\"\n"
                            + "                                     class=\"user-desginer-product-item-img-font\">\n"
                            + "                                <img loading=\"lazy\" src=\"" + pro.getImgBehind()+ "\" alt=\"\"\n"
                            + "                                     class=\"user-desginer-product-item-img-behind\">\n"
                            + "                                <div class=\"main-slider__item-info-cart\">\n"
                            + "                                    <div class=\"main-slider__item-btn-list\">\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-like\">\n"
                            + "                                            <i class=\"ti-heart\"></i>\n"
                            + "                                        </a>\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-search\">\n"
                            + "                                            <i class=\"ti-search\"></i>\n"
                            + "                                        </a>\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-external-link\">\n"
                            + "                                            <i class=\"ti-help\"></i>\n"
                            + "                                        </a>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"main-slider__item-add-btn\">\n"
                            + "                                        <a href=\"DetailProServlet?action=watchPro&id=" + pro.getId() + "\">\n"
                            + "                                            <span>Watching Now </span><i class=\"ti-eye\"></i> </a>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <div class=\"main-slider__item-favourite\">\n"
                            + "                                    <i class=\"fas fa-check\"></i>\n"
                            + "                                    <span>Hot</span>\n"
                            + "                                </div>\n"
                            + "                                <div class=\"main-slider__item-sale\">\n"
                            + "                                    <span class=\"main-slider__item-sale-persent\">" + pro.getRerentageDiscoint() + "</span>\n"
                            + "                                    <span class=\"main-slider__item-sale-discount\">Discount</span>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                            <div class=\"user-desginer-product-item-desc\">\n"
                            + "                                <a href=\"\"\n"
                            + "                                   class=\"user-desginer-product-item-desc-link user-desginer-product-item-desc-item\">\n"
                            + "                                   " + pro.getName() + "\n"
                            + "                                </a>\n"
                            + "                                <div class=\"user-desginer-product-item-desc-link-price\">\n"
                            + "                                    <a href=\"\"\n"
                            + "                                       class=\"user-desginer-product-item-desc-link-price-old user-desginer-product-item-desc-item\">\n"
                            + "                                        <span> " + pro.getPriceOld() + "VND</span>\n"
                            + "                                    </a>\n"
                            + "                                    <a href=\"\"\n"
                            + "                                       class=\"user-desginer-product-item-desc-link-price-new user-desginer-product-item-desc-item\">\n"
                            + "                                        " + pro.getPriceOld() + "VND\n"
                            + "                                    </a>\n"
                            + "                                </div>\n"
                            + "                                <a href=\"CartServlet?idCart=" + pro.getId() + "\" class=\"user-desginer-product-item-desc-add-cart\">Add Cart</a>\n"
                            + "                            </div>\n"
                            + "                            <c:if test=\"${sessionScope.privi}\">\n"
                            + "                                <a class=\"icon__admin-product\" href=\"ProductServlet?action=DeletePageProduct&id=" + pro.getId() + "\">\n"
                            + "                                    <i class=\"ti-trash\"></i>\n"
                            + "                                </a>\n"
                            + "                            </c:if>\n"
                            + "                        </div>");
                }
            } else {
                for (Product pro : lsPro) {
                    out.print("<div class=\"main-product-wrap-body-item product-view col l-3 m-4 c-12\" data-aos=\"fade-right\">\n"
                            + "                            <div class=\"user-desginer-product-item-img\">\n"
                            + "                                <img loading=\"lazy\" src=\"" + pro.getImgFont() + "\" alt=\"\"\n"
                            + "                                     class=\"user-desginer-product-item-img-font\">\n"
                            + "                                <img loading=\"lazy\" src=\"" + pro.getImgBehind() + "\" alt=\"\"\n"
                            + "                                     class=\"user-desginer-product-item-img-behind\">\n"
                            + "                                <div class=\"main-slider__item-info-cart\">\n"
                            + "                                    <div class=\"main-slider__item-btn-list\">\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-like\">\n"
                            + "                                            <i class=\"ti-heart\"></i>\n"
                            + "                                        </a>\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-search\">\n"
                            + "                                            <i class=\"ti-search\"></i>\n"
                            + "                                        </a>\n"
                            + "                                        <a class=\"main-slider__item-btn main-slider__item-btn-external-link\">\n"
                            + "                                            <i class=\"ti-help\"></i>\n"
                            + "                                        </a>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"main-slider__item-add-btn\">\n"
                            + "                                        <a href=\"DetailProServlet?action=watchPro&id=" + pro.getId() + "\">\n"
                            + "                                            <span>Watching Now </span><i class=\"ti-eye\"></i> </a>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <div class=\"main-slider__item-favourite\">\n"
                            + "                                    <i class=\"fas fa-check\"></i>\n"
                            + "                                    <span>Hot</span>\n"
                            + "                                </div>\n"
                            + "                                <div class=\"main-slider__item-sale\">\n"
                            + "                                    <span class=\"main-slider__item-sale-persent\">" + pro.getRerentageDiscoint() + "</span>\n"
                            + "                                    <span class=\"main-slider__item-sale-discount\">Discount</span>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                            <div class=\"user-desginer-product-item-desc\">\n"
                            + "                                <a href=\"\"\n"
                            + "                                   class=\"user-desginer-product-item-desc-link user-desginer-product-item-desc-item\">\n"
                            + "                                   " + pro.getName() + "\n"
                            + "                                </a>\n"
                            + "                                <div class=\"user-desginer-product-item-desc-link-price\">\n"
                            + "                                    <a href=\"\"\n"
                            + "                                       class=\"user-desginer-product-item-desc-link-price-old user-desginer-product-item-desc-item\">\n"
                            + "                                        <span> " + pro.getPriceOld() + "VND</span>\n"
                            + "                                    </a>\n"
                            + "                                    <a href=\"\"\n"
                            + "                                       class=\"user-desginer-product-item-desc-link-price-new user-desginer-product-item-desc-item\">\n"
                            + "                                        " + pro.getPriceOld() + "VND\n"
                            + "                                    </a>\n"
                            + "                                </div>\n"
                            + "                                <a href=\"CartServlet?idCart=" + pro.getId() + "\" class=\"user-desginer-product-item-desc-add-cart\">Add Cart</a>\n"
                            + "                            </div>\n"
                            + "                        </div>");
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
