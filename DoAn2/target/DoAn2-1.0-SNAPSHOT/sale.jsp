<%-- 
    Document   : sale
    Created on : Jun 13, 2021, 2:22:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>FASHION STORE SALE</title>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./DoAnFile/lucky-wheel-master/css/typo/typo.css" />
        <link rel="stylesheet" href="./DoAnFile/lucky-wheel-master/css/hc-canvas-luckwheel.css" />
        <style>
            .hc-luckywheel{
                position:fixed;
                top: 50%;
                left: 50%;
                margin-top: -250px;
                margin-left: -250px;
            }
        </style>
    </head>
    <body class="bg">
    <marquee id="danhngon" >
        <p>Còn thở là còn gỡ</p>
        <p>Dừng lại là thất bại</p>
        <p id="tacgia">Huấn Hoa Hồng</p>
    </marquee>
        <div class="wrapper typo" id="wrapper">
            <section id="luckywheel" class="hc-luckywheel">
                <div class="hc-luckywheel-container">
                    <canvas class="hc-luckywheel-canvas" width="500px" height="500px"
                            >Vòng Xoay May Mắn</canvas
                    >
                </div>
                <div class="hetluot"><p>Vui Lòng mua thêm sản phẩm</p></div>
                <a class="hc-luckywheel-btn" href="javascript:;">Xoay</a>
            </section>
            
        </div>
    
        <div class="ticket__randowm">
            <div class="ticket__number">
                <p class="ticket__number-text">
                    Số vé hiện tại: 
                </p>
                <span id="giamve">${luotquay}</span>
            </div>
             <p class="ticket__number-text">
                    Nghe nhạc giải trí nè: 
                </p>
            <audio id="audio" controls autoplay muted>
                <source src="./DoAnFile/lucky-wheel-master/audio/nhac1.mp3" type="audio/mpeg">
            </audio>
            <div class="gif__your">
                <a href="">Các phần quà của bạn</a>
            </div>
            <div class="nhaptien"><a href="">Nạp tiền</a></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="./DoAnFile/lucky-wheel-master/js/hc-canvas-luckwheel.js"></script>
        <script src="./DoAnFile/lucky-wheel-master/luckey.js"></script>
        <script>


        </script>
    </body>
</html>
