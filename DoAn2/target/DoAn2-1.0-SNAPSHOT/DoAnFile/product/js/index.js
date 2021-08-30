var filterIcon = document.querySelector('.header__nav-filter-category-item-link-img');
var FilterWrap = document.querySelector('.header__nav-filter-category-item-link');
var filterCheck = document.getElementById('filter__category-checkbox');
var filterCheckSpan = document.querySelector('.header__nav-filter-category-item-link-span');
var filterListSort = document.querySelector('.header__nav-filter-list-sort');
var filterListSortCheck = document.getElementById('filter-list-sort-checkbox');
var filterProduct = document.querySelector('.header__nav-filter-list-product');
var filterProductCheck = document.getElementById('filter-list-produc-checkbox');
var filterSizeCheck = document.getElementById('filter-list-size-checkbox');
var filteSize = document.querySelector('.header__nav-filter-list-size');
var filterCategory = document.querySelector('.filte__category');
var mainProductWrap = document.querySelector('.main-product-wrap');
var headerNavFilter = document.querySelector('.header__nav-filter-category-item-filter');
var header = document.querySelector('.header');

function changClass() {
    if (filterCheck.checked) {
        filterIcon.style.transform = 'rotatez(0deg)';
        Object.assign(filterCheckSpan.style, {
            color: '#333',
            borderRight: 'none',
            paddingRight: '0'
        });
        filterCategory.style.left = '-100%';
        filterCategory.style.display = 'none';
        filterCategory.style.opacity = '0';
        headerNavFilter.style.marginLeft = '0px';
        mainProductWrap.classList.add('l-12');
        mainProductWrap.classList.remove('l-9')
    } else {
        filterIcon.style.transform = 'rotatez(-180deg)';
        filterCheckSpan.style.color = '#ffce3e';
        filterCheckSpan.style.paddingRight = '279.9px';
        headerNavFilter.style.marginLeft = '-80px';
        filterCheckSpan.style.borderRight = '1px solid #dcdcdc';
        filterCategory.style.left = '0%';
        filterCategory.style.display = 'block';
        filterCategory.style.opacity = '1';
        mainProductWrap.classList.add('l-9');
        mainProductWrap.classList.remove('l-12')
    }
}
var countClassMobile = 1;

function ChangClassMobile() {
    if (window.matchMedia("(max-width: 1023px)").matches) {
        countClassMobile++;
        if (countClassMobile % 2 !== 0) {
            filterIcon.style.transform = 'rotatez(0deg)';
            filterCheckSpan.style.color = '#333';
            filterCheckSpan.style.borderRight = 'none';
            filterCategory.style.left = '-100%';
            filterCategory.style.opacity = '0'
        } else {
            filterIcon.style.transform = 'rotatez(-180deg)';
            filterCheckSpan.style.color = '#ffce3e';
            headerNavFilter.style.marginLeft = '0';
            filterCheckSpan.style.paddingRight = '0px';
            filterCheckSpan.style.borderRight = 'none';
            filterCategory.style.left = '0%';
            filterCategory.style.opacity = '1'
        }
    }
}
FilterWrap.addEventListener('click', changClass);
FilterWrap.addEventListener('click', ChangClassMobile);

function changWidth() {
    if (filterListSortCheck.checked) {
        filterListSort.style.visibility = 'visible';
        filterListSort.style.height = '116px';
        filterListSort.style.opacity = '1'
    } else {
        filterListSort.style.visibility = 'hidden';
        filterListSort.style.height = '0';
        filterListSort.style.opacity = '0'
    }
}

function changWidth2() {
    if (filterProductCheck.checked) {
        filterProduct.style.visibility = 'visible';
        filterProduct.style.opacity = '1';
        filterProduct.style.transform = 'translateY(0%)'
    } else {
        filterProduct.style.visibility = 'hidden';
        filterProduct.style.transform = 'translateY(60%)';
        filterProduct.style.opacity = '0'
    }
    if (filterSizeCheck.checked) {
        filteSize.style.visibility = 'visible';
        filteSize.style.opacity = '1';
        filteSize.style.transform = 'translateY(0%)'
    } else {
        filteSize.style.visibility = 'hidden';
        filteSize.style.transform = 'translateY(60%)';
        filteSize.style.opacity = '0'
    }
}
var FormCatePlus = document.querySelector('.header__search-menu-item_form-add');
var countCate = 1;

function DispalyCatePlus() {
    countCate++;
    if (countCate % 2 === 0) {
        FormCatePlus.style.display = 'block'
    } else {
        FormCatePlus.style.display = 'none'
    }
};
var iconMessager = document.querySelector('.icon__messager');

var scrollBtn = document.querySelector('.scroll-top');

window.onscroll = function () {
        scrollFunction()
    },
 

function scrollFunction() {
    if (document.body.scrollTop > 1200 || document.documentElement.scrollTop > 1200) {
        scrollBtn.style.opacity = "1";
        scrollBtn.style.visibility = "visible"
    } else {
        scrollBtn.style.opacity = "0";
        scrollBtn.style.visibility = "hidden"
    }
 
}
scrollBtn.onclick = function () {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0
};
let spinnerWrapper = document.querySelector('.spinner-wrapper');
window.addEventListener('load', function () {
    spinnerWrapper.parentElement.removeChild(spinnerWrapper)
});
var iCurrents = document.querySelectorAll('.i__current-page');
iCurrents.forEach((iCurrent) => {
    iCurrent.onclick = function () {
        document.querySelector('.i__current-page.i__current-page-active').classList.remove('i__current-page-active');
        this.classList.add('i__current-page-active')
    }
});
var handler = document.querySelector('.filter__category-item-range-body');
var wrapper = document.querySelector('.filter__category-item-range');
var boxA = wrapper.querySelector('.range-first');
var priceInput = document.querySelector('#filter__category-price-input');
wrapper.addEventListener('mousemove', function (e) {
    var widthWra = wrapper.offsetWidth;
    var containerOffsetLeft = wrapper.offsetLeft;
    var pointerRelativeXpos = e.clientX - containerOffsetLeft;
    var boxAminWidth = 0;
    var changeNode = (Math.max(boxAminWidth, pointerRelativeXpos - 8));
    boxA.style.left = changeNode + 'px';
    priceInput.value = Math.floor((((changeNode / widthWra) * 100) / 100) * 2000) + ".000"
})