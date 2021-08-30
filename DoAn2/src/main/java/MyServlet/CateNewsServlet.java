/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.CateNewsDao;
import DAO.CategoryNews;
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
public class CateNewsServlet extends HttpServlet {

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
        CateNewsDao dao = new CateNewsDao();
        int id ;
        String name;
        CategoryNews ctnews = null;
        String action = request.getParameter("actionNews");
        if(action==null||action.equals("")){
            request.getRequestDispatcher("news.jsp").forward(request, response);
            return;
        }
        switch(action){
         case "addcateNews":
             id = Integer.parseInt(request.getParameter("IDCateNews"));
             name = request.getParameter("NameCateNews");
         
             ctnews = new CategoryNews(id, name);
             if(dao.findbyid(id)==null){
                 dao.insert(ctnews);
                 
             }else{
               dao.update(ctnews);
                 
             }
             request.getRequestDispatcher("news.jsp").forward(request, response);
             break;
         case "delete":
             id = Integer.parseInt(request.getParameter("IDCateNews"));
             System.out.println("DDDDD");
             System.out.println(id);
             if(dao.findbyid(id)==null){
                 System.out.println("Loi Ham Xoa");
             }else{
                 dao.delete(id);
             }
              request.getRequestDispatcher("news.jsp").forward(request, response);
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
