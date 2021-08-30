var navItems = document.querySelectorAll(".header__navbar-item");
for (let navItem of navItems) {
    navItem.onclick = function () {
        var activeNav = document.querySelector(".header__navbar-item--active");
        activeNav.classList.remove("header__nav-item--active");
        this.classList.add("header__navbar-item--active");
    };
}
$('.subnav-slider-owl.owl-carousel').owlCarousel({
    loop: !1,
    rewind: !0,
    items: 5,
    margin: 0,
    dots: !0,
    nav: !1,
    responsive: {
        0: {
            items: 3
        },
        600: {
            items: 5
        },
        1000: {
            items: 5
        }
    }
});
$('.main-slider-owl').owlCarousel({
    loop: !0,
    rewind: !0,
    items: 3,
    singleItem: !0,
    margin: 10,
    navSpeed: 1000,
    nav: !0,
    responsive: !0,
    navText: ['<i class="ti-arrow-circle-left"></i>', '<i class="ti-arrow-circle-right"></i>'],
    responsive: {
        0: {
            items: 1,
            nav: !0
        },
        600: {
            items: 1,
            nav: !0
        },
        1000: {
            items: 1,
            nav: !0,
            loop: !1
        }
    }
});
var navPrev = document.querySelector('.main-slider-owl .owl-prev');
var navNext = document.querySelector('.main-slider-owl .owl-next');
var mainSlider = document.querySelector('.main-slider');
var bannner = document.querySelector('.banner');
mainSlider.onmouseover = function () {
    Object.assign(navPrev.style, {
        opacity: "1",
        visibility: "visible",
        left: "36%"
    });
    Object.assign(navNext.style, {
        opacity: "1",
        visibility: "visible",
        right: "36%"
    });
};
mainSlider.onmouseout = function () {
    Object.assign(navPrev.style, {
        opacity: "0",
        visibility: "hidden",
        left: "38%"
    });
    Object.assign(navNext.style, {
        opacity: "0",
        visibility: "visible",
        right: "38%"
    });
};

var header__introduct__srcolll = document.querySelector('.header__introduct');
var header__srcoll = document.querySelector('.header');
var header__navlink = document.querySelectorAll('.header__nav-link');
var header__Logo = document.querySelector('.header__nav-logo-link');
var header__cartNotice = document.querySelector('.header__cart-notice');
function sliderShow() {
    const images = [];
    const time = 3000;
    bannner.style.transform = "translateY(0%)";
    bannner.style.opacity = '1';
    setTimeout('sliderShow()', time);
}
var iconMessager = document.querySelector('.icon__messager');
var iconMessagerMenu = document.querySelector('.on-Message__bell-header-more-item');
var iconMessagerAdd = document.querySelector('.on-Message__bell-header-more-add-item');
var countMesager = 1;
var countMessageMenu = 1;
var checkMesss = !0;

function viewMessageMenu() {
    countMessageMenu++;
    if (countMessageMenu % 2 === 0) {
        iconMessagerMenu.style.display = 'block';
    } else {
        iconMessagerMenu.style.display = 'none';
    }
}
var countMessageAdd = 1;

function viewMessageAdd() {
    countMessageAdd++;
    if (countMessageAdd % 2 === 0) {
        iconMessagerAdd.style.display = 'block';
    } else {
        iconMessagerAdd.style.display = 'none';
    }
}

window.onload = sliderShow;
var scrollBtn = document.querySelector('.scroll-top');
window.onscroll = function () {
    scrollFunction();
},
        function () {
            bellFunction();
        };

function scrollFunction() {
    if (document.body.scrollTop > 1200 || document.documentElement.scrollTop > 1200) {
        scrollBtn.style.opacity = "1";
        scrollBtn.style.visibility = "visible";
    } else {
        scrollBtn.style.opacity = "0";
        scrollBtn.style.visibility = "hidden";
    }

    if (document.body.scrollTop > 180 || document.documentElement.scrollTop > 180) {
        Object.assign(header__introduct__srcolll.style, {
            opacity: "0",
            display: "none"
        });
        Object.assign(header__srcoll.style, {
            background: "rgb(22,22,22)",
            height: "66px"
        });
        header__Logo.style.fontSize = "28px";
        for (var i = 0; i < header__navlink.length; i++) {
            if (i === 0) {
            } else {
                header__navlink[i].style.color = 'rgba(250, 250, 250, 1)';
            }
            header__navlink[i].style.fontSize = '15px';
        }
        Object.assign(header__cartNotice.style, {
            background: '#fff',
            color: "#80bfff"
        });
    } else {
        Object.assign(header__introduct__srcolll.style, {
            opacity: "1",
            display: "flex"
        });
        header__srcoll.style.background = " linear-gradient(to bottom,#24211e 0,rgba(37,33,30,0) 100%)";
        header__Logo.style.fontSize = "24px";
        for (var i = 0; i < header__navlink.length; i++) {
            if (i === 0) {
            } else {
                header__navlink[i].style.color = 'rgba(250, 250, 250, 0.8)';
            }
            header__navlink[i].style.fontSize = '14px';
        }
        Object.assign(header__cartNotice.style, {
            background: '#000',
            color: "#FFC229"
        });
    }
}
scrollBtn.onclick = function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
};
var bannerLable = document.querySelector('.banner__special-text label');
var bannerNumber = document.querySelector('.banner__special-number');
var bannerPresent = document.querySelector('.banner__special-number ~ span');
var bannerLink = document.querySelector('.banner__special-text > a');

