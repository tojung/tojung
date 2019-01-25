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

        $('.main-notice').each(function(){
            const notice_id = this.id // ex, notice-1
            if(!notice_id) return
            if(!is_notice_read(notice_id.replace("notice-", ""))){
                let notice = $('#'+notice_id)
                // notice를 읽지않은 경우 실행
                notice.show("fast")
                notice.css('display', 'flex')
            }
        });

        $(document).ready(function(){
            $('.cover').unwrap();
            $('.cover_img').get(0).play();
            $('.cover_img').get(1).play();
            $('.cover_img').get(2).play();
            initHomeIndex();
        });
    });
}).call(this);

function noticeHide(id){
    $('#notice-'+id.toString()).hide();
    SetCookie("notice-read"+id.toString(), "1", "300");
}


function expand(){
    $(document).ready(function(){
        $('.solution').toggleClass('open');
        if($('.solution').hasClass('open')){
            $('#expandBtn').html("접기");
        }
        else{
            $('#expandBtn').html("펼쳐 보기");
        }
    });
}

function GetCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return false;
}

function SetCookie (name, value, exdays) {
    let d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    let expires = "expires=" + d.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

function DeleteCookie (name) {
    var exp = new Date();
    exp.setTime (exp.getTime() - 1);
    var cval = GetCookie (name);
    document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}

function is_notice_read(id) {
    // console.log("id" + id)
    if (GetCookie('notice-read'+id.toString()) === '1') {
        //show popup here
        return true
    }
    return false
}
