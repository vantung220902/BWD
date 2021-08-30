<%-- 
    Document   : index.jsp
    Created on : Jun 28, 2021, 9:35:25 AM
    Author     : admin
--%>

<%@page import="java.util.AbstractList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MoneyOfMonth"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="./DoAnFile/Admin-BWD/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/libs/css/style.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <title>FASHION STORE</title>
        <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
        <style>
            .nav-left-sidebar .submenu{
                display: block !important;
            }
        </style>
    </head>

    <body class="preloading">
        <div class="loader">
            <span class="fa fa-spinner xoay icon_load-page"></span>
        </div>
        <!-- ============================================================== -->
        <!-- main wrapper -->
        <!-- ============================================================== -->
        <div class="dashboard-main-wrapper">
            <!-- ============================================================== -->
            <!-- navbar -->
            <!-- ============================================================== -->
            <jsp:include page="./headerAdmin.jsp"></jsp:include>
                <!-- ============================================================== -->
                <!-- end navbar -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- left sidebar -->
                <!-- ============================================================== -->
            <jsp:include page="./navLeft.jsp"></jsp:include>
                <!-- ============================================================== -->
                <!-- end left sidebar -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- wrapper  -->
                <!-- ============================================================== -->
                <div class="dashboard-wrapper">
                    <div class="dashboard-ecommerce">
                        <div class="container-fluid dashboard-content ">
                            <!-- ============================================================== -->
                            <!-- pageheader  -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h2 class="pageheader-title">Bảng điều khiển</h2>
                                        <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                        <div class="page-breadcrumb">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Bảng điều khiển</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Quản lí chung</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader  -->
                            <!-- ============================================================== -->
                            <div class="ecommerce-widget">

                                <div class="row">
                                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="text-muted">Tổng doanh thu</h5>
                                                <div class="metric-value d-inline-block">
                                                    <h1 class="mb-1">${sum}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span>
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue"></div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="text-muted">Doanh thu liên kết</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">${sum}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span>
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue2"></div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="text-muted">Tiền hoàn lại</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">0.00</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-primary font-weight-bold">
                                                <span>N/A</span>
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue3"></div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="text-muted">Tb Doanh thu/Người dùng</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">${avg}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-secondary font-weight-bold">
                                                <span>-2.00%</span>
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue4"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- ============================================================== -->

                                <!-- ============================================================== -->

                                <!-- recent orders  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header">Đơn hàng gần dây</h5>
                                        <div class="card-body p-0">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead class="bg-light">
                                                        <tr class="border-0">
                                                            <th class="border-0">#</th>

                                                            <th class="border-0" style="width:120px">Tên sản phẩm</th>
                                                            <th class="border-0">Id sản phẩm</th>
                                                            <th class="border-0">Số lượng</th>
                                                            <th class="border-0">Giá</th>
                                                            <th class="border-0">Ngày đặt</th>
                                                            <th class="border-0">Khách hàng đặt</th>
                                                            <th class="border-0">Trạng thái</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="cart" items="${lsCart}">
                                                            <tr>
                                                                <td>${cart.id}</td>
                                                                <td>${cart.name} </td>
                                                                <td>${cart.proid} </td>
                                                                <td>${cart.quantity}</td>
                                                                <td>${cart.price}</td>
                                                                <td>${cart.createDate}</td>
                                                                <td>${cart.username}</td>
                                                                <td><span class="badge-dot badge-success mr-1"></span>${cart.status}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="9"><a href="#" class="btn btn-outline-light float-right">Xem chi tiết</a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end recent orders  -->


                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- customer acquistion  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header">Tỉ lệ quay lại cửa hàng</h5>
                                        <div class="card-body">
                                            <div class="ct-chart ct-golden-section" style="height: 354px;"></div>
                                            <div class="text-center">
                                                <span class="legend-item mr-2">
                                                    <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Trở lại</span>
                                                </span>
                                                <span class="legend-item mr-2">

                                                    <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Lần đầu</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end customer acquistion  -->
                                <!-- ============================================================== -->
                            </div>
                            <div class="row">
                                <!-- ============================================================== -->
                                <!-- product category  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header">Danh mục sản phẩm</h5>
                                        <div class="card-body">
                                            <div class="ct-chart-category ct-golden-section" style="height: 315px;"></div>
                                            <div class="text-center m-t-40">
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Clothing Baby</span>
                                                </span>
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs text-danger mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Dress</span>
                                                </span>
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs text-info mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Little Details</span>
                                                </span>
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs text-warning mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">Print Shop</span>
                                                </span>
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs  mr-1  legend-tile" style="color: #ffa47f"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text" >Skirt</span>
                                                </span>
                                                <span class="legend-item mr-4">
                                                    <span class="fa-xs  mr-1 legend-tile" style="color: #b4f87b;"><i class="fa fa-fw fa-square-full"></i></span>
                                                    <span class="legend-text">T-Shirt</span>
                                                </span>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end product category  -->
                                <!-- product sales  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <!-- <div class="float-right">
                                                    <select class="custom-select">
                                                        <option selected>Today</option>
                                                        <option value="1">Weekly</option>
                                                        <option value="2">Monthly</option>
                                                        <option value="3">Yearly</option>
                                                    </select>
                                                </div> -->
                                            <h5 class="mb-0">Bán sản phẩm</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="ct-chart-product ct-golden-section"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end product sales  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                                    <!-- ============================================================== -->
                                    <!-- top perfomimg  -->
                                    <!-- ============================================================== -->
                                    <div class="card">
                                        <h5 class="card-header">Các nền tảng hoạt động</h5>
                                        <div class="card-body p-0">
                                            <div class="table-responsive">
                                                <table class="table no-wrap p-table">
                                                    <thead class="bg-light">
                                                        <tr class="border-0">
                                                            <th class="border-0">Nền tảng</th>
                                                            <th class="border-0">Lượt truy cập</th>
                                                            <th class="border-0">Doanh thu</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Facebook</td>
                                                            <td>98,789 </td>
                                                            <td>$4563</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Instagram</td>
                                                            <td>98,789 </td>
                                                            <td>$4563</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Tik Tok</td>
                                                            <td>98,789 </td>
                                                            <td>$4563</td>
                                                        </tr>
                                                        <tr>
                                                            <td>YouTube</td>
                                                            <td>98,789 </td>
                                                            <td>$4563</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Pinterest</td>
                                                            <td>98,789 </td>
                                                            <td>$4563</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <a href="#" class="btn btn-outline-light float-right">Chi tiết</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ============================================================== -->
                                    <!-- end top perfomimg  -->
                                    <!-- ============================================================== -->
                                </div>
                            </div>

                            <div class="row">
                                <!-- ============================================================== -->
                                <!-- sales  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                    <div class="card border-3 border-top border-top-primary">
                                        <div class="card-body">
                                            <h5 class="text-muted">Bán hàng</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">${sum}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5.86%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end sales  -->
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- new customer  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                    <div class="card border-3 border-top border-top-primary">
                                        <div class="card-body">
                                            <h5 class="text-muted">Khách hàng mới</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">${countAcc}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">10%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end new customer  -->
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- visitor  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                    <div class="card border-3 border-top border-top-primary">
                                        <div class="card-body">
                                            <h5 class="text-muted">Lượt truy cập</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">13000</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end visitor  -->
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- total orders  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                    <div class="card border-3 border-top border-top-primary">
                                        <div class="card-body">
                                            <h5 class="text-muted">Số lượng đơn hàng</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">${countCart}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-danger font-weight-bold">
                                                <span class="icon-circle-small icon-box-xs text-danger bg-danger-light bg-danger-light "><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1">4%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end total orders  -->
                                <!-- ============================================================== -->
                            </div>
                            <div class="row">
                                <!-- ============================================================== -->
                                <!-- total revenue  -->
                                <!-- ============================================================== -->


                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- category revenue  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header">Doanh thu theo doanh mục</h5>
                                        <div class="card-body">
                                            <div id="c3chart_category" style="height: 420px;"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end category revenue  -->
                                <!-- ============================================================== -->

                                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header"> Tổng doanh thu</h5>
                                        <div class="card-body">
                                            <div id="morris_totalrevenue"></div>
                                        </div>
                                        <div class="card-footer">
                                            <p class="display-7 font-weight-bold"><span class="text-primary d-inline-block">$26,000</span><span class="text-success float-right">+9.45%</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <!-- ============================================================== -->
                                    <!-- social source  -->
                                    <!-- ============================================================== -->
                                    <div class="card">
                                        <h5 class="card-header">Bán hàng trên mạng xã hội</h5>
                                        <div class="card-body p-0">
                                            <ul class="social-sales list-group list-group-flush">
                                                <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle facebook-bgcolor mr-2"><i class="fab fa-facebook-f"></i></span><span class="social-sales-name">Facebook</span><span class="social-sales-count text-dark">120 Sales</span>
                                                </li>
                                                <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle twitter-bgcolor mr-2"><i class="fab fa-twitter"></i></span><span class="social-sales-name">Twitter</span><span class="social-sales-count text-dark">99 Sales</span>
                                                </li>
                                                <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle instagram-bgcolor mr-2"><i class="fab fa-instagram"></i></span><span class="social-sales-name">Instagram</span><span class="social-sales-count text-dark">76 Sales</span>
                                                </li>
                                                <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle pinterest-bgcolor mr-2"><i class="fab fa-pinterest-p"></i></span><span class="social-sales-name">Pinterest</span><span class="social-sales-count text-dark">56 Sales</span>
                                                </li>
                                                <li class="list-group-item social-sales-content"><span class="social-sales-icon-circle googleplus-bgcolor mr-2"><i class="fab fa-google-plus-g"></i></span><span class="social-sales-name">Google Plus</span><span class="social-sales-count text-dark">36 Sales</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#" class="btn-primary-link">Xem chi tiết</a>
                                        </div>
                                    </div>
                                    <!-- ============================================================== -->
                                    <!-- end social source  -->
                                    <!-- ============================================================== -->
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <!-- ============================================================== -->
                                    <!-- sales traffice source  -->
                                    <!-- ============================================================== -->
                                    <div class="card">
                                        <h5 class="card-header"> Bán hàng theo lượng truy cập</h5>
                                        <div class="card-body p-0">
                                            <ul class="traffic-sales list-group list-group-flush">
                                                <li class="traffic-sales-content list-group-item "><span class="traffic-sales-name">Direct</span><span class="traffic-sales-amount">$4000.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span>
                                                </li>
                                                <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Search<span class="traffic-sales-amount">$3123.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span>
                                                    </span>
                                                </li>
                                                <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Social<span class="traffic-sales-amount ">$3099.00  <span class="icon-circle-small icon-box-xs text-success ml-4 bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1 text-success">5.86%</span></span>
                                                    </span>
                                                </li>
                                                <li class="traffic-sales-content list-group-item"><span class="traffic-sales-name">Referrals<span class="traffic-sales-amount ">$2220.00   <span class="icon-circle-small icon-box-xs text-danger ml-4 bg-danger-light"><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1 text-danger">4.02%</span></span>
                                                    </span>
                                                </li>
                                                <li class="traffic-sales-content list-group-item "><span class="traffic-sales-name">Email<span class="traffic-sales-amount">$1567.00   <span class="icon-circle-small icon-box-xs text-danger ml-4 bg-danger-light"><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1 text-danger">3.86%</span></span>
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#" class="btn-primary-link">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end sales traffice source  -->
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- sales traffic country source  -->
                                <!-- ============================================================== -->
                                <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <h5 class="card-header">Bán hàng theo quốc gia</h5>
                                        <div class="card-body p-0">
                                            <ul class="country-sales list-group list-group-flush">
                                                <li class="country-sales-content list-group-item"><span class="mr-2"><i class="flag-icon flag-icon-us" title="us" id="us"></i> </span>
                                                    <span class="">United States</span><span class="float-right text-dark">78%</span>
                                                </li>
                                                <li class="list-group-item country-sales-content"><span class="mr-2"><i class="flag-icon flag-icon-ca" title="ca" id="ca"></i></span><span class="">Canada</span><span class="float-right text-dark">7%</span>
                                                </li>
                                                <li class="list-group-item country-sales-content"><span class="mr-2"><i class="flag-icon flag-icon-ru" title="ru" id="ru"></i></span><span class="">Russia</span><span class="float-right text-dark">4%</span>
                                                </li>
                                                <li class="list-group-item country-sales-content"><span class=" mr-2"><i class="flag-icon flag-icon-in" title="in" id="in"></i></span><span class="">India</span><span class="float-right text-dark">12%</span>
                                                </li>
                                                <li class="list-group-item country-sales-content"><span class=" mr-2"><i class="flag-icon flag-icon-fr" title="fr" id="fr"></i></span><span class="">France</span><span class="float-right text-dark">16%</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a href="#" class="btn-primary-link">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- ============================================================== -->
                                <!-- end sales traffice country source  -->
                                <!-- ============================================================== -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <div class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                 KHTV TEAM
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="text-md-right footer-links d-none d-sm-block">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- end wrapper  -->
            <!-- ============================================================== -->
        </div>
        <c:forEach var="item" items="${lsMoney}">
            <h1 class="bt_1" style="display: none;" data-money="${item.money}"></h1>
        </c:forEach>
        <c:forEach var="avg" items="${lsAvg}">
            <h1 class="bt_2" style="display: none;" data-avg="${avg.money}"></h1>
        </c:forEach>
        <c:forEach var="count" items="${lsCateChart}">
            <h1 class="bt_3" style="display: none;" data-count="${count.sizePro}"></h1>
        </c:forEach>
        <c:forEach var="item" items="${lsSumProCart}">
            <h1 class="bt_4" style="display: none;" data-sum="${item.sum}" data-name="${item.name}"></h1>
        </c:forEach>
        <!-- ============================================================== -->
        <!-- end main wrapper  -->
        <!-- ============================================================== -->
        <!-- Optional JavaScript -->
        <!-- jquery 3.3.1 -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <!-- bootstap bundle js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- slimscroll js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <!-- main js -->
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/main-js.js"></script>
        <!-- chart chartist js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
        <!-- sparkline js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
        <!-- morris js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.js"></script>
        <!-- chart c3 js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/C3chartjs.js"></script>
        <script>
            $(function () {
                "use strict";
                var myArry = [];
                var valueMoneys = document.querySelectorAll('.bt_1');
                valueMoneys.forEach((s) => {
                    myArry.push(parseInt(s.getAttribute('data-money')) / 10);
                });
                var myArryAvgs = [];
                var valueAvgs = document.querySelectorAll('.bt_2');
                valueAvgs.forEach((s) => {
                    myArryAvgs.push(parseInt(s.getAttribute('data-avg')) / 10);
                });
                $("#sparkline-revenue").sparkline(myArry, {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#5969ff',
                    fillColor: '',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });
                $("#sparkline-revenue2").sparkline(myArry, {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#ff407b',
                    fillColor: '',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });
                $("#sparkline-revenue3").sparkline([0], {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#25d5f2',
                    fillColor: '',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });
                $("#sparkline-revenue4").sparkline(myArryAvgs, {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#ffc750',
                    fillColor: '',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true,
                });
                var ctx = document.getElementById("chartjs_balance_bar").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',

                    data: {
                        labels: ["Current", "1-30", "31-60", "61-90", "91+"],
                        datasets: [{
                                label: 'Aged Payables',
                                data: [500, 1000, 1500, 3700, 2500],
                                backgroundColor: "rgba(89, 105, 255,.8)",
                                borderColor: "rgba(89, 105, 255,1)",
                                borderWidth: 2

                            }, {
                                label: 'Aged Receiables',
                                data: [1000, 1500, 2500, 3500, 2500],
                                backgroundColor: "rgba(255, 64, 123,.8)",
                                borderColor: "rgba(255, 64, 123,1)",
                                borderWidth: 2


                            }]
                    },
                    options: {
                        legend: {
                            display: true,

                            position: 'bottom',

                            labels: {
                                fontColor: '#71748d',
                                fontFamily: 'Circular Std Book',
                                fontSize: 14,
                            }
                        },
                        scales: {
                            xAxes: [{
                                    ticks: {
                                        fontSize: 14,
                                        fontFamily: 'Circular Std Book',
                                        fontColor: '#71748d',
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        fontSize: 14,
                                        fontFamily: 'Circular Std Book',
                                        fontColor: '#71748d',
                                    }
                                }]
                        }
                    }
                });
                Morris.Donut({
                    element: 'morris_gross',

                    data: [
                        {value: 94, label: 'Budget'},
                        {value: 15, label: ''}

                    ],

                    labelColor: '#5969ff',

                    colors: [
                        '#5969ff',
                        '#a8b0ff'

                    ],

                    formatter: function (x) {
                        return x + "%"
                    },
                    resize: true

                });
                Morris.Donut({
                    element: 'morris_profit',

                    data: [
                        {value: 93, label: 'Profit'},
                        {value: 15, label: ''}

                    ],

                    labelColor: '#ff407b',

                    colors: [
                        '#ff407b',
                        '#ffd5e1'

                    ],

                    formatter: function (x) {
                        return x + "%"
                    },
                    resize: true

                });
                Morris.Bar({
                    element: 'ebit_morris',
                    data: [
                        {x: '2011 Q1', y: 20000},
                        {x: '2011 Q2', y: 24000},
                        {x: '2011 Q3', y: 33000},
                        {x: '2011 Q4', y: 40000},
                        {x: '2012 Q1', y: 25000},
                        {x: '2012 Q2', y: 70000},
                        {x: '2012 Q3', y: 52000},
                        {x: '2012 Q4', y: 39000},
                        {x: '2013 Q1', y: 80000}
                    ],
                    xkey: 'x',
                    ykeys: ['y'],
                    labels: ['Y'],
                    barColors: ['#ff407b'],
                    preUnits: ["$"]

                });
                var a = c3.generate({
                    bindto: "#goodservice",
                    size: {height: 350},
                    color: {pattern: ["#5969ff", "#ff407b"]},
                    data: {
                        columns: [
                            ["Service", 20000, 25000, 30000, 80000, 10000, 50000],
                            ["Average", 25000, 25000, 25000, 25000, 25000, 25000]
                        ],
                        types: {Service: "bar"}
                    },
                    bar: {

                        width: 45

                    },
                    legend: {
                        show: true
                    },
                    axis: {
                        y: {
                            tick: {
                                format: d3.format("$")
                            }
                        }

                    },
                });
                var data = {
                    labels: ['Disputed Invoice', 'Overdue Invoice'],
                    series: [20, 15]
                };
                var options = {
                    labelInterpolationFnc: function (value) {
                        return value[0]
                    }
                };
                var responsiveOptions = [
                    ['screen and (min-width: 640px)', {
                            chartPadding: 30,
                            labelOffset: 100,
                            labelDirection: 'explode',
                            labelInterpolationFnc: function (value) {
                                return value;
                            }
                        }],
                    ['screen and (min-width: 1024px)', {
                            labelOffset: 80,
                            chartPadding: 20
                        }]
                ];
                new Chartist.Pie('.ct-chart-invoice', data, options, responsiveOptions);
                new Chartist.Line('.ct-chart-line-invoice', {
                    labels: ['Jan 2018', 'Mar 2018', 'May 2018', 'Jul 2018', 'Sep 2018', 'Oct 2018', 'Nov 2018'],
                    series: [
                        [12, 8, 6, 7, 3, 2.5, 7, 8],
                        [7, 7, 7, 7, 7, 7, 7, 7]

                    ]
                }, {
                    fullWidth: true,
                    chartPadding: {
                        right: 40
                    },
                    axisY: {
                        labelInterpolationFnc: function (value) {
                            return '$' + (value / 1000);
                        }
                    },

                });
                var chart = c3.generate({
                    bindto: "#account",
                    color: {pattern: ["#5969ff", "#ff407b", "#25d5f2", "#ffc750"]},
                    data: {
                        // iris data from R
                        columns: [
                            ['30 days', 120],
                            ['60 days', 70],
                            ['90 days', 50],
                            ['90+ Days', 30],
                        ],
                        type: 'pie',

                    }
                });
                setTimeout(function () {
                    chart.load({

                    });
                }, 1500);
                setTimeout(function () {
                    chart.unload({
                        ids: 'data1'
                    });
                    chart.unload({
                        ids: 'data2'
                    });
                },
                        2500
                        );
                Morris.Area({
                    element: 'capital',
                    behaveLikeLine: true,

                    data: [
                        {x: '2010 Q1', y: 20000},
                        {x: '2010 Q2', y: 24000},
                        {x: '2010 Q3', y: 33000},
                        {x: '2010 Q4', y: 40000},
                        {x: '2011 Q1', y: 25000},
                        {x: '2011 Q2', y: 70000},
                        {x: '2011 Q3', y: 52000},
                        {x: '2012 Q1', y: 39000},
                        {x: '2012 Q2', y: 80000}
                    ],
                    xkey: 'x',
                    ykeys: ['y'],
                    labels: ['Y'],
                    lineColors: ['#ff407b'],
                    preUnits: ["$"]
                });
                new Chartist.Bar('.ct-chart-inventory', {
                    labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                    series: [
                        [800000, 1200000, 1400000, 1300000],
                        [200000, 400000, 500000, 300000],
                        [100000, 200000, 400000, 600000]
                    ]
                }, {
                    stackBars: true,
                    axisY: {
                        labelInterpolationFnc: function (value) {
                            return  '$' + (value / 1000);
                        }
                    }
                }).on('draw', function (data) {
                    if (data.type === 'bar') {
                        data.element.attr({
                            style: 'stroke-width: 30px'
                        });
                    }
                });
            });
            $(function () {
                "use strict";
                // ============================================================== 
                // Product Sales
                // ============================================================== 
                var myArrySum = [];
                var myArrName = [];
                var valueProSum = document.querySelectorAll('.bt_4');
                valueProSum.forEach((s) => {
                    myArrySum.push(parseInt(s.getAttribute('data-sum')));
                    myArrName.push(s.getAttribute('data-name'));
                });
                new Chartist.Bar('.ct-chart-product', {
                    labels: myArrName,
                    series: [
                        myArrySum
                    ]
                }, {
                    stackBars: true,
                    axisY: {
                        labelInterpolationFnc: function (value) {
                            return (value / 1000) + 'k';
                        }
                    }
                }).on('draw', function (data) {
                    if (data.type === 'bar') {
                        data.element.attr({
                            style: 'stroke-width: 40px'
                        });
                    }
                });





                // ==============================================================
                // Product Category
                // ==============================================================
                var myArry = [];
                var valueMoneys = document.querySelectorAll('.bt_3');
                valueMoneys.forEach((s) => {
                    myArry.push(parseInt(s.getAttribute('data-count')));
                });
                var chart = new Chartist.Pie('.ct-chart-category', {
                    series: myArry,
                    labels: ['Bananas', 'Apples', 'Grapes']
                }, {
                    donut: true,
                    showLabel: false,
                    donutWidth: 40

                });


                chart.on('draw', function (data) {
                    if (data.type === 'slice') {
                        // Get the total path length in order to use for dash array animation
                        var pathLength = data.element._node.getTotalLength();

                        // Set a dasharray that matches the path length as prerequisite to animate dashoffset
                        data.element.attr({
                            'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
                        });

                        // Create animation definition while also assigning an ID to the animation for later sync usage
                        var animationDefinition = {
                            'stroke-dashoffset': {
                                id: 'anim' + data.index,
                                dur: 1000,
                                from: -pathLength + 'px',
                                to: '0px',
                                easing: Chartist.Svg.Easing.easeOutQuint,
                                // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
                                fill: 'freeze'
                            }
                        };

                        // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
                        if (data.index !== 0) {
                            animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
                        }

                        // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
                        data.element.attr({
                            'stroke-dashoffset': -pathLength + 'px'
                        });

                        // We can't use guided mode as the animations need to rely on setting begin manually
                        // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
                        data.element.animate(animationDefinition, false);
                    }
                });

                // For the sake of the example we update the chart every time it's created with a delay of 8 seconds



                // ==============================================================
                // Customer acquisition
                // ==============================================================
                var chart = new Chartist.Line('.ct-chart', {
                    labels: ['Mon', 'Tue', 'Wed'],
                    series: [
                        [1, 5, 2, 5],
                        [2, 3, 4, 8]

                    ]
                }, {
                    low: 0,
                    showArea: true,
                    showPoint: false,
                    fullWidth: true
                });

                chart.on('draw', function (data) {
                    if (data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 2000 * data.index,
                                dur: 2000,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeOutQuint
                            }
                        });
                    }
                });




                // ==============================================================
                // Revenue Cards
                // ==============================================================
                $("#sparkline-revenue").sparkline([10, 5, 7, 7, 9, 5, 3, 5, 2, 4, 6, 7], {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#5969ff',
                    fillColor: '#dbdeff',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });



                $("#sparkline-revenue2").sparkline([3, 7, 6, 4, 5, 4, 3, 5, 5, 2, 3, 1], {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#ff407b',
                    fillColor: '#ffdbe6',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });



                $("#sparkline-revenue3").sparkline([5, 3, 4, 6, 5, 7, 9, 4, 3, 5, 6, 1], {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#25d5f2',
                    fillColor: '#dffaff',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true
                });



                $("#sparkline-revenue4").sparkline([6, 5, 3, 4, 2, 5, 3, 8, 6, 4, 5, 1], {
                    type: 'line',
                    width: '99.5%',
                    height: '100',
                    lineColor: '#fec957',
                    fillColor: '#fff2d5',
                    lineWidth: 2,
                    spotColor: undefined,
                    minSpotColor: undefined,
                    maxSpotColor: undefined,
                    highlightSpotColor: undefined,
                    highlightLineColor: undefined,
                    resize: true,
                });





                // ==============================================================
                // Total Revenue
                // ==============================================================
                Morris.Area({
                    element: 'morris_totalrevenue',
                    behaveLikeLine: true,
                    data: [
                        {x: '2016 Q1', y: 0, },
                        {x: '2016 Q2', y: 7500, },
                        {x: '2017 Q3', y: 15000, },
                        {x: '2017 Q4', y: 22500, },
                        {x: '2018 Q5', y: 30000, },
                        {x: '2018 Q6', y: 40000, }
                    ],
                    xkey: 'x',
                    ykeys: ['y'],
                    labels: ['Y'],
                    lineColors: ['#5969ff'],
                    resize: true

                });




                // ==============================================================
                // Revenue By Categories
                // ==============================================================
                var chart = c3.generate({
                    bindto: "#c3chart_category",
                    data: {
                        columns: [
                            ['Dress', 100],
                            ['Print', 80],
                            ['Little', 50],
                            ['TShirt', 40],
                            ['Skirt', 20],
                        ],
                        type: 'donut',

                        onclick: function (d, i) {
                            console.log("onclick", d, i);
                        },
                        onmouseover: function (d, i) {
                            console.log("onmouseover", d, i);
                        },
                        onmouseout: function (d, i) {
                            console.log("onmouseout", d, i);
                        },

                        colors: {
                            Dress: '#5969ff',
                            Print: '#ff407b',
                            Little: '#25d5f2',
                            TShirt: '#ffc750',
                            Skirt: '#2ec551',

                        }
                    },
                    donut: {
                        label: {
                            show: false
                        }
                    },

                });
            });
            $(window).on('load', function (event) {
                $('body').removeClass('preloading');
                // $('.load').delay(1000).fadeOut('fast');
                $('.loader').delay(1000).fadeOut('fast');
            });
        </script>
    </body>

</html>