<%-- Document : detailproduct Created on : May 20, 2021, 11:12:07 PM Author : admin --%>

<%@page import="DAO.CategoryNews" %>
<%@page import="DAO.CateNewsDao" %>
<%@page import="java.util.AbstractList" %>
<%@page import="java.util.ArrayList" %>
<%@page import="DAO.DateConver" %>
<%@page import="DAO.CategoriesDAO" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Product" %>
<%@page import="DAO.ProductDAO" %>
<%@page import="DAO.Categories" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FASHION STORE</title>
    <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poiret+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,500&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap"
          rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
          integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
          crossorigin="anonymous"/>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <link rel="stylesheet" href="./DoAnFile/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./DoAnFile/css/owl.theme.default.min.css">
    <link rel="stylesheet"
          href="./DoAnFile/assets/font/fontawesome-free-5.15.3/fontawesome-free-5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/style.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/jquery.convform.css">
    <link rel="stylesheet" href="./DoAnFile/css/reset.css">
    <link rel="stylesheet" href="./DoAnFile/css/base.css">
    <link rel="stylesheet" href="./DoAnFile/css/grid.css">
    <link rel="stylesheet" href="./DoAnFile/product/detailProduct/css/main.css">
    <link rel="stylesheet" href="./DoAnFile/header.css">
    <link rel="stylesheet" href="./DoAnFile/footer.css">
    <link rel="stylesheet" href="./DoAnFile/product/detailProduct/css/responsivedetail.css">
    <link rel="stylesheet" href="./DoAnFile/product/productcss/reponsiveproduct.css">
</head>
<style>
    .collection__link-img {
        width: 100%;
        display: block;
        position: relative;
        background-image: url(DoAnFile/img/collection.jpg);
        height: 364px;
        background-position: top center;
        background-repeat: no-repeat;
        background-size: cover;
    }

    .main__product-wrap-desc-add-cart .user-desginer-product-item-desc-add-cart {
        display: block;
        font-size: 1.6rem;
        color: #fafafa;
        font-family: "Oswald", serif;
        width: 70%;
        font-style: normal;
        background-color: #333;
        border: 1px solid var(--white-color);
        padding: 16px 0;
        text-align: center;
    }

    .size_container {
        display: flex;
        justify-content: center;
    }

    #product_categorie {
        width: 45%;
        height: 20px;
        font-size: 14px;
        margin: 8px 0;
        margin-right: -26px;
        border: 1px solid var(--boder-color);
        border-radius: 2px;
    }
</style>
<body class="preloading">
<%
    String actioncate = (String) request.getAttribute("ACTION");
    Categories cateupdate = (Categories) request.getAttribute("CATEGORIES");
    if (actioncate == null) {
        actioncate = "AddCateProduct";
    }
    if (cateupdate == null) {
        cateupdate = new Categories(0, "");
    }
    Cookie cookies[] = request.getCookies();
    String colorC = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("colorC")) {
                colorC = cookie.getValue();
                break;
            }
        }
    }
    if (colorC == "" || colorC == null || colorC.equals("")) {
        if(colorC.equals("#FFFFFF")){
            colorC = "transparent";
        }
        colorC = "transparent";
    }

%>
<div class="loader">
    <span class="fa fa-spinner xoay icon_load-page"></span>
