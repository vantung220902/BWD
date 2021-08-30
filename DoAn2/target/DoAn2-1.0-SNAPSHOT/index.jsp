<%-- Document : index Created on : May 20, 2021, 11:07:16 PM Author : admin --%>
<%@page import="DAO.CategoryNews"%>
<%@page import="DAO.CateNewsDao"%>
<%@page import="DAO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.Categories"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CategoriesDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FASHION STORE</title>
        <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
        <link rel="preconnect" href="<c:url value=" https://fonts.gstatic.com"/>">
        <link rel="preconnect" href="<c:url value=" https://fonts.gstatic.com"/>">
        <link href="<c:url value=" https://fonts.googleapis.com/css2?family=Poiret+One&display=swap"/>"
              rel="stylesheet"/>
        <link href="<c:url value="
               https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,500&display=swaphttps://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,500&display=swap"/>
              " rel="stylesheet">
        <link href="<c:url value="
               https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap"/>" rel="stylesheet"
              />
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="
               ./DoAnFile/assets/font/fontawesome-free-5.15.3/fontawesome-free-5.15.3/css/all.min.css" />">
        <link rel="stylesheet" href="<c:url value="
               ./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css" />">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/style.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/responsive.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/jquery.convform.css">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/owl.carousel.min.css" />">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/owl.theme.default.min.css" />">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/reload.css" />">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/reset.css" />">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/grid.css" />">
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/base.css" />">
        <link rel="stylesheet" href="<c:url value="./DoAnFile/css/main.css" />">
        <link rel="stylesheet" href="./DoAnFile/footer.css"/>
        <link rel="stylesheet" href="<c:url value=" ./DoAnFile/css/responsive.css" />">
<style>
    .VI{
        display: none;
    }
