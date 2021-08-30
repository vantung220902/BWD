
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="scroll-top">
            <i class="fas fa-arrow-up"></i>
        </div>
        
        <div class="chat_box">

            <div class="my-conv-form-wrapper">
                <form action="" method="GET" class="hidden">
                    <select data-conv-question="Hello! How can I help you" name="category">
                        <option value="Contact Us">Contact Us ?</option>
                        <option value="Search product">Search product ?</option>
                    </select>

                    <div data-conv-fork="category">
                        <div data-conv-case="Contact Us">
                            <input type="text" name="name" data-conv-question="Please, Enter your name"> 
                            <input type="text" data-conv-question="Hi {name}, <br> It's a pleasure to meet you." data-no-answer="true">
                            <input data-conv-question="Enter your e-mail" data-pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" type="email" name="email" required placeholder="What's your e-mail?"> 
                        </div>  
                    </div> 
                    <div data-conv-fork="category">
                        <div data-conv-case="Search product">
                            <select data-conv-question="products" name="products">
                                <option value="dress">Dress</option>
                                <option value="glass">Glass</option>
                                <option value="son">Son</option>
                                <option value="T shirt">T shirt</option>
                            </select> 
                        </div>
                    </div> 

                    <div data-conv-fork="products">
                        <div data-conv-case="dress">
                            <input type="text" name="dresspro" data-conv-question="http://localhost:8080/DoAn/ProductServlet?action=SearchProductCT&id=4">

                        </div>
                    </div>

                    <select data-conv-question="Please Contact Us with" name="infor">
                        <option value="contact">Admin</option>
                        <option value="Information Us">Information Us</option>
                    </select>
                    <div data-conv-fork="infor">
                        <div data-conv-case="contact">
                            <input type="text" name="wait" data-conv-question="Please,wait for us a moment">

                        </div>
                    </div>
                    <div data-conv-fork="infor">
                        <div data-conv-case="Information Us">
                            <select data-conv-question="Information">
                                <option value="phonenumber">0363697690</option>
                                <option value="facebook">facebook</option>
                                <option value="website">website</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="icon__messager">
            <img loading="lazy" src="./DoAnFile/img/icon/bot.svg" alt="" class="icon__messager-item">
        </div>
<div class="home__nav-bar-mobile">
    <div class="row">
        <a href="./index.jsp" class="home__nav-bar-mobile-item ">
            <i class="icon__home-nav-item ti-home"></i>
            <p class="EN">Home</p>
	<p class="VI">Trang chủ</p>
        </a>
        <div class="home__nav-bar-mobile-item home__nav-bar-mobile-item-cate">
            <i class="icon__home-nav-item ti-layout-grid2"></i>
            <p class="EN">Category</p>
	<p class="VI">Danh mục</p>
        </div>
        <div class="home__nav-bar-mobile-item home__nav-bar-mobile-item-voucher">
            <i class="icon__home-nav-item ti-gift"></i>
            <p class="EN">Voucher</p>
	<p class="VI">Phiếu giảm giá</p>
        </div>
        <a href="" class="home__nav-bar-mobile-item ">
            <i class="icon__home-nav-item ti-bell"></i>
	<p class="EN">Message</p>
	<p class="VI">Tin nhắn</p>
        </a>
        <a href="" class="home__nav-bar-mobile-item home__nav-bar-mobile-item-acc">
            <i class="icon__home-nav-item ti-user"></i>
            <p>${sessionScope.fn}</p>
        </a>
    </div>
</div>
<div class="manages__acount-client">
    <ul class="header__introduct-acc-list-mobile">
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                <i class="ti-user"></i>
		<span class="VI">Tài khoản của tôi</span>
		<span class="EN">My account</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                <i class="ti-home"></i>
		<span class="VI">Địa chỉ của tôi</span>
		<span class="EN">My address</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                <i class="ti-money"></i>
		<span class="VI">Đơn mua</span>
		<span class="EN">My order</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile header__introduct-acc-item--separate">
            <a href="AccServlet?action=Logout">
                <i class="fas fa-sign-in-alt"></i> 	
		<span class="VI">Đăng xuất</span>
		<span class="EN">Log out</span>
            </a></li>
    </ul>
</div>
<div class="kho__Voucher-manages">
    <ul class="header__introduct-acc-list-mobile">
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                10<span class="VI">Mã giảm giá 50%</span>
	      <span class="EN">50% Discount code</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                15<span class="VI">Mã giảm giá 40%</span>
	      <span class="EN">40% Discount code</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile">
            <a href="">
                20 <span class="VI">Mã giảm giá 30%</span>
	      <span class="EN">30% Discount code</span>
            </a></li>
        <li class="header__introduct-acc-item-mobile header__introduct-acc-item--separate">
            <a href="">
                25<span class="VI">Mã giảm giá 10%</span>
	      <span class="EN">10% Discount code</span>
            </a></li>
    </ul>
