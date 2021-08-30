/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.CateNewsDao;
import DAO.CategoryNews;
import DAO.DateConver;
import DAO.News;
import DAO.NewsDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author admin
 */
@MultipartConfig
public class NewServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            CategoryNews ctnews = new CategoryNews();
            int id, idnews;
            CateNewsDao daoct = new CateNewsDao();
            String action = request.getParameter("action");
            News news = null;
            HttpSession session = request.getSession();
            NewsDao daonews = new NewsDao();
            if (action == null || action.equals("")) {
                request.setAttribute("ACTIONNEWS", "SaveOrUpdate");
                request.getRequestDispatcher("news.jsp").forward(request, response);
                return;
            }
            switch (action) {
                case "getByAllCate":
                    id = 1;
                    int indexPageN = 1;
                    try {
                        id = Integer.parseInt(request.getParameter("idnews"));
                        indexPageN = Integer.parseInt(request.getParameter("indexPageNews"));
                    } catch (Exception e) {
                        id = 1;
                        indexPageN = 1;
                        e.printStackTrace();
                    }
                    List<News> lsNews = daonews.getAllByCateNews(id, indexPageN);
                    int countNews = daonews.getSIZE(id);
                    int endPageNews = countNews / 16;
                    if (countNews % 16 != 0) {
                        endPageNews++;
                    }
                    int sizePage = lsNews.size();
                    session.setAttribute("idCTSession", id);
                    session.setAttribute("indexCurrentSession", indexPageN);
                    request.setAttribute("idNewsCT", id);
                    request.setAttribute("listNews", lsNews);
                    request.setAttribute("endPageN", endPageNews);
                    request.setAttribute("SizeNews", sizePage);
                    request.setAttribute("sumNews", countNews);
                    request.getRequestDispatcher("news.jsp").forward(request, response);
                    break;
                case "SaveOrUpdate":
                    idnews = Integer.parseInt(request.getParameter("news__id"));
                    String name = request.getParameter("news__name");
                    String description = request.getParameter("news_description");
                    Date date = DateConver.todate(request.getParameter("news__date"));
                    int cate = Integer.parseInt(request.getParameter("news__cate"));
                    String link = request.getParameter("news__link");
                    Part part = request.getPart("news__img");
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String dg  = "./DoAnFile/news/img";
                     try {
                        part.write("C:\\Users\\admin\\OneDrive\\Tài liệu\\NetBeansProjects\\DoAn2\\src\\main\\webapp\\DoAnFile\\news\\img" + "/" + fileName);
                    } catch (Exception e) {
                         System.out.println(e.toString());
                    }
                    String pathImg = dg + "/" + fileName;
                    news = new News(idnews, name, description, date, new CategoryNews(cate, ""), link, pathImg);
                    if (daonews.findById(idnews) == null) {
                        daonews.insert(news);
                    } else {
                        daonews.update(news);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListNews&idpage=1").forward(request, response);
                    break;
                case "AddViews":
                    request.getRequestDispatcher("editNews").forward(request, response);
                    break;
                case "EditArticle":
                    idnews = Integer.parseInt(request.getParameter("id"));
                    news = daonews.findById(idnews);
                    request.setAttribute("NW", news);
                    request.setAttribute("ACTIONNEWS", "SaveOrUpdate");
                    request.getRequestDispatcher("editNews.jsp").forward(request, response);
                    break;
                case "DeletePageNews":
                    idnews = Integer.parseInt(request.getParameter("id"));
                    int ctN = Integer.parseInt(request.getParameter("cateNID"));
                    ctN++;
                    if (daonews.findById(idnews) == null) {
                        session.setAttribute("tb1", "Product Nay Khong Ton Tai");

                    } else {
                        daonews.delete(idnews);
                    }
                    request.getRequestDispatcher("NewServlet?action=getByAllCate&idnews=" + ctN + "").forward(request, response);
                    break;
                case "DeleteNewsView":
                    idnews = Integer.parseInt(request.getParameter("id"));

                    if (daonews.findById(idnews) == null) {
                        session.setAttribute("tb1", "Product Nay Khong Ton Tai");
                    } else {
                        daonews.delete(idnews);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListNews&idpage=1").forward(request, response);
                    break;

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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
