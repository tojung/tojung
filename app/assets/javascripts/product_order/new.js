// 우편번호 찾기 화면을 넣을 element

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    var element_layer = document.getElementById('layer');
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    var element_layer = document.getElementById('layer');

    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample2_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample2_address').value = fullAddr;

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';

    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function card_payment() {
    var payment_method =  document.getElementById('payment_method_description');
    var element_layer = document.getElementById('layer');

    $('input[name=payment_method]').attr('value', '카드결제');
    payment_method.innerHTML = "신용카드를 선택하였습니다.";
}
function phone_payment(){
    var payment_method =  document.getElementById('payment_method_description');
    var element_layer = document.getElementById('layer');

    $('input[name=payment_method]').attr('value', '폰결제');
    payment_method.innerHTML = "휴대폰 결제를 선택하였습니다.";
}
function initLayerPosition(){
    var width = 300; //우편번호서비스가 들어갈 element의 width
    var height = 400; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께
    var element_layer = document.getElementById('layer');

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

function normal_payment(){
    var element_layer = document.getElementById('layer');

    var payment_method =  document.getElementById('payment_method_description');
    var pay_method = $('input[name=payment_method]').attr('value', '계좌이체');
    payment_method.innerHTML = '계좌이체를 선택하였습니다.';
}

function toss_payment() {
    var element_layer = document.getElementById('layer');

    var payment_method =  document.getElementById('payment_method_description');
    var pay_method = $('input[name=payment_method]').attr('value', '토스');
    payment_method.innerText = '토스결제를 선택하였습니다. ';
}

function extra_payment(){
    var element_layer = document.getElementById('layer');

    var payment_method =  document.getElementById('payment_method_description');
    var pay_method = $('input[name=payment_method]').attr('value', '제공안함');
    payment_method.innerText = '해당 옵션은 현재 제공하지않습니다.';
}
function fuckin_hard_case(select_this, package_price,delivery_price) {
    var element_layer = document.getElementById('layer');

    var type = $('#caseType option:selected').val();
    if (type == '젤리케이스'){
        $('#hardCase').filter('.on').removeClass('on').addClass('off');
        $('#jellyCase').removeClass('off').addClass('on');
    }
    else if (type == '하드케이스'){
        $('#jellyCase').filter('.on').removeClass('on').addClass('off');
        $('#hardCase').removeClass('off').addClass('on');
    }
    console.log('fuckin hard case');
    if(select_this.value === '하드케이스'){
        var m=parseInt(package_price);
        $('input[name=product_price]').attr('min', m+3000);
        if ($('input[name=product_price]').attr('value') < m + 3000 || parseInt($('input[name=product_price]').val()) < m + 3000){
            $('input[name=product_price]').attr('value', m + 3000);
            $('input[name=product_price]').val(m+3000)
            $('#product_price_description').text(m + 3000 + '원');
            var p = $('input[name=total_price]');
            p.attr('value', parseInt(p.attr('value')) + 3000)
            var product_price_description2 = document.getElementById('product_price_description2');
            product_price_description2.innerText = parseInt(p.attr('value'))
        }
    }else{
        var m=parseInt(package_price);
        $('input[name=product_price]').attr('value', m);
        $('input[name=product_price]').val(m);
        $('#product_price_description').text(m + '원');
        var p = $('input[name=total_price]');
        p.attr('value',  m + delivery_price);
        var product_price_description2 = document.getElementById('product_price_description2');
        product_price_description2.innerText = parseInt(p.attr('value'));
    }
}
function fuckin_submit(){
    var element_layer = document.getElementById('layer');

    $('input[name=commit]').removeAttr('data-disable-with');
    let payment_method = $('input[name=payment_method]').attr('value');
    if (payment_method === '카드결제') {
        pay_new_test();
        // $('input[name=commit]').removeAttr('disabled')
        // $('form').submit()
    }else if(payment_method == '폰결제'){
        pay_phone();
    } else if (payment_method === '제공안함') {
        alert('제공하지않는 결제방법을 선택하셨습니다.');
        $('input[name=commit]').removeAttr('disabled')
    } else if (payment_method === '계좌이체') {
        console.log('계좌이체');
        // return true
        // $('input[name=status]').attr('value', '결제대기중');
        pay_trans();
        // $('form').submit();
        //$('input[name=commit]').removeAttr('disabled')
    }else if(payment_method === '토스'){
        console.log('토스');
        $('input[name=status]').attr('value', '결제진행중');
        $('form').submit();
    }
    else if (payment_method === '해당없음') {
        $('form').submit();
    } else {
        alert('결제방법을 선택해주세요');
    }
}

function select_change(select_this) {
    // alert(select_this.value);
    $('input[name="phone"]').val(select_this.value)
}

(function() {
    $(document).on('turbolinks:load', function() {
        if (!(page.controller() === 'product_order' && page.action() === 'new')) {
            return;
        }

        // alert("Welcome Index!");
        console.log("Welcome Home Index!")
        $(document).ready(function(){
            for(i=0;i<$('.comma-money').length;i++){
                var money = $('.comma-money')[i];
                money = $(money).html();
                if (money !== "0원"){
                    money = money.substring(0,money.length-1)
                    money = Number(money);
                    money = money.toLocaleString();
                    money = money+"원";
                    var putmoney = $('.comma-money')[i];
                    $(putmoney).html(money);
                }
            }
        });
    });
}).call(this);
