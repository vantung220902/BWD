AOS.init({
    offset: 400,
    delay: 0,
    duration: 1000
});
var scrollBtn = document.querySelector('.scroll-top');
var header = document.querySelector('.header');
window.onscroll = function () {
        scrollFunction()
    },
    function () {
        bellFunction()
    };

function scrollFunction() {
    if (document.body.scrollTop > 1200 || document.documentElement.scrollTop > 1200) {
        scrollBtn.style.opacity = "1";
        scrollBtn.style.visibility = "visible"
    } else {
        scrollBtn.style.opacity = "0";
        scrollBtn.style.visibility = "hidden"
    }
 
    if (document.body.scrollTop > 180 || document.documentElement.scrollTop > 180) {
        header.style.height = '62px'
    } else {
        header.style.height = '66px'
    }
}
scrollBtn.onclick = function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0
}
var containerFilter = document.querySelector('.container__filter');
var containerBody = document.querySelector('.container-body');
var filterIcon = document.getElementById('orientation-filter-icon');
var orientationHeading = document.querySelector('.orientation-heading');
var count = 1;
var orientTationFilter = document.querySelector('.orientation-filter');
var containerFiler = document.querySelector('.container__filter');
var iconFilter = document.getElementById('orientation-filter-icon');
var countFilter = 1;

function ContainerFilter() {
    if (window.matchMedia("(max-width: 1023px)").matches) {
        countFilter++;
        if (countFilter % 2 === 0) {
            containerFiler.style.display = 'block';
            iconFilter.style.transform = 'rotatez(-180deg)'
        } else {
            containerFilter.style.display = 'none';
            iconFilter.style.transform = 'rotatez(0deg)'
        }
    }
}
orientTationFilter.addEventListener('click', ContainerFilter);
var cateNewsForm = document.querySelector('.CategoryNewsEditor__form');
var countctNews = 0;

function displayCTNews() {
    countctNews++;
    if (countctNews % 2 !== 0) {
        cateNewsForm.style.display = 'flex'
    } else {
        cateNewsForm.style.display = 'none'
    }
}
var activeI = document.querySelectorAll('.i__current-page');
activeI.forEach(function (indexCurrent) {
    indexCurrent.onclick = function () {
        document.querySelector('.i__current-page.i__current-page-active').classList.remove('i__current-page-active');
        this.classList.add('i__current-page-active')
    }
});
var iconMessager = document.querySelector('.icon__messager');

