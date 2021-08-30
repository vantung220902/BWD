var headerMobileIcon = document.querySelector('.header__search-menu-mobile-link');
var headerCategoryMobile = document.querySelector('.header__category-mobile');
var headerProduct = document.querySelector('.header__nav-link-mobile');
var headerProdudctItem = document.querySelector('.header__product-mobile');
var headerNavLink = document.querySelector('.header__nav-link::after');
var headerColection = document.querySelector('.home__nav-item-collection');
var headerColectionItem = document.querySelector('.header__collection-mobile');
var headerColection = document.querySelector('.home__nav-item-collection');
var headerTheNewsItem = document.querySelector('.header__nav-the-news-mobile');
var headerUniform = document.querySelector('.header__nav-uniform-mobile');
var headerBloglist = document.querySelector('.header__nav-blog-list-mobile');
var countHeader = 1;
var countProduct = 1;
var countColection = 1;
var countTheNews = 1;
var countUniform = 1;


function headerUniformChange() {
    countUniform++;
    if (countUniform % 2 === 0) {
        headerUniform.style.top = '176%';
        headerUniform.style.opacity = '1';
        headerUniform.style.visibility = 'visible'
    } else {
        headerUniform.style.top = '600%';
        headerUniform.style.opacity = '0';
        headerUniform.style.visibility = 'hidden'
    }
}

function headerTheNewsChange() {
    countTheNews++;
    if (countTheNews % 2 === 0) {
        headerTheNewsItem.style.top = '176%';
        headerTheNewsItem.style.opacity = '1';
        headerTheNewsItem.style.visibility = 'visible'
    } else {
        headerTheNewsItem.style.top = '600%';
        headerTheNewsItem.style.opacity = '0';
        headerTheNewsItem.style.visibility = 'hidden'
    }
}

function headerColectionChange() {
    countColection++;
    if (countColection % 2 === 0) {
        headerColectionItem.style.top = '176%';
        headerColectionItem.style.opacity = '1';
        headerColectionItem.style.visibility = 'visible'
    } else {
        headerColectionItem.style.top = '600%';
        headerColectionItem.style.opacity = '0';
        headerColectionItem.style.visibility = 'hidden'
    }
}

function HeaderProductChange() {
    countProduct++;
    if (countProduct % 2 === 0) {
        headerProdudctItem.style.top = '176%';
        headerProdudctItem.style.opacity = '1';
        headerProdudctItem.style.visibility = 'visible'
    } else {
        headerProdudctItem.style.top = '600%';
        headerProdudctItem.style.opacity = '0';
        headerProdudctItem.style.visibility = 'hidden'
    }
}
var ctMobile = document.querySelector('.home__nav-bar-mobile-item-cate');
headerProduct.addEventListener('click', HeaderProductChange);

function mobileHeader() {
    countHeader++;
    if (countHeader % 2 === 0) {
        headerCategoryMobile.style.top = '0';
        headerCategoryMobile.style.visibility = 'visible';
        headerCategoryMobile.style.opacity = '1'
    } else {
        headerCategoryMobile.style.top = '60%';
        headerCategoryMobile.style.visibility = 'hidden';
        headerCategoryMobile.style.opacity = '0'
    }
}
headerMobileIcon.addEventListener('click', mobileHeader);
ctMobile.addEventListener('click', mobileHeader);
var headerDetai = document.querySelector('.header__product-deatil');
var colectionDetai = document.querySelector('.header__product-colection');
var thenewDetail = document.querySelector('.header__product-thenews');
var uniformDetail = document.querySelector('.header__product-uniform');
var blogDetail = document.querySelector('.header__product-Blog');
var headerCategorymin = document.querySelector('.header__category-mobile-min');
var headerCategoryBack = document.querySelectorAll('.header__product-deatil-heading');

function HeaderProductDetai() {
    headerCategorymin.style.display = 'none';
    headerDetai.style.display = 'block'
}

function HeaderColectionDetai() {
    headerCategorymin.style.display = 'none';
    colectionDetai.style.display = 'block'
}

function HeaderTheNewsDetai() {
    headerCategorymin.style.display = 'none';
    thenewDetail.style.display = 'block'
}

function HeaderUniformDetai() {
    headerCategorymin.style.display = 'none';
    uniformDetail.style.display = 'block'
}



