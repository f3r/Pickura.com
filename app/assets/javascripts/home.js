// $(function(){
//   $('#pics a').click(function() {
//     $('#user_image').attr("src", $(this).data('target'));
//   });
// });


$(function(){
  $("#nivoslider").nivoSlider({
  		effect:"boxRandom",
  		slices:15,
  		boxCols:8,
  		boxRows:4,
  		animSpeed:200,
  		pauseTime:3000,
  		startSlide:0,
  		directionNav:true,
  		directionNavHide:true,
  		controlNav:true,
  		controlNavThumbs:true,
  		controlNavThumbsFromRel:true,
  		keyboardNav:true,
  		pauseOnHover:true,
  		manualAdvance:true
  });
});