</div>
<div class="main">
    <div class="header ">
        <div class="grid wide__header">

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
                    <% ProductDAO daopro = new ProductDAO();
                        int cateproId = 0;
                        try {
                            cateproId = Integer.parseInt(request.getAttribute("idSearchPro").toString());
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (cateproId == 0) {
                            cateproId = 4;
                        }
                        List<Product> lspro = (ArrayList<Product>) request.getAttribute("lsproC");
                    %>
                    <li class="header__nav-item header__nav-item-product">
                        <h3 class="header__nav-link">
                            <span class="EN"> PRODUCT</span>
                            <span class="VI"> SẢN PHẨM</span>
                        </h3>
                        <%
                            CategoriesDAO dao = new CategoriesDAO();
                            List<Categories> ls = dao.getAll();


                        %>
                        <div class="header__product">
                            <div class="header__product-body-item">
                                <% for (int j = 0; j < ls.size(); j++) {
                                    Categories catepro2 = ls.get(j);
                                %>
                                <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>"

                                   class="header__product-body-heading
                                           <%if (catepro2.getId() == cateproId) {
                                                   out.print("active");
                                               }%>
                                           ">
                                    <%=catepro2.getName()%>
                                </a>
                                <%}%>
                            </div>

                        </div>
                    </li>
                    <li class="header__nav-item home__nav-item-collection">
                        <a href="" class="header__nav-link">
                            <span class="EN"> COLLECTION</span>
                            <span class="VI"> BỘ SƯU TẬP</span>
                        </a>
                        <%

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
                        <ul class="header__collection row">
                            <li class="header__collection-item col l-6">
                                <div class="collection__wrap">
                                    <a href="#" class="collection__link-img">
                                    </a>
                                    <div class="collection__link-text">
                                        <div class="collection__link-primary-text">
                                            Bộ Sưu Tập Mùa Hè:
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
                                        <a href="#"
                                           class="collection__item-brand collection__item-brand-check">
                                            <img loading="lazy"
                                                 src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy"
                                                 src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy"
                                                 src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy"
                                                 src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                                 alt="">
                                        </a>
                                        <a href="#" class="collection__item-brand">
                                            <img loading="lazy"
                                                 src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
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
                        <a href="./DoAn/news.jsp" class="header__nav-link">
                            <span class="EN">NEWS</span>
                            <span class="VI">TIN TỨC</span>
                        </a>
                        <div class="header__nav-the-news">
                            <ul class="header__nav-the-news-list">

                                <%
                                    for (int i = 0; i < lsNews.size(); i++) {
                                        CategoryNews ctnews = lsNews.get(i);
                                %>

                                <li class="header__nav-the-news-item">
                                    <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>"
                                       class="header__nav-the-news-link">
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
                    <div class="header__nav-overlay">
                    </div>
                </ul>
                <a href="index.jsp" class="header__nav-heading-text">FASHION STORE</a>
                <div class="header__cart row ">
                    <ul class="header__cart-body">
                        <li class="header__cart-category header__cart-body-item">
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
                                            <input type="hidden" class="form-control" name="action"
                                                   value="<%=actioncate%>">
                                            <div class="form-group">
                                                <label for="formGroupExampleInput"></label>
                                                <input type="text" name="IDCate" class="form-control"
                                                       id="formGroupExampleInput" placeholder="Enter ID"
                                                       value="<%=cateupdate.getId()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="formGroupExampleInput2"></label>
                                                <input type="text" class="form-control" name="NameCate"
                                                       id="formGroupExampleInput2"
                                                       placeholder="Enter name" style="margin: 6px 0 12px"
                                                       value="<%=cateupdate.getName()%>">
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-cate">Submit</button>
                                            <h1>${sessionScope.tbloiCate}</h1>
                                        </form>
                                    </li>
                                </ul>

                            </div>
                        </li>

                        <form action="SearchServlet" method="get" class="header__search header__cart-body-item">

                            <div class="header__search-wrap">
                                <input oninput="searchByName(this)" type="text" class="header__search-input"
                                       placeholder="Search..." name="txtSearch" value="${txtText}">

                                <!-- History search -->

                            </div>
                            <button type="submit" class="button-search">
                                <i class="ti-search header__icon-search"></i>
                            </button>
                        </form>
                        <i class="ti-search header__icon-search header__icon-search-mobile"
                           onclick="viewsFormSearchMobile()"></i>
                        <form action="SearchServlet" method="get" class="header__cart-body-item-mobile">

                            <div class="header__search-wrap-mobile">
                                <input oninput="searchByName(this)" type="text" class="header__search-input-mobile"
                                       placeholder="Search..." name="txtSearch" value="${txtText}">
                            </div>
                            <button type="submit" class="button-search">
                                <i class="ti-search header__icon-search-mobile"></i>
                            </button>
                        </form>

                        <a href="./signUp.jsp" class="Login__Product"
                                <c:if test="${not sessionScope.ck}">
                                    style="display: block; color: var(--white-color);font-size: 1.6rem;"
                                </c:if>
                                <c:if test="${sessionScope.ck}">
                                    style="display: none;"
                                </c:if>
                        >
                            Login
                        </a>
                        <li class="header__introduct-item header__introduct-item-voice">
                            <i class="ti-microphone icon__ai-voice"></i>
                        </li>
                        <li class="header__introduct-item header__nav-acc header__cart-body-item"
                            onclick="IconCart()">

                            <div  <c:if test="${sessionScope.ck}">
                                style="display: flex"
                            </c:if>
                                    <c:if test="${not sessionScope.ck}">
                                        style="display: none;"
                                    </c:if>>

                                <img loading="lazy" src="./DoAnFile/img/icon/leader.jpg" alt=""
                                     class="header__introduct-acc-icon">
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
                                        <i class="ti-home"></i><span> My Address</span>
                                    </a>
                                </li>
                                <li class="header__introduct-acc-item">
                                    <a href="">
                                        <i class="ti-money"></i> <span> Purchase Order</span>
                                    </a>
                                </li>
                                <li class="header__introduct-acc-item header__introduct-acc-item--separate">
                                    <a href="AccServlet?action=LogoutProduct">
                                        <i class="fas fa-sign-in-alt"></i> <span>Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="header__cart-wrap header__cart-body-item">
                            <a href="ShowCartServlet">
                                <i class="header__cart-icon ti-shopping-cart"></i>
                                <span class="header__cart-notice">${sessionScope.lsCart.size()}</span>
                                <!-- No Cart :header__cart-list-no_cart -->
                                <div class="header__cart-list">
                                    <div class="header__cart-list-no-cart" <c:if test="${sessionScope.lsCart.size()<1}">
                                        style="display: block;"
                                    </c:if>>
                                        <img loading="lazy" src="./DoAnFile/img/no-cart.png" alt=""
                                             class="header__cart-no_cart-img">
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
                                    <a href="ShowCartServlet" class="header__cart-view-cart btn btn--primary">Watch
                                        Cart</a>
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
    <div class="header__category-mobile">
        <ul class="header__nav-list-mobile">
            <li class="header__nav-item">
                <div class="header__nav-link">
                    <span class="header__nav-link-arrived EN"> HOME PAGE</span>
                    <span class="header__nav-link-arrived VI"> TRANG CHỦ</span>
                </div>
            </li>
            <li class="header__nav-item header__nav-item-product">
                <div class="header__nav-link header__nav-link-mobile">
                    <span class="EN"> PRODUCT</span>
                    <span class="VI"> SẢN PHẨM</span>
                </div>

                <div class="header__product header__product-mobile">
                    <div class="header__product-body-item">
                        <%
                            for (int j = 0; j < ls.size(); j++) {
                                Categories catepro2 = ls.get(j);
                        %>
                        <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>"
                           class="header__product-body-heading">
                            <%=catepro2.getName()%>
                        </a>
                        <%}%>
                    </div>

                </div>
            </li>
            <li class="header__nav-item home__nav-item-collection">
                <div class="header__nav-link" onclick="headerColectionChange()">
                    <span class="EN"> COLLECTION</span>
                    <span class="VI"> BỘ SƯU TẬP</span>
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
                                    <img loading="lazy"
                                         src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                         alt="">
                                </a>
                                <a href="#" class="collection__item-brand">
                                    <img loading="lazy"
                                         src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                         alt="">
                                </a>
                                <a href="#" class="collection__item-brand">
                                    <img loading="lazy"
                                         src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                         alt="">
                                </a>
                                <a href="#" class="collection__item-brand">
                                    <img loading="lazy"
                                         src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                         alt="">
                                </a>
                                <a href="#" class="collection__item-brand">
                                    <img loading="lazy"
                                         src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
                                         alt="">
                                </a>
                            </div>
                        </div>
                    </li>

                </ul>
            </li>
            <li class="header__nav-item">
                <div href="" class="header__nav-link">
                    <span class="EN"> DESIGN T-Shirt</span>
                    <span class="VI"> THIẾT KẾ ÁO</span>
                </div>
            </li>
            <li class="header__nav-item header__nav-item-the-news">
                <div href="./DoAn/news.jsp" class="header__nav-link" onclick="headerTheNewsChange()">
                    <span class="EN"> NEWS</span>
                    <span class="VI"> TIN TỨC</span>
                </div>
                <div class="header__nav-the-news header__nav-the-news-mobile">
                    <ul class="header__nav-the-news-list">

                        <% for (int i = 0; i < lsNews.size(); i++) {
                            CategoryNews ctnews = lsNews.get(i);
                        %>

                        <li class="header__nav-the-news-item">
                            <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>"
                               class="header__nav-the-news-link">
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
                </a>
            </li>

            <li class="header__nav-item">

                <c:if test="${sessionScope.privi}">
                    <a href="./DoAnFile/at-pro-admin-template-master/at-pro-admin-template-master/index.html"
                       class="header__nav-link">
                        <span class="EN">MANAGE WEB</span>
                        <span class="VI">QUẢN LÍ WEB</span>
                    </a>
                </c:if>
            </li>
            <div class="header__nav-overlay">
            </div>
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
                <span class="header__category-mobile-min-link VI"
                      onclick="HeaderProductDetai()">SẢN PHẨM</span>
            </li>
            <li>
                        <span class="header__category-mobile-min-link EN"
                              onclick="HeaderColectionDetai()">COLECTION</span>
                <span class="header__category-mobile-min-link VI"
                      onclick="HeaderColectionDetai()">BỘ SƯU TẬP</span>
            </li>
            <li>
                <a href="./Desigin.jsp" class="header__category-mobile-min-link EN">
                    DESIGN T-Shirt
                </a>
                <a href="./Desigin.jsp" class="header__category-mobile-min-link VI">
                    THIẾT KẾ ÁO
                </a>
            </li>
            <li>
                        <span class="header__category-mobile-min-link EN"
                              onclick="HeaderTheNewsDetai()">NEWS</span>
                <span class="header__category-mobile-min-link VI"
                      onclick="HeaderTheNewsDetai()">TIN TỨC</span>
            </li>


            <li class="header__nav-item">

                <c:if test="${sessionScope.privi}">
                    <a href="./DoAnFile/at-pro-admin-template-master/at-pro-admin-template-master/index.html"
                       class="header__nav-link">
                        <span class="EN">MANAGE WEB</span>
                        <span class="VI">QUẢN LÍ WEB</span>
                    </a>
                </c:if>
            </li>
        </ul>
        <div class="header__product-deatil">
            <div class="header__product-deatil-heading" onclick="HeaderBalck()">
                <i class="ti-angle-left"></i>
                <p class="EN">PRODUCT</p>
                <p class="VI">SẢN PHẨM</p>
                <div class="header__product-body-item">
                    <%
                        for (int j = 0; j < ls.size(); j++) {
                            Categories catepro2 = ls.get(j);
                    %>
                    <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>"
                       class="header__product-body-heading">
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
                <p class="VI">BỘ SƯU TẬP</p>
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
                                <img loading="lazy"
                                     src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png"
                                     alt="">
                            </a>
                            <a href="#" class="collection__item-brand">
                                <img loading="lazy"
                                     src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png"
                                     alt="">
                            </a>
                            <a href="#" class="collection__item-brand">
                                <img loading="lazy"
                                     src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png"
                                     alt="">
                            </a>
                            <a href="#" class="collection__item-brand">
                                <img loading="lazy"
                                     src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png"
                                     alt="">
                            </a>
                            <a href="#" class="collection__item-brand">
                                <img loading="lazy"
                                     src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png"
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
                <p class="VI">Tin Tức</p>
                <ul class="header__product-deatil-list">

                    <% for (int i = 0; i < lsNews.size(); i++) {
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
</div>
<div class="orientation">
    <div class="grid wide">
        <div class="row orientation__wrap">
            <div class="col l-12 m-12 c-12 orientation__wrap-body">
                <ul class="orientation__wrap-body-list">
                    <%

                        Product pro = (Product) request.getAttribute("Prodetail");
                        if (pro == null) {
                            pro = new Product(54, "Lorem ipsum dolor sit amet", "./DoAnFile/product/detailProduct/imgtail/anh6.jpg",
                                    "./DoAnFile/product/detailProduct/imgtail/anh7.jpg", 400, 200, DateConver.now(),
                                    new Categories(4, ""), "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis dignissim nunc", 2, 25, "M", "transparent");
                        }
                    %>
                    <li>
                        <a href="" class="orientation__wrap-body-list-link">FASHION STORE</a>
                    </li>
                    <li>
                        <a href="" class="orientation__wrap-body-list-link"><%=pro.getCateID().getName()%>
                        </a>
                    </li>

                    <li>
                        <a href=""
                           class="orientation__wrap-body-list-link orientation__wrap-body-list-link-end">
                            <%=pro.getName()%>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="main__product">
    <div class="grid wide main__product-body">
        <div class="row main__product-wrap">
            <div class="col l-1 m-1 c-0 main__product-wrap-node">
                <span onclick="node1()" class="product-wrap-node main__product-wrap-node-arrived"></span>
                <span onclick="node2()" class="product-wrap-node"></span>
            </div>

            <div id="samples" class="col l-8 m-8 c-12 main__product-wrap-img" onmouseout="zoomOut()"
                 onscroll="scrollFuntionImg()">
                <div class="cursor"></div>
                <ul class="main__product-wrap-img-list" onmousemove="zoomIn(event)">
                    <li>
                        <a class="main__product-wrap-img-list-link ">
                            <img loading="lazy" id="zoom1" onmousemove="zoomIn(event)" onmouseout="zoomOut()"
                                 class="main__product-wrap-img-item active"
                                 src="<%=pro.getImgFont()%>" alt="">
                            <div class="main__product-wrap-img-list-link-change" style="background: <%=colorC%>">

                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="main__product-wrap-img-list-link">
                            <img loading="lazy" id="zoom2" onmousemove="zoomIn(event)" onmouseout="zoomOut()"
                                 class="main__product-wrap-img-item"
                                 src="<%=pro.getImgBehind()%>" alt="">
                            <div class="main__product-wrap-img-list-link-change" style="background: <%=colorC%>">

                            </div>
                        </a>
                    </li>

                </ul>
            </div>
            <div class="col l-3 m-4 c-0 main__product-wrap-desc" onmousemove="zoomOut(event)">
                <div class="col l-3 m-4 c-0">
                    <div id="preview" onmousemove="zoomIn(event)"></div>
                </div>
                <div class="main__product-wrap-desc-heading">
                    <h3><%=pro.getName()%>
                    </h3>

                    <div class="main__product-wrap-desc-heading-vote">
                        <p class="main__product-wrap-desc-heading-price">$<%=pro.getPriceNew()%>VND</p>
                        <i class="ti-star"></i><i class="ti-star"></i><i class="ti-star"></i><i
                            class="ti-star"></i><i class="ti-star"></i>
                        <span>(5)</span>
                    </div>
                </div>
                <form action="CartServlet" method="GET">
                    <div class="main__product-wrap-desc-size">
                        <h4>Size</h4>
                        <div class="size_container">
                            <select id="product_categorie" name="product_size">
                                <option value="<%=pro.getSize()%>"><%=pro.getSize()%>
                                </option>
                                <option value="M">M
                                </option>
                                <option value="L">L
                                </option>
                                <option value="S">S
                                </option>
                                <option value="XS">XS
                                </option>
                                <option value="XXL">XXL
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="main__product-wrap-desc-color">
                        <h4>Color</h4>

                        <div class="main__product-choose-color">
                            <input type="color" id="text__color" name="color_changing" value="<%=colorC%>">
                            <i class="ti-close off__color"></i>
                        </div>
                    </div>
                    <input name="idCart" value="<%=pro.getId()%>" hidden>
                    <div class="main__product-wrap-desc-quantity">
                        <h4>Quantity:</h4>
                        <input type="number" value="1" class="main__product-wrap-desc-quantity-input">
                    </div>
                    <div class="main__product-wrap-desc-add-cart">
                        <button type="submit" class="user-desginer-product-item-desc-add-cart">Add Cart</button>
                        <div class="main__product-wrap-desc-add-cart-icon">
                            <i class="ti-heart"></i>
                        </div>
                    </div>
                </form>
                <div class="main__product-wrap-desc-detail">
                    <a>
                        <p class="main__product-wrap-desc-detail-heading"> Product Details:</p>
                    </a>
                    <div class="main__product-wrap-desc-detail-text">
                        <p><%=pro.getDescription()%>
                        </p>
                    </div>
                    <div class="main__product-wrap-desc-suggest main__product-wrap-desc-item">
                        <a>
                            <p class="main__product-wrap-desc-text"> Suggestions To Coordinate Clothes</p>
                        </a>
                        <i class="ti-angle-right"></i>
                    </div>
                    <div class="main__product-wrap-desc-delivery main__product-wrap-desc-item">
                        <a>
                            <p class="main__product-wrap-desc-text"> Delivery & Return</p>
                        </a>
                        <i class="ti-angle-right"></i>
                    </div>
                    <div class="main__product-wrap-desc-item">
                        <a>
                            <p class="main__product-wrap-desc-text"> Material & Care</p>
                            <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/imgIcon/customer-care.svg"
                                 alt=""
                                 class="main__product-wrap-desc-img">
                        </a>
                        <i class="ti-angle-right"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="gtco-testimonials-detail">
        <div class="owl-carousel owl-carousel5 owl-theme">
            <div class="main-desginer-body">
                <img loading="lazy" src="<%=pro.getImgFont()%>" alt="">
                <div class="main__product-wrap-img-list-link-change" style="background: <%=colorC%>">

                </div>
            </div>
            <div class="main-desginer-body">
                <img loading="lazy" src="<%=pro.getImgBehind()%>" alt="">
                <div class="main__product-wrap-img-list-link-change" style="background: <%=colorC%>">

                </div>
            </div>

        </div>
    </div>
    <div class="col l-0 m-12 c-12 main__product-wrap-desc">
        <div class="col l-3 m-4 c-0">
            <div id="preview" onmousemove="zoomIn(event)"></div>
        </div>
        <div class="main__product-wrap-desc-heading">
            <h3><%=pro.getName()%>
            </h3>

            <div class="main__product-wrap-desc-heading-vote">
                <p class="main__product-wrap-desc-heading-price">$<%=pro.getPriceNew()%>VND</p>
                <i class="ti-star"></i><i class="ti-star"></i><i class="ti-star"></i><i
                    class="ti-star"></i><i class="ti-star"></i>
                <span>(5)</span>
            </div>
        </div>
        <div class="main__product-wrap-desc-size">
            <h4>Size</h4>
            <ul class="main__product-wrap-desc-size-list">
                <li>
                    <a href=""
                       class="main__product-wrap-desc-size-link main__product-wrap-desc-size-link-check">
                        S
                    </a>
                </li>
                <li>
                    <a href="" class="main__product-wrap-desc-size-link">
                        M
                    </a>
                </li>
                <li>
                    <a href="" class="main__product-wrap-desc-size-link">
                        L
                    </a>
                </li>
                <li>
                    <a href="" class="main__product-wrap-desc-size-link">
                        XL
                    </a>
                </li>

            </ul>
        </div>
        <div class="main__product-wrap-desc-color">
            <h4>Color</h4>

            <div class="main__product-choose-color">
                <input type="color" id="text__color-mobile" value="transparent">


                <i class="ti-close off__color2"></i>
            </div>
        </div>
        <div class="main__product-wrap-desc-quantity">
            <h4>Quantity:</h4>
            <input type="number" id="" value="1" class="main__product-wrap-desc-quantity-input">
        </div>

        <div class="main__product-wrap-desc-add-cart">
            <a href="CartServlet?idCart=<%=pro.getId()%>" class="user-desginer-product-item-desc-add-cart">Add Cart</a>
            <div class="main__product-wrap-desc-add-cart-icon">
                <i class="ti-heart"></i>
            </div>
        </div>
        <div class="main__product-wrap-desc-detail">
            <a>
                <p class="main__product-wrap-desc-detail-heading"> Product Details:</p>
            </a>
            <div class="main__product-wrap-desc-detail-text">
                <p><%=pro.getDescription()%>
                </p>
            </div>
            <div class="main__product-wrap-desc-suggest main__product-wrap-desc-item">
                <a>
                    <p class="main__product-wrap-desc-text"> Suggestions To Coordinate Clothes</p>
                </a>
                <i class="ti-angle-right"></i>
            </div>
            <div class="main__product-wrap-desc-delivery main__product-wrap-desc-item">
                <a>
                    <p class="main__product-wrap-desc-text"> Delivery & Return</p>
                </a>
                <i class="ti-angle-right"></i>
            </div>
            <div class="main__product-wrap-desc-item">
                <a>
                    <p class="main__product-wrap-desc-text"> Material & Care</p>
                    <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/imgIcon/customer-care.svg" alt=""
                         class="main__product-wrap-desc-img">
                </a>
                <i class="ti-angle-right"></i>
            </div>
        </div>
    </div>

</div>
<div class="suggest__product-same">
    <div class="grid wide">
        <div class="row">
            <div class="col c-12 l-12 m-12 suggest__product-same-heading">
                <p>Product Same Kind</p>
                <div class="suggest__product-same-heading-icon">
                    <i class="ti-angle-left play"></i> <i class="ti-angle-right stop"></i>
                </div>
            </div>
        </div>
        <%

            List<Product> lsSamePro = (AbstractList<Product>) request.getAttribute("lsSamePro");
        %>
        <div class="row gtco-testimonials">
            <div class="owl-carousel owl-carousel1 owl-theme">
                <%
                    for (int i = 0; i < lsSamePro.size() / 2; i++) {
                        Product proSame = lsSamePro.get(i);
                        if (i == 6) {
                            break;
                        }
                %>
                <div class="main-product-wrap-body-item col">
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=proSame.getId()%>">
                            <i class="ti-pencil"></i>
                        </a>
                    </c:if>
                    <div class="user-desginer-product-item-img">
                        <img loading="lazy" src="<%=proSame.getImgFont()%>" alt=""
                             class="user-desginer-product-item-img-font">
                        <img loading="lazy" src="<%=proSame.getImgBehind()%>" alt=""
                             class="user-desginer-product-item-img-behind">
                        <div class="main-slider__item-info-cart">
                            <div class="main-slider__item-btn-list">
                                <a class="main-slider__item-btn main-slider__item-btn-like">
                                    <i class="ti-heart"></i>
                                </a>
                                <a class="main-slider__item-btn main-slider__item-btn-search">
                                    <i class="ti-search"></i>
                                </a>
                                <a class="main-slider__item-btn main-slider__item-btn-external-link">
                                    <i class="ti-help"></i>
                                </a>
                            </div>
                            <div class="main-slider__item-add-btn">
                                <a href="DetailProServlet?action=watchPro&id=<%=proSame.getId()%>">
                                    <span>Watching Now </span><i class="ti-eye"></i> </a>
                            </div>
                        </div>
                        <div class="main-slider__item-favourite">
                            <i class="fas fa-check"></i>
                            <span>Hot</span>
                        </div>
                        <div class="main-slider__item-sale">
                            <span class="main-slider__item-sale-persent"><%=proSame.getRerentageDiscoint()%></span>
                            <span class="main-slider__item-sale-discount">Discount</span>
                        </div>
                    </div>
                    <div class="user-desginer-product-item-desc">
                        <a href=""
                           class="user-desginer-product-item-desc-link user-desginer-product-item-desc-item">
                            <%=proSame.getName()%>
                        </a>
                        <div class="user-desginer-product-item-desc-link-price">
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-old user-desginer-product-item-desc-item">
                                <span> <%=proSame.getPriceOld()%>VND</span>
                            </a>
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-new user-desginer-product-item-desc-item">
                                <%=proSame.getPriceNew()%>VND
                            </a>
                        </div>
                        <a href="" class="user-desginer-product-item-desc-add-cart">Add Cart</a>
                    </div>
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product"
                           href="ProductServlet?action=DeletePageProduct&id=<%=proSame.getId()%>">
                            <i class="ti-trash"></i>
                        </a>
                    </c:if>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
<div class="write__reviews">
    <div class="grid wide">
        <div class="row">
            <div class="col l-12 m-12 c-12">
                <p class="reviews__heading"> REVIEWS</p>
            </div>
            <div class="col l-12 m-12 c-12 write__reviews-wrap">
                <div class="write__reviews-wrap-body">
                    <span class="write__reviews-wrap-body-message">To Leave Message</span>
                    <p id="writereview" onclick="WriteReview()">Write A Review</p>
                    <p id="writeask" onclick="WriteQuestion()">Ask A Question</p>
                </div>
            </div>
            <div id="review" class="col c-12 m-12 l-12 write__reviews-detail">
                <div class="write__reviews-detail-main">
                    <div class="write__reviews-detail-main-heading">
                        <h2>WRITE A REVIEW</h2> <i class="ti-close write__reviews-detail-main-close"></i>
                    </div>
                    <div class="write__reviews-detail-main-vote">
                        <span>*</span>
                        <p> VOTE:</p>
                    </div>
                    <div class="write__reviews-detail-main-star">
                        <ul class="ratings">
                            <li class="star"></li>
                            <li class="star"></li>
                            <li class="star"></li>
                            <li class="star"></li>
                            <li class="star"></li>
                        </ul>

                    </div>
                    <div class="write__reviews-detail-main-title">
                        <div class="write__reviews-detail-main-title-body">
                            <span>*</span>
                            <p>TITLE:</p>
                        </div>
                        <input type="text" class="write__reviews-detail-main-title-input"
                               placeholder="Title">

                    </div>
                    <div class="write__reviews-detail-main-review">
                        <div class="write__reviews-detail-main-review-body">
                            <span>*</span>
                            <p>Review:</p>
                        </div>
                        <div id="editor__review"></div>
                    </div>
                    <div class="write__reviews-detail-main-send col l-12 c-12 m-12">
                        <div class="row">
                            <p class="col l-2 m-2 c-2 write__reviews-detail-main-send-heading">Connect With:
                            </p>
                            <div class="write__reviews-detail-main-send-body col l-10 m-10 c-10">
                                <div class="write__reviews-detail-main-send-item  c-12 m-6 l-6">
                                    <div class="write__reviews-detail-main-review-body">
                                        <span>*</span>
                                        <p>Use your name:</p>
                                    </div>
                                    <input type="text" class="write__reviews-detail-main-send-input"
                                           placeholder="Use your name">
                                </div>
                                <div class="write__reviews-detail-main-send-item row c-12 m-6 l-6">
                                    <div class="write__reviews-detail-main-review-body">
                                        <span>*</span>
                                        <p>Email:</p>
                                    </div>
                                    <input type="text"
                                           class="write__reviews-detail-main-send-input write__reviews-detail-main-send-item-user "
                                           placeholder="Email">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-send l-12 c-12 m-12">
                        <a class="btn-send-wrap">
                                    <span>
                                        SEND
                                    </span>
                        </a>

                    </div>
                </div>

            </div>
            <div id="question" class="col c-12 m-12 l-12 write__qustion-detail">
                <div class="write__reviews-detail-main">
                    <div class="write__reviews-detail-main-heading">
                        <h2>ASK A QUESTION</h2> <i class="ti-close detail-main-question-close"></i>
                    </div>
                    <div class="write__reviews-detail-main-review">
                        <div class="write__reviews-detail-main-review-body">
                            <span>*</span>
                            <p>Question:</p>
                        </div>
                        <div id="editor__question"></div>
                    </div>
                    <div class="write__reviews-detail-main-send col l-12 c-12 m-12">
                        <div class="row">
                            <p class="col l-2 m-2 c-2 write__reviews-detail-main-send-heading"></p>
                            <div class="write__reviews-detail-main-send-body col l-10 m-10 c-10">
                                <div class="write__reviews-detail-main-send-item col c-12 m-6 l-6">
                                    <div class="write__reviews-detail-main-review-body">
                                        <span>*</span>
                                        <p>Use your name:</p>
                                    </div>
                                    <input type="text" class="write__reviews-detail-main-send-input"
                                           placeholder="Use your name">
                                </div>
                                <div class="write__reviews-detail-main-send-item row c-12 m-6 l-6">
                                    <div class="write__reviews-detail-main-review-body">
                                        <span>*</span>
                                        <p>Email:</p>
                                    </div>
                                    <input type="text"
                                           class="write__reviews-detail-main-send-input write__reviews-detail-main-send-item-gmail "
                                           placeholder="Email">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-send l-12 c-12 m-12">
                        <a href="" class="btn-send-wrap">
                                    <span>
                                        SEND
                                    </span>
                        </a>

                    </div>
                </div>

            </div>
            <div class="write__reviews-detail-wrap col m-12 c-12 l-12">
                <p class="write__reviews-detai-wrap-heading" onclick="WriteReview()">REVIEWS</p>
                <p class="write__reviews-detai-wrap-heading" onclick="WriteQuestion()">QUESTIONS</p>
            </div>

        </div>
    </div>

</div>
<div class="write__evaluate">
    <div class="grid wide">
        <div class="row">
            <div class="col c-12 m-12 l-12 write__evaluate-heading write__evaluate-item">
                <h2>To Leave Your Satisfied</h2>
            </div>
            <div class="col c-12 l-12 m-12 write__evaluate-start write__evaluate-item">
                <ul class="ratings2">
                    <li class="star2"></li>
                    <li class="star2"></li>
                    <li class="star2"></li>
                    <li class="star2"></li>
                    <li class="star2"></li>
                </ul>
            </div>
            <div class="col c-12 m-12 l-12 write__evaluate-send write__evaluate-item">
                <a href="" class="btn-send-wrap">
                    <span>SEND</span>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="comment__detail">
    <div class="grid wide">
        <div class="row comment__detail-main">
            <div class=" c-12 m-12 l-12 comment__detail-main">
                <div class="comment__detail-heading">
                    <span>12 Comment</span>
                    <i class="ti-angle-down"></i>
                    <span>The Newest Comment</span>
                </div>
                <div class="comment__detail-main-input">
                    <img loading="lazy" src="./DoAnFile/img/icon/tom.jpg" alt=""
                         class="comment__detail-main-input-img col c-1 l-1 m-1">
                    <input type="text" class="comment__detail-input col c-11 l-11 m-11"
                           placeholder="Leave comments here">
                </div>
                <div class="comment__detail-comment">
                    <div class="comment__detail-comment-first">
                        <img loading="lazy" src="./DoAnFile/img/icon/tom2.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">100</span>
                                <i class="ti-heart icon__heart-comment active"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>

                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/juery.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/juery2.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                    <div class="comment__detail-comment-first">
                        <img loading="lazy" src="./DoAnFile/img/icon/tom5.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>

                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/tom8.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/juery4.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>

                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/juery2.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                    <div class="comment__detail-comment-first-watch-more col c-12 l-12 m-12">
                        <i class="ti-angle-down"></i>
                        <p>Wacth More Comment</p>
                    </div>
                    <div class="comment__detail-comment-first">
                        <img loading="lazy" src="./DoAnFile/img/icon/tom3.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>

                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/juery4.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                    <div class="comment__detail-comment-first active">
                        <img loading="lazy" src="./DoAnFile/img/icon/tom7.jpg" alt=""
                             class="comment__detail-main-input-img small col c-1 l-1 m-1">
                        <div class="comment__detail-comment-content col c-11 l-11 m-11">
                            <div class="comment__detail-comment-content-first">
                                        <span class="comment__detail-comment-content-name">
                                            Tom
                                        </span>
                                <h6 class="comment__detail-comment-time">2 Days ago</h6>
                            </div>
                            <p>The dress is beautiful, the dress is beautiful, the fabric is good
                                Shop is enthusiastic to cover the product name
                                Fast delivery recommended to buy</p>
                            <div class="comment__detail-comment-content-feeling">
                                <span class="number__heart__comment">10</span>
                                <i class="ti-heart icon__heart-comment"></i>
                                <i class="ti-heart-broken icon__heart-comment-dislike"></i>
                                <p>Reply</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="./footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./DoAnFile/js/owl.carousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/style.css">
<link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/responsive.css">
<link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/jquery.convform.css">
<script src="./DoAnFile/product/detailProduct/js/indexDetail.js"></script>
<script src="./DoAnFile/CKEditor/ckeditor5-build-classic-27.1.0/ckeditor5-build-classic/ckeditor.js"></script>
<script src="./DoAnFile/js/mainckeritor.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery.convform.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/custom.js"></script>
<script>
    ClassicEditor.create(document.querySelector('#editor__question')).cathc(error => {
        console.error(error);
    });
</script>
<script>
    const changeColors = document.querySelectorAll(".main__product-wrap-img-list-link-change");
    const intTextColor = document.querySelector('#text__color');
    const intTextColorMb = document.querySelector('#text__color-mobile');
    const iconOffColor = document.querySelector('.off__color');
    const iconOffColor2 = document.querySelector('.off__color2');
    const pre = document.getElementById("preview");
    let colorCJS = '<%=colorC%>';
    if (colorCJS !== '' || colorCJS !== "") {
        iconOffColor.style.display = 'block';
        changeColors.forEach((changecolor, i) => {
            changecolor.style.display = 'block';
            changecolor.style.backgroundColor = colorCJS;
        });
        iconOffColor.style.display = 'block';
        iconOffColor.onclick = function (){
            changeColors.forEach((changecolor, i) => {
                changecolor.style.display = 'none';
                changecolor.style.backgroundColor = 'transparent';
                intTextColor.value = "transparent";
            });
        }


    }
    intTextColor.oninput = function () {
        let color = intTextColor.value;
        iconOffColor.style.display = 'block';
        pre.style.display = 'none';
        iconOffColor.onclick = function () {
            const changeColors = document.querySelectorAll(".main__product-wrap-img-list-link-change");
            changeColors.forEach((changecolor, i) => {
                changecolor.style.display = 'none';
                changecolor.style.backgroundColor = 'transparent';
            });
            iconOffColor.style.display = 'none';
            pre.style.display = 'block';
        };
        changeColors.forEach((changecolor, i) => {
            changecolor.style.display = 'block';
            changecolor.style.backgroundColor = color;
        });
    }
    intTextColorMb.oninput = function () {
        let color = intTextColorMb.value;
        iconOffColor2.style.display = 'block';
        iconOffColor2.onclick = function () {
            const changeColors = document.querySelectorAll(".main__product-wrap-img-list-link-change");
            changeColors.forEach((changecolor, i) => {
                changecolor.style.display = 'none';
                changecolor.style.backgroundColor = 'transparent';
            });
            iconOffColor2.style.display = 'none';
        };
        changeColors.forEach((changecolor, i) => {
            changecolor.style.display = 'block';
            changecolor.style.backgroundColor = color;
        });
    }

    function zoomIn(event) {
        pre.style.visibility = "visible";
        if ($('#zoom1').is(':hover')) {
            var img = document.getElementById("zoom1");
            pre.style.backgroundImage = "url('<%=pro.getImgFont()%>')";

        }
        if ($('#zoom2').is(':hover')) {
            var img = document.getElementById("zoom2");
            pre.style.backgroundImage = "url('<%=pro.getImgBehind()%>')";
        }
        document.addEventListener('mousemove', e => {
            var posX = e.offsetX;
            var posY = e.offsetY;
            pre.style.backgroundPosition = (-posX - 100) + "px " + (-posY * 1.3) + "px";

        });
    }

    $(window).on('load', function (event) {
        $('body').removeClass('preloading');

        $('.loader').delay(1000).fadeOut('fast');
    });
</script>
<script src="./DoAnFile/js/headerReponsive.js"></script>
</body>

</html>