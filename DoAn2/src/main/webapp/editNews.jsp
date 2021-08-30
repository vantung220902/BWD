<%-- 
    Document   : editproduc
    Created on : Jun 28, 2021, 9:49:52 AM
    Author     : admin
--%>
<%@page import="DAO.CategoryNews"%>
<%@page import="DAO.CateNewsDao"%>
<%@page import="DAO.News"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Categories"%>
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
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <title>FASHION STORE</title>
        <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
    </head>

    <body>
        <%
            String action = (String) request.getAttribute("ACTIONNEWS");
            News news = (News) request.getAttribute("NW");
            CateNewsDao daoct = new CateNewsDao();
            List<CategoryNews> lsct = daoct.getAll();
            if (action == null) {
                action = "SaveOrUpdate";
            }
            if (news == null) {
                news = new News(0, "", "", DateConver.now(), new CategoryNews(1, ""), "", "");
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
                                    <h1 style="text-align: center;">Sửa sản phẩm</h1>
                                    <form class="form-horizontal" action="NewServlet" method="post" enctype="multipart/form-data" >
                                        <input type="hidden" class="form-control" name="action" value="SaveOrUpdate">
                                        <fieldset>
                                            <legend>Tin Tức</legend>
                                            <div class="form-group">
                                                <label class=" control-label" for="news__id">ID</label>  
                                                <div class="">
                                                    <input id="news__id" name="news__id"  value="<%=news.getId()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="news__name">Tên</label>  
                                            <div class="">
                                                <input id="news__name" name="news__name" value="<%=news.getName()%>" class="form-control input-md" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="news_description">Mô tả</label>
                                            <div class="">                     
                                                <textarea class="form-control" id="news_description"  name="news_description"><%=news.getDescription()%></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="news__date">Ngày Đăng</label>  
                                            <div class="">
                                                <input id="news__date" name="news__date"  value="<%=news.getDataSubmit()%>" class="form-control input-md"  type="date">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="news__cate">Loại Tin</label>
                                            <div class="">
                                                <select id="news__cate" name="news__cate" class="form-control">
                                                    <option >--Chọn--</option>
                                                    <%
                                                        for (int i = 0; i < lsct.size(); i++) {
                                                            CategoryNews cate = lsct.get(i);
                                                    %>
                                                    <option value="<%=cate.getId()%>"><%=cate.getName()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class=" control-label" for="news__link">Link</label>  
                                            <div class="">
                                                <input id="news__link" name="news__link"  class="form-control input-md" value="<%=news.getLink()%>" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="news__img">Ảnh</label>  
                                            <div class="">
                                                <input id="news__img" name="news__img" class="form-control input-md"   type="file">
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