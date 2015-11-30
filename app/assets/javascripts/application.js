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
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('td').mouseover(function(){
    $(this).css({'opacity':'0.5'});
  });

  $('td').mouseout(function() {
      $(this).css({'opacity':'1'});
  });

  $('.available').click(function(){
    $('.selected').removeClass('selected').addClass('available')
    $(this).toggleClass('available selected');
  });

  $('.ticket_show_id').change(function(){
    var str;
    $( ".ticket_show_id option:selected" ).each(function() {
      str = $(this).text();
    });
    var title = document.getElementById('show_name');
    title.innerHTML = str;
    // updateTable($( ".ticket_show_id option:selected" ).val());
  });

  $('td').click(function(){
    var col = $(this).parent().children().index($(this));
    var row = $(this).parent().parent().children().index($(this).parent()) + 1;
    $('#ticket_seat_id').val(row + " / " + col);
    $('.seat-msg').empty();
  });

  $('.occupied').click(function(){
    $('#ticket_seat_id').val("");
    $('.seat-msg').empty();
    $('#ticket_seat_id').after('<p class="error seat-msg">Seat is occupied !</p>');
  });

  $('.center').click(function(){
    $('#ticket_seat_id').val("");
    $('.seat-msg').empty();
  });

  $('.row-number').click(function(){
    $('#ticket_seat_id').val("");
    $('.seat-msg').empty();
  });
});

function updateTable(show_id){
  $('td').each(function(){
    if(!$(this).hasClass('center') && !$(this).hasClass('row-number'))
      $(this).removeClass('selected occupied').addClass('available')
  })
}