function flashingLights() {
    if (window.matchMedia("(min-width:740px) and (max-width: 1024px)").matches) {
        var randowm = Boolean(Math.round(Math.random()));
        if (randowm === !0) {
            bannerLable.style.left = '28%';
            bannerNumber.style.color = '#80bfff';
            bannerPresent.style.color = '#80bfff';
            Object.assign(bannerLink.style, {
                right: '3%',
                color: 'var(--white-color)',
                background: '#80bfff'
            });
        } else {
            bannerLable.style.left = '20';
            bannerNumber.style.color = '#ffce3e';
            bannerPresent.style.color = '#ffce3e';
            Object.assign(bannerLink.style, {
                right: '10%',
                color: 'var(--black-color)',
                background: '#fff'
            });
        }
    }
}
setInterval(flashingLights, 2000);
var countBannerSlider = 1;
var bannnerSliderMobile = document.querySelector('.bannner-slider-mobile');

function bannerSlider() {
    if (window.matchMedia("(min-width:740px) and (max-width:1023px)").matches) {
        countBannerSlider++;
        if (countBannerSlider % 2 === 0) {
            bannerLable.style.left = '28%';
            bannerNumber.style.color = '#80bfff';
            bannerPresent.style.color = '#80bfff';
            Object.assign(bannerLink.style, {
                right: '3%',
                color: 'var(--white-color)',
                background: '#80bfff'
            });
        } else {
            bannerLable.style.left = '20%';
            bannerNumber.style.color = '#ffce3e';
            bannerPresent.style.color = '#ffce3e';
            Object.assign(bannerLink.style, {
                right: '10%',
                color: 'var(--black-color)',
                background: '#fff'
            });
        }
    }
}
bannnerSliderMobile.addEventListener('click', bannerSlider);
var countBannerSliderMobile = 1;

function bannerSliderMobile() {
    countBannerSliderMobile++;
    if (window.matchMedia("(max-width:740px)").matches) {
        if (countBannerSliderMobile % 2 === 0) {
            bannerLable.style.left = '23%';
            bannerLable.style.color = '#ffce3e';
            bannerNumber.style.color = '#80bfff';
            bannerPresent.style.color = '#80bfff';
            Object.assign(bannerLink.style, {
                right: '2%',
                color: '#ffce3e',
                background: '#80bfff'
            });
        } else {
            bannerLable.style.left = '15%';
            bannerLable.style.color = '#80bfff';
            bannerNumber.style.color = '#ffce3e';
            bannerPresent.style.color = '#ffce3e';
            Object.assign(bannerLink.style, {
                right: '6%',
                color: 'var(--black-color)',
                background: '#fff'
            });
        }
    }
}
bannnerSliderMobile.addEventListener('click', bannerSliderMobile);
var FormCatePlus = document.querySelector('.header__search-menu-item_form-add');
var countCate = 1;

function DispalyCatePlus() {
    countCate++;
    if (countCate % 2 === 0) {
        FormCatePlus.style.display = 'block';
    } else {
        FormCatePlus.style.display = 'none';
    }
}
;

function animateValue(obj, start, end, duration) {
    let startTimestamp = null;
    const step = (timestamp) => {
        if (!startTimestamp)
            startTimestamp = timestamp;
        const progress = Math.min((timestamp - startTimestamp) / duration, 1);
        obj.innerHTML = Math.floor(progress * (end - start) + start);
        if (progress < 1) {
            window.requestAnimationFrame(step);
        }
    };
    window.requestAnimationFrame(step);
}
const obj = document.getElementById("NumberSale");
setTimeout(animateValue(obj, 0, 90, 5000), 5000);
var chekFormMobileSearch = 1;

function viewsFormSearchMobile() {
    chekFormMobileSearch++;
    if (chekFormMobileSearch % 2 === 0) {
        document.querySelector(".header__cart-body-item-mobile").style.display = "flex";
    } else {
        document.querySelector(".header__cart-body-item-mobile").style.display = "none";
    }
}
$(window).on('load', function (event) {
    $('body').removeClass('preloading');
    $('.loader').delay(1000).fadeOut('fast');
});

var EN = document.querySelectorAll('.EN');
var VI = document.querySelectorAll('.VI');
var countLg = 0;

function trans() {
    countLg++;
    if (countLg % 2 !== 0) {
        EN.forEach(function (E) {
            E.style.display = 'none';
        });
        VI.forEach(function (v) {
            v.style.display = 'block';
        });
    } else {
        EN.forEach(function (E) {
            E.style.display = 'block';
        });
        VI.forEach(function (v) {
            v.style.display = 'none';
        });
    }
}