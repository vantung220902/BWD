(function () {
    "use strict";
    var carousels = function () {
        $(".owl-carousel1").owlCarousel({
            loop: !0,
            center: !0,
            margin: 0,
            responsiveClass: !0,
            nav: !1,
            autoplay: !0,
            autoplayTimeout: 2000,
            autoplayHoverPause: !0,
            responsive: {
                0: {
                    items: 1,
                    nav: !1,
                    loop: !0
                },
                680: {
                    items: 2,
                    nav: !1,
                    loop: !0
                },
                1000: {
                    items: 3.6,
                    nav: !0,
                    loop: !0
                }
            }
        });
        $('.play').on('click', function () {
            carousels.trigger('play.owl.autoplay', [1000])
        });
        $('.stop').on('click', function () {
            carousels.trigger('stop.owl.autoplay')
        })
    };
    (function ($) {
        carousels()
    })(jQuery)
})();
(function () {
    "use strict";
    var carousels = function () {
        $(".owl-carousel5").owlCarousel({
            loop: !0,
            center: !0,
            margin: 1,
            responsiveClass: !0,
            singleItem: !0,
            nav: !1,
            autoplay: !0,
            autoplayTimeout: 3000,
            autoplayHoverPause: !0,
            responsive: {
                0: {
                    items: 1,
                    nav: !0,
                    loop: !0
                },
                680: {
                    items: 1,
                    nav: !1,
                    loop: !0
                },
                1000: {
                    items: 2,
                    nav: !0,
                    loop: !0
                }
            }
        })
    };
    (function ($) {
        carousels()
    })(jQuery)
})();
var header = document.querySelector('.header');
var productNode = document.querySelectorAll('.product-wrap-node');
var productListImg = document.querySelector('.main__product-wrap-img');

function scrollFuntionImg() {
    if (productListImg.scrollTop > 735) {
        productNode[1].classList.add('main__product-wrap-node-arrived');
        productNode[0].classList.remove('main__product-wrap-node-arrived')
    }
    if (productListImg.scrollTop <= 735) {
        productNode[0].classList.add('main__product-wrap-node-arrived');
        productNode[1].classList.remove('main__product-wrap-node-arrived')
    } else {
        productNode[1].classList.add('main__product-wrap-node-arrived');
        productNode[0].classList.remove('main__product-wrap-node-arrived')
    }
}
var writeTitleWrap = document.querySelector('.write__reviews-detail');
var writeAskWrap = document.querySelector('.write__qustion-detail');
var writeDetail = document.querySelectorAll('.write__reviews-detai-wrap-heading');
var count2 = 1;
var count3 = 1;

function WriteReview() {
    count2++;
    if (count2 % 2 === 0) {
        writeTitleWrap.style.display = 'block';
        writeDetail[0].classList.add('write__reviews-detai-wrap-heading-check');
        writeDetail[1].classList.remove('write__reviews-detai-wrap-heading-check')
    } else {
        writeTitleWrap.style.display = 'none';
        writeDetail[0].classList.remove('write__reviews-detai-wrap-heading-check')
    }
    if (count3 % 2 === 0) {
        writeAskWrap.style.display = 'none';
        count3++
    }
}

function WriteQuestion() {
    count3++;
    if (count3 % 2 === 0) {
        writeAskWrap.style.display = 'block';
        writeDetail[1].classList.add('write__reviews-detai-wrap-heading-check');
        writeDetail[0].classList.remove('write__reviews-detai-wrap-heading-check')
    } else {
        writeAskWrap.style.display = 'none';
        writeDetail[1].classList.remove('write__reviews-detai-wrap-heading-check')
    }
    if (count2 % 2 === 0) {
        writeTitleWrap.style.display = 'none';
        count2++
    }
}
var iconMessager = document.querySelector('.icon__messager');

var scrollBtn = document.querySelector('.scroll-top');

window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 1200 || document.documentElement.scrollTop > 1200) {
        scrollBtn.style.opacity = "1";
        scrollBtn.style.visibility = "visible"
    } else {
        scrollBtn.style.opacity = "0";
        scrollBtn.style.visibility = "hidden"
    }
  
    if (document.body.scrollTop > 160 || document.documentElement.scrollTop > 160) {
        header.style.height = '62px'
    } else {
        header.style.height = '66px'
    }
}
scrollBtn.onclick = function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0
};
const cursor = document.querySelector('.cursor');
productListImg.addEventListener('mousemove', e1 => {
    cursor.setAttribute("style", "top: " + (e1.offsetY + 10) + "px; left: " + (e1.offsetX + 10) + "px;")
});

function cursorOut() {
    cursor.style.display = 'none'
}
productListImg.addEventListener('mouseout', cursorOut);
document.addEventListener('click', () => {
    cursor.classList.add("expand");
    setTimeout(() => {
        cursor.classList.remove("expand")
    }, 500)
});

function zoomOut() {
    var pre = document.getElementById("preview");
    pre.style.visibility = "hidden"
}

function node1() {
    productListImg.scrollTop = 0
}

function node2() {
    productListImg.scrollTop = 736
}

function node3() {
    productListImg.scrollTop = 2205
}

function node4() {
    productListImg.scrollTop = 2940
}

function node5() {
    productListImg.scrollTop = 4040
}
var writeClose = document.querySelector('.write__reviews-detail-main-close');
var writeCloseQuestion = document.querySelector('.detail-main-question-close');

function Close() {
    count2++;
    writeTitleWrap.style.display = 'none'
}

function Close2() {
    count3++;
    writeAskWrap.style.display = 'none'
}
writeClose.addEventListener('click', Close);
writeCloseQuestion.addEventListener('click', Close2);
$(function () {
    var star = '.star',
        selected = '.selected';
    $(star).on('click', function () {
        $(selected).each(function () {
            $(this).removeClass('selected')
        });
        $(this).addClass('selected')
    })
});
$(function () {
    var star = '.star2',
        selected = '.selected';
    $(star).on('click', function () {
        $(selected).each(function () {
            $(this).removeClass('selected')
        });
        $(this).addClass('selected')
    })
});
var iconCommentS = document.querySelectorAll('.icon__heart-comment');
var numberHeartS = document.querySelectorAll('.number__heart__comment');
var checkNumberHeartS = !1;
iconCommentS.forEach((icon, index) => {
    icon.onclick = function () {
        number = 0;
        var numberHeart = numberHeartS[index];
        number++;
        if (number === 1) {
            numberHeart.innerText = parseInt(numberHeart.innerText) + number
        }
        document.querySelector('.icon__heart-comment.active').classList.remove('active');
        this.classList.add('active')
    }
})