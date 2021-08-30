<%-- 
    Document   : product.jsp
    Created on : May 20, 2021, 11:10:39 PM
    Author     : admin
--%>

<%@page import="DAO.CategoryNews" %>
<%@page import="DAO.CateNewsDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="DAO.Product" %>
<%@page import="java.util.List" %>
<%@page import="DAO.CategoriesDAO" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
          integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
          crossorigin="anonymous"/>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="./DoAnFile/assets/font/fontawesome-free-5.15.3/fontawesome-free-5.15.3/css/all.min.css">
    <link rel="stylesheet" href="./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/style.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/jquery.convform.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">
    <link rel="stylesheet" href="./DoAnFile/css/reset.css">
    <link rel="stylesheet" href="./DoAnFile/css/base.css">
    <link rel="stylesheet" href="./DoAnFile/css/grid.css">
    <link rel="stylesheet" href="./DoAnFile/footer.css">
    <link rel="stylesheet" href="./DoAnFile/product/productcss/mainproduct.css">
    <link rel="stylesheet" href="./DoAnFile/header.css">
    <link rel="stylesheet" href="./DoAnFile/product/productcss/reponsiveproduct.css">
    <style>
        .collection__link-img {
            background-image: url(DoAnFile/img/collection.jpg);
        }

        .VI {
            display: none;
        }
    </style>
