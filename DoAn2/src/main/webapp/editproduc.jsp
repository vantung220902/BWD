<%-- 
    Document   : editproduc
    Created on : Jun 28, 2021, 9:49:52 AM
    Author     : admin
--%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.CategoriesDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Categories"%>
<%@page import="DAO.DateConver"%>
<%@page import="DAO.Product"%>
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
            String action = (String) request.getAttribute("ACTIONPRO");
            Product pro = (Product) request.getAttribute("PD");
            ProductDAO dao = new ProductDAO();
            int quantity = 0;
            try {
                quantity = dao.getQuantuty(pro.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
            CategoriesDAO daoct = new CategoriesDAO();
            List<Categories> lsct = daoct.getAll();
            if (action == null) {
                action = "SaveOrUpdate";
            }
            if (pro == null) {
                pro = new Product(0, "", "", "", 0, 0, DateConver.now(), new Categories(1, ""), "", 1, 0, "M", "defaut");
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
                                    <form class="form-horizontal" method="post" action="ProductServlet" enctype="multipart/form-data">
                                        <input type="hidden" class="form-control" name="action" value="<%=action%>">
                                    <fieldset>
                                        <legend>PRODUCTS</legend>

                                        <div class="form-group">
                                            <label class=" control-label" for="product_id">ID</label>  
                                            <div class="">
                                                <input id="product_id" name="product_id" placeholder="ID" class="form-control input-md" value="<%=pro.getId()%>" type="text">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class=" control-label" for="product_name">Tên</label>  
                                            <div class="">
                                                <input id="product_name" name="product_name" placeholder="Tên" class="form-control input-md"value="<%=pro.getName()%>"  type="text">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="product_categorie">Loại</label>
                                            <div class="">
                                                <select id="product_categorie" name="product_categorie" class="form-control">
                                                    <option>--Chọn--</option>>
                                                    <%
                                                        for (int i = 0; i < lsct.size(); i++) {
                                                            Categories cate = lsct.get(i);
                                                    %>
                                                    <option value="<%=cate.getId()%>"><%=cate.getName()%></option>
                                                    <%}%>


                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class=" control-label" for="available_quantity">Số Lượng</label>  
                                            <div class="">
                                                <input id="available_quantity" name="available_quantity" placeholder="Số lượng" class="form-control input-md"value="<%=quantity%>"  type="text">

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class=" control-label" for="product_description">Mô tả</label>
                                            <div class="">                     
                                                <textarea class="form-control" id="product_description" name="product_description"><%=pro.getDescription()%></textarea>
                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class=" control-label" for="percentage_discount">Giảm giá</label>  
                                            <div class="">
                                                <input id="percentage_discount" name="percentage_discount" value="<%=pro.getRerentageDiscoint()%>" placeholder="Giảm giá" class="form-control input-md" type="text">

                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class=" control-label" for="mannufacture_date">Ngày Sản Xuất</label>  
                                            <div class="">
                                                <input id="mannufacture_date" name="mannufacture_date" value="<%=pro.getMannufactureDate()%>" placeholder="Ngày sản xuất" class="form-control input-md"  type="date">

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class=" control-label" for="priceOldID">Giá Cũ</label>  
                                            <div class="">
                                                <input id="priceOldID" name="PriceOld" placeholder="Giá cũ" class="form-control input-md" value="<%=pro.getPriceOld()%>"  type="text">

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class=" control-label" for="PriceNewID">Giá Mới</label>  
                                            <div class="">
                                                <input id="PriceNewID" name="PriceNew" placeholder="Giá mới" value="<%=pro.getPriceNew()%>" class="form-control input-md"  type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="size">SIZE</label>  
                                            <div class="">
                                                <input id="size" name="size" placeholder="Size" class="form-control input-md" value="<%=pro.getSize()%>"  type="text">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" control-label" for="procolor">Màu sắc</label>  
                                            <div class="">
                                                <input id="procolor" name="procolor" placeholder="Màu Sắc" class="form-control input-md" value="<%=pro.getColor()%>"  type="text">

                                            </div>
                                        </div>
                                        <!-- File Button --> 
                                        <div class="form-group">
                                            <label class=" control-label" for="filebutton">Ảnh Trước</label>
                                            <div class="">
                                                <input id="filebutton"  value="<%=pro.getImgFont()%>" name="imagesFont" class="input-file form-control" type="file">
                                            </div>
                                        </div>
                                        <!-- File Button --> 
                                        <div class="form-group">
                                            <label class=" control-label" for="filebutton">Ảnh Sau</label>
                                            <div class="">
                                                <input id="filebutton" value="<%=pro.getImgBehind()%>" name="imagesbehind" class="input-file form-control" type="file"> 
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
            ClassicEditor.create(document.querySelector('#product_description')).cathc(error => {
                console.error(error);
            });
        </script>
    </body>

</html>