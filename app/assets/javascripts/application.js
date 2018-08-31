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

window.onpageshow = function(event) {
    if (event.persisted) {
        window.location.reload();
    }
};


$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        alert("dddd");
    }
});

// 사이드바 카테고리
function sidebar_cate_change(item){
  $(document).ready(function () {
    $('.category-keyword').filter('.cate-red').removeClass("cate-red");
    // 통일/국방일 경우 => 외교/통일/국방으로
    if ($(item).children()[1].innerHTML === '통일/국방'){
      var target = $('.category-keyword')[7];
      var keyword = '외교/통일/국방';
      $(target).addClass("cate-red");
      $('#category-tag').html(keyword);
    }
    // 나머지
    else {
      for(let i=0;i<$('.category-keyword').length;i++){
        if($('.category-keyword')[i].innerHTML === $(item).children()[1].innerHTML){
          var target = $('.category-keyword')[i];
          var keyword = $(item).children()[1].innerHTML
          $(target).addClass("cate-red");
          $('#category-tag').html(keyword);
        }
      }
    }
    // Scroll To category list
    $('html, body').animate({
       scrollTop: $('#categoryList').offset().top-100
    }, 'slow');
});
}