</head>

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
                    <%
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
                        <li>
                            <jsp:include page="/toggle.jsp"></jsp:include>
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
                    <span class="header__nav-link-arrived VI">TRANG CHỦ</span>
                </div>
            </li>
            <li class="header__nav-item header__nav-item-product">
                <div class="header__nav-link header__nav-link-mobile EN">
                    PRODUCT
                </div>
                <div class="header__nav-link header__nav-link-mobile VI">
                    SẢN PHẨM
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
                    <span class="VI">BỘ SƯU TẬP</span>
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
                    <a href="./Desigin.jsp" class="header__nav-link EN">
                        DESIGN T-Shirt
                    </a>
                    <a href="./Desigin.jsp" class="header__nav-link VI">
                        THIẾT KẾ ÁO
                    </a>
                </div>
            </li>
            <li class="header__nav-item header__nav-item-the-news">
                <div href="./DoAn/news.jsp" class="header__nav-link" onclick="headerTheNewsChange()">
                    <span class="EN">NEWS</span>
                    <span class="VI">TIN TỨC</span>
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
                    <a href="pageAdminServlet" class="header__nav-link">
                        <span class="EN"> MANAGE WEB</span>
                        <span class="VI"> QUẢN LÍ WEB</span>
                    </a>
                </c:if>
            </li>
            <div class="header__nav-overlay">
            </div>
        </ul>
        <ul class="header__category-mobile-min">
            <li>
                <a href="./index.jsp"
                   class="header__category-mobile-min-link header__category-mobile-min-link-check EN">HOME</a>

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


            <li class="header__nav-item">

                <c:if test="${sessionScope.privi}">
                    <a href="./DoAnFile/at-pro-admin-template-master/at-pro-admin-template-master/index.html"
                       class="header__nav-link">
                        <span class="EN"> MANAGE WEB</span>
                        <span class="VI"> QUẢN LÍ WEB</span>
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
    <nav class="header__nav-filter">
        <div class="grid wide filter__wrap">
            <div class="row ">
                <div class="header__nav-filter-wrap col c-12 l-12 m-12">
                    <ul class="header__nav-filter-category m-5 c-5">
                        <li class="header__nav-filter-category-item header__nav-filter-category-item-filter">
                            <label for="filter__category-checkbox" class="header__nav-filter-category-item-link"
                                   id="mychangeclass">
                                <img loading="lazy" src="./DoAnFile/product/img/left-arrow.svg"
                                     class="header__nav-filter-category-item-link-img" alt="anh">

                                </img>
                                <span class="header__nav-filter-category-item-link-span EN"><span class="EN">Filter Product</span><span
                                        class="VI">Lọc sản phẩm</span>
                                             </span>

                            </label>

                        </li>
                        <li class="header__nav-filter-category-item ">
                            <label for="filter-list-size-checkbox" class="header__nav-filter-category-item-link"
                                   onclick="changWidth2()">
                                <span class="EN"> SIZE</span>
                                <span class="VI">KÍCH THƯỚC</span>
                                <i class="ti-angle-down"></i>
                                <input type="checkbox" hidden id="filter-list-size-checkbox"
                                       class="filter-list-size-checkbox-menu">
                                <div class="header__nav-filter-list-size">
                                    <ul class="header__nav-filter-category-item-size-list">
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link
                                                       header__nav-filter-category-item-sort-list-link-check"
                                               href="">S</a>
                                        </li>

                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link" href="">M</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link" href="">L</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link h"
                                               href="">XL</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link"
                                               href="">XXL</a>
                                        </li>

                                    </ul>
                                </div>
                            </label>
                        </li>
                        <%
                            Categories cateTitle = null;
                            try {
                                cateTitle = (Categories) request.getAttribute("cateTitle");
                            } catch (Exception e) {
                                e.printStackTrace();

                            }
                            if (cateTitle == null) {
                                cateTitle = new Categories(4, "Dress");
                            }


                        %>
                        <li class="header__nav-filter-category-item header__nav-filter-category-item-mobile">
                            <label for="filter-list-produc-checkbox" class="header__nav-filter-category-item-link"
                                   onclick="changWidth2()">
                                <span><%=cateTitle.getName()%></span>
                                <i class="ti-angle-down"></i>
                                <input type="checkbox" hidden id="filter-list-produc-checkbox"
                                       class="filter-list-produc-checkbox-menu">
                                <div class="header__nav-filter-list-product">
                                    <ul class="header__nav-filter-category-item-product-list">
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link header__nav-filter-category-item-sort-list-link-check EN"
                                               href="">Flounce</a>
                                            <a class="header__nav-filter-category-item-sort-list-link header__nav-filter-category-item-sort-list-link-check VI"
                                               href="">Viền</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link EN" href="">All
                                                Dress</a>
                                            <a class="header__nav-filter-category-item-sort-list-link VI" href="">Tất cả
                                                váy</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link EN"
                                               href="">A-line</a>
                                            <a class="header__nav-filter-category-item-sort-list-link VI"
                                               href="">Đường kẻ</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link EN"
                                               href="">Straight</a>
                                            <a class="header__nav-filter-category-item-sort-list-link VI"
                                               href="">Thẳng</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link "
                                               href="">Princess</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link" href="">Drop
                                                waist</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link"
                                               href="">Shirtwaist</a>
                                        </li>
                                        <li>
                                            <a class="header__nav-filter-category-item-sort-list-link"
                                               href="">Coat</a>
                                        </li>
                                    </ul>
                                </div>
                            </label>

                        </li>

                    </ul>

                    <div class="main-product__title m-2 c-2 ">
                        <p class="main-product__title-heading"><%=cateTitle.getName()%>
                        </p>
                    </div>
                    <ul class="header__nav-filter-category m-5 header__nav-filter-category-sort">
                        <li class="header__nav-filter-category-item" onclick="changWidth()">
                            <label for="filter-list-sort-checkbox"
                                   class="header__nav-filter-category-item-link header__nav-filter-category-item-link-sort">
                                <span>SORT</span>
                                <i class="ti-angle-down"></i>
                            </label>
                            <input type="checkbox" hidden id="filter-list-sort-checkbox"
                                   class="filter-list-sort-checkbox-menu">
                            <div class="header__nav-filter-list-sort">
                                <ul class="header__nav-filter-category-item-sort-list">
                                    <li>
                                        <a class="header__nav-filter-category-item-sort-list-link header__nav-filter-category-item-sort-list-link-check"
                                           href="">The Newest</a>
                                    </li>
                                    <li>
                                        <a class="header__nav-filter-category-item-sort-list-link" href="">The
                                            Oldest</a>
                                    </li>
                                    <li>
                                        <a class="header__nav-filter-category-item-sort-list-link" href="">Price
                                            From Low To High</a>
                                    </li>
                                    <li>
                                        <a class="header__nav-filter-category-item-sort-list-link" href="">Promotion
                                            Product </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="header__nav-filter-category-item header__nav-filter-category-item-text">
                            <span id="numberOfPage">${sizePage}</span>
                            <span class="header__nav-filter-category-item-text-first">
                                        In ${SizeCurrent} Products</span>
                            <span id="page__indexCurrent">Page ${sessionScope.page__indexCurrent}</span>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>

