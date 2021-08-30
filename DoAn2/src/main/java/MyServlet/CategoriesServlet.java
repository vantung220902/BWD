/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Categories;
import DAO.CategoriesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class CategoriesServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            CategoriesDAO daocate = new CategoriesDAO();
            Categories cate = null;
            String name;
            int id;
            String tbloi;
            HttpSession session = request.getSession();
            if (action == null || action.equals("")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            switch (action) {
                case "MinusCate":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    if (cate != null) {
                        int i = daocate.delete(id);
                        if (i == -1) {
                            session.setAttribute("tbloiCate", "Cate Nay Van Dang Con San Pham");
                        } else {
                            session.setAttribute("tbloiCate", "");
                        }

                    }
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "MinusCateProduct":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    if (cate != null) {
                        int i = daocate.delete(id);
                        if (i == -1) {
                            session.setAttribute("tbloiCate", "Cate Nay Van Dang Con San Pham");
                        }
                    }
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                    break;
                case "MinusCateViews":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    if (cate != null) {
                        int i = daocate.delete(id);
                        if (i == -1) {
                            session.setAttribute("tbloiCate", "Cate Nay Van Dang Con San Pham");
                        }
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListCate&idpagect=1").forward(request, response);
                    break;
                case "AddCate":
                    name = request.getParameter("NameCate");
                    id = Integer.parseInt(request.getParameter("IDCate"));
                    cate = new Categories(id, name);
                    if (daocate.findbyid(id) == null) {
                        daocate.insert(cate);
                    } else {
                        daocate.update(cate);

                    }
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
               
                case "AddCateProduct":
                    name = request.getParameter("NameCate");
                    id = Integer.parseInt(request.getParameter("IDCate"));
                    cate = new Categories(id, name);
                    if (daocate.findbyid(id) == null) {
                        daocate.insert(cate);
                    } else {
                        daocate.update(cate);

                    }
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                    break;
                case "AddCateView":
                    name = request.getParameter("NameCate");
                    id = Integer.parseInt(request.getParameter("IDCate"));
                    cate = new Categories(id, name);
                    if (daocate.findbyid(id) == null) {
                        daocate.insert(cate);
                    } else {
                        daocate.update(cate);

                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListCate&idpagect=1").forward(request, response);
                    break;
                case "EditCate":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    tbloi = "Item Nay Hien Khong Ton Tai";

                    if (cate == null) {
                        session.setAttribute("tbcateer", tbloi);
                    }
                    request.setAttribute("CATEGORIES", cate);
                    request.setAttribute("ACTION", "AddCate");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "EditCateProduct":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    tbloi = "Item Nay Hien Khong Ton Tai";

                    if (cate == null) {
                        session.setAttribute("tbcateer", tbloi);
                    }
                    request.setAttribute("CATEGORIES", cate);
                    request.setAttribute("ACTION", "AddCateProduct");
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                    break;
                case "EditCateViews":
                    id = Integer.parseInt(request.getParameter("id"));
                    cate = daocate.findbyid(id);
                    tbloi = "Item Nay Hien Khong Ton Tai";

                    if (cate == null) {
                        session.setAttribute("tbcateer", tbloi);
                    }
                    request.setAttribute("CATEGORIES", cate);
                    request.setAttribute("ACTION", "AddCateProduct");
                    request.getRequestDispatcher("editcategory.jsp").forward(request, response);
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
