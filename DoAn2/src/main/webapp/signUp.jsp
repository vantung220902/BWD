<%-- 
    Document   : signUp
    Created on : Jun 13, 2021, 2:58:25 PM
    Author     : admin
--%>

<%@page import="DAO.DateConver"%>
<%@page import="DAO.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script 
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="./DoAnFile/css/dn_ky.css">
        <title>Sign in & Sign up</title>
    </head>
    <body>
        <%
            String username = "", password = "", remen = "";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cook : cookies) {
                    if (cook.getName().equals("cookuser")) {
                        username = cook.getValue();
                    } else if (cook.getName().equals("cookpass")) {
                        password = cook.getValue();
                    } else if (cook.getName().equals("cookiremem")) {
                        remen = cook.getValue();
                    }
                }
            }

        %>
        <div class="container">
            <div class="forms-container">

                <div class="signin-signup">
                    <form action="AccServlet" class="sign-in-form" method="post" id="form-1">
                        <input type="hidden" class="form-control" name="action" value="Login">

                        <h2 class="title">Sign in</h2>
                        <div class="input-field form-group">
                            <i class="fas fa-user"></i>
                            <input type="text" id="modal-tk" class="form-control" placeholder="Username" name="username" value="<%=username%>"> 
                            <span class="form-message"></span>
                        </div>
                        <div class="input-field form-group">
                            <i class="fas fa-lock"></i>
                            <input id="modal-mk" type="password" class="form-control" placeholder="Password" name="password" value="<%=password%>"> 
                            <span class="form-message"></span>
                        </div>

                        <input class="form-check-input" type="checkbox" name="remember" 

                               id="flexSwitchCheckDefault" style="float: initial" value="1" 
                               <%="1".equals(remen) ? "checked='/checked'" : ""%>
                               />
                        <label class="form-check-label " for="flexSwitchCheckDefault">Remember Login</label>


                        <div class="bu1">
                            <button class="btn solid" type="submit"><a>Login</a></button>
                        </div>
                        <p class="social-text">Or Sign in with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                    <%
                        String action = (String) request.getAttribute("ACTION");
                        Account ac = (Account) request.getAttribute("ACCOUNT");
                        if (action == null) {
                            action = "Save";
                        }
                        if (ac == null) {
                            ac = new Account("", "", "", 0, DateConver.now(), true, "", "", "", "user", DateConver.now());
                        }

                    %>
                    <form action="AccServlet" class="sign-up-form" method="post">
                        <input type="hidden" class="form-control" name="action" value="<%=action%>">
                        <h2 class="title">Sign up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input  type="text" name="username" placeholder="Username" value="<%=ac.getUsername()%>"> 
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input  type="text" placeholder="Email" name="email" value="<%=ac.getEmail()%>"> 
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input  type="password" placeholder="Password" name="password" value="<%=ac.getPassword()%>"> 
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="text" placeholder="Full Name" name="fullname" value="<%=ac.getFullname()%>"> 
                        </div>

                        <button type="submit" class="btn solid">Sign up</button>
                        <p class="social-text">Or Sign up with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>Welcome</h3>
                        <p>Welcome to our store, this is the place for fashionistas, we will satisfy you with the best we have.</p>
                        <button class="btn transparent" id="sign-up-btn">Sign up</button>
                    </div>
                    <img src="./DoAnFile/img/icon/undraw_shopping_eii3.svg" class="image">
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>Welcome</h3>
                        <p>Welcome to our store, this is the place for fashionistas, we will satisfy you with the best we have.</p>
                        <button class="btn transparent" id="sign-in-btn">Sign in</button>
                    </div>
                    <img src="./DoAnFile/img/icon/undraw_web_shopping_dd4l (1).svg" class="image">
                </div>
            </div>
        </div>
        <script src="./DoAnFile/js/checklogin.js"></script>
        <script>
                const sign_in_btn = document.querySelector("#sign-in-btn");
                const sign_up_btn = document.querySelector("#sign-up-btn");

                const container = document.querySelector(".container");

                sign_up_btn.addEventListener('click', () => {
                    container.classList.add("sign-up-mode");
                });

                sign_in_btn.addEventListener('click', () => {
                    container.classList.remove("sign-up-mode");
                });

                Validator({
                    form: "#form-1",
                    formGroupSelector: ".form-group",
                    errorSelector: ".form-message",
                    rules: [
                        Validator.isRequired("#modal-tk", "Vui lòng nhập  đầy đủ"),

                        Validator.minlength("#modal-mk", 3)
                    ],

                });
        </script>
    </script>
</body>
</html>