</div>
<div class="main-product">
    <div class="row">
        <input type="checkbox" hidden id="filter__category-checkbox" class="filter__category-checkbox-menu">
        <div class="filte__category">
            <div class="filter__category-wrap">
                <div class="filter__category-heading">
                    <h3 class="filter__category-heading-checked">
                        <%=cateTitle.getName()%>
                    </h3>
                    <button>Delete</button>
                </div>
                <div class="filter__category-item">
                    <ul class="filter__category-item-list">
                        <li>
                            <input type="checkbox">
                            <p>Wrap Dress</p>
                        </li>
                        <li>
                            <input type="checkbox" i>
                            <p>Miniskirt</p>
                        </li>
                    </ul>
                </div>
                <div class="filter__category-heading">
                    <h3>
                        SIZE
                    </h3>
                    <button>Delete</button>
                </div>
                <div class="filter__category-item">
                    <ul class="filter__category-item-list">
                        <li>
                            <input type="checkbox">
                            <p>XS</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>XXS</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>S</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>M</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>L</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>XL</p>
                        </li>
                        <li>
                            <input type="checkbox">
                            <p>XXL</p>
                        </li>

                    </ul>
                </div>
                <div class="filter__category-heading">
                    <h3>
                        Color
                    </h3>
                    <button>Delete</button>
                </div>
                <div class="filter__category-item">
                    <ul class="filter__category-item-list">
                        <li>
                            <div class="filter__color" id="white">
                            </div>
                            <p>White</p>
                        </li>

                        <li>
                            <div class="filter__color" id="black">
                            </div>
                            <p>Black</p>
                        </li>
                        <li>
                            <div class="filter__color" id="grey">
                            </div>
                            <p>Grey</p>
                        </li>
                        <li>
                            <div class="filter__color" id="yellowGreen">
                            </div>
                            <p>Yellow Green</p>
                        </li>
                        <li>
                            <div class="filter__color" id="yellow">
                            </div>
                            <p>Yellow</p>
                        </li>
                        <li>
                            <div class="filter__color" id="red">
                            </div>
                            <p>Red</p>
                        </li>
                        <li>
                            <div class="filter__color" id="pink">
                            </div>
                            <p>Pink</p>
                        </li>

                        <li>
                            <div class="filter__color" id="purple">
                            </div>
                            <p>Purple</p>
                        </li>
                        <li>
                            <div class="filter__color" id="bulenhat">
                            </div>
                            <p>Turquoise</p>
                        </li>
                        <li>
                            <div class="filter__color" id="Blue">
                            </div>
                            <p>Blue</p>
                        </li>
                        <li>
                            <div class="filter__color" id="Orange">
                            </div>
                            <p>Orange</p>
                        </li>
                        <li>
                            <div class="filter__color" id="">
                            </div>
                            <p>Don't Distinguish Color</p>
                        </li>
                    </ul>
                </div>
                <div class="filter__category-heading">
                    <h3>
                        Price Range
                    </h3>
                    <button onclick="DeletePrice()">Delete</button>
                </div>
                <div class="filter__category-item-range">
                    <span class="range-first range"></span>
                    <div class="filter__category-item-range-body">
                    </div>
                    <span class="range-third range"></span>

                </div>
                <div class="filter__category-item">

                    <div class="filter__category-item-price">
                        <input type="text" id="filter__category-price-input" value="0.000">
                        <i class="ti-arrow-down"></i>
                        <input type="text" value="2000.000" id="filter__category-price-input2">
                        <span class="filter__category-item-price-filter" onclick="searchByPrice()">Filter</span>
                    </div>

                </div>
                <div class="filter__categort-delete-all">
                    <p onclick="DeletePrice()">Delete All</p>
                </div>
            </div>
        </div>
        <div class="main-product-wrap col l-12 m-12 c-12">
            <c:if test="${sessionScope.privi}">
                <a href="ProductServlet?action=AddProduct" class="admin__add-product">
                    <i class="ti-plus"></i> <span>Add Product</span>
                </a>
            </c:if>
            <div class="row main-product-wrap-body grid wide__product">
                <%
                    int count = 0;
                    int i;

                    for (i = 0; i < lspro.size(); i++) {
                        Product pagepro = lspro.get(i);
                        if (i % 2 == 0) {%>
                <div class="main-product-wrap-body-item product-view col l-3 m-4 c-12" data-aos="fade-left">
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=pagepro.getId()%>">
                            <i class="ti-pencil"></i>
                        </a>
                    </c:if>
                    <div class="user-desginer-product-item-img">
                        <img loading="lazy" src="<%=pagepro.getImgFont()%>" alt=""
                             class="user-desginer-product-item-img-font">
                        <img loading="lazy" src="<%=pagepro.getImgBehind()%>" alt=""
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
                                <a href="DetailProServlet?action=watchPro&id=<%=pagepro.getId()%>"><span>Watching Now </span><i
                                        class="ti-eye"></i> </a>
                            </div>
                        </div>
                        <div class="main-slider__item-favourite">
                            <i class="fas fa-check"></i>
                            <span>Hot</span>
                        </div>
                        <div class="main-slider__item-sale">
                            <span class="main-slider__item-sale-persent"><%=pagepro.getRerentageDiscoint()%></span>
                            <span class="main-slider__item-sale-discount">Discount</span>
                        </div>
                    </div>
                    <div class="user-desginer-product-item-desc">
                        <a href=""
                           class="user-desginer-product-item-desc-link user-desginer-product-item-desc-item">
                            <%=pagepro.getName()%>
                        </a>
                        <div class="user-desginer-product-item-desc-link-price">
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-old user-desginer-product-item-desc-item">
                                <span> <%=pagepro.getPriceOld()%>VND</span>
                            </a>
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-new user-desginer-product-item-desc-item">
                                <%=pagepro.getPriceNew()%>VND
                            </a>
                        </div>

                        <a href="CartServlet?idCart=<%=pagepro.getId()%>&id=<%=cateproId%>"
                           class="user-desginer-product-item-desc-add-cart">Add Cart</a>
                    </div>
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product"
                           href="ProductServlet?action=DeletePageProduct&id=<%=pagepro.getId()%>">
                            <i class="ti-trash"></i>
                        </a>
                    </c:if>
                </div>
                <%}%>
                <%
                    if (i % 2 != 0) {%>
                <div class="main-product-wrap-body-item product-view col l-3 m-4 c-12" data-aos="fade-right">
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product" href="ProductServlet?action=EditProduct&id=<%=pagepro.getId()%>">
                            <i class="ti-pencil"></i>
                        </a>
                    </c:if>
                    <div class="user-desginer-product-item-img">
                        <img loading="lazy" src="<%=pagepro.getImgFont()%>" alt=""
                             class="user-desginer-product-item-img-font">
                        <img loading="lazy" src="<%=pagepro.getImgBehind()%>" alt=""
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
                                <a href="DetailProServlet?action=watchPro&id=<%=pagepro.getId()%>">
                                    <span>Watching Now </span><i class="ti-eye"></i> </a>
                            </div>
                        </div>
                        <div class="main-slider__item-favourite">
                            <i class="fas fa-check"></i>
                            <span>Hot</span>
                        </div>
                        <div class="main-slider__item-sale">
                            <span class="main-slider__item-sale-persent"><%=pagepro.getRerentageDiscoint()%></span>
                            <span class="main-slider__item-sale-discount">Discount</span>
                        </div>
                    </div>
                    <div class="user-desginer-product-item-desc">
                        <a href=""
                           class="user-desginer-product-item-desc-link user-desginer-product-item-desc-item">
                            <%=pagepro.getName()%>
                        </a>
                        <div class="user-desginer-product-item-desc-link-price">
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-old user-desginer-product-item-desc-item">
                                <span> <%=pagepro.getPriceOld()%>VND</span>
                            </a>
                            <a href=""
                               class="user-desginer-product-item-desc-link-price-new user-desginer-product-item-desc-item">
                                <%=pagepro.getPriceNew()%>VND
                            </a>
                        </div>
                        <a href="CartServlet?idCart=<%=pagepro.getId()%>&id=<%=cateproId%>"
                           class="user-desginer-product-item-desc-add-cart">Add Cart</a>
                    </div>
                    <c:if test="${sessionScope.privi}">
                        <a class="icon__admin-product"
                           href="ProductServlet?action=DeletePageProduct&id=<%=pagepro.getId()%>">
                            <i class="ti-trash"></i>
                        </a>
                    </c:if>
                </div>
                <%}%>
                <%}%>
            </div>
        </div>
    </div>

    <div class="main-product__footer grid wide">
        <div class="row">
            <div class="col c-12 l-12 m-12 main-product__footer-wrap">
                <ul class="main-product__footer-list">
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="main-product__footer-item">
                            <!--href="ProductServlet?action=SearchProductCT&id=${idSearchPro}&indexpage=${i}"-->
                            <a onclick="Pagination(${i})"
                               class="main-product__footer-link
                                       ">
                                        <span id="Span-${i}" class="i__current-page
                                              <c:if test="${i==1}">
                                                  i__current-page-active
                                              </c:if>">${i}</span>
                                <input type="hidden" name="main-product__footer-link-input" value="${idSearchPro}">

                            </a>
                        </li>
                    </c:forEach>
                    <li class="main-product__footer-item">
                        <a href="" class="main-product__footer-link"><i class="ti-angle-right"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class='spinner-wrapper'>
    <div class="spinner"></div>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="./DoAnFile/news/js/index.js"></script>
