<%-- 
    Document   : product
    Created on : Jun 28, 2021, 9:51:25 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="./DoAnFile/Admin-BWD/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/libs/css/style.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet"
          href="./DoAnFile/Admin-BWD/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>FASHION STORE</title>
    <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
</head>
<style>
    .page-item.active {
        background-color: #5969ff;
        border-color: #5969ff;
    }
    .modal-dialog{
        display: block;
    }
</style>
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
                    <h3 class="text-center">Quản lí sản phẩm</h3>
                </div>
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <table class="table table-hover table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Ảnh trước sản phẩm</th>
                            <th scope="col">Ảnh sau sản phẩm</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Giá Cũ</th>
                            <th scope="col">Giá Mới</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Doanh mục</th>
                            <th scope="col">Mô tả</th>
                            <th scope="col">Ngày Sản Xuất</th>
                            <th scope="col">SIZE</th>
                            <th scope="col">Màu sắc</th>
                            <th scope="col">Phần Trăm</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody id="table__pro-views">
                        <c:forEach var="pro" items="${lsPro}">
                            <tr>
                                <td>${pro.id}</td>
                                <td class="product-img-admin">
                                    <img src="${pro.imgFont}" style="max-width: 40px;" alt="img">
                                </td>
                                <td class="product-img-admin">
                                    <img src="${pro.imgBehind}" style="max-width: 40px;" alt="img">
                                </td>
                                <td>${pro.name}</td>
                                <td>${pro.priceOld}</td>
                                <td>${pro.priceNew}</td>
                                <td style="text-align:center"><b>${pro.quantity}</b></td>
                                <td>${pro.cateID.name}</td>
                                <td>${pro.description}</td>
                                <td>${pro.mannufactureDate}</td>
                                <td>${pro.rerentageDiscoint}</td>
                                <td>${pro.size}</td>
                                <td>${pro.color}</td>
                                <td>
                                    <a href="ProductServlet?action=EditProduct&id=${pro.id}">
                                        <button type="button" class="btn btn-primary">Sửa</button>
                                    </a>
                                    <a href="ProductServlet?action=DeleteProductView&id=${pro.id}">
                                        <button type="button" class="btn btn-secondary">Xoá</button>
                                    </a>
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

                            <c:forEach begin="1" var="i" end="${numberlist}">
                                <li class="page-item <c:if test="${i==1}">
                                            active
                                            </c:if>"><a class="page-link" onclick="Pagin(${i})"
                                >${i}</a></li>
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
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal"
                                data-whatever="@mdo">Thêm sản phẩm mới
                        </button>
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
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" action="ProductServlet" enctype="multipart/form-data">
                    <input type="hidden" class="form-control" name="action" value="SaveOrUpdate">
                    <fieldset>
                        <legend>Sản Phẩm</legend>

                        <div class="form-group">
                            <label class=" control-label" for="product_id">ID</label>
                            <div class="">
                                <input id="product_id" name="product_id" class="form-control input-md" type="text">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class=" control-label" for="product_name">Tên</label>
                            <div class="">
                                <input id="product_name" name="product_name"
                                       class="form-control input-md" type="text">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label" for="product_categorie">Loại Sản Phẩm</label>
                            <div class="">
                                <select id="product_categorie" name="product_categorie" class="form-control">
                                    <option>--Chọn--</option>
                                    <c:forEach var="cate" items="${lsCate}">
                                        <option value="${cate.id}">${cate.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class=" control-label" for="available_quantity">Số Lượng</label>
                            <div class="">
                                <input id="available_quantity" name="available_quantity" class="form-control input-md"
                                       type="text">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class=" control-label" for="product_description">Mô Tả</label>
                            <div class="">
                                <textarea class="form-control" id="product_description"
                                          name="product_description"></textarea>
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class=" control-label" for="percentage_discount">Giảm Giá</label>
                            <div class="">
                                <input id="percentage_discount" name="percentage_discount" class="form-control input-md"
                                       type="text">

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class=" control-label" for="mannufacture_date">Ngày Sản Xuất</label>
                            <div class="">
                                <input id="mannufacture_date" name="mannufacture_date" class="form-control input-md"
                                       type="date">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class=" control-label" for="priceOldID">Giá Cũ</label>
                            <div class="">
                                <input id="priceOldID" name="PriceOld" class="form-control input-md" type="text">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class=" control-label" for="PriceNewID">Giá Mới</label>
                            <div class="">
                                <input id="PriceNewID" name="PriceNew" class="form-control input-md" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label" for="size">SIZE</label>
                            <div class="">
                                <input id="size" name="size" placeholder="Size" class="form-control input-md"
                                       type="text">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label" for="procolor">Màu sắc</label>
                            <div class="">
                                <input id="procolor"
                                       name="procolor" placeholder="Màu Sắc" class="form-control input-md"
                                       value="#FFFFF" type="text">

                            </div>
                        </div>
                        <!-- File Button -->
                        <div class="form-group">
                            <label class=" control-label " for="filebutton">Ảnh Trước</label>
                            <div class="">
                                <input id="filebutton" name="imagesFont" class="input-file form-control" type="file">
                            </div>
                        </div>
                        <!-- File Button -->
                        <div class="form-group">
                            <label class=" control-label" for="filebutton">Ảnh Sau</label>
                            <div class="">
                                <input id="filebutton" name="imagesbehind" class="input-file form-control" type="file">
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <div class="col-md-12">
                                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Thêm</button>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>

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
<script src="./DoAnFile/CKEditor/ckeditor5-build-classic-27.1.0/ckeditor5-build-classic/ckeditor.js"></script>
<script>
    ClassicEditor.create(document.querySelector('#product_description')).cathc(error => {
        console.error(error);
    });
</script>
<script>
    function Pagin(id) {
        $.ajax({
            url: './PaginProAmin',
            type: 'GET',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data: {
                iPagin: id
            },
            success: function (response) {
                var proConetnt = document.querySelector('#table__pro-views');
                proConetnt.innerHTML = response;

            },
            error: function () {
                console.log("Lỗi Rồi Thằng Quần");
            }
        });
    }
    ;
    var nodePage = document.querySelectorAll('.page-item');
    nodePage.forEach((node, index) => {
        node.onclick = function () {
            document.querySelector('.page-item.active').classList.remove('active');
            this.classList.add('active');
        };
    });
</script>
</body>

</html>