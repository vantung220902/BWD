/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Account;
import DAO.AccountDAO;
import DAO.Cart;
import DAO.CartDao;
import DAO.CateNewsDao;
import DAO.Categories;
import DAO.CategoriesDAO;
import DAO.CategoryNews;
import DAO.MoneyOfMonth;
import DAO.News;
import DAO.NewsDao;
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
public class pageAdminServlet extends HttpServlet {

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
            String action = request.getParameter("action");
            CartDao daocart = new CartDao();
            AccountDAO daoacc = new AccountDAO();
            ProductDAO daopro = new ProductDAO();
            CateNewsDao daoctnews = new CateNewsDao();
            NewsDao daonews = new NewsDao();
            CategoriesDAO daocate = new CategoriesDAO();
            List<Cart> lscart = daocart.getTop5();
            if (action == null || action.equals("")) {
                request.setAttribute("sum", daocart.SumPrice());
                request.setAttribute("avg", daocart.AvgPrice());
                request.setAttribute("countAcc", daoacc.CountAcc());
                request.setAttribute("countCart", daocart.CountCART());
                request.setAttribute("lsCart", lscart);
                request.setAttribute("lsMoney", daocart.getSumMonth());
                request.setAttribute("lsAvg", daocart.getAvgMonth());
                request.setAttribute("lsCateChart", daopro.getLsCate());
                request.setAttribute("lsSumProCart", daocart.getSumCartPro());
                request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
                return;
            }
            switch (action) {
                case "ListPro":
                    int id = Integer.parseInt(request.getParameter("idpage"));
                    List<Product> lspro = daopro.getNext16(id);
                    List<Categories> lscate = daocate.getAll();
                    int size = daopro.getSize();
                    int endPage = size / 16;
                    if (size % 16 != 0) {
                        endPage++;
                    }
                    request.setAttribute("numberlist", endPage);
                    request.setAttribute("lsCate", lscate);
                    request.setAttribute("lsPro", lspro);
                    request.getRequestDispatcher("Viewproducts.jsp").forward(request, response);
                    break;
                case "ListCate":

                    List<Categories> lsct = daocate.getAll();
                    int sizect = daocate.getSize();
                    int endPagect = sizect / 11;
                    if (sizect % 11 != 0) {
                        endPagect++;
                    }
                    request.setAttribute("numberlistct", endPagect);
                    request.setAttribute("lsCatect", lsct);
                    request.getRequestDispatcher("category.jsp").forward(request, response);
                    break;
                case "ListAcc":
                    List<Account> lsacc = daoacc.getAll();
                    int sizeacc = daoacc.CountAcc();
                    int endPageacc = sizeacc / 10;
                    if (sizeacc % 10 != 0) {
                        endPageacc++;
                    }
                    request.setAttribute("numacc", endPageacc);
                    request.setAttribute("lsAccViews", lsacc);
                    request.getRequestDispatcher("account.jsp").forward(request, response);
                    break;
                case "ListNews":
                    int idNews = Integer.parseInt(request.getParameter("idpage"));
                    List<News> lsnews = daonews.getTop16(idNews);
                    List<CategoryNews> lsctnews = daoctnews.getAll();
                    int sizeNews = daonews.getSIZEAll();
                    int endPageNews = sizeNews / 16;
                    if (sizeNews % 16 != 0) {
                        endPageNews++;
                    }
                    request.setAttribute("numViews", endPageNews);
                    request.setAttribute("lsNews", lsnews);
                    request.setAttribute("lsnewsCt", lsctnews);
                    request.getRequestDispatcher("ViewNew.jsp").forward(request, response);
                    break;
                case "ListCart":
                    int pageCart = Integer.parseInt(request.getParameter("idpage"));
                    List<Cart> lsCarts = daocart.getNext16(pageCart);
                    int sizeCarts = daocart.getSIZE();
                    int endPageCart = sizeCarts / 16;
                    if (sizeCarts % 16 != 0) {
                        endPageCart++;
                    }
                    request.setAttribute("numCart", endPageCart);
                    request.setAttribute("lsCarts", lsCarts);
                    request.getRequestDispatcher("ViewCarts.jsp").forward(request, response);
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
