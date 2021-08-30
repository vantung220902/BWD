/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Account;
import DAO.Cart;
import DAO.CartDao;
import DAO.DateConver;
import DAO.Product;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class OrderServlet extends HttpServlet {

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
        Cookie arr[] = request.getCookies();
        HttpSession session = request.getSession();
        List<Product> list = new ArrayList<Product>();
        ProductDAO dao = new ProductDAO();
        Product product = new Product();
        for (Cookie o : arr) {
            if (o.getName().equals("idCart")) {
                String txt[] = o.getValue().split("/");
                for (String s : txt) {
                    product = dao.findByid(Integer.parseInt(s));
                    product.setQuantity(1);
                    list.add(product);
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            int count = 1;
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getId() == list.get(j).getId()) {
                    count++;
                    list.remove(j);
                    j--;
                    list.get(i).setQuantity(count);
                    System.out.println("Count: " + count);
                }
            }
        }
        String status = "Đã Nhận";
        String username = session.getAttribute("us").toString();

        CartDao daocart = new CartDao();
        for (Product pro : list) {
            Cart cart = new Cart();
            cart.setProid(pro.getId());
            cart.setQuantity(pro.getQuantity());
            cart.setPrice(pro.getPriceNew()*pro.getQuantity()+100);
            cart.setStatus(status);
            cart.setUsername(username);
            cart.setName(pro.getName());
            cart.setCreateDate(DateConver.now());
            daocart.insert(cart);
            int i= dao.updateQuantuty(pro.getQuantity(), pro.getId());
           

        }
        for (Cookie o : arr) {
            if (o.getName().equals("idCart")) {
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        response.sendRedirect("ProductServlet?action=SearchProductCT&id=4");
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
