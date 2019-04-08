// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_self
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require serviceworker-companion
//= require vapid.js.erb

// /* HOME/INDEX */
// function initHomeIndex() {
//     $(document).ready(() => {
//         markCommas();
//
//         slick_index();
//         if (window.matchMedia("screen and (max-width: 576px)").matches) {
//             cardBodyShow();
//             $('.center').on('swipe', function(event, slick, direction){
//                 cardBodyShow();
//             });
//         }
//     });
//
//     // window 사이즈가 줄어들었을 때 CardBodyShow 작동
//     $(window).resize(function(){
//         if (window.matchMedia("screen and (max-width: 576px)").matches) {
//             cardBodyShow();
//             $('.center').on('swipe', function(event, slick, direction){
//                 cardBodyShow();
//             });
//         }
//     });
//
//     // window 사이즈가 늘어났을 때 CardBodyShow 작동
//     $(window).resize(function(){
//         if (window.matchMedia("screen and (min-width: 768px)").matches){
//             $('.card-body').css('display','block');
//             $('.center').on('swipe', function(event, slick, direction){
//                 $('.card-body').css('display','block');
//             });
//         }
//     });
// }
//
// // _thumb
// // _newcard
// function slick_index() {
//     $('.center').not('.slick-initialized').slick({
//         arrows: false,
//         centerPadding: '10px',
//         slidesToShow: 3,
//         slidesToScroll: 1,
//         variableWidth: true,
//         touchMove: true,
//         draggable: true,
//         responsive: [
//             {
//                 breakpoint: 768,
//                 settings: {
//                     arrows: false,
//                     centerMode: true,
//                     centerPadding: '40px',
//                     slidesToShow: 2,
//                     slidesToScroll: 1
//                 }
//             },
//             {
//                 breakpoint: 480,
//                 settings: {
//                     arrows: false,
//                     centerMode: true,
//                     centerPadding: '40px',
//                     slidesToShow: 1,
//                     slidesToScroll: 1
//                 }
//             }
//         ]
//     })
// }
//
// // _newcard
// // _thumb
// function cardBodyShow(){
//     // 모바일로 접근시에 CardBodyShow 작동
//     $('.card-body').css('display','none');
//     var cardMent = $('.card').filter('.slick-active').children().children();
//     cardMent = cardMent[1];
//     $(cardMent).css('display','block');
// }
//
// // _newcard
// // _thumb
// function markCommas() {
//     var funding_money = $('.funding-money');
//     var money;
//     var putMoney;
//
//     for (let i = 0; i < funding_money.length; i++) {
//         putMoney = funding_money[i];
//         money = funding_money[i];
//         money = $(money).html();
//
//         if (money === "0원") {
//             continue;
//         }
//
//         money = money.replace('원', '');
//         money = money.split(',').join('');
//
//         money = money.substring(0, money.length);
//         money = Number(money);
//         money = money.toLocaleString();
//         money = money + "원";
//         console.log(money);
//         $(putMoney).html(money);
//     }
// }
//
// // _thumb
// function cate_change(item){
//     $(document).ready(function () {
//         $('.category-keyword').filter('.cate-red').removeClass("cate-red");
//         $(item).addClass("cate-red");
//         var x = $(item).html();
//         $('#category-tag').html(x);
//     });
// }

/* PAYMENT MODULES */
function sidebar_click(){
$(document).ready(function () {
  $('#dismiss, #dismiss-button, .overlay, #exit-button').on('click', function () {
      // hide sidebar
      $('#sidebar').css("margin-right","-300px");
      // hide overlay
      $('.overlay').removeClass('active');
  });

    // open sidebar
    $('#sidebar').css("margin-right","0px");
    // fade in the overlay
    $('.overlay').addClass('active');
    $('.collapse.in').toggleClass('in');
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
});
}

function pay_new_test() {
    $(document).ready(function () {
        var IMP = window.IMP;
        IMP.init('imp03714372');
        let my_form = $('form');
        IMP.request_pay({
            pg: 'danal_tpay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명_' + new Date().getTime(),
            amount: $('input[name=total_price]').val(),
            buyer_email: $('input[name=email]').val(),
            buyer_name: $('input[name=name]').val(),
            buyer_tel: $('input[name=phone_num]').val(),
            buyer_addr: $('input[name=address_text]').val(),
            buyer_postcode: $('input[name=address_num]').val()
        }, function (rsp) {
            // if (rsp.success) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payment", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid: rsp.imp_uid,
                        amount: $('input[name=total_price]').val()
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function (data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    // data.status === 'true'
                    if ( data.status === 'true' ) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);

                        $('input[name=payment_method]').attr('value', '카드결제완료');
                        $('input[name=status]').attr('value', '결제완료');
                        $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                        my_form.submit();
                        // window.location.href = '/product_order'
                    } else {
                        alert("Fail!");
                        alert(data);
                        $('input[name=payment_method]').attr('value','카드결제실패');
                        $('input[name=status]').attr('value', '결제실패');
                        $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                        my_form.submit();
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                   }
                });
        });

    });
}

function pay_trans() {
    $(document).ready(function () {
        var IMP = window.IMP;
        IMP.init('imp03714372');
        let my_form = $('form');
        IMP.request_pay({
            pg: 'danal_tpay',
            pay_method: 'trans',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명_' + new Date().getTime(),
            amount: $('input[name=total_price]').val(),
            buyer_email: $('input[name=email]').val(),
            buyer_name: $('input[name=name]').val(),
            buyer_tel: $('input[name=phone_num]').val(),
            buyer_addr: $('input[name=address_text]').val(),
            buyer_postcode: $('input[name=address_num]').val()
        }, function (rsp) {
            // if (rsp.success) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payment", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid: rsp.imp_uid,
                    amount: $('input[name=total_price]').val()
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function (data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                // data.status === 'true'
                if ( data.status === 'true' ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;

                    alert(msg);

                    $('input[name=payment_method]').attr('value', '계좌이체결제완료');
                    $('input[name=status]').attr('value', '결제완료');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    my_form.submit();
                    // window.location.href = '/product_order'
                } else {
                    $('input[name=payment_method]').attr('value','계좌이체결제실패');
                    $('input[name=status]').attr('value', '계좌이체결제실패');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    my_form.submit();
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
        });
    });
}

function pay_phone(){
    $(document).ready(function () {
        var IMP = window.IMP;
        IMP.init('imp03714372');
        let my_form = $('form');
        IMP.request_pay({
            pg: 'danal',
            pay_method: 'phone',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명_' + new Date().getTime(),
            amount: $('input[name=total_price]').val(),
            buyer_email: $('input[name=email]').val(),
            buyer_name: $('input[name=name]').val(),
            buyer_tel: $('input[name=phone_num]').val(),
            buyer_addr: $('input[name=address_text]').val(),
            buyer_postcode: $('input[name=address_num]').val()
        }, function (rsp) {
            // if (rsp.success) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payment", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid: rsp.imp_uid,
                    amount: $('input[name=total_price]').val()
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function (data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                // data.status === 'true'
                if ( data.status === 'true' ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;

                    alert(msg);

                    $('input[name=payment_method]').attr('value', '폰결제완료');
                    $('input[name=status]').attr('value', '결제완료');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    my_form.submit();
                    // window.location.href = '/product_order'
                } else {
                    $('input[name=payment_method]').attr('value','폰결제실패');
                    $('input[name=status]').attr('value', '폰결제실패');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    my_form.submit();
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });

        });

    });
}