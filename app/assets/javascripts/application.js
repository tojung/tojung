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
        console.log('pay new start');
        console.log($('input[name=total_price]').val())
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
            console.log(rsp);
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
                    console.log(data);
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
                        console.log(data);
                        alert("Fail!");
                        alert(data);
                        $('input[name=payment_method]').attr('value','카드결제실패');
                        $('input[name=status]').attr('value', '결제실패');
                        $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                        // my_form.submit();
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                   }
                });
            // } else {
            //     var msg = '결제에 실패하였습니다.';
            //     msg += '에러내용 : ' + rsp.error_msg;
            //
            //     alert(msg);
            // }
        });

    });
}
function pay_trans() {
    $(document).ready(function () {
        var IMP = window.IMP;
        IMP.init('imp03714372');
        console.log('pay new start');
        console.log($('input[name=total_price]').val())
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
            console.log(rsp);
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
                console.log(data);
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
                    console.log('fail');
                    $('input[name=payment_method]').attr('value','계좌이체결제실패');
                    $('input[name=status]').attr('value', '계좌이체결제실패');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    // my_form.submit();
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            // } else {
            //     var msg = '결제에 실패하였습니다.';
            //     msg += '에러내용 : ' + rsp.error_msg;
            //
            //     alert(msg);
            // }
        });

    });
}
function pay_phone(){
    $(document).ready(function () {
        var IMP = window.IMP;
        IMP.init('imp03714372');
        console.log('pay new start');
        console.log($('input[name=total_price]').val())
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
            console.log(rsp);
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
                console.log(data);
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
                    console.log('fail');
                    $('input[name=payment_method]').attr('value','폰결제실패');
                    $('input[name=status]').attr('value', '폰결제실패');
                    $('input[name=imp_uid]').attr('value', rsp.imp_uid);
                    my_form.submit();
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            // } else {
            //     var msg = '결제에 실패하였습니다.';
            //     msg += '에러내용 : ' + rsp.error_msg;
            //
            //     alert(msg);
            // }
        });

    });
}
window.channelPluginSettings = {
    "pluginKey": "c41b6775-e43d-4cae-888e-8616e0c23cfe" //please fill with your plugin key
};
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })()
