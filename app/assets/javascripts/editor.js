var Editor = {
  initialize: function(){
	console.log('initializing');
	$('.sticker').click(function(){
      Editor.newSticker($(this).attr('src'));
	});
  },
  newSticker: function(src){
   console.log('clicky');

   var image = $('<img class="sticker"/>');
   image.attr('src', src);
   $("#canvas").prepend(image);
   image.draggable();
  }
};

Editor.initialize();