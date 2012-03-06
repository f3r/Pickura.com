// $(function(){
//   $('#pics a').click(function() {
//     $('#user_image').attr("src", $(this).data('target'));
//   });
// });

easing_options = ['swing',          
                  'easeInQuad',     'easeOutQuad',    'easeInOutQuad',
                  'easeInCubic',    'easeOutCubic',   'easeInOutCubic',
                  'easeInQuart',    'easeOutQuart',   'easeInOutQuart',
                  'easeInQuint',    'easeOutQuint',   'easeInOutQuint',
                  'easeInSine',     'easeOutSine',    'easeInOutSine',
                  'easeInExpo',     'easeOutExpo',    'easeInOutExpo',
                  'easeInCirc',     'easeOutCirc',    'easeInOutCirc',
                  'easeInElastic',  'easeOutElastic', 'easeInOutElastic',
                  'easeInBack',     'easeOutBack',    'easeInOutBack',
                  'easeInBounce',   'easeOutBounce',  'easeInOutBounce']

$(document).ready(function() {
  $('ul.slider').roundabout({
    autoplay : true,
    duration : 1300,
    autoplayDuration: 4000,
    tilt:      -5,
    minOpacity: 0,
    minScale:   0,
    enableDrag: true,
    easing: easing_options[2]
    // maxScale: 1.0,
    // shape: 'tearDrop'
    // shape: 'rollerCoaster' 
  });
});