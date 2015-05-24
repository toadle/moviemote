// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-rating.min
//= require bootstrap-tagsinput


$( document ).ready(function() {

  $('.poster_background[data-href]').on('click', function (e) {
    window.location = $(this).data('href');
  });

  $('input[type=rating]').rating({
    start: 0,
    stop: 10
  }).on('change', function(){
    $(this).closest('form').submit();
  });

  $('.user_watchlist').on('click', function(e) {
    window.location = $(this).data('href');
  });

  $('.hider-button').on('click', function(e) {
    $(this).closest('.visible').siblings('.hidden').removeClass("hidden");
    $(this).closest('.visible').addClass("hidden");
  });

  $('.nav.nav-tabs').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

});