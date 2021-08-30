<%-- 
    Document   : account
    Created on : Jun 28, 2021, 9:45:55 AM
    Author     : admin
--%>

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
            .product-colors input[type=checkbox], input[type=radio]{
                display:block;
            }
        </style>
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
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h3 class="text-center">Quản lí tài khoản</h3>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <table class="table table-hover table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Tên tài khoản</th>
                                            <th scope="col">Mật khẩu</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Họ và tên</th>
                                            <th scope="col">Giới Tính</th>
                                            <th scope="col">Địa chỉ</th>
                                            <th scope="col">Quyền</th>
                                            <th scope="col">Tuổi</th>
                                            <th scope="col">Ngày Sinh</th>
                                            <th scope="col">Ngày Đăng Ký</th>
                                            <th scope="col">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="acc" items="${lsAccViews}">
                                        <tr>
                                            <td>${acc.username}</td>
                                            <td>${acc.password}</td>  
                                            <td>${acc.email}</td> 
                                            <td>${acc.fullname}</td>
                                            <td><c:if test="${acc.gender}">
                                                    Nam
                                                </c:if>
                                                <c:if test="${acc.gender == false}">
                                                    Nữ
                                                </c:if>
                                            </td>  
                                            <td>${acc.address}</td>  
                                            <td>${acc.privileges}</td>
                                            <td>${acc.age}</td>
                                            <td>${acc.birthday}</td> 
                                            <td>${acc.registerDate}</td> 
                                            <td>
                                                <a href="AccServlet?action=Eidt&username=${acc.username}"><button type="button" class="btn btn-primary">Sửa</button></a>
                                                <a href="AccServlet?action=DeleteViews&username=${acc.username}"><button type="button" class="btn btn-secondary">Xoá</button></a>
                                            </td> 
                                        </tr>
                                    </c:forEach>
                                </tbody>


                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" var="i" end="${numacc}">
                                        <li class="page-item"><a class="page-link"
                                                                 href="#">${i}</a></li>
                                        </c:forEach>

                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="Addproduct">
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Thêm tài khoản mới</button>
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
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm tài khoản</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AccServlet" class="sign-up-form" method="post">
                            <input type="hidden" class="form-control" name="action" value="SaveViews">
                           
                            <div class="form-group">
                                <i class="fas fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="Tên Đăng Nhập" > 
                            </div>
                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <input class="form-control" type="text" placeholder="Email" name="email" > 
                            </div>
                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control" type="password" placeholder="Password" name="password" > 
                            </div>
                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control"type="text" placeholder="Full Name" name="Tên " > 
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control"type="text" placeholder="Age" name="Tuổi" > 
                            </div>
                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control"type="date" placeholder="Birthday" name="Ngáy Sinh"> 
                            </div>
                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control"type="text" placeholder="Phone" name="Số Điện Thoại" > 
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input class="form-control"type="text" placeholder="Address" name="Địa Chỉ" > 
                            </div>
                            <div class="radio"><!--value = 1 => Nam| 0 =>Nu -->
                                <label class="checkbox-inline"
                                ><input class="form-control"
                                type="radio" name="gender"  value="0" checked
                                                                      
                                                                      >Male</label>
                                <label class="checkbox-inline">
                                    <input class="form-control"type="radio" name="gender"  value="1" 
                                                                      
                                                                      > Female</label>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Thêm</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
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
    </body>

</html>