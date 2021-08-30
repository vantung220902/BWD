<%-- 
    Document   : map-vector
    Created on : Jun 28, 2021, 9:59:03 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template Google Map</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="./DoAnFile/Admin-BWD/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/libs/css/style.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-2.0.2.css">
</head>

<body>
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
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Vector Map </h2>
                            <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Maps</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Vector Map</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- world map -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">World Map</h5>
                            <div class="card-body">
                                <div id="world-map-markers" style="height: 450px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!--end world map -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!--india -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">India</h5>
                            <div class="card-body">
                                <div id="india" style="height: 450px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!--end india -->
                    <!-- ============================================================== -->
                </div>
                <div class="row">
                    <!-- ============================================================== -->
                    <!--USA -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">USA</h5>
                            <div class="card-body">
                                <div id="usa" style="height: 450px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end USA -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Australia map -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Australia Map</h5>
                            <div class="card-body">
                                <div id="australia" style="height: 450px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end Australia map -->
                    <!-- ============================================================== -->
                </div>
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- UK map -->
                    <!-- ============================================================== -->
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Uk Map</h5>
                            <div class="card-body">
                                <div id="uk" style="height: 450px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- UK map -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <div class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                               KHTV TEAM
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
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
        </div>
    </div>
        <!-- ============================================================== -->
        <!-- end main wrapper -->
        <!-- ============================================================== -->
        <!-- Optional JavaScript -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/main-js.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/gmaps.min.js"></script>
        <!-- jvactormap js -->
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-in-mill.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-us-aea-en.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-uk-mill-en.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/vendor/jvectormap/jquery-jvectormap-au-mill.js"></script>
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/jvectormap.custom.js"></script>
</body>
 
</html>
