<%-- 
    Document   : dashboard-finance
    Created on : Jun 28, 2021, 9:47:26 AM
    Author     : admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.DateConver"%>
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
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/vector-map/jqvmap.css">
        <link href="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" type="text/css" href="./DoAnFile/Admin-BWD/assets/vendor/daterangepicker/daterangepicker.css" />
        <title>FASHION STORE</title>
        <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- main wrapper -->
        <!-- ============================================================== -->
        <% 
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            String strDate = formatter.format(date);

        %>
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
                    <div class="dashboard-finance">
                        <div class="container-fluid dashboard-content">
                            <!-- ============================================================== -->
                            <!-- pageheader  -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h3 class="mb-2">Qu???n l?? doanh thu</h3>
                                        <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                        <div class="page-breadcrumb">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">B???n ??i???u khi???n</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Qu???n l?? doanh thu</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader  -->
                            <!-- ============================================================== -->
                            <div class="row">
                                <div class="offset-xl-10 col-xl-2 col-lg-2 col-md-6 col-sm-12 col-12">
                                    <form>
                                        <div class="form-group">
                                            <input class="form-control" type="text" name="daterange" value="01/01/2020 - <%=strDate%>" />
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">T???ng thu nh???p
                                        <div class="card-body">
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">$5,79,000</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">25%</span>
                                            </div>
                                        </div>
                                        <div class="card-body bg-light p-t-40 p-b-40">
                                            <div id="sparkline-revenue"></div>
                                        </div>
                                        <div class="card-footer text-center bg-white">
                                            <a href="#" class="card-link">Xem chi ti???t</a>
                                        </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">T???ng chi ph??</h5>
                                    <div class="card-body">
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">$1,79,000</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-secondary font-weight-bold">
                                            <span class="icon-circle-small icon-box-xs text-danger bg-danger-light"><i class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1">15%</span>
                                        </div>
                                    </div>
                                    <div class="card-body text-center bg-light p-t-40 p-b-40">
                                        <div id="sparkline-revenue2"></div>
                                    </div>
                                    <div class="card-footer text-center bg-white">
                                        <a href="#" class="card-link">Xem chi ti???T</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Ti???n m???t</h5>
                                    <div class="card-body">
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">$79,000</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                            <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">25%</span>
                                        </div>
                                    </div>
                                    <div class="card-body bg-light p-t-40 p-b-40">
                                        <div id="sparkline-revenue3"></div>
                                    </div>
                                    <div class="card-footer text-center bg-white">
                                        <a href="#" class="card-link">Xem chi ti???t</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Bi??n l???i nhu???n r??ng</h5>
                                    <div class="card-body">
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">$92,000</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                            <span class="icon-circle-small icon-box-xs text-success bg-success-light"><i class="fa fa-fw fa-arrow-up"></i></span> <span class="ml-1">25%</span>
                                        </div>
                                    </div>
                                    <div class="card-body bg-light p-b-40 p-t-40">
                                        <div id="sparkline-revenue4"></div>
                                    </div>
                                    <div class="card-footer text-center bg-white">
                                        <a href="#" class="card-link">Xem chi ti???t</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end revenue year  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- ap and ar balance  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">C??n b???ng AP v?? AR
                                    </h5>
                                    <div class="card-body">
                                        <canvas id="chartjs_balance_bar"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end ap and ar balance  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- gross profit  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">% ng??n s??ch thu nh???p</h5>
                                    <div class="card-body">
                                        <div id="morris_gross" style="height: 272px;"></div>
                                    </div>
                                    <div class="card-footer bg-white">
                                        <p>Ng??n s??ch <span class="float-right text-dark">12,000.00</span></p>
                                        <p>C??n b???ng<span class="float-right text-dark">-2300.00 <span class="ml-2 text-secondary"><i class="fas fa-caret-up mr-1"></i>25%</span></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end gross profit  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- profit margin  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">% Ng??n s??ch chi ti??u</h5>
                                    <div class="card-body">
                                        <div id="morris_profit" style="height: 272px;"></div>
                                    </div>
                                    <div class="card-footer bg-white">
                                        <p>Ng??n s??ch <span class="float-right text-dark">3500.00</span></p>
                                        <p>C??n b???ng <span class="float-right text-dark">230.00 <span class="ml-2 text-secondary"><i class="fas fa-caret-up mr-1"></i>25%</span></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end profit margin -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- earnings before interest tax  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">EBIT (Thu nh???p tr?????c l??i vay v?? thu???)</h5>
                                    <div class="card-body">
                                        <div id="ebit_morris"></div>
                                        <div class="text-center">
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">EBIT (Thu nh???p tr?????c l??i vay v?? thu???)</span>
                                            </span>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end earnings before interest tax  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- cost of goods  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Gi?? v???n h??ng h??a / d???ch v???<span class="float-right">T??? 2020 ?????n 2021</span></h5>
                                    <div class="card-body">
                                        <div id="goodservice"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end cost of goods  -->
                            <!-- ============================================================== -->
                        </div>
                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- overdue invoices  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Tranh ch???p so v???i H??a ????n qu?? h???n</h5>
                                    <div class="card-body">
                                        <div class="ct-chart-invoice ct-golden-section"></div>
                                        <div class="text-center m-t-40">
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full "></i></span><span class="legend-text">H??a ????n b??? tranh ch???p</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full "></i></span><span class="legend-text">Ho?? ????n qu?? h???n</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end overdue invoices  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- disputed invoices  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-5 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">H??a ????n b??? tranh ch???p</h5>
                                    <div class="card-body">
                                        <div class="ct-chart-line-invoice ct-golden-section"></div>
                                        <div class="text-center m-t-10">
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">H??a ????n b??? tranh ch???p</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">Trung b??nh c???ng</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end disputed invoices  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- account payable age  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Tu???i ph???i tr??? c???a t??i kho???n</h5>
                                    <div class="card-body">
                                        <div id="account" style="height: 300px;"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end account payable age  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- working capital  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">V???n l??u ?????ng<span class="float-right">T??? 2020 ?????n 2021</span></h5>
                                    <div class="card-body">
                                        <div id="capital"></div>
                                        <div class="text-center m-t-10">
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">V???n l??u ?????ng</span>
                                            </span>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end working capital  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- inventory turnover  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Doanh thu h??ng t???n kho</h5>
                                    <div class="card-body">
                                        <div class="ct-chart-inventory ct-golden-section"></div>
                                        <div class="text-center m-t-10">
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">Doanh s???</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">M???c ti??u</span>
                                            </span>
                                            <span class="legend-item mr-3">
                                                <span class="fa-xs text-info mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                <span class="legend-text">???? ?????t ???????c</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end inventory turnover -->
                        <!-- ============================================================== -->
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
        <!-- ============================================================== -->
        <!-- end main wrapper  -->
        <!-- ============================================================== -->
        <!-- jquery 3.3.1  -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <!-- bootstap bundle js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- slimscroll js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <!-- chart chartist js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/Chartistjs.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist-plugin-threshold.js"></script>
        <!-- chart C3 js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
        <!-- chartjs js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/charts-bundle/Chart.bundle.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/charts-bundle/chartjs.js"></script>
        <!-- sparkline js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
        <!-- dashboard finance js -->
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/dashboard-finance.js"></script>
        <!-- main js -->
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/main-js.js"></script>
        <!-- gauge js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/gauge/gauge.min.js"></script>
        <!-- morris js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morrisjs.html"></script>
        <!-- daterangepicker js -->
        <script src="../../../../cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="../../../../cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <script>
            $(function () {
                $('input[name="daterange"]').daterangepicker({
                    opens: 'left'
                }, function (start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });
            });
        </script>
    </body>
</html>
