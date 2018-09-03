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
$(document).on('turbolinks:load', function () {
  $('.loaded').show();
  $('.loading-background').hide();
  $('.loading-indicator').hide();
});
$(document).on('turbolinks:request-start', function () {
  $('.loaded').hide();
  $('.loading-background').show();
  $('.loading-indicator').show();
});
$(document).on('turbolinks:request-end', function () {
  $('.loaded').show();
  $('.loading-background').hide();
  $('.loading-indicator').hide();
});
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

;window.channelPluginSettings = {
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
  })();

