/* HOME/INDEX */
function initHomeIndex() {
    $(document).ready(() => {
        markCommas();
        slick_index();
        if (window.matchMedia("screen and (max-width: 576px)").matches) {
          cardBodyShow();
          $('.center').on('swipe', function(event, slick, direction){
              cardBodyShow();
          });
      }
})

    // window 사이즈가 줄어들었을 때 CardBodyShow 작동
    $(window).resize(function(){
        if (window.matchMedia("screen and (max-width: 576px)").matches) {
            cardBodyShow();
            $('.center').on('swipe', function(event, slick, direction){
                cardBodyShow();
            });
        }
    });

    // window 사이즈가 늘어났을 때 CardBodyShow 작동
    $(window).resize(function(){
        if (window.matchMedia("screen and (min-width: 768px)").matches){
            $('.card-body').css('display','block');
            $('.center').on('swipe', function(event, slick, direction){
                $('.card-body').css('display','block');
            });
        }
    });
}

// _thumb
// _newcard
function slick_index() {
    $('.center').not('.slick-initialized').slick({
        arrows: false,
        centerPadding: '10px',
        slidesToShow: 3,
        slidesToScroll: 1,
        variableWidth: true,
        touchMove: true,
        draggable: true,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '40px',
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    centerMode: true,
                    centerPadding: '40px',
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    })
}

// _newcard
// _thumb
function cardBodyShow(){
    // 모바일로 접근시에 CardBodyShow 작동
    $('.card-body').css('display','none');
    var cardMent = $('.card').filter('.slick-active').children().children();
    cardMent = cardMent[1];
    $(cardMent).css('display','block');
}

// _newcard
// _thumb
function markCommas() {
    var funding_money = $('.funding-money');
    var money;
    var putMoney;

    for (let i = 0; i < funding_money.length; i++) {
        putMoney = funding_money[i];
        money = funding_money[i];
        money = $(money).html();

        if (money === "0원") {
            continue;
        }

        money = money.replace('원', '');
        money = money.split(',').join('');

        money = money.substring(0, money.length);
        money = Number(money);
        money = money.toLocaleString();
        money = money + "원";
        console.log(money);
        $(putMoney).html(money);
    }
}

// _thumb
function cate_change(item){
    $(document).ready(function () {
        $('.category-keyword').filter('.cate-red').removeClass("cate-red");
        $(item).addClass("cate-red");
        var x = $(item).html();
        $('#category-tag').html(x);
    });
}
function category_func(category_list_num) {
    $('.category-keyword').filter('.cate-red').removeClass("cate-red");
    for(let i=0;i<$('.category-keyword').length;i++){
        if($('.category-keyword')[i].innerHTML === category_list_num){
            var target = $('.category-keyword')[i];
            var keyword = category_list_num;
            $(target).addClass("cate-red");
            $('#category-tag').html(keyword);
        }
    }
    // Scroll To category list
    $('html, body').animate({
        scrollTop: $('#categoryList').offset().top-100
    }, 'slow');
}
(function() {
    $(document).on('turbolinks:load', function() {
        if (!(page.controller() === 'home' && page.action() === 'index')) {
            return;
        }

        // alert("Welcome Index!");
        console.log("Welcome Home Index!")
        $(document).ready(function(){
            $('.cover').unwrap();
            $('.cover_img').get(0).play();
            $('.cover_img').get(1).play();
            $('.cover_img').get(2).play();
//            if($('.category_flag')){
//                console.log($('.category_flag').innerHTML)
//            }
            initHomeIndex();
        });
    });
}).call(this);

function noticeHide(){
    $('.main-notice').hide();
}