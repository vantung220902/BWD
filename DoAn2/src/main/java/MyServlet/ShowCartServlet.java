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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.RandomStringUtils;

/**
 *
 * @author admin
 */
public class ShowCartServlet extends HttpServlet {

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
        Cookie arr[] = request.getCookies();
        HttpSession session = request.getSession();
        List<Product> list = new ArrayList<Product>();
        int size = 0;
        int count = 0;
        boolean check = true;
        String generatedString = "";
        boolean checkSale = false;
        int radowm = (int) Math.floor(Math.random() * 100);
        if ( radowm< 10) {
            checkSale = true;
            int length = 10;
            boolean useLetters = true;
            boolean useNumbers = false;
           generatedString  = RandomStringUtils.random(length, useLetters, useNumbers);
        }
        ProductDAO daopro = new ProductDAO();
        Product pro;
       
        for (Cookie o : arr) {
            if (o.getName().equals("idCart")) {
                String txt[] = o.getValue().split("/");
                for (String s : txt) {
                    pro = daopro.findByid(Integer.parseInt(s));
                    size=pro.getQuantity();
                    pro.setQuantity(1);
                    list.add(pro);
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            
            pro = list.get(i);
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getId() == list.get(j).getId()) {
                    count++;
                    list.remove(j);
                    j--;
                    pro.setQuantity(count);

                }
            }
        }
        double total = 0;
        for (Product o : list) {
            total = total + o.getQuantity() * o.getPriceNew();
        }
    
          if(count>size){
              request.setAttribute("tb", "Xin lỗi sản phẩm này số lượng chỉ có: "+count);
             check = false;
          }
        request.setAttribute("listCartPro", list);
        request.setAttribute("total", total);
        session.setAttribute("lsCart", list);
        request.setAttribute("checkSale", checkSale);
        request.setAttribute("maSale", generatedString);
        request.setAttribute("sum", 100 * total);
         request.setAttribute("check",check);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
