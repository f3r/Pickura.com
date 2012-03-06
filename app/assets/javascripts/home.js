// from: http://gsgd.co.uk/sandbox/jquery/easing/
easing_options = ['swing',                                                //  0
                  'easeInQuad',     'easeOutQuad',    'easeInOutQuad',    //  1  - 2 -  3
                  'easeInCubic',    'easeOutCubic',   'easeInOutCubic',   //  4  - 5 -  6
                  'easeInQuart',    'easeOutQuart',   'easeInOutQuart',   //  7  - 8 -  9
                  'easeInQuint',    'easeOutQuint',   'easeInOutQuint',   // 10 - 11 - 12
                  'easeInSine',     'easeOutSine',    'easeInOutSine',    // 13 - 14 - 15
                  'easeInExpo',     'easeOutExpo',    'easeInOutExpo',    // 16 - 17 - 18
                  'easeInCirc',     'easeOutCirc',    'easeInOutCirc',    // 19 - 20 - 21
                  'easeInElastic',  'easeOutElastic', 'easeInOutElastic', // 22 - 23 - 24
                  'easeInBack',     'easeOutBack',    'easeInOutBack',    // 25 - 26 - 27
                  'easeInBounce',   'easeOutBounce',  'easeInOutBounce']  // 28 - 29 - 30

$(document).ready(function() {
  $('ul.slider').roundabout({
    autoplay : true,
    duration : 1300,
    autoplayDuration: 3500,
    tilt:      -5,
    minOpacity: 0,
    minScale:   0,
    enableDrag: true,
    easing:     easing_options[1],
    dropEasing: easing_options[11],
    autoplayPauseOnHover: true
  });
  
  // $('.slider img').click(function() {
  //     $('#user_image').attr("src", $(this).data('target'));
  //   });
  
});