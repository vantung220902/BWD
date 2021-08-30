<%-- 
    Document   : navLeft
    Created on : Jun 28, 2021, 9:34:18 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="pageAdminServlet?action=ListPro&idpage=1">Bảng điều khiển</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active"  data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Bảng điều khiển<span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">Quản lí chung</a>
                                            <div id="submenu-1-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="pageAdminServlet">Bảng điều khiển thương mại điện tử</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product.jsp">Danh sách sản phẩm</a>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="dashboard-finance.jsp">Doanh thu</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="dashboard-sales.jsp">Bản hàng</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"  data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-inbox"></i>Ứng dụng<span class="badge badge-secondary">New</span></a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="inbox.jsp">Tin nhắn</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Chi tiết Email</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="email-compose.jsp">Soạn Email</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="message-chat.jsp">Trò chuỵện</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"  data-toggle="collapse" aria-expanded="false" data-target="#submenu-9" aria-controls="submenu-9"><i class="fas fa-fw fa-map-marker-alt"></i>Maps</a>
                                <div id="submenu-9" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="map-google.jsp">Google Maps</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="map-vector.jsp">Vector Maps</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link"  data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Quản lí shop</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pageAdminServlet?action=ListPro&idpage=1">Quản lí sản phẩm</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pageAdminServlet?action=ListCate">Quản lí danh mục</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pageAdminServlet?action=ListAcc">Quản lí tài khoản</a>
                                        </li>
                                         <li class="nav-item">
                                            <a class="nav-link" href="pageAdminServlet?action=ListNews&idpage=1">Quản lí tin tức</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pageAdminServlet?action=ListCart&idpage=1">Quản lí giỏ hàng</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>