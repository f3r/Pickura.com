// $(function(){
//   $('#pics a').click(function() {
//     $('#user_image').attr("src", $(this).data('target'));
//   });
// });

$(document).ready(function() {
  $('ul.slider').roundabout({
    autoplay : true,
    duration : 2000,
    autoplayDuration: 4000
  });
});