<%@page import="DAO.NewsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.News"%>
<%@page import="DAO.CategoryNews"%>
<%@page import="DAO.CateNewsDao"%>
<%@page import="DAO.CategoriesDAO"%>
<%@page import="DAO.Product"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.Categories"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FASHION STORE</title>
        <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poiret+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous"/>
        <link rel="stylesheet" href="./DoAnFile/assets/font/fontawesome-free-5.15.3/fontawesome-free-5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/style.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/responsive.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/ChatBot/css/jquery.convform.css">
        <link rel="stylesheet" href="./DoAnFile/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./DoAnFile/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="./DoAnFile/css/reset.css">
        <link rel="stylesheet" href="./DoAnFile/css/base.css">
        <link rel="stylesheet" href="./DoAnFile/css/grid.css">
        <link rel="stylesheet" href="./DoAnFile/header.css">
        <link rel="stylesheet" href="./DoAnFile/footer.css">
        <link rel="stylesheet" href="./DoAnFile/news/css/main.css">
        <link rel="stylesheet" href="./DoAnFile/product/productcss/reponsiveproduct.css">
        <link rel="stylesheet" href="./DoAnFile/news/css/reponsivenews.css">

    </head>
    <style>
        .collection__link-img{
            background-image: url(DoAnFile/img/collection.jpg);
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
                            <%   ProductDAO daopro = new ProductDAO();
                                int cateproId = 0;
                                try {
                                    cateproId = Integer.parseInt(request.getAttribute("idSearchPro").toString());
                                } catch (Exception e) {
                                    e.printStackTrace();

                                }
                                if (cateproId == 0) {
                                    cateproId = 4;
                                }
                                List<Product> lspro = daopro.getAllByCate(cateproId, 0);
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
                                        <%                                            for (int j = 0; j < ls.size(); j++) {
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
                                <ul class="header__collection row">
                                    <li class="header__collection-item col l-6">
                                        <div class="collection__wrap">
                                            <a href="#" class="collection__link-img">
                                            </a>
                                            <div class="collection__link-text">
                                                <div class="collection__link-primary-text">
                                                    Summer Collection
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
                            <%
                                CateNewsDao daoNews = new CateNewsDao();
                                List<CategoryNews> lsNews = daoNews.getAll();
                                CategoryNews ctnewEditor = (CategoryNews) request.getAttribute("CATEGORYNEWS");
                                if (ctnewEditor == null) {
                                    ctnewEditor = new CategoryNews(0, "");
                                }

                            %>
                            <li class="header__nav-item header__nav-item-the-news">
                                <a href="./DoAn/news.jsp" class="header__nav-link">
                                    <span class="EN">NEWS</span>
                                    <span class="VI">TIN TỨC</span>
                                </a>
                                <div class="header__nav-the-news">
                                    <ul class="header__nav-the-news-list">
                                        <%                                           for (int i = 0; i < lsNews.size(); i++) {
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
                                <a href="SaleServlet?username=${sessionScope.us}p" class="header__nav-link">
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
                                        <label for="header__search-checkbox" class="header__search-checkbox-icon">
                                            <i class="ti-menu header__icon-bars"></i>
                                        </label>
                                        <ul class="header__search-menu-list" id="style-2">

                                            <% for (int i = 0; i < ls.size(); i++) {
                                                    Categories cate = ls.get(i);

                                            %>
                                            <li class="header__search-menu-item">
                                                <c:if test="${sessionScope.privi}">
                                                    <div>
                                                        <i class="ti-pencil"></i>
                                                    </div>
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

                                <a href="signUp.jsp" class="Login__Product"
                                   <c:if test="${not sessionScope.ck}">
                                       style="display: block; color: var(--white-color);font-size: 1.6rem;"
                                   </c:if>
                                   <c:if test="${sessionScope.ck}">
                                       style="display: none;"
                                   </c:if>
                                   >
                                    Login
                                </a>
                                <li class="header__introduct-item header__nav-acc header__cart-body-item"
                                    onclick="IconCart()">

                                    <div  <c:if test="${sessionScope.ck}" >
                                            style="display: flex"
                                        </c:if>
                                        <c:if test="${not sessionScope.ck}">
                                            style="display: none;"
                                        </c:if>>

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
                                                <i class="ti-home"></i><span> My Address</span>
                                            </a>
                                        </li>
                                        <li class="header__introduct-acc-item">
                                            <a href="">
                                                <i class="ti-money"></i> <span>Purchase Order</span>
                                            </a>
                                        </li>
                                        <li class="header__introduct-acc-item header__introduct-acc-item--separate">
                                            <a href="AccServlet?action=LogoutNews">
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
                                                        Have not any product
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
                                                                        Xóa
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </li> 
                                                    </c:forEach>


                                                </ul>
                                                <a href="ShowCartServlet"class="header__cart-view-cart btn btn--primary">Xem giỏ
                                                    hàng</a>
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
                            <<span class="header__nav-link-arrived EN"> HOME PAGE</span>
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
                                <a href="ProductServlet?action=SearchProductCT&id=<%=catepro2.getId()%>" class="header__product-body-heading">
                                    <%=catepro2.getName()%>
                                </a>
                                <%}%>
                            </div>
                        </div>
                    </li>
                    <li class="header__nav-item home__nav-item-collection" onclick="headerColectionChange()">
                        <div class="header__nav-link">
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
		  <span class="VI"> THIẾT KẾ ÁO</span>
                        </a>
                    </li>
                    <li class="header__nav-item header__nav-item-the-news" onclick="headerTheNewsChange()">
                        <div class="header__nav-link">
                             <span class="EN"> NEWS</span>
                            <span class="VI"> TIN TỨC</span>
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
                            <span class="VI">TRÒ CHƠI</span>
                            </a>
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
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-01.png" alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-02.png" alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-03.png" alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-04.png" alt="">
                                    </a>
                                    <a href="#" class="collection__item-brand">
                                        <img loading="lazy" src="./DoAnFile/product/detailProduct/imgtail/HangThoiTrang/logo-brand-05.png" alt="">
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

                            <%
                                for (int i = 0; i < lsNews.size(); i++) {
                                    CategoryNews ctnews = lsNews.get(i);
                            %>

                            <li>
                                <a href="NewServlet?action=getByAllCate&idnews=<%=ctnews.getId()%>" class="header__product-deatil-link">
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
                            <li>
                                <a href="./index.jsp" class="orientation__wrap-body-list-link">FASHION STORE</a>
                            </li>
                            <li>
                                <a href="./index.jsp" class="orientation__wrap-body-list-link">Home Page</a>
                            </li>
                            <li>
                                <a href="./news.jsp" class="orientation__wrap-body-list-link orientation__wrap-body-list-link-end">News</a>
                            </li>
                        </ul>
                        <ul class="orientation__wrap-body-quantity">
                            <li class="header__nav-filter-category-item header__nav-filter-category-item-text">
                                <span id="numberOfPage">${SizeNews}</span>
                                <span class="header__nav-filter-category-item-text-first"> 
                                    In ${sumNews} News</span>
                                <span id="page__indexCurrent">Page ${sessionScope.indexCurrentSession}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row orientation__heading-wrap">
                    <div class="col l-12 m-12 c-12">
                        <div class="orientation-heading">
                            <p>The News</p>
                            <a class="orientation-filter">
                                <i id="orientation-filter-icon" class="ti-angle-left"></i>
                                <span>Filter The News</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="grid wide">
                <div class="row">
                    <div class="container__filter col l-3">
                        <div class="container__filter-wrap">
                            <input type="text" class="container__filter-input" 
                                   name="container__filter-input-news"
                                   oninput="searchByName(this)"
                                   placeholder="Search The News..." value="${txtText}">
                            <i  class="ti-search"></i>
                        </div>
                        <div class="container__filter-month">
                            <p>The News Of Month :</p>
                            <div class="container__filter-month-body">
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        January
                                    </span>
                                </div> 
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        February
                                    </span>
                                </div> 
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        March
                                    </span>
                                </div> 
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        April
                                    </span>
                                </div> 
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        May
                                    </span>
                                </div> 
                                <div class="container__filter-month-body-wrap">
                                    <input type="checkbox" class="container__filter-month-body-check" id=""> <span>
                                        June
                                    </span>
                                </div> 
                            </div>
                        </div>

                      
                        <%
                            NewsDao daoN = new NewsDao();
                            int indexN = 1;
                            List<News> lsViewst = daoN.getTop4(indexN);
                        %>
                        <div class="container__filter-hot">
                            <p>most viewed news:</p>
                        </div>
                        <%
                            for (int i = 0; i < lsViewst.size(); i++) {
                                News news = lsViewst.get(i);
                        %>
                        <div class="container__filter-hot-item">
                            <img loading="lazy" src="<%=news.getImg()%>" alt="" class="container__filter-hot-item-img">
                            <div class="container__filter-hot-item-desc">
                                <p><%=news.getName()%>
                                </p>
                            </div>
                        </div>
                        <%} %>



                        <div class="container__filter-hot">
                            <p>latest news:</p>
                        </div>
                        <%
                            indexN = 2;
                            lsViewst = daoN.getTop4(indexN);
                            for (int i = 0; i < lsViewst.size(); i++) {
                                News news = lsViewst.get(i);
                        %>
                        <div class="container__filter-hot-item">
                            <img loading="lazy" src="<%=news.getImg()%>" alt="" class="container__filter-hot-item-img">
                            <div class="container__filter-hot-item-desc">
                                <p><%=news.getName()%>
                                </p>
                            </div>
                        </div>
                        <%} %>

                    </div>
                    <div class="container-body  col m-12 c-12 l-9">
                        <c:if test="${sessionScope.privi}">
                            <a href="editNews.jsp" class="admin__add-product">
                                <i class="ti-plus"></i><span>Add Article</span>
                            </a>
                        </c:if>
                        <div class="row main-news-wrap-body">
                            <%
                                List<News> lsnews = (ArrayList<News>) request.getAttribute("listNews");
                                for (int i = 0; i < lsnews.size(); i++) {
                                    News news = lsnews.get(i);
                            %>
                            <div class="col l-6 m-6 c-12 news-view" data-aos=<%if (i % 2 == 0) {
                                    out.print("fade-left");
                                } else {
                                    out.print("fade-right");
                                }%>>
                                <c:if test="${sessionScope.privi}">
                                    <a class="icon__admin-product" href="NewServlet?action=EditArticle&id=<%=news.getId()%>">
                                        <i class="ti-pencil"></i>
                                    </a>
                                </c:if>
                                <div class="container__news-item ">
                                    <img loading="lazy" src="<%=news.getImg()%>" alt="" class="container__news-item-img">
                                    <div class="container__news-item-desc">
                                        <h2><%=news.getCateid().getName()%></h2>
                                        <div class="container__news-item-date">
                                            <span><%=news.getDataSubmit()%></span>
                                            <span>23:35 GMT+07:00</span>
                                        </div>
                                        <h4>"<%=news.getName()%></h4>
                                        <p><%=news.getDescription()%></p>
                                        <a href="<%=news.getLink()%>" class="btn">Xem Ngay</a>
                                    </div>
                                </div>
                                <c:if test="${sessionScope.privi}">
                                    <a class="icon__admin-product" href="NewServlet?action=DeletePageNews&id=<%=news.getId()%>&cateNID=<%=news.getCateid().getId()%>">
                                        <i class="ti-trash"></i>
                                    </a>
                                </c:if>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-product__footer grid wide">
            <div class="row">
                <div class="col c-12 l-12 m-12 main-product__footer-wrap">
                    <ul class="main-product__footer-list">

                        <c:forEach begin="1" end="${endPageN}" var="i">
                            <li class="main-product__footer-item">
                                <!--href="NewServlet?action=getByAllCate&idnews=${sessionScope.idCTSession}&indexPageNews=${i}"-->
                                <a onclick="Pagination(${i})"
                                   class="main-product__footer-link 
                                   ">
                                    <span id="Span-${i}" class="i__current-page
                                          <c:if test="${i==1}">
                                              i__current-page-active
                                          </c:if>">${i}</span>
                                    <input type="hidden" name="main-product__footer-link-input" value="${idNewsCT}">
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
       
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
            <script src="./DoAnFile/news/js/index.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="./DoAnFile/js/owl.carousel.min.js"></script>
            <script src="./DoAnFile/js/headerReponsive.js"></script>
           <script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery-3.3.1.min.js"></script>
            <script type="text/javascript" src="./DoAnFile/ChatBot/js/jquery.convform.js"></script>
            <script type="text/javascript" src="./DoAnFile/ChatBot/js/custom.js"></script>
            <script>

                            function Pagination(id) {
                                var idSCT = document.querySelector('input[name="main-product__footer-link-input"]').value;
                                var iPage = document.querySelector('#Span-' + id).textContent;
                                var pageCurrent = document.querySelector('#page__indexCurrent');
                                var checkAdmin = false;
                                checkAdmin = '${sessionScope.privi}';
                                var numberCurrent = '<%=request.getAttribute("SizeNews")%>';
                                document.getElementById("numberOfPage").innerText = numberCurrent;
                                pageCurrent.innerHTML = 'Page ' + iPage;
                                $.ajax({
                                    url: './PaginNews',
                                    type: 'GET',
                                    data: {
                                        idSearchCT: idSCT,
                                        iPagin: iPage,
                                        checkAD: checkAdmin
                                    },
                                    success: function (response) {
                                        var proConetnt = document.querySelector('.main-news-wrap-body');
                                        proConetnt.innerHTML = response;

                                    },
                                    error: function () {
                                        alert("error");
                                    }
                                });
                            }
                            ;

                            function searchByName(param) {
                                var checkAdmin = false;
                                checkAdmin = '${sessionScope.privi}';
                                var txt = param.value;
                                $.ajax({
                                    url: './SearchAjaxNews',
                                    type: 'get',
                                    data: {
                                        txtSearch: txt,
                                        checkAD: checkAdmin
                                    },
                                    success: function (response) {
                                        var proConetnt = document.querySelector('.main-news-wrap-body');
                                        proConetnt.innerHTML = response;

                                    },
                                    error: function () {
                                        alert("error");
                                    }
                                });
                            }
                            var activeI = document.querySelectorAll('.i__current-page');
                            activeI.forEach(function (e) {
                                e.onclcik = function () {
                                    document.querySelector('.i__current-page.i__current-page-active').classList.remove('.i__current-page-active');
                                    this.classList.add('.i__current-page-active');
                                };
                            });
                            var inputIdCT = document.querySelector("input[name='IDCateNews']");
                            var ctutnews = document.querySelectorAll('.catenewsupdate');
                            var cateNewsForm = document.querySelector('.CategoryNewsEditor__form');
                            var countctNews = 0;
                            ctutnews.forEach(function (news) {
                                console.log(news.getAttribute('data-index'));
                                news.onclick = function () {
                                    inputIdCT.value = this.getAttribute('data-index');
                                    displayCTNews();
                                };
                            });
                            function  displayCTNews() {
                                countctNews++;
                                if (countctNews % 2 !== 0) {
                                    cateNewsForm.style.display = 'flex';
                                } else {
                                    cateNewsForm.style.display = 'none';
                                }
                            }
                            ;
                            $(window).on('load', function (event) {
                                $('body').removeClass('preloading');
                                // $('.load').delay(1000).fadeOut('fast');
                                $('.loader').delay(1000).fadeOut('fast');
                            });
        </script>
    </body>
</html>