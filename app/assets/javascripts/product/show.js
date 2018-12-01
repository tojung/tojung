/* PRODUCT/_PRODUCT_INFO */
function packageDropdown(item, product_id){
    $(document).ready(function () {

        var x = $(item).html();
        $('#packageButton').html(x);
        $('#packageContainer').html(x);
        $('#packageContainer').addClass('package-box2 my-3');
        $('#packageContainer > .package-info').removeClass('d-flex');
        $('#packageContainer > .package-info > .package-info-1 > .package-name').unwrap();
        $('#packageContainer > .package-item').removeClass('hide').addClass('show');
        var pid = $("#packageButton").children()[0].id;
        $('#pay-link-lg').attr("href","/product_order/new?product_id="+ product_id.toString() +"&package_id="+pid);
    });
}

// '패키지를 선택하세요' alert
function packageSelected(){
    $(document).ready(function(){
        var ment = $('#packageButton > .package-info > span').html();
        if( ment == "패키지 선택하기"){
            alert('패키지를 선택해주세요');
        }
    });
}

/* PRODUCT/_BOTTOM_BAR */
// PACKAGE 클릭 이벤트
function packagebar_click(){
    $(document).ready(function () {
        $('.overlay2').on('click', function () {
            // hide sidebar
            $('#packageBar').removeClass("open");
            $('#packageBarCollapse').removeClass("font-weight-bold");
            $('.pay-link').removeAttr("href");
            // hide overlay
            $('.overlay2').removeClass('active');
        });
        // open sidebar
        $('#packageBar').addClass("open");
        $('#packageBarCollapse').addClass("font-weight-bold");
        // fade in the overlay
        $('.overlay2').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
}

function sharebar_click(){
    $(document).ready(function () {
        $('.overlay2').on('click', function () {
            // hide sidebar
            $('#shareBar').removeClass("open");
            // hide overlay
            $('.overlay2').removeClass('active');
        });
        // open sidebar
        $('#shareBar').addClass("open");
        // fade in the overlay
        $('.overlay2').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
}

/* PRODUCT/_PACKAGE */
function doBlink(){
    $('.pay-link').toggleClass("hidden0");
}


/* PRODUCT/_SHARE */
function createlink(product_name, product_subname, image_url, web_url){
    console.log(product_name)
    console.log(product_subname)
    console.log(image_url)
    console.log(web_url)
    Kakao.Link.sendDefault({
        // container: '#kakao-link-btn',
        objectType: 'feed',
        content: {
            title: "투정, "+product_name,
            description: product_subname,
            imageUrl: image_url,
            link: {
                mobileWebUrl: 'https://developers.kakao.com',
                webUrl: 'https://developers.kakao.com'
            }
        },
        buttons: [
            {
                title: '웹으로 보기',
                link: {
                    mobileWebUrl: web_url,
                    webUrl: web_url
                }
            }
        ]
    });
    console.log("SUCC");
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
}

/* PRODUCT/_TIMELINE */
function cardHeight() {
    $(document).ready(function () {
        var x = $('.maker_card').width();
        $('.maker_card').css({'height':(x*1.35)+'px'});
    });
}

(function() {
    $(document).on('turbolinks:load', function() {
        if (!(page.controller() === 'product' && page.action() === 'show')) {
            return;
        }

        $(document).ready(function(){

            // _product_info
            var x = $('#dropdownShare').width();
            $('#shareDropdown').width(x);
            money = $('.funding-money').html();
            if (money !== "0원"){
                money = money.substring(0,money.length-1)
                money = Number(money);
                money = money.toLocaleString();
                money = money+"원";
                $('.funding-money').html(money);
            }
            // _bottom_bar
            $('.bottom-bar').unwrap();
            $('.overlay2').unwrap();

            // _description
            $('.caro-cards').slick({
                arrows: false,
                dots: true,
                dotsClass: 'd-flex cards-dot justify-content-center pl-0',
                infinite: true,
                speed: 300,
                fade: true,
                cssEase: 'linear'
            });

            // _package
            $('.package-row').not('.slick-initialized').slick({
                infinite: false,
                speed: 300,
                slidesToShow: 8,
                slidesToScroll: 1,
                focusOnSelect: true,
                arrows: false,
                responsive: [
                    {
                        breakpoint: 768,
                        settings: {
                            arrows: false,
                            slidesToShow: 5
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            arrows: false,
                            slidesToShow: 4
                        }
                    },
                    {
                        breakpoint: 330,
                        settings: {
                            arrows: false,
                            slidesToShow: 3
                        }
                    }
                ]
            });

            $('.package-img').click(function(){
                if ($(this).hasClass("border-red")){
                    $(this).removeClass("border-red");
                }
                else{
                    for(let i=0;i<$('.package-img').length;i++){
                        $('.package-img').removeClass('border-red');
                    }
                    $(this).addClass("border-red");
                }
                var pid = $('.border-red')[0].id;
                var url = window.location.href;
                var product_id = url.substr(url.indexOf('product/') + 8);
                $('.pay-link').attr("href","/product_order/new?product_id=" + product_id + "&package_id="+pid);

                // 패키지 버튼 깜빡깜빡
                var count = 0;
                var refresh = setInterval(function(){
                    ++count;
                    doBlink();
                    if(count>=4){
                        clearInterval(refresh);
                    }
                }, 300);
            });

            // _package
            for(var i=0;i<$('.product-money').length;i++){
                money2 = $('.product-money')[i];
                money= $(money2).html();
                if (money !== "0원"){
                    money = money.substring(0,money.length-1)
                    money = Number(money);
                    money = money.toLocaleString();
                    money = money+"원";
                    $(money2).html(money);
                }
            }

            // _share
            try{
                Kakao.init('d88e4ac3d481a3491b72e73fcb0ae1fc');
            }catch (e) {
                console.log('kakao init ok')
            }
        });
    });
}).call(this);