<script src="./DoAnFile/js/headerReponsive.js"></script>
<script src="./DoAnFile/product/js/index.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery.convform.js"></script>
<script type="text/javascript" src="./DoAnFile/ChatBot/js/custom.js"></script>
<script>
    var checkAdmin = false;
    checkAdmin = '${sessionScope.privi}';

    function Pagination(id) {
        var idSCT = document.querySelector('input[name="main-product__footer-link-input"]').value;
        var iPage = document.querySelector('#Span-' + id).textContent;
        var pageCurrent = document.querySelector('#page__indexCurrent');
        var numberCurrent = '<%=request.getAttribute("sizePage")%>';
        document.getElementById("numberOfPage").innerHTML = numberCurrent;
        pageCurrent.innerHTML = 'Page ' + iPage;
        $.ajax({
            url: './PaginationServlet',
            type: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data: {
                idSearchCT: idSCT,
                iPagin: iPage,
                checkAD: checkAdmin
            },
            success: function (response) {
                var proConetnt = document.querySelector('.main-product-wrap-body');
                proConetnt.innerHTML = response;

            },
            error: function () {
                console.log("Lỗi Rồi Thằng Quần");
            }
        });
    }

    function searchByName(param) {
        var txt = param.value;

        $.ajax({
            url: './SearchAjax',
            type: 'GET',
            data: {
                txtSearch: txt,
                checkAD: checkAdmin
            },
            success: function (response) {
                var proConetnt = document.querySelector('.main-product-wrap-body');
                proConetnt.innerHTML = response;

            },
            error: function () {
                console.log("Lỗi Rồi Thằng Quần");
            }
        });
    }

    function searchByPrice() {
        var cateId = '<%=cateproId%>';
        var price1 = parseInt(document.querySelector("#filter__category-price-input").value);
        var price2 = parseInt(document.querySelector("#filter__category-price-input2").value);
        $.ajax({
            url: './SearchByPrice',
            type: 'GET',
            data: {
                cateid: cateId,
                priceBegin: price1,
                priceEnd: price2,
                checkAD: checkAdmin
            },
            success: function (response) {
                var proConetnt = document.querySelector('.main-product-wrap-body');
                proConetnt.innerHTML = response;

            },
            error: function () {
                console.log("Lỗi Rồi Thằng Quần");
            }
        });
    }

    function DeletePrice() {
        document.querySelector("#filter__category-price-input").value = "0.000";
        document.querySelector('.range-first').style.left = "0%";
    }

    $(window).on('load', function (event) {
        $('body').removeClass('preloading');
        // $('.load').delay(1000).fadeOut('fast');
        $('.loader').delay(1000).fadeOut('fast');
    });


</script>
</body>

</html>