</style>
    </head>

    <body class="preloading">
        <div class="loader">
            <span class="fa fa-spinner xoay icon_load-page"></span>
        </div>
        <jsp:include page="/toggle.jsp"></jsp:include>
            <div class="main">
                <div class="header ">
                    <div class="grid wide__header">
                        <div class="row header__introduct">
                            <ul class="header__introduct-list header__introduct-list-first col c-6">
                                <li class="header__introduct-item header__introduct-item-connect">
                                    <div class="header__introduct-item-connect-icon"></div> <span>0333952064</span>
                                </li>
                                <li class="header__introduct-item header__introduct-item-connect">
                                    <i class="ti-email email__introduct"></i> <span>Maill</span>
                                </li>
                                <li class="header__introduct-item header__introduct-social">
                                    <span class="header__introduct-link-nopper EN">Connect</span>
                                    <span class="header__introduct-link-nopper VI">Kết nối</span>
                                    <a href="https://www.facebook.com/profile.php?id=100018097638094" class="header__introduct-link">
                                        <i
                                            class="fab fa-facebook-square header__introduct-icon header__introduct-icon-social"></i>
                                    </a>
                                    <a href="https://www.instagram.com/" class="header__introduct-link">
                                        <i
                                            class="fab fa-instagram header__introduct-icon header__introduct-icon-social"></i>
                                    </a>

                                </li>
                            </ul>
                            <ul class="header__introduct-list header__introduct-list-second col c-6">
                                <li class="header__introduct-item header__introduct-item-notification ">
                                    <div  class="header__introduct-link">
                                        <i
                                            class="ti-bell header__introduct-icon header__introduct-icon-right mlemmlem"></i>
                                        <span class="EN">Message</span>
                                        <span class="VI">Tin nhắn</span>
                                    </div>
                                    <div class="header__notification">
                                        <header class="header__notification-heading">
                                            <h3> Thông Báo Mới Nhận</h3>
                                        </header>

                                        <footer class="header__notification-footer">
                                            <a href="" class="header__notification-footer-btn">
                                                Xem tất cả
                                            </a>
                                        </footer>
                                    </div>
                                </li>
                                <li class="header__introduct-item">
                                    <a href="" class="header__introduct-link">
                                        <i
                                            class="far fa-question-circle header__introduct-icon header__introduct-icon-right"></i>
                                        <span class="EN">Help</span>
                                        <span class="VI">Trợ giúp</span>
                                    </a>
                                </li>
                                <li class="header__introduct-item header__separate"
                                <c:if test="${sessionScope.ck}">
                                    style="display: none"
                                </c:if>
                                <c:if test="${sessionScope.ck}">
                                    style="display: block"
                                </c:if>
                                >
                                <a href="AccServlet?action=Resgister" class="header__introduct-link "
                                   ><span class="EN">Sign Up</span>
                                    <span class="VI">Đăng Nhập</span></a>
                            </li>
                            <li class="header__introduct-item"
                                <c:if test="${sessionScope.ck}">
                                    style="display: none"
                                </c:if>
                                <c:if test="${sessionScope.ck}">
                                    style="display: block"
                                </c:if>
                                >
                                <a href="signUp.jsp" class="header__introduct-link"><span class="EN">Sign In</span>
                                    <span class="VI">Đăng Ký</span></a>
                            </li>
                            <li class="header__introduct-item header__introduct-item-guide">
                                <div  class="header__introduct-link ">
                                    <i class="ti-info"></i>
                                    <span class="EN"> Tour Guide</span>
                                    <span class="VI"> Giới Thiệu</span></div>
                            </li>

                        </ul>
                    </div>
                    <nav class="header__nav row">
                        <ul class="header__nav-list">
                            <li class="header__nav-logo">
                                <a href="./index.jsp" class=" header__nav-logo-link">
                                    FASHION STORE
                                </a>
                            </li>
                            <li class="header__nav-item">
                                <a href="./index.jsp" class="header__nav-link header__nav-link-arrived">
                                    <span class="EN"> HOME PAGE</span>
                                    <span class="VI"> TRANG CHỦ</span>
                                </a>
                            </li>
                            <%
                                CategoriesDAO dao = new CategoriesDAO();
                                List<Categories> ls = dao.getAll();

                            %>
                            <li class="header__nav-item header__nav-item-product">
                                <h3  class="header__nav-link">
                                    <span class="EN"> PRODUCT</span> 
                                    <span class="VI"> SẢN PHẨM</span> 
                                </h3>
                                <div class="header__product">
                                    <div class="header__product-body-item">
                                        <%                                            for (int j = 0; j < ls.size(); j++) {
                                                Categories catepro2 = ls.get(j);
                                        %>
                                        <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>" class="header__product-body-heading">
                                            <%=catepro2.getName()%>
                                        </a>
                                        <%}%>
                                    </div>

                                </div>
                            </li>
                            <li class="header__nav-item home__nav-item-collection">
                                <div class="header__nav-link">
                                    <span class="EN"> COLLECTION</span>  
                                    <span class="VI"> BỘ SƯU TẬP</span>    
                                </div>
                                <ul class="header__collection row">
                                    <li class="header__collection-item col l-6">
                                        <div class="collection__wrap">
                                            <a href="#" class="collection__link-img">
                                            </a>
                                            <div class="collection__link-text">
                                                <div class="collection__link-primary-text">
                                                    Summer Colection:
                                                </div>
                                                <div class="collection__link-secondary-text">
                                                    Cô Gái Đứng Trên Tảng Đá Và Nhìn
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%     
//                                        ProductDAO daopro = new ProductDAO();
                                        ProductDAO daopro =  new ProductDAO();
                                        int cateproId = 0;
                                        try {
                                            cateproId = Integer.parseInt(request.getAttribute("idSearchPro").toString());
                                        } catch (Exception e) {
                                            e.printStackTrace();

                                        }

                                        if (cateproId == 0) {
                                            cateproId = 4;
                                        }
                                        CateNewsDao daoNews = new CateNewsDao();
                                        List<CategoryNews> lsNews = daoNews.getAll();
                                    %>
                                    <li class="header__collection-item col l-3">
                                        <div class="collection__wrap">
                                            <div class="collection__item-title">
                                                Types of Collections
                                            </div>
                                            <ul class="collection__item-category">
                                                <li
                                                    class="collection__item-category-item collection__item-category-item-spring">
                                                    <a class="collection__item-category-link" href=""> Spring Summer 2021 </a>
                                                    <div class="category-item_desc">
                                                        <ul class="category-item-desc-list">
                                                            <li class="category-item-desc-item">
                                                                <a href="">Amazing Vietnam</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">The HaLong</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li
                                                    class="collection__item-category-item collection__item-category-item-spring-summer">
                                                    <a class="collection__item-category-link" href=""> Summer Fall 2021</a>
                                                    <div class="category-item_desc-summer">
                                                        <ul class="category-item-desc-list">
                                                            <li class="category-item-desc-item">
                                                                <a href="">XITA Nguyen Xuân Hè 2021</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">FENDI XUÂN HÈ 2021</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">Vườn địa đàng thành phố</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li
                                                    class="collection__item-category-item collection__item-category-item-spring-2021">
                                                    <a class="collection__item-category-link" href=""> Spring 2021</a>
                                                    <div class="category-item_desc-spring">
                                                        <ul class="category-item-desc-list">
                                                            <li class="category-item-desc-item">
                                                                <a href="">The Tay Bac</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">Fall Winter 2020 Collection</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">Vườn địa đàng thành phố</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li
                                                    class="collection__item-category-item collection__item-category-item-fall-2021">
                                                    <a class="collection__item-category-link" href=""> Fall 2021</a>
                                                    <div class="category-item_desc-fall">
                                                        <ul class="category-item-desc-list">
                                                            <li class="category-item-desc-item">
                                                                <a href="">The Tay Bac</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">Fall Winter 2020 Collection</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                            </li>
                                                            <li class="category-item-desc-item">
                                                                <a href="">Vườn địa đàng thành phố</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="collection__item-category-item">
                                                    <a class="collection__item-category-link" href="">Fall Winter 2021</a>
                                                </li>
                                                <li class="collection__item-category-item">
                                                    <a class="collection__item-category-link" href=""> Winter Spring
                                                        2021</a>
                                                </li>
                                                <li class="collection__item-category-item">
                                                    <a class="collection__item-category-link" href=""> Summer Fall 2020</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header__collection-item col l-3">
                                        <div class="collection__wrap">
                                            <div class="collection__item-title">
                                                Fashion Brands
                                            </div>
                                            <div class="collection__item-brands">
                                                <a href="#"
                                                   class="collection__item-brand collection__item-brand-check">
                                                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                                         alt="">
                                                </a>
                                                <a href="#" class="collection__item-brand">
                                                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                                         alt="">
                                                </a>
                                                <a href="#" class="collection__item-brand">
                                                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                                         alt="">
                                                </a>
                                                <a href="#" class="collection__item-brand">
                                                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                                         alt="">
                                                </a>
                                                <a href="#" class="collection__item-brand">
                                                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
                                                         alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </li>
                            <li class="header__nav-item">
                                <a href="./Desigin.jsp" class="header__nav-link EN">
                                    DESIGN T-Shirt
                                </a>
                                <a href="./Desigin.jsp" class="header__nav-link VI">
                                    THIẾT KẾ ÁO
                                </a>
                            </li>
                            <li class="header__nav-item header__nav-item-the-news">
                                <div class="header__nav-link">
                                    <span class="EN">NEWS</span>
                                    <span class="VI">TIN TỨC</span>
                                </div>
                                <div class="header__nav-the-news">
                                    <ul class="header__nav-the-news-list">

                                        <%
                                            for (int i = 0; i < lsNews.size(); i++) {
                                                CategoryNews ctnews = lsNews.get(i);
                                        %>

                                        <li class="header__nav-the-news-item">
                                            <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>" class="header__nav-the-news-link">
                                                <%=ctnews.getName()%>
                                            </a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </li>
                            <li class="header__nav-item">
                                <a href="SaleServlet?username=${sessionScope.us}" class="header__nav-link">
                                    <span class="EN">SALE</span>
                                    <span class="VI">TRÒ CHƠI</span>
                                </a>
                            </li>

                         
                            <li class="header__nav-item">

                                <c:if test="${sessionScope.privi}">
                                    <a href="pageAdminServlet" class="header__nav-link">
                                        <span class="EN"> MANAGE WEB</span>
                                        <span class="VI"> QUẢN LÍ WEB</span>
                                    </a>
                                </c:if>
                            </li>
                        </ul>
                        <%
                            String actioncate = (String) request.getAttribute("ACTION");
                            Categories cateupdate = (Categories) request.getAttribute("CATEGORIES");
                            if (actioncate == null) {
                                actioncate = "AddCateProduct";
                            }
                            if (cateupdate == null) {
                                cateupdate = new Categories(0, "");
                            }

                        %>
                        <a href="./index.jsp" class="header__nav-heading-text">FASHION STORE</a>
                        <div class="header__cart row ">
                            <ul class="header__cart-body">
                                <li  class="header__cart-category header__cart-body-item">
                                    <div class="header__search-menu">

                                        <input type="checkbox" hidden id="header__search-checkbox"
                                               class="header__search-checkbox-menu">
                                        <label for="header__search-checkbox"
                                               class="header__search-checkbox-icon">
                                            <i class="ti-menu header__icon-bars"></i>
                                        </label>
                                        <ul class="header__search-menu-list" id="style-2">

                                            <% for (int i = 0; i < ls.size(); i++) {
                                                    Categories cate = ls.get(i);

                                            %>
                                            <li class="header__search-menu-item">
                                                <c:if test="${sessionScope.privi}">
                                                    <a href="CategoriesServlet?action=EditCateProduct&id=<%=cate.getId()%>">
                                                        <i class="ti-pencil"></i>
                                                    </a>
                                                </c:if>
                                                <a href="ProductServlet?action=SearchProductCT&id=<%=cate.getId()%>" 

                                                   class="header__search-menu-link <%
                                                       if (cateproId == cate.getId()) {
                                                           out.print("active");
                                                       } else {
                                                           out.print("");
                                                       }
                                                   %>">
                                                    <%=cate.getName()%>
                                                </a>
                                                <c:if test="${sessionScope.privi}">
                                                    <a href="CategoriesServlet?action=MinusCateProduct&id=<%=cate.getId()%>">
                                                        <i class="ti-minus"></i>
                                                    </a>
                                                </c:if>
                                            </li>
                                            <%}%>
                                            <c:if test="${sessionScope.privi}">
                                                <div class="header__search-menu-ad-add" onclick="DispalyCatePlus()">
                                                    <i class="ti-plus"></i>
                                                </div>
                                            </c:if>
                                            <li class="header__search-menu-item header__search-menu-item_form-add">

                                                <form action="CategoriesServlet" method="post" class="CateFormPlus">
                                                    <input type="hidden" class="form-control" name="action" value="<%=actioncate%>">
                                                    <div class="form-group">
                                                        <label for="formGroupExampleInput"></label>
                                                        <input type="text"  name="IDCate" class="form-control" id="formGroupExampleInput" placeholder="Enter ID" value="<%=cateupdate.getId()%>">
                                                    </div>
                                                    <div class="form-group" >
                                                        <label for="formGroupExampleInput2"></label>
                                                        <input type="text" class="form-control" name="NameCate"
                                                               id="formGroupExampleInput2"
                                                               placeholder="Enter name" style="margin: 6px 0 12px" value="<%=cateupdate.getName()%>">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary btn-cate">Submit</button>
                                                    <h1>${sessionScope.tbloiCate}</h1>
                                                </form>
                                            </li>
                                        </ul>

                                    </div>
                                </li>
                                <form  action="SearchServlet" method="get" class="header__search header__cart-body-item">

                                    <div class="header__search-wrap">
                                        <input  oninput="searchByName(this)" type="text" class="header__search-input"
                                                placeholder="Search..." name="txtSearch" value="${txtText}">

                                        <!-- History search -->

                                    </div>
                                    <button type="submit" class="button-search" >
                                        <i class="ti-search header__icon-search" ></i>
                                    </button>
                                </form>
                                <i class="ti-search header__icon-search header__icon-search-mobile" onclick="viewsFormSearchMobile()"></i>
                                <form  action="SearchServlet" method="get" class="header__cart-body-item-mobile">

                                    <div class="header__search-wrap-mobile">
                                        <input  oninput="searchByName(this)" type="text" class="header__search-input-mobile"
                                                placeholder="Search..." name="txtSearch" value="${txtText}">
                                    </div>
                                    <button type="submit" class="button-search">
                                        <i class="ti-search header__icon-search-mobile"></i>
                                    </button>
                                </form> 
                                <li class="header__introduct-item header__nav-acc header__cart-body-item"
                                    <c:if test="${sessionScope.ck}">
                                        style="display: block;"
                                    </c:if>
                                    <c:if test="${not sessionScope.ck}">
                                        style="display: none;"
                                    </c:if>
                                    >
                                    <div  style="display: flex" >
                                        <img loading="lazy" src="./DoAnFile/img/icon/leader.jpg" alt="" class="header__introduct-acc-icon">
                                        <a href="" class="header__introduct-link">
                                            <span class="header__nav-acc-name">${sessionScope.fn}</span>
                                        </a>
                                    </div>

                                    <ul class="header__introduct-acc-list">
                                        <li class="header__introduct-acc-item">
                                            <a href="">
                                                <i class="ti-user"></i><span>My Account</span>
                                            </a>
                                        </li>
                                        <li class="header__introduct-acc-item">
                                            <a href="">
                                                <i class="ti-home"></i><span> My address</span>
                                            </a>
                                        </li>
                                        <li class="header__introduct-acc-item">
                                            <a href="">
                                                <i class="ti-money"></i> <span> Purchase Order</span>
                                            </a>
                                        </li>
                                        <li
                                            class="header__introduct-acc-item header__introduct-acc-item--separate">
                                            <a href="AccServlet?action=Logout">
                                                <i class="fas fa-sign-in-alt"></i> <span>Log Out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="header__introduct-item header__introduct-item-voice">
                                    <i class="ti-microphone icon__ai-voice"></i>
                                </li>
                                <li class="header__cart-wrap header__cart-body-item">
                                    <a href="ShowCartServlet">
                                        <i class="header__cart-icon ti-shopping-cart"></i>
                                        <span class="header__cart-notice">${sessionScope.lsCart.size()}</span>
                                        <!-- No Cart :header__cart-list-no_cart -->
                                        <div class="header__cart-list ">
                                            <div class="header__cart-list">
                                                <div class="header__cart-list-no-cart" <c:if test="${sessionScope.lsCart.size()<1}">
                                                     style="display: block;"
                                                    </c:if>>
                                                    <img loading="lazy" src="./DoAnFile/img/no-cart.png" alt="" class="header__cart-no_cart-img">
                                                    <p class="header__cart-list-no_cart-message">
                                                        Have'not any product
                                                    </p></div>
                                                <h4 class="header__cart-heading">
                                                    Product added
                                                </h4>

                                                <ul class="header__cart-list-item">
                                                    <!-- Cart Item -->
                                                    <c:forEach var="pro" items="${sessionScope.lsCart}">
                                                        <li class="header__cart-item">
                                                            <img loading="lazy" src="${pro.imgFont}" alt=""
                                                                 class="header__cart-img">
                                                            <div class="header__cart-item-info">
                                                                <div class="header__cart-item-head">
                                                                    <h5 class="header__cart-item-name">
                                                                        ${pro.name}
                                                                    </h5>
                                                                    <div class="header__cart-item-price-wrap">
                                                                        <span class="header__cart-item-price">
                                                                            ${pro.priceNew}
                                                                        </span>
                                                                        <span class="header__cart-item-multiply">
                                                                            x
                                                                        </span>
                                                                        <span class="header__cart-item-quantity">

                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="header__cart-item-body">
                                                                    <span class="header__cart-item-description">
                                                                        Type : ${pro.cateID.name}
                                                                    </span>
                                                                    <span class="header__cart-item-remove">
                                                                        Delete
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </li> 
                                                    </c:forEach>


                                                </ul>
                                                <a href="ShowCartServlet"class="header__cart-view-cart btn btn--primary">Watch Cart
                                                </a>
                                            </div>
                                    </a>
                                </li>
                                <li class="header__search-menu-mobile">
                                    <div class="header__search-menu-mobile-link">
                                        <i id="header__search-menu-mobile-link-icon" class="ti-menu"></i>
                                        <i id="header__search-menu-mobile-link-icon-close" class="ti-close"></i>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <li class="header__category-mobile">
                <ul class="header__nav-list-mobile">
                    <li class="header__nav-item">
                        <a href="./index.jsp" class="header__nav-link">
                            <span class="header__nav-link-arrived EN"> HOME PAGE</span>
                            
                        </a>
                    </li>
                    <li class="header__nav-item header__nav-item-product">
                        <div  class="header__nav-link header__nav-link-mobile">
                            <span class="EN"> PRODUCT</span>
                            
                        </div>
                        <div class="header__product header__product-mobile">
                            <div class="header__product-body-item">
                                <%
                                    for (int j = 0; j < ls.size(); j++) {
                                        Categories catepro2 = ls.get(j);
                                %>
                                <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>" class="header__product-body-heading">
                                    <%=catepro2.getName()%>
                                </a>
                                <%}%>
                            </div>
                        </div>
                    </li>
                    <li class="header__nav-item home__nav-item-collection" >
                        <div class="header__nav-link" onclick="headerColectionChange()">
                            <span class="EN"> COLLECTION</span>
                            
                        </div>
                        <ul class="header__collection header__collection-mobile row">
                            <li class="header__collection-item col l-6">
                                <div class="collection__wrap">
                                    <a href="#" class="collection__link-img">
                                    </a>
                                    <div class="collection__link-text">
                                        <div class="collection__link-primary-text">
                                            Summer Collections:
                                        </div>
                                        <div class="collection__link-secondary-text">
                                            Cô Gái Đứng Trên Tảng Đá Và Nhìn
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="header__collection-item col l-3">
                                <div class="collection__wrap">
                                    <div class="collection__item-title">
                                        Types of Collections
                                    </div>
                                    <ul class="collection__item-category">
                                        <li
                                            class="collection__item-category-item collection__item-category-item-spring">
                                            <a class="collection__item-category-link" href=""> Spring Summer 2021 </a>
                                            <div class="category-item_desc">
                                                <ul class="category-item-desc-list">
                                                    <li class="category-item-desc-item">
                                                        <a href="">Amazing Vietnam</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">The HaLong</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li
                                            class="collection__item-category-item collection__item-category-item-spring-summer">
                                            <a class="collection__item-category-link" href=""> Summer Fall 2021</a>
                                            <div class="category-item_desc-summer">
                                                <ul class="category-item-desc-list">
                                                    <li class="category-item-desc-item">
                                                        <a href="">XITA Nguyen Xuân Hè 2021</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">FENDI XUÂN HÈ 2021</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">Vườn địa đàng thành phố</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li
                                            class="collection__item-category-item collection__item-category-item-spring-2021">
                                            <a class="collection__item-category-link" href=""> Spring 2021</a>
                                            <div class="category-item_desc-spring">
                                                <ul class="category-item-desc-list">
                                                    <li class="category-item-desc-item">
                                                        <a href="">The Tay Bac</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">Fall Winter 2020 Collection</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">Vườn địa đàng thành phố</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li
                                            class="collection__item-category-item collection__item-category-item-fall-2021">
                                            <a class="collection__item-category-link" href=""> Fall 2021</a>
                                            <div class="category-item_desc-fall">
                                                <ul class="category-item-desc-list">
                                                    <li class="category-item-desc-item">
                                                        <a href="">The Tay Bac</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">Fall Winter 2020 Collection</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">BST Uniqlo U Xuân/Hè 2021</a>
                                                    </li>
                                                    <li class="category-item-desc-item">
                                                        <a href="">Vườn địa đàng thành phố</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="collection__item-category-item">
                                            <a class="collection__item-category-link" href="">Fall Winter 2021</a>
                                        </li>
                                        <li class="collection__item-category-item">
                                            <a class="collection__item-category-link" href=""> Winter Spring
                                                2021</a>
                                        </li>
                                        <li class="collection__item-category-item">
                                            <a class="collection__item-category-link" href=""> Summer Fall 2020</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="header__collection-item col l-3">
                                <div class="collection__wrap">
                                    <div class="collection__item-title">
                                        Fashion Brands
                                    </div>
                                    <div class="collection__item-brands">
                                        <a href="#" class="collection__item-brand collection__item-brand-check">
                                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
                                                 alt="">
                                        </a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </li>
                    <li class="header__nav-item">
                        <a href="./Desigin.jsp" class="header__nav-link">
                            <span class="EN"> DESIGN T-Shirt</span>
                            
                        </a>
                    </li>
                    <li class="header__nav-item header__nav-item-the-news" >
                        <div class="header__nav-link" onclick="headerTheNewsChange()">
                            <span class="EN"> NEWS</span>
                            
                        </div>
                        <div class="header__nav-the-news header__nav-the-news-mobile">
                            <ul class="header__nav-the-news-list">

                                <%
                                    for (int i = 0; i < lsNews.size(); i++) {
                                        CategoryNews ctnews = lsNews.get(i);
                                %>

                                <li class="header__nav-the-news-item">
                                    <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>" class="header__nav-the-news-link">
                                        <%=ctnews.getName()%>
                                    </a>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </li>
                    <li class="header__nav-item">
                        <a href="SaleServlet?username=${sessionScope.us}" class="header__nav-link">
                            <span class="EN">SALE</span>
                            
                        </a>
                    </li>

                  
                    <li class="header__nav-item">

                        <c:if test="${sessionScope.privi}">
                            <a href="pageAdminServlet" class="header__nav-link">
                                <span class="EN">MANAGE WEB</span>
                               
                            </a>
                        </c:if>
                    </li>
                </ul>
                <ul class="header__category-mobile-min">
                    <li>
                        <span
                            class="header__category-mobile-min-link header__category-mobile-min-link-check EN">HOME</span>
                        <span
                            class="header__category-mobile-min-link header__category-mobile-min-link-check VI">TRANG CHỦ</span>
                    </li>
                    <li>
                        <span class="header__category-mobile-min-link EN"
                              onclick="HeaderProductDetai()">PRODUCT</span>
                       
                    </li>
                    <li>
                        <span class="header__category-mobile-min-link EN"
                              onclick="HeaderColectionDetai()">COLECTION</span>
                        
                    </li>
                    <li>
                        <a href="./Desigin.jsp" class="header__category-mobile-min-link EN">
                            DESIGN T-Shirt
                        </a>
                        
                    </li>
                    <li>
                        <span class="header__category-mobile-min-link EN"
                              onclick="HeaderTheNewsDetai()">NEWS</span>
    
                    </li>
                    <li>
                        <c:if test="${sessionScope.privi}">
                            <a href="pageAdminServlet" class="header__category-mobile-min-link ">
                                <span class="EN"> MANAGE WEB</span>
                                        
                            </a>
                        </c:if>
                    </li>

                  
                </ul>
                <div class="header__product-deatil">
                    <div class="header__product-deatil-heading" onclick="HeaderBalck()">
                        <i class="ti-angle-left"></i>
                        <p class="EN">PRODUCT</p>
                       
                        <div class="header__product-body-item">
                            <%
                                for (int j = 0; j < ls.size(); j++) {
                                    Categories catepro2 = ls.get(j);
                            %>
                            <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>" class="header__product-body-heading">
                                <%=catepro2.getName()%>
                            </a>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="header__product-colection">
                    <div class="header__product-deatil-heading" onclick="HeaderBalck()">
                        <i class="ti-angle-left"></i>
                        <p class="EN">COLLECTION</p>
                        
                        <div class="header__product-colection-wrap">
                            <ul class="header__product-deatil-list header__colection-deatil-list">
                                <li>
                                    <a href="" class="header__product-deatil-link">Sumer Spring 2021</a>
                                </li>
                                <li>
                                    <a href="" class="header__product-deatil-link">Sumer Fall 2021</a>
                                </li>
                                <li>
                                    <a href="" class="header__product-deatil-link">Spring 2021</a>
                                </li>
                                <li>
                                    <a href="" class="header__product-deatil-link">Fall 2021</a>
                                </li>
                                <li>
                                    <a href="" class="header__product-deatil-link">Fall Winter 2021</a>
                                </li>
                                <li>
                                    <a href="" class="header__product-deatil-link">Sumer Fall 2020</a>
                                </li>
                            </ul>
                            <div class="collection__wrap">
                                <div class="collection__item-title">
                                    Các Hãng Thời Trang
                                </div>
                                <div class="collection__item-brands">
                                    <a href="#" class="collection__item-brand collection__item-brand-check">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                             alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                             alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                             alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                             alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
                                             alt="">
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="header__product-thenews">
                    <div class="header__product-deatil-heading" onclick="HeaderBalck()">
                        <i class="ti-angle-left"></i>
                        <p class="EN">The News</p>
                       
                        <ul class="header__product-deatil-list">

                            <%
                                for (int i = 0; i < lsNews.size(); i++) {
                                    CategoryNews ctnews = lsNews.get(i);
                            %>

                            <li class="header__nav-the-news-item">
                                <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>"
                                   class="header__product-deatil-link">
                                    <%=ctnews.getName()%>
                                </a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>

               
        </div>

        <!-- end header -->
        <section class="bannner-slider bannner-slider-mobile grid wide">
            <div class="row banner">
                <div class="col l-12 m-12 c-12 banner__simple-text">
                    <h2></h2>
                    <h3 class="EN">Sale Today</h3>
                    <h3 class="VI">Giảm Giá Hôm Nay</h3>
                </div>
                <div class="col l-12 m-12 c-12 banner__special-text">
                    <div id="NumberSale" class="banner__special-number">70</div>
                    <span>% <br />OFF</span>
                    <label class="EN">Sale To</label>
                    <label class="VI">Giảm Tới</label>
                    <a href="#" class="EN">SHOP WOMEN</a>
                    <a href="#" class="VI">SHOP NỮ</a>
                </div>
            </div>

        </section>
        <div class="row banner-name">
            <div class="banner-name-text col l-12 c-12 m-12">

            </div>
            <div class="col l-12 m-12 c-12 main-slider__title">

                <div class="main-slider__title-text main-slider__title-text-cagory">
                    <span class="EN">Shop By Category</span>
                    <span class="VI">Các Loại Sản Phẩm</span>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-ads text-center">
        <div class="banner-icon-next">
            <i class="ti-arrow-circle-left"></i>
        </div>
        <div class="grid wide">

            <div class="banner-gtco-testimonials">
                <div class="owl-carousel owl-carousel2 owl-theme">
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_05.11e315e6.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>
                        </div>
                        <h5 class="banner-ad__text">
                            OUTWEAR
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_07.20942ff4.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            DRESSES
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_09.7de54b20.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            SKIRTS
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_13.a4b732c5.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            SHIRTS AND BLOUSES
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_11.b0241492.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            T-SHIRTS E TOPS
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_15.6c701b69.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            KNITWEAR
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_17.44f2cab6.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            TROUSERS
                        </h5>
                    </div>
                    <div class="col l-category-8 m-6 c-12 banner-ad">
                        <div class="banner-ad-wrapper">
                            <div href="#" class="banner-ad__link">
                                <img loading="lazy" src="./DoAnFile/img/banner-product/Landing-DONNA-tagli_19.57ee552f.png" alt="">
                            </div>

                            <div class="banner-ad__circle">
                            </div>
                            <a href="#" class="banner-ad__search-icon">
                                <i class="ti-search"></i>
                            </a>

                        </div>
                        <h5 class="banner-ad__text">
                            JEANS
                        </h5>
                    </div>
                </div>
            </div>

        </div>
        <div class="banner-icon-next">
            <i class="ti-arrow-circle-right"></i>
        </div>
    </div>
    <div class="main-slider">
        <div class="grid wide">
            <div class="row main-slider-body">
                <div class="col l-12 m-12 c-12 main-slider__title">
                    <div class="main-slider__title-bg">
                        <p>FASHION STORE</p>
                    </div>
                    <div class="main-slider__title-text">
                        <span class="EN">Best Selling</span>
                        <span class="VI">Bán Chạy Nhất</span>
                    </div>
                    <div class="cotainer__admin-search-best">
                        <c:if test="${sessionScope.privi}">
                            <input type="text" class="input__admin-search" placeholder="Enter Search Product"><i class="ti-search"></i>
                        </c:if>

                    </div>
                </div>
                <%

                    List<Product> lspro = daopro.getNextSize(1, 8);

                %>
                <div class="col l-12 m-12 c-12 main-slider-wrapper">
                    <div class="main-slider-owl owl-carousel owl-theme">
                        <div class="item main-slider__page">
                            <div class="row main-slider__row">
                                <%                                    for (int i = 0; i < lspro.size(); i++) {
                                        Product pro = lspro.get(i);

                                %>
                                <div class="main-slider__item col l-3 m-6 c-12">
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=pro.getId()%>">
                                            <i class="ti-pencil"></i>
                                        </a>
                                    </c:if>
                                    <div class="main-slider__item-wrapper">

                                        <div class="main-slider__img-wrapper">
                                            <div class="main-slider__item-img">
                                                <img loading="lazy" class="main-slider__item-img--front"
                                                     src="<%=pro.getImgFont()%>" alt="">
                                                <img loading="lazy" class="main-slider__item-img--behind"
                                                     src="<%=pro.getImgBehind()%>" alt="">
                                                <div class="main-slider__item-info-cart">
                                                    <div class="main-slider__item-btn-list">
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-like">
                                                            <i class="ti-heart"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-search">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-external-link">
                                                            <i class="ti-help"></i>
                                                        </a>
                                                    </div>
                                                    <div class="main-slider__item-add-btn">
                                                        <a href="DetailProServlet?action=watchPro&id=<%=pro.getId()%>"><span>Watching Now </span><i class="ti-eye"></i> </a>
                                                    </div>
                                                </div>
                                                <div class="main-slider__item-sale">
                                                    20%
                                                </div>
                                            </div>

                                        </div>
                                        <div class="main-slider__item-info">
                                            <a href="" class="main-slider__item-name">
                                                <%=pro.getName()%>
                                            </a>
                                            <div class="main-slider__item-price">

                                                <div class="main-slider__item-price--old"><%=pro.getPriceOld()%>VND</div>
                                                <div class="main-slider__item-price--new"><%=pro.getPriceNew()%>VND</div>

                                            </div>
                                            <div class="main-slider__item-rate">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>

                                    </div>
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=DeleteProduct&id=<%=pro.getId()%>">
                                            <i class="ti-trash"></i>
                                        </a>
                                    </c:if>
                                </div>
                                <%}%>
                            </div>

                        </div>
                        <div class="item main-slider__page">
                            <div class="row main-slider__row">
                                <%
                                    for (int i = 0; i < lspro.size(); i++) {
                                        Product pro = lspro.get(i);

                                %>
                                <div class="main-slider__item col l-3 m-6 c-12">
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=pro.getId()%>">
                                            <i class="ti-pencil"></i>
                                        </a>
                                    </c:if>
                                    <div class="main-slider__item-wrapper">

                                        <div class="main-slider__img-wrapper">
                                            <div class="main-slider__item-img">
                                                <img loading="lazy" class="main-slider__item-img--front"
                                                     src="<%=pro.getImgFont()%>" alt="">
                                                <img loading="lazy" class="main-slider__item-img--behind"
                                                     src="<%=pro.getImgBehind()%>" alt="">
                                                <div class="main-slider__item-info-cart">
                                                    <div class="main-slider__item-btn-list">
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-like">
                                                            <i class="ti-heart"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-search">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-external-link">
                                                            <i class="ti-help"></i>
                                                        </a>
                                                    </div>
                                                    <div class="main-slider__item-add-btn">
                                                        <a href="DetailProServlet?action=watchPro&id=<%=pro.getId()%>"><span>Watching Now </span><i class="ti-eye"></i> </a>
                                                    </div>
                                                </div>
                                                <div class="main-slider__item-sale">
                                                    20%
                                                </div>
                                            </div>

                                        </div>
                                        <div class="main-slider__item-info">
                                            <a href="" class="main-slider__item-name">
                                                <%=pro.getName()%>
                                            </a>
                                            <div class="main-slider__item-price">

                                                <div class="main-slider__item-price--old"><%=pro.getPriceOld()%>VND</div>
                                                <div class="main-slider__item-price--new"><%=pro.getPriceNew()%>VND</div>

                                            </div>
                                            <div class="main-slider__item-rate">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>

                                    </div>
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=DeleteProduct&id=<%=pro.getId()%>">
                                            <i class="ti-trash"></i>
                                        </a>
                                    </c:if>
                                </div>
                                <%}%>
                            </div>

                        </div>
                        <div class="item main-slider__page">
                            <div class="row main-slider__row">
                                <%
                                    for (int i = 0; i < lspro.size(); i++) {
                                        Product pro = lspro.get(i);

                                %>
                                <div class="main-slider__item col l-3 m-6 c-12">
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=pro.getId()%>">
                                            <i class="ti-pencil"></i>
                                        </a>
                                    </c:if>
                                    <div class="main-slider__item-wrapper">

                                        <div class="main-slider__img-wrapper">
                                            <div class="main-slider__item-img">
                                                <img loading="lazy" class="main-slider__item-img--front"
                                                     src="<%=pro.getImgFont()%>" alt="">
                                                <img loading="lazy" class="main-slider__item-img--behind"
                                                     src="<%=pro.getImgBehind()%>" alt="">
                                                <div class="main-slider__item-info-cart">
                                                    <div class="main-slider__item-btn-list">
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-like">
                                                            <i class="ti-heart"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-search">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                        <a
                                                            class="main-slider__item-btn main-slider__item-btn-external-link">
                                                            <i class="ti-help"></i>
                                                        </a>
                                                    </div>
                                                    <div class="main-slider__item-add-btn">
                                                        <a href="DetailProServlet?action=watchPro&id=<%=pro.getId()%>"><span>Watching Now </span><i class="ti-eye"></i> </a>
                                                    </div>
                                                </div>
                                                <div class="main-slider__item-sale">
                                                    20%
                                                </div>
                                            </div>

                                        </div>
                                        <div class="main-slider__item-info">
                                            <a href="" class="main-slider__item-name">
                                                <%=pro.getName()%>
                                            </a>
                                            <div class="main-slider__item-price">

                                                <div class="main-slider__item-price--old"><%=pro.getPriceOld()%>VND</div>
                                                <div class="main-slider__item-price--new"><%=pro.getPriceNew()%>VND</div>

                                            </div>
                                            <div class="main-slider__item-rate">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>

                                    </div>
                                    <c:if test="${sessionScope.privi}">
                                        <a class="icon__admin-product" href="ProductServlet?action=DeleteProduct&id=<%=pro.getId()%>">
                                            <i class="ti-trash"></i>
                                        </a>
                                    </c:if>
                                </div>
                                <%}%>
                            </div>

                        </div>

                    </div>
                    <c:if test="${sessionScope.privi}">
                        <a href="ProductServlet?action=AddProduct" class="admin__add-product">
                            <i class="ti-plus"></i>
                        </a>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
    <div class="spinner-wrapper">
        <div class="spinner"></div>
    </div>

    <div class="main-desginer">
        <div class="grid wide">
            <div class=" main-desginer-body-name">
                <h3 class="main-desginer-body-heading EN">
                    FASHION STORE'S DESGINER
                </h3>
                <h3 class="main-desginer-body-heading VI">
                    Các Nhà Thiết Kế FASHION STORE
                </h3>
                <img loading="lazy" src="./DoAnFile/img/icon/idea.svg" alt="">
            </div>
            <div class="gtco-testimonials-desginer">
                <div class="owl-carousel owl-carousel4 owl-theme">

                    <div class="main-desginer-body">
                        <div class="main-desginer-body-img">
                            <img loading="lazy" src="./DoAnFile/img/main-content/nsx1.jpg" alt="">
                            <div class="main-desginer-body-desc">
                                <h2 class="EN">Please be your</h2>
                                <h3 class="EN">main and shine</h3>
                                <h2 class="EN">in your own way</h2>
                                <h2 class="VI">Hãy là </h2>
                                <h3 class="VI">chính bạn và tỏa sáng</h3>
                                <h2 class="VI">theo cách của ban</h2>
                            </div>
                            <div class="main-desginer-body-watch">
                                <a href="./DoAnFile/userdesgin/maindesgin.html"> 
                                    <span>Watching Now </span><i class="ti-eye"></i></a>
                            </div>
                        </div>

                    </div>
                    <div class="main-desginer-body">
                        <div class="main-desginer-body-img">
                            <img loading="lazy" src="./DoAnFile/img/main-content/nsx2.png" alt="">
                            <div class="main-desginer-body-desc">
                                <h2 class="EN">Please be your</h2>
                                <h3 class="EN">main and shine</h3>
                                <h2 class="EN">in your own way</h2>
                                <h2 class="VI">Hãy là </h2>
                                <h3 class="VI">chính bạn và tỏa sáng</h3>
                                <h2 class="VI">theo cách của ban</h2>
                            </div>
                            <div class="main-desginer-body-watch">
                                <a href="./DoAnFile/userdesgin/maindesgin.html"> 
                                    <span>Watching Now </span><i class="ti-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="main-desginer-body col">
                        <div class="main-desginer-body-img">
                            <img loading="lazy" src="./DoAnFile/img/main-content/nsx3.jpg" alt="">
                            <div class="main-desginer-body-desc">
                                <h2 class="EN">Please be your</h2>
                                <h3 class="EN">main and shine</h3>
                                <h2 class="EN">in your own way</h2>
                                <h2 class="VI">Hãy là </h2>
                                <h3 class="VI">chính bạn và tỏa sáng</h3>
                                <h2 class="VI">theo cách của ban</h2>
                            </div>
                            <div class="main-desginer-body-watch">
                                <a href="./DoAnFile/userdesgin/maindesgin.html"> 
                                    <span>Watching Now </span><i class="ti-eye"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>

    <div class="designers ">
        <div class="grid wide">
            <div class="row">
                <div class="col l-12 m-12 c-12">
                    <div class="designers__wrapper">
                        <div class="designers__text EN">DESIGNERS</div>
                        <div class="designers__text VI">Nhà Thiết Kế</div>
                        <ul class="designers__list">
                            <li class="designers__item">
                                <a href="./DoAnFile/Portfolio Website - CodingNepal/Portfolio Website - CodingNepal/Website without Working Contact Form/index.html" class="designers__item-img">
                                    <img loading="lazy" src="./DoAnFile/img/icon/leader.jpg" alt="">
                                </a>
                                <a href="" class="designers__item-name">Văn Tùng</a>
                            </li>
                            <li class="designers__item">
                                <a href="./DoAnFile/Portfolio Website - CodingNepal/Portfolio Website - CodingNepal/Website without Working Contact Form/index.html" class="designers__item-img">
                                    <img loading="lazy" src="./DoAnFile/img/icon/tv1.jpg" alt="">
                                </a>
                                <a href="#" class="designers__item-name">Ngọc Khánh</a>
                            </li>
                            <li class="designers__item">
                                <a href="./DoAnFile/Portfolio Website - CodingNepal/Portfolio Website - CodingNepal/Website without Working Contact Form/index.html" class="designers__item-img">
                                    <img loading="lazy" src="./DoAnFile/img/icon/tv2.jpg" alt="">
                                </a>
                                <a href="#" class="designers__item-name">Ngọc Vủ</a>
                            </li>
                            <li class="designers__item">
                                <a href="./DoAnFile/Portfolio Website - CodingNepal/Portfolio Website - CodingNepal/Website without Working Contact Form/index.html" class="designers__item-img">
                                    <img loading="lazy" src="./DoAnFile/img/icon/tv3.jpg" alt="">
                                </a>
                                <a href="#" class="designers__item-name">Ngọc Hậu</a>
                            </li>
                        </ul>
                        <a href="#" class="designers__btn EN">SEE ALL DESIGNERS</a>
                        <a href="#" class="designers__btn VI">XEM TẤT CẢ</a>
                    </div>
                </div>
            </div>
            <div class="main-desginer-product">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-5 main-desginer-product-wrap">
                            <h2 class="desginer-product-wrap-heading">

                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="services grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <div class="services__heading">

                    <div class="services__heading-text EN">
                        CUSTOM SERVICES
                    </div>
                    <div class="services__heading-text VI">
                        DỊCH VỤ KHÁCH HÀNG
                    </div>
                </div>
            </div>
        </div>
        <div class="row services__items">
            <div class="col l-4 m-4 c-12 services__item">
                <div class="services__item-title EN">IDEA DESIGN</div>
                <div class="services__item-title VI">Ý TƯỞNG</div>
                <a href="#" class="services__item-icon">
                    <img loading="lazy" src="./DoAnFile/img/services/icon_pen.png" alt="">
                </a>
                <p class="services__item-desc EN">
                    Do you have ideas about design fashion,
                    do you want to create fashionable clothing from your idea
                </p>
                <p class="services__item-desc VI">

                    Bạn có ý tưởng về thời trang thiết kế,
                    bạn có muốn tạo ra quần áo thời trang từ ý tưởng của bạn
                </p>
            </div>
            <div class="col l-4 m-4 c-12 services__item">
                <div class="services__item-title EN">COLLECTION</div>
                <div class="services__item-title VI">BỘ SƯU TẬP</div>
                <a href="#" class="services__item-icon">
                    <img loading="lazy" src="./DoAnFile/img/services/icon_keo.png" alt="">
                </a>
                <p class="services__item-desc EN">
                    Do you have ideas about design fashion,
                    do you want to create fashionable clothing from your idea
                </p>
                <p class="services__item-desc VI">
                    Bạn có ý tưởng về thời trang thiết kế,
                    bạn có muốn tạo ra quần áo thời trang từ ý tưởng của bạn
                </p>
            </div>
            <div class="col l-4 m-4 c-12 services__item">
                <div class="services__item-title">COLLECTION</div>
                <a href="#" class="services__item-icon">
                    <img loading="lazy" src="./DoAnFile/img/services/icon_pen.png" alt="">
                </a>
                <p class="services__item-desc EN">
                    Do you have ideas about design fashion,
                    do you want to create fashionable clothing from your idea
                </p>
                <p class="services__item-desc VI">
                    Bạn có ý tưởng về thời trang thiết kế,
                    bạn có muốn tạo ra quần áo thời trang từ ý tưởng của bạn
                </p>
            </div>
        </div>

    </div>
    <div class="silder text-center">
        <div class="grid wide">
            <h2 class="large-heading EN">What customer say about us</h2>
            <h2 class="large-heading VI">Khách Hàng Nói Gì Về Chúng Tôi</h2>
            <div class="gtco-testimonials">
                <div class="owl-carousel owl-carousel1 owl-theme">
                    <div>
                        <div class="card text-center">
                            <img loading="lazy" class="card-img-top" src="./DoAnFile/img/card/images.jpg" alt="">
                            <div class="card-body">
                                <h5>Mr. Doraemon<br /></h5>
                                <p class="card-text">“ The mechanical cat from the future has helped Nobita
                                    in the past since 1970. Instead of Nobita marrying Jaiko, he will marry
                                    Shizuka in the future.” </p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card text-center"><img loading="lazy" class="card-img-top" src="./DoAnFile/img/card/Tu-vi-tuoi-DAN-HO-tuan-toi-23-11-2020-29-11-2020-Moi-thu-deu-dien-ra-on-dinh-4.jpg"
                                                           alt="">
                            <div class="card-body">
                                <h5>Mr. Nobi Nobita<br /></h5>
                                <p class="card-text">“ A clumsy boy, always got a score of 0, Jaian bullies,
                                    is scolded by his mother. Want to rely on Doraemon. Even so, he is a
                                    person with a kind heart and is so well-loved by everyone. He also likes
                                    Shizuka very much” </p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card text-center"><img loading="lazy" class="card-img-top" src="./DoAnFile/img/card/girl-xinh-600x600.jpg"
                                                           alt="">
                            <div class="card-body">
                                <h5>Mrs. Minamoto Shizuka<br /></h5>
                                <p class="card-text">“
                                    She loves baked potatoes, plays the piano and is very kind and helps
                                    Nobita when bullied. ” </p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card text-center"><img loading="lazy" class="card-img-top" src="./DoAnFile/img/card/giải-trí-8.jpg"
                                                           alt="">
                            <div class="card-body">
                                <h5>Mr. Goda Takeshi<br /></h5>
                                <p class="card-text">“ The fat guy, often causing trouble and bullying his
                                    friends (especially Nobita). But in return he was very brave and saved
                                    the Nobita group a number of times” </p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card text-center"><img loading="lazy" class="card-img-top" src="./DoAnFile/img/card/anh-nu-sinh-thu-hut-trieu-like-facebook-464x580.jpg"
                                                           alt="">
                            <div class="card-body">
                                <h5>Mr. Honekawa Suneo<br /></h5>
                                <p class="card-text">“ Bragging, bragging. Help Jaian bully Nobita. Quite
                                    good at repairing electronic devices.” </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="information-customer">
        <div class="grid wide">
            <div class="row information-customer-wrap">
                <div class="col l-4 c-12 m-12 information-customer-body">
                    <h2 class="information-customer-body-heading EN">
                        We send fun emails. Pop yours here and we'll prove it.
                    </h2>
                    <h2 class="information-customer-body-heading VI">
                        Chúng tôi gửi những email vui nhộn. Bật của bạn ở đây và chúng tôi sẽ chứng minh điều đó.
                    </h2>
                    <span class="information-customer-body-select EN">
                        Select Gender:
                    </span>
                    <span class="information-customer-body-select VI">
                        Chọn Giới Tính:
                    </span>
                    <div class="body-select">
                        <input type="radio" name="radio-select" class="information-customer-body-radio">
                        <span class="radio-select-text EN">
                            WOMAN
                        </span>
                        <span class="radio-select-text VI">
                            Nữ
                        </span>
                        <input type="radio" name="radio-select" class="information-customer-body-radio">
                        <span class="radio-select-text EN">
                            MAN
                        </span>
                        <span class="radio-select-text VI">
                            Nam
                        </span>
                        <input type="radio" name="radio-select" class="information-customer-body-radio">
                        <span class="radio-select-text EN">
                            PREFER NOT TO SAY
                        </span>
                        <span class="radio-select-text VI">
                            Chưa Rõ :>
                        </span>
                    </div>
                    <div class="body-select-email">
                        <input type="text" name="" id="" class="body-select-email-text"
                               placeholder="Enter your email">
                        <i class="ti-arrow-right body-select-emai-icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="scroll-top">
        <i class="fas fa-arrow-up"></i>
    </div>
    <!-- Messenger Plugin chat Code -->
    <div id="fb-root"></div>

    <!-- Your Plugin chat code -->
    <div id="fb-customer-chat" class="fb-customerchat">
    </div>


    <div class="chat_box">
        <div class="my-conv-form-wrapper">
            <form action="" method="GET" class="hidden">
                <select data-conv-question="Hello! How can I help you" name="category">
                    <option value="Contact Us">Contact Us ?</option>
                    <option value="Search product">Search product ?</option>
                </select>

                <div data-conv-fork="category">
                    <div data-conv-case="Contact Us">
                        <input type="text" name="name" data-conv-question="Please, Enter your name"> 
                        <input type="text" data-conv-question="Hi {name}, <br> It's a pleasure to meet you." data-no-answer="true">
                        <input data-conv-question="Enter your e-mail" data-pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" type="email" name="email" required placeholder="What's your e-mail?"> 
                    </div>  
                </div> 
                <div data-conv-fork="category">
                    <div data-conv-case="Search product">
                        <select data-conv-question="products" name="products">
                            <option value="dress">Dress</option>
                            <option value="glass">Glass</option>
                            <option value="son">Son</option>
                            <option value="T shirt">T shirt</option>
                        </select> 
                    </div>
                </div> 

                <div data-conv-fork="products">
                    <div data-conv-case="dress">
                        <input type="text" name="dresspro" data-conv-question="http://localhost:8080/DoAn/ProductServlet?action=SearchProductCT&id=4">

                    </div>
                </div>

                <select data-conv-question="Please Contact Us with" name="infor">
                    <option value="contact">Admin</option>
                    <option value="Information Us">Information Us</option>
                </select>
                <div data-conv-fork="infor">
                    <div data-conv-case="contact">
                        <input type="text" name="wait" data-conv-question="Please,wait for us a moment">

                    </div>
                </div>
                <div data-conv-fork="infor">
                    <div data-conv-case="Information Us">
                        <select data-conv-question="Information">
                            <option value="phonenumber">0363697690</option>
                            <option value="facebook">facebook</option>
                            <option value="website">website</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="icon__messager">

        <img loading="lazy" src="./DoAnFile/img/icon/bot.svg" alt="" class="icon__messager-item">
    </div>
    <div class="ThuQuynh__voice">
        <p class="audio__wait active" id="audio__1">Chào cậu! Mình là Thu Quỳnh >_< hướng dẫn viên tại FASHION STORE,
            mình sẽ đưa cậu đi thăm quan và giới thiệu cho cậu hiểu rõ hơn về FASHION STORE nhé. Đi thôi!</p>
        <p class="audio__wait" id="audio__2">Đây là khu vực để bạn chọn các dịch vụ trên Shop khá là đa dạng đúng không nào :D!</p>
        <p class="audio__wait" id="audio__3">Đây là những sản phẩm được mua nhiều nhất ở shop!</p>
        <p  class="audio__wait" id="audio__4">Đây là những nhà thiết kế trang phục bên shop :D mặc dù họ thiết kế hơi xấu! bạn có thể kích vào để xem chi tiết hơn về họ nhớ xem Văn Tùng :D</p>
        <p class="audio__wait" id="audio__5">Bạn có thể gửi email của bạn cho bên mình để có thể nhận được nhiều phần quà hấp dẫn như 1 chiếc dép lào chẳng hạn chẳng hạn :D</p>
        <p class="audio__wait" id="audio__5">Cảm ơn bạn đã lắng nghe mình và cuối cùng chúc bạn mua sắm ở shop vui vẻ bye cậu mình đi đây à khoang mình muốn nói là mình yêu cậu 🧡</p>
        <img loading="lazy"  id="img__icon-audio" src="./DoAnFile/img/icon/iocn2.gif" alt="">
        <img loading="lazy"  id="img__icon-audio2" src="./DoAnFile/img/icon/icon3.gif" alt="">
        <div class="ThuQuynh__voice-footer">
            <audio id="audio" src="./DoAnFile/audio/mp3-output-ttsfree(dot)com.mp3"></audio>
            <button class="btn btn--normal" style="min-width: 114px;">Quay Lại</button>
            <ul>
                <li>
                    <a class="ThuQuynh__voice-node ThuQuynh__voice-node-checked">

                    </a>
                </li>
                <li>
                    <a class="ThuQuynh__voice-node">

                    </a>
                </li>
                <li>
                    <a class="ThuQuynh__voice-node">

                    </a>
                </li>
                <li>
                    <a class="ThuQuynh__voice-node">

                    </a>
                </li>
                <li>
                    <a class="ThuQuynh__voice-node">

                    </a>
                </li>
                <li>
                    <a class="ThuQuynh__voice-node">

                    </a>
                </li>
            </ul>
            <button class="btn  btn--primary" style="min-width: 114px;">Let's go!</button>
        </div>

    </div>

    <jsp:include page="./footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="<c:url value=" ./DoAnFile/js/owl.carousel.min.js"/>"></script>
    <script src="./DoAnFile/js/index.js"></script>
    <script src="<c:url value=" ./DoAnFile/js/headerReponsive.js"/>"></script>
    <script src="<c:url value=" ./DoAnFile/js/script.js"/>"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery.convform.js"></script>
    <script type="text/javascript" src="./DoAnFile/ChatBot/js/custom.js"></script>
    <script>
                        let spinnerWrapper = document.querySelector('.spinner-wrapper');
                        window.addEventListener('load', function () {
                            spinnerWrapper.parentElement.removeChild(spinnerWrapper);
                        });
                        var headerNavItemS = document.querySelectorAll(".header__nav-item");
                        headerNavItemS.forEach(function (headerNavItem, index) {
                            headerNavItem.onclick = function () {
                                headerNavItem.classList.remove('header__nav-link-arrived');
                                this.classList.add('header__nav-link-arrived');
                            };
                        });
                        var aiAudio = document.querySelector('#audio');
                        var tourGuide = document.querySelector('.header__introduct-item-guide');
                        var thuQuynhVoice = document.querySelector('.ThuQuynh__voice');
                        var nodeVoices = document.querySelectorAll('.ThuQuynh__voice-node');
                        var imgAudio = document.querySelector('#img__icon-audio');
                        var imgAudio2 = document.querySelector('#img__icon-audio2');

                        var isPlay = 1;
                        var textAudios = document.querySelectorAll('.audio__wait');

                        var currentSong = 0;
                        var songs = ['./DoAnFile/audio/mp3-output-ttsfree(dot)com.mp3',
                            './DoAnFile/audio/mp3-output-ttsfree(dot)com (1).mp3',
                            './DoAnFile/audio/mp3-output-ttsfree(dot)com (2).mp3',
                            './DoAnFile/audio/mp3-output-ttsfree(dot)com(3).mp3',
                            './DoAnFile/audio/mp3-output-ttsfree(dot)com (4).mp3',
                            './DoAnFile/audio/mp3-output-ttsfree(dot)com (5).mp3'
                        ];
                        tourGuide.onclick = function () {
                            isPlay++;
                            if (isPlay % 2 === 0) {
                                thuQuynhVoice.style.display = 'flex';
                                imgAudio2.style.display = 'none';
                                imgAudio.style.display = 'block';
                                audio.src = songs[currentSong];
                                aiAudio.play();
                                audio.onended = function () {
                                    currentSong++;
                                    if (currentSong === 1) {
                                        Object.assign(thuQuynhVoice.style, {
                                            top: 10 + "%",
                                            left: 14 + "%"
                                        });
                                    }
                                    if (currentSong === 2) {
                                        Object.assign(thuQuynhVoice.style, {
                                            top: 30 + "%",
                                            left: 70 + "%"
                                        });
                                        window.scrollTo(0, 1100);
                                    }
                                    if (currentSong === 3) {
                                        Object.assign(thuQuynhVoice.style, {
                                            top: 30 + "%",
                                            left: 75 + "%"
                                        });
                                        window.scrollTo(0, 3300);
                                    }
                                    if (currentSong === 4) {
                                        Object.assign(thuQuynhVoice.style, {
                                            top: 30 + "%",
                                            left: 14 + "%"
                                        });
                                        window.scrollTo(0, 4900);
                                    }
                                    if (currentSong === 5) {
                                        Object.assign(thuQuynhVoice.style, {
                                            top: 50 + "%",
                                            left: 30 + "%"
                                        });
                                        window.scrollTo(0, 4900);
                                        imgAudio2.style.display = 'block';
                                        imgAudio.style.display = 'none';

                                    }
                                    if (currentSong > 5) {
                                        Object.assign(thuQuynhVoice.style, {
                                            display: 'none',
                                            top: 30 + "%",
                                            left: 70 + "%"
                                        })

                                    }
                                    if (currentSong < 6) {
                                        textAudios.forEach(function (text) {
                                            document.querySelector('.audio__wait.active').classList.remove('active');
                                            textAudios[currentSong].classList.add('active');
                                        });
                                        nodeVoices.forEach(function (node) {
                                            document.querySelector('.ThuQuynh__voice-node.ThuQuynh__voice-node-checked').classList.remove('ThuQuynh__voice-node-checked');
                                            nodeVoices[currentSong].classList.add('ThuQuynh__voice-node-checked');
                                        });
                                        audio.src = songs[currentSong];
                                        aiAudio.play();
                                    }

                                };
                            } else {
                                Object.assign(thuQuynhVoice.style, {
                                    display: 'none',
                                    top: 30 + "%",
                                    left: 70 + "%"
                                });
                                aiAudio.pause();
                            }
                        };
                        var responisveTour = window.matchMedia("(max-width: 700px)")
                        if (responisveTour.matches) {
                            tourGuide.onclick = function () {
                                isPlay++;
                                if (isPlay % 2 === 0) {
                                    thuQuynhVoice.style.display = 'flex';
                                    imgAudio2.style.display = 'none';
                                    imgAudio.style.display = 'block';
                                    audio.src = songs[currentSong];
                                    aiAudio.play();
                                    audio.onended = function () {
                                        currentSong++;
                                        if (currentSong === 1) {
                                            Object.assign(thuQuynhVoice.style, {
                                                top: 10 + "%",

                                            });
                                        }
                                        if (currentSong === 2) {
                                            Object.assign(thuQuynhVoice.style, {
                                                top: 30 + "%",

                                            });
                                            window.scrollTo(0, 900);
                                        }
                                        if (currentSong === 3) {
                                            Object.assign(thuQuynhVoice.style, {
                                                top: 30 + "%",

                                            });
                                            window.scrollTo(0, 7100);
                                        }
                                        if (currentSong === 4) {
                                            Object.assign(thuQuynhVoice.style, {
                                                top: 30 + "%",

                                            });
                                            window.scrollTo(0, 8900);
                                        }
                                        if (currentSong === 5) {
                                            Object.assign(thuQuynhVoice.style, {
                                                top: 50 + "%",

                                            });

                                            imgAudio2.style.display = 'block';
                                            imgAudio.style.display = 'none';

                                        }
                                        if (currentSong > 5) {
                                            Object.assign(thuQuynhVoice.style, {
                                                display: 'none',
                                                top: 30 + "%",

                                            })

                                        }
                                        if (currentSong < 6) {
                                            textAudios.forEach(function (text) {
                                                document.querySelector('.audio__wait.active').classList.remove('active');
                                                textAudios[currentSong].classList.add('active');
                                            });
                                            nodeVoices.forEach(function (node) {
                                                document.querySelector('.ThuQuynh__voice-node.ThuQuynh__voice-node-checked').classList.remove('ThuQuynh__voice-node-checked');
                                                nodeVoices[currentSong].classList.add('ThuQuynh__voice-node-checked');
                                            });
                                            audio.src = songs[currentSong];
                                            aiAudio.play();
                                        }

                                    };
                                } else {
                                    Object.assign(thuQuynhVoice.style, {
                                        display: 'none',
                                        top: 30 + "%",

                                    });
                                    aiAudio.pause();
                                }
                            };
                        }

    </script>
    <script>
        var chatbox = document.getElementById('fb-customer-chat');
        chatbox.setAttribute("page_id", "116005154039103");
        chatbox.setAttribute("attribution", "biz_inbox");

        window.fbAsyncInit = function () {
            FB.init({
                xfbml: true,
                version: 'v11.0'
            });
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</body>
</html>