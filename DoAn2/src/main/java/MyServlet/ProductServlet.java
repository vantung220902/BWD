/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Categories;
import DAO.CategoriesDAO;
import DAO.DateConver;
import DAO.Product;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ProductServlet extends HttpServlet {

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
            Categories cate = new Categories();
            int id;
            CategoriesDAO daocate = new CategoriesDAO();
            String action = request.getParameter("action");
            Product pro = null;
            HttpSession session = request.getSession();
            ProductDAO daopro = new ProductDAO();
            if (action == null || action.equals("")) {
                request.setAttribute("ACTIONPRO", "SaveOrUpdate");
                request.getRequestDispatcher("Viewproducts.jsp").forward(request, response);
            }
            switch (action) {
                case "SaveOrUpdate":
                    id = Integer.parseInt(request.getParameter("product_id"));
                    String name = request.getParameter("product_name");
                    Part partFont = request.getPart("imagesFont");
                    Part partBehind = request.getPart("imagesbehind");
                    String fileNameFont = Paths.get(partFont.getSubmittedFileName()).getFileName().toString();
                    String fileNameBehind = Paths.get(partBehind.getSubmittedFileName()).getFileName().toString();
                    String dg = "./DoAnFile/product/detailProduct/imgtail";
                    try {
                        partFont.write("C:\\Users\\admin\\OneDrive\\Tài liệu\\NetBeansProjects\\DoAn2\\src\\main\\webapp\\DoAnFile\\product\\detailProduct\\imgtail" + "/" + fileNameFont);
                        partBehind.write("C:\\Users\\admin\\OneDrive\\Tài liệu\\NetBeansProjects\\DoAn2\\src\\main\\webapp\\DoAnFile\\product\\detailProduct\\imgtail" + "/" + fileNameBehind);
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                    String pathImgFont = dg + "/" + fileNameFont;
                    String pathImgBehind = dg + "/" + fileNameBehind;
                    int priceOld = Integer.parseInt(request.getParameter("PriceOld"));
                    int priceNew = Integer.parseInt(request.getParameter("PriceNew"));
                    Date mannufactureDate = DateConver.todate(request.getParameter("mannufacture_date"));
                    int cateID = Integer.parseInt(request.getParameter("product_categorie"));
                    String description = request.getParameter("product_description");
                    int quantity = Integer.parseInt(request.getParameter("available_quantity"));
                    int rerentageDiscoint = Integer.parseInt(request.getParameter("percentage_discount"));
                    String size = request.getParameter("size");
                    String color = request.getParameter("procolor");
                    System.out.println("Thanh COng 222");
                    pro = new Product(id, name, pathImgFont, pathImgBehind, priceOld, priceNew, mannufactureDate, new Categories(cateID, ""), description, quantity, rerentageDiscoint,size,color);
                    if (daopro.findByid(id) == null) {
                        daopro.insert(pro);
                    } else {
                        daopro.update(pro);
                        System.out.println("Thanh COng Edit");
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListPro&idpage=1").forward(request, response);
                    break;
                case "AddProduct":
                    request.getRequestDispatcher("editproduc.jsp").forward(request, response);
                    break;
                case "EditProduct":
                    id = Integer.parseInt(request.getParameter("id"));
                    pro = daopro.findByid(id);
                    request.setAttribute("PD", pro);
                    request.setAttribute("ACTIONPRO", "SaveOrUpdate");
                    request.getRequestDispatcher("editproduc.jsp").forward(request, response);
                    break;
                case "DeleteProduct":
                    id = Integer.parseInt(request.getParameter("id"));
                    if (daopro.findByid(id) == null) {
                        session.setAttribute("tb1", "Product Nay Khong Ton Tai");
                    } else {
                        daopro.delete(id);
                    }
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "DeletePageProduct":
                    id = Integer.parseInt(request.getParameter("id"));
                    if (daopro.findByid(id) == null) {
                        session.setAttribute("tb1", "Product Nay Khong Ton Tai");
                    } else {
                        daopro.delete(id);
                    }
                    request.getRequestDispatcher("ProductServlet?action=SearchProductCT&id=4").forward(request, response);
                    break;
                case "DeleteProductView":
                    id = Integer.parseInt(request.getParameter("id"));
                    if (daopro.findByid(id) == null) {
                        session.setAttribute("tb1", "Product Nay Khong Ton Tai");
                    } else {
                        daopro.delete(id);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListPro&idpage=1").forward(request, response);
                    break;
                case "SearchProductCT":
                    id = Integer.parseInt(request.getParameter("id"));
                    int index = 1;
                    try {
                        index = Integer.parseInt(request.getParameter("indexpage"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    session.setAttribute("idCTSession", id);
                    session.setAttribute("indexCurrentSession", index);
                    Categories cateTitel = daocate.findbyid(id);
                    List<Product> lsPro = daopro.getAllByCate(id, index);
                    int count = daopro.getSizeByCID(id);
                    int endPage = count / 16;
                    if (count % 16 != 0) {
                        endPage++;
                    }
                    int sizePage = lsPro.size();
                    request.setAttribute("sizePage", sizePage);
                    request.setAttribute("idSearchPro", id);
                    request.setAttribute("lsproC", lsPro);
                    request.setAttribute("endPage", endPage);
                    request.setAttribute("SizeCurrent", count);
                    request.setAttribute("cateTitle", cateTitel);
                    request.getRequestDispatcher("product.jsp").forward(request, response);
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
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
