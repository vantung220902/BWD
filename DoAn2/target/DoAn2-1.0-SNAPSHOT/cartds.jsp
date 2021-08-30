<%@ page import="DAO.Design" %>
<%@ page import="DAO.designDao" %><%--
    Document   : cart
    Created on : May 29, 2021, 8:24:50 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FASHION STORE</title>
    <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
    <link rel="stylesheet" href="./vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./DoAnFile/cart/cart.css">


    <style>
        .header__nav-heading-text{
            font-size: 2.4rem;
            line-height: 2.4rem;
            font-family:  Fantasy,Tribal Dragon;
            color: white;
            padding-left: 24px;
            border-right:  1px solid #000;
        }
        .header__nav-heading-text-cart{
            font-size: 1.6rem;
        }
        .layout_img{
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            mix-blend-mode: hue;
            display: block;
        }
    </style>
</head>
<body>

<div class="cart">
    <div class="row pb-0">
        <div class="col-lg-9 ">
            <h4>Your Cart</h4>
            <p>Hello, <b>${sessionScope.fn}</b></p>
            <c:if test="${checkSale}">
                <div class="container">
                    <div class="content">
                        <h2>Congratulation</h2>
                        <h4>You get 50% off code</h4>
                        <span class="text-center">${maSale}</span>
                    </div>
                    <div class="flap"></div>
                    <div class="close__presents" onclick="viewPresent()">
                        <i class="ti-close"></i>
                    </div>
                </div>

            </c:if>
            <table class="table table-hover table-striped text-center">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Color</th>
                    <th scope="col">Logo</th>
                    <th scope="col">Text</th>
                    <th scope="col">Img</th>
                    <th scope="col">Total</th>
                    <th scope="col">Remove</th>
                </tr>
                </thead>
                <%
                    Design ds = (Design) request.getAttribute("ds");
                    designDao dao = new designDao();

                %>
                <tbody>

                <tr>
                    <td class="cart-product-img" style="position: relative">

                        <img src="./DoAnFile/ThietKeAo/background_tshirt1.png" alt="img" width="74px">
                    </td>
                    <td>Tshirt</td>
                    <td>999</td>
                    <td>1</td>
                    <td><%=ds.getColor()%></td>
                    <td><%=ds.getLogo()%></td>
                    <td><%=ds.getText()%></td>
                    <td><img src="<%=ds.getImg()%>"  alt="" width="60px"></td>
                    <td>

                        <a ><button style="font-size: 20px" class="btnSub btn btn-light">-</button></a>
                        <strong style="padding:0 10px;">1</strong>

                            <a ><button style="font-size: 20px" class="btnAdd btn btn-light">+</button></a>
                    </td>

                    <td>
                        <a href="Desigin.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg>

                        </a>
                    </td>
                </tr>

                </tbody>
            </table>
            <div class="col-md-4 col-sm-4 ip-back">
                <a href="Desigin.jsp"><input type="submit" class="back-shopping" value="Continue Shopping"></a>
            </div>

        </div>
        <%
            dao.delete();
        %>
        <div class="col-lg-3  payment">
            <h4>Summary</h4>
            <hr>
            <div class="price">
                <h5>Item Price </h5>
                <h5 class="money">999</h5>
            </div>
            <div class="ship-fee">
                <h5>Shipping</h5>
                <h5 class="money">100</h5>
            </div>
            <div class="infor">
                <form>
                    <div class="form-group">
                        <label >GIVE CODE</label>
                        <input type="text" class="form-control" placeholder="Enter your code">
                        <div class="kho__gift" onclick="viewPresent()">
                            <i class="ti-gift"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >ADDRESS</label>
                        <input type="text" class="form-control" placeholder="Enter your address">
                    </div>
                    <div class="form-group">
                        <label >PHONE</label>
                        <input type="text" class="form-control" placeholder="Enter your Phone">
                    </div>
                </form>
            </div>
            <hr>
            <div class="payment_cost">
                <h3>Payment</h3>
                <a class="payment__option active"><span>Payment on delivery</span>
                    <i class="ti-check iconCheck"></i></a>
                <a class="payment__option "><span>Phone Card</span> </a>
                <a class="payment__option "><span>Credit Card</span></a>
            </div>
            <div class="total">
                <h4>Total Price</h4>
                <h4 class="money">1099</h4>
            </div>
            <div class="checkout text-center">

                <a href="<c:if test="${sessionScope.ck}">
                          ./Design.jsp

                            </c:if>
                            <c:if test="${not sessionScope.ck}">
                                ./signUp.jsp
                            </c:if>
                            " class="btn btn-dark mt-4 mb-3">CHECKOUT</a>
            </div>
        </div>


    </div>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    var present = document.querySelector('.container');
    var count = 1;
    function viewPresent() {
        count++;
        if (count % 2 === 0) {
            present.style.display = 'none';
        } else {
            present.style.display = 'block';
        }
    }
</script>
</body>
</html>
</html>