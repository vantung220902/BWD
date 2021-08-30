<%-- 
    Document   : editproduc
    Created on : Jun 28, 2021, 9:49:52 AM
    Author     : admin
--%>

<%@page import="DAO.DateConver"%>
<%@page import="DAO.Cart"%>
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
    </head>

    <body>
        <%
            String action = (String) request.getAttribute("ACTION");
            Cart cart = (Cart) request.getAttribute("CART");
            if (action == null) {
                action = "Save";
            }
            if (cart == null) {
                cart = new Cart(0, 0, 0, 0, "", "", "", DateConver.now());
            }
        %>
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
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="container">
                                <h1 style="text-align: center;">Sửa giỏ hàng</h1>
                                <form class="form-horizontal" action="CartADServlet" method="get"  >
                                    <input type="hidden" class="form-control" name="action" value="<%=action%>">
                                    <fieldset>
                                        <legend>Giỏ Hàng</legend>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_id">ID</label>  
                                            <div class="">
                                                <input id="cart_id" name="cart_id" value="<%=cart.getId()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="pro_id">ID sản phẩm</label>  
                                            <div class="">
                                                <input id="pro_id" name="pro_id"value="<%=cart.getProid()%>"  class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_quantity">Số lượng</label>
                                            <div class="">                     
                                                <input id="cart_quantity" name="cart_quantity" value="<%=cart.getQuantity()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_pri">Giá</label>  
                                            <div class="">
                                                <input id="cart_pri" name="cart_pri" value="<%=cart.getPrice()%>" class="form-control input-md"  type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_sa">Trạng thái</label>  
                                            <div class="">
                                                <input id="cart_sa" name="cart_sa" value="<%=cart.getStatus()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_us">ID Người mua</label>  
                                            <div class="">
                                                <input id="cart_us" name="cart_us" value="<%=cart.getUsername()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_na">Tên sản phẩm</label>  
                                            <div class="">
                                                <input id="cart_na" name="cart_na" value="<%=cart.getName()%>"  class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="cart_date">Ngày mua</label>  
                                            <div class="">
                                                <input id="cart_date" name="cart_date" value="<%=cart.getCreateDate()%>" class="form-control input-md" type="date">
                                            </div>
                                        </div>
                                        <!-- Button -->
                                        <div class="form-group">
                                            <div class="">
                                                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Thêm</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
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
            <!-- ============================================================== -->
            <!-- end wrapper  -->
            <!-- ============================================================== -->
        </div>

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
        <script src="./DoAnFile/Admin-BWD/assets/libs/js/dashboard-ecommerce.js"></script>
        <script src="./DoAnFile/CKEditor/ckeditor5-build-classic-27.1.0/ckeditor5-build-classic/ckeditor.js"></script>


        <script>
            ClassicEditor.create(document.querySelector('#news_description')).cathc(error => {
                console.error(error);
            });

        </script>
    </body>

</html>