</div>
<div class="footer">
    <div class="grid wide">
        <div class="row footer-wrap">
            <div class="footer-desc l-3 m-12 c-12">
                <ul class="footer-desc-list">
                    <h2 class="footer-desc-heading">
                        <span class="VI">VỀ CHÚNG TÔI</span>
	            <span class="EN">ABOUT US</span>
                    </h2>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">OUR STORY
	            </a>
		<a href="" class="footer-desc-link VI">CÂU CHUYỆN CỦA CHÚNG TÔI
	            </a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">LOCATIONS</a>
		<a href="" class="footer-desc-link VI">VỊ TRÍ</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">OUR FABRICS</a>
		<a href="" class="footer-desc-link VI">CHẤT LIỆU CỦA CHÚNG TÔI</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">PRESS</a>	
		<a href="" class="footer-desc-link VI">NHẤN</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">CAREERS</a>
		<a href="" class="footer-desc-link VI">SỰ NGHIỆP</a>
                    </li>
                </ul>

                <ul class="footer-desc-list">
                    <h2 class="footer-desc-heading EN">
                        SUPPORT
                    </h2>
	       <h2 class="footer-desc-heading VI">
                       HỖ TRỢ
                    </h2>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">CONTACT US</a>
		<a href="" class="footer-desc-link VI">LIÊN HỆ CHÚNG TÔI</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">MY ACCOUNT</a>
		 <a href="" class="footer-desc-link VI">TÀI KHOẢN CỦA TÔI</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">ORDER STATUS</a>
		<a href="" class="footer-desc-link VI">TRẠNG THÁI ĐƠN HÀNG</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">RETURNS+EXCHANGES</a>
		<a href="" class="footer-desc-link VI">TRẢ LẠI + TRAO ĐỔI</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">FAQS</a>	
		<a href="" class="footer-desc-link VI">CHỨNG MINH</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">FABRIC CARE</a>
		  <a href="" class="footer-desc-link VI">CHĂM SÓC VẢI</a>
                    </li>
                    <li class="footer-desc-item">
                        <a href="" class="footer-desc-link EN">AMBASSADOR PROGRAM</a>
		<a href="" class="footer-desc-link VI">CHƯƠNG TRÌNH AMBASSADOR</a>
                    </li>
                </ul>
            </div>
            <div class="footer-logo l-6 m-12 c-12">
                <h1 class="footer-logo-text">FASHION STORE</h1>
            </div>
            <div class="footer-desc-login l-3 m-12 c-12">
                <h3 class="footer-desc-login-text EN">
                    Sign up for FASHION STORE news & updates
                </h3>
	   <h3 class="footer-desc-login-text VI">
                    Đăng ký nhận tin tức và cập nhật của FASHION STORE
                </h3>
                <div class="footer-desc-login-input-wrap">
                    <input type="text" name="" class="footer-desc-login-input EN"
                           placeholder="Enter your email to subscribe">
	    <input type="text" name="" class="footer-desc-login-input VI"
                           placeholder="Nhập email của bạn để đăng ký">
                    <i class="ti-arrow-right footer-desc-login-icon"></i>
                </div>
                <div class="footer__socail">
                    <i class="ti-facebook"></i>
                    <i class="ti-instagram"></i>
                    <i class="ti-pinterest"></i>
                    <i class="ti-apple"></i>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    var checkLogin = '${sessionScope.ck}';
    var manageAccMobile = document.querySelector('.manages__acount-client');
    var iconAccMobile = document.querySelector('.home__nav-bar-mobile-item-acc');
    var managevcMobile = document.querySelector('.kho__Voucher-manages');
    console.log(managevcMobile);
    var iconvcMobile = document.querySelector('.home__nav-bar-mobile-item-voucher');
    console.log(iconvcMobile);
    var countIconaccMobile = 1;
    var countIconvoucherMobile = 1;
    iconAccMobile.onclick = function () {
        if (checkLogin) {
            countIconaccMobile++;
            iconAccMobile.href = '#';
            if (countIconaccMobile % 2 === 0) {
                manageAccMobile.style.display = 'flex';
            } else {
                manageAccMobile.style.display = 'none';
            }
        } else {
            iconAccMobile.href = "./signUp.jsp";
        }
    };
    iconvcMobile.onclick = function () {
        if (checkLogin) {
            countIconvoucherMobile++;
            iconvcMobile.href = '#';
            console.log("thanh Cong");
            if (countIconvoucherMobile % 2 === 0) {
                managevcMobile.style.display = 'flex';
            } else {
                managevcMobile.style.display = 'none';
            }
        } else {
            iconvcMobile.href = "./signUp.jsp";
        }
    };
</script>