function HeaderBalck() {
    headerDetai.style.display = 'none';
    colectionDetai.style.display = 'none';
    thenewDetail.style.display = 'none';
    uniformDetail.style.display = 'none';
    blogDetail.style.display = 'none';
    headerCategorymin.style.display = 'block'
}
var countIconHeader = 1;
var IconMobleMenu = document.getElementById('header__search-menu-mobile-link-icon');
var IconMobileClose = document.getElementById('header__search-menu-mobile-link-icon-close');

function HeaderIconMobile() {
    countIconHeader++;
    if (countIconHeader % 2 === 0) {
        IconMobleMenu.style.display = 'none';
        IconMobileClose.style.display = 'block'
    } else {
        IconMobleMenu.style.display = 'block';
        IconMobileClose.style.display = 'none'
    }
}
headerMobileIcon.addEventListener('click', HeaderIconMobile);
ctMobile.addEventListener('click', HeaderIconMobile);
var headerCart = document.querySelector('.header__cart-wrap.header__cart-body-item');
var headerCartList = document.querySelector('.header__cart-list');
var countCart = 1;

function Cart() {
    countCart++;
    if (countCart % 2 === 0) {
        headerCartList.style.display = 'block'
    } else {
        headerCartList.style.display = 'none'
    }
}
headerCart.addEventListener('click', Cart);
var headerIconCart = document.querySelector('.header__introduct-item.header__nav-acc header__cart-body-item');
var headerIconCartList = document.querySelector('.header__introduct-acc-list');
var countIconCart = 1;

function IconCart() {
    countIconCart++;
    if (countIconCart % 2 === 0) {
        headerIconCartList.style.visibility = 'visible';
        headerIconCartList.style.top = 'calc(100% + 14px)';
        headerIconCartList.style.opacity = '1'
    } else {
        headerIconCartList.style.visibility = 'hidden';
        headerIconCartList.style.top = '300%';
        headerIconCartList.style.opacity = '0'
    }
}
const aiVoice = document.querySelector(".icon__ai-voice");
window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const recognition = new window.SpeechRecognition();
recognition.lang = "en-US";
recognition.interimResults = !0;
let p = document.createElement("p");
recognition.addEventListener("result", (e) => {
    const text = Array.from(e.results).map((result) => result[0]).map((result) => result.transcript).join("");
    p.innerText = text;
    aiVoice.appendChild(p);
    if (e.results[0].isFinal) {
        if (text.includes("Đầm") || text.includes("đầm") || text.includes("váy") || text.includes("Váy") || text.includes("Dress") || text.includes("dress") || text.includes("Bag") || text.includes("bag")) {
            window.open("http://localhost:8080/DoAn2/ProductServlet?action=SearchProductCT&id=4")
        }
        if (text.includes("Little") || text.includes("Phụ Kiện") || text.includes("phụ kiện") || text.includes("Khăn") || text.includes("little") || text.includes("accessories")) {
            window.open("http://localhost:8080/DoAn2/ProductServlet?action=SearchProductCT&id=1")
        }
        if (text.includes("The News") || text.includes("the news") || text.includes("Tin tức thời trang") || text.includes("tin tức thời trang") || text.includes("Tin Tức Thời Trang") || text.includes("tin tức")) {
            window.open("http://localhost:8080/DoAn2/NewServlet?action=getByAllCate&idnews=1")
        }
        if (text.includes("end") || text.includes("End")) {
            recognition.abort();
            retrun
        }
    };
    setInterval(function () {
        while (aiVoice.hasChildNodes()) {
            aiVoice.removeChild(aiVoice.firstChild)
        }
    }, 3000)
});
recognition.addEventListener("end", () => {
    setTimeout(function () {
        recognition.abort()
    }, 10000)
});
aiVoice.onclick = function () {
    recognition.start()
};
var chekFormMobileSearch = 1;

function viewsFormSearchMobile() {
    chekFormMobileSearch++;
    if (chekFormMobileSearch % 2 === 0) {
        document.querySelector(".header__cart-body-item-mobile").style.display = "flex"
    } else {
        document.querySelector(".header__cart-body-item-mobile").style.display = "none"
    }
}
var EN = document.querySelectorAll('.EN');
var VI = document.querySelectorAll('.VI');
var countLg = 0;

function trans() {
    countLg++;
    if (countLg % 2 !== 0) {
        EN.forEach(function (E) {
            E.style.display = 'none'
        });
        VI.forEach(function (v) {
            v.style.display = 'block'
        })
    } else {
        EN.forEach(function (E) {
            E.style.display = 'block'
        });
        VI.forEach(function (v) {
            v.style.display = 'none'
        })
    }
}