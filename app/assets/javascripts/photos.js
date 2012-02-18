  $('.best_in_place').best_in_place();
  
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto({
			animation_speed: 'normal', /* fast/slow/normal */
			default_width: 851,
			default_height: 315,
			theme: 'facebook', /* pp_default, light_rounded / dark_rounded / light_square / dark_square / facebook */
			slideshow:5000, 
			autoplay_slideshow:true
    });
  });