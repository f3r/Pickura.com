
/************************************************************************************************ 
 * ADMIN PANEL
 *************************************************************************************************/
  // Inline editing
  $('.best_in_place').best_in_place();
  
  // Slideshow
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
  
  // Admin function to delete an image
  function remove_photo(id){
    $(id).fadeOut(500, function(){
        $(id).remove();
    });
  }

/************************************************************************************************ 
 * GALLERY
 *************************************************************************************************/
  // Sharing buttons
  $('.photo').hover(
    function() {
      $(this).children(".social_sharing").show();
    },
    function() {
      $(this).children(".social_sharing").hide();
    }
  );