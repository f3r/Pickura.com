$(function(){
  $('#pics a').click(function() {
    $('#user_image').attr("src", $(this).data('target'));
  });
});