/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyServlet;

import DAO.Account;
import DAO.AccountDAO;
import DAO.Categories;
import DAO.CategoriesDAO;
import DAO.DateConver;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AccServlet extends HttpServlet {

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

        try (PrintWriter out = response.getWriter()) {
            AccountDAO dao = new AccountDAO();
            Account ac = null;
            String username;
            boolean check = false;
            boolean checklg = false;
            String report;
            String wrongLogin;
            boolean checkupdata = false;
            String usernamedn;
            String passworddn;
            String rememberdn;
            Cookie cookieUse;
            Cookie cookiePass;
            Cookie cookieremem;
            Account acsee;
            Boolean _gender = false;
            boolean ad;
            boolean isUser;
            boolean isPassword;
            String phone = null,
                    email = null,
                    address = null;
            int age = 0,
                    gender = 0;
            Date brithdate = null;
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if (action == null || action.equals("")) {
                request.setAttribute("ACCOUNT", new Account("", "", "", 0, DateConver.now(), true, "", "", "", "user", DateConver.now()));
                request.setAttribute("ACTION", "Save");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            switch (action) {
                case "Save":
                    username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String fullname = request.getParameter("fullname");
                    age = 0;
                    gender = 0;
                    phone = null;
                    email = null;
                    address = null;
                    brithdate = DateConver.now();
                    try {
                        age = Integer.parseInt(request.getParameter("age"));
                        brithdate = DateConver.todate(request.getParameter("birthday"));
                        gender = Integer.parseInt(request.getParameter("gender"));
                        phone = request.getParameter("phone");
                        email = request.getParameter("email");
                        address = request.getParameter("address");
                    } catch (Exception e) {
                        age = 0;
                        brithdate = DateConver.now();
                    }

                    if (gender == 1) {
                        _gender = true;
                    }
                    ac = new Account(username, password, fullname, age, brithdate, _gender, phone, email, address, "user", DateConver.now());
                    if (dao.findbyid(username) == null) {
                        dao.insert(ac);
                        check = true;
                        session.setAttribute("fn", fullname);
                        session.setAttribute("ck", check);
                    } else {
                        dao.update(ac);
                        request.getRequestDispatcher("signUp.jsp").forward(request, response);
                    }
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                    break;
                case "SaveViews":
                    username = request.getParameter("username");
                    password = request.getParameter("password");
                    fullname = request.getParameter("fullname");
                    age = 0;

                    gender = 0;
                    phone = null;

                    email = null;

                    address = null;

                    brithdate = DateConver.now();
                    try {
                        age = Integer.parseInt(request.getParameter("age"));
                        brithdate = DateConver.todate(request.getParameter("birthday"));
                        gender = Integer.parseInt(request.getParameter("gender"));
                        phone = request.getParameter("phone");
                        email = request.getParameter("email");
                        address = request.getParameter("address");
                    } catch (Exception e) {
                        age = 0;
                        brithdate = DateConver.now();
                    }

                    if (gender == 1) {
                        _gender = true;
                    }
                    ac = new Account(username, password, fullname, age, brithdate, _gender, phone, email, address, "user", DateConver.now());
                    if (dao.findbyid(username) == null) {
                        dao.insert(ac);
                        check = true;
                        session.setAttribute("fn", fullname);
                        session.setAttribute("ck", check);
                    } else {
                        dao.update(ac);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListAcc").forward(request, response);
                    break;
                case "Login":
                    usernamedn = request.getParameter("username");
                    passworddn = request.getParameter("password");
                    rememberdn = request.getParameter("remember");
                    cookieUse = new Cookie("cookuser", usernamedn);
                    cookieUse.setMaxAge(60 * 60 * 24 * 7);
                    cookiePass = new Cookie("cookpass", passworddn);
                    cookiePass.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(cookieUse);
                    response.addCookie(cookiePass);
                    cookieremem = new Cookie("cookiremem", rememberdn);
                    cookieremem.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(cookieremem);
                    acsee = null;
                    ad = false;
                    acsee = dao.findbyTK(usernamedn, passworddn);
                    isUser = usernamedn != null && usernamedn.trim().length() > 0;
                    isPassword = passworddn != null && passworddn.trim().length() > 0;
                    if (isUser && isPassword) {
                        if (acsee != null) {
                            session.setAttribute("us", usernamedn);
                            session.setAttribute("pw", passworddn);
                            session.setAttribute("fn", acsee.getFullname());
                            if (acsee.getPrivileges().equals("admin")) {
                                ad = true;
                            }
                            session.setAttribute("privi", ad);
                            check = true;
                            session.setAttribute("ck", check);
                            response.sendRedirect("index.jsp");
                        } else {
                            wrongLogin = "Sai Tai Khoan Mat Khau";
                            session.setAttribute("ck", check);
                            session.setAttribute("cklg", checklg);
                            session.setAttribute("wrongln", wrongLogin);
                            request.getRequestDispatcher("signUp.jsp").forward(request, response);
                        }
                    } else {
                        wrongLogin = "Vui Long Dien Day Du Thong Tin";
                        checklg = true;
                        session.setAttribute("ck", check);
                        session.setAttribute("cklg", checklg);
                        session.setAttribute("wrongln", wrongLogin);
                        request.getRequestDispatcher("signUp.jsp").forward(request, response);
                    }
                    break;

                case "Logout":
                    session.invalidate();
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "LogoutProduct":
                    session.invalidate();
                    request.getRequestDispatcher("ProductServlet?action=SearchProductCT&id=4").forward(request, response);
                    break;
                case "LogoutNews":
                    session.invalidate();
                    request.getRequestDispatcher("NewServlet?action=getByAllCate&idnews=1").forward(request, response);
                    break;
                case "Resgister":
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                    break;
                case "Eidt":
                    username = request.getParameter("username");
                    ac = dao.findbyid(username);
                    report = "Tai Khoan Nay Khong Ton Tai";
                    request.setAttribute("ACCOUNT", ac);
                    request.setAttribute("ACTION", "SaveViews");
                    request.getRequestDispatcher("editAcc.jsp").forward(request, response);

                    break;
                case "Delete":
                    username = request.getParameter("username");
                    ac = dao.findbyid(username);
                    if (ac != null) {
                        dao.delete(username);
                    }
                    request.getRequestDispatcher("viewAccount.jsp").forward(request, response);
                    break;
                case "DeleteViews":
                    username = request.getParameter("username");
                    ac = dao.findbyid(username);
                    if (ac != null) {
                        dao.delete(username);
                    }
                    request.getRequestDispatcher("pageAdminServlet?action=ListAcc").forward(request, response);
                    break;
                case "AddOrEidt":
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AccServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AccServlet.class.getName()).log(Level.SEVERE, null, ex);
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
