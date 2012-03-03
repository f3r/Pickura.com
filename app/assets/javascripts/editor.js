var Editor = {
  initialize: function(){
  	console.log('initializing');
  	$('.sticker').click(function(){
        Editor.newSticker($(this).attr('src'));
  	});
  	
  	$('#download_button, #upload_button').click(function(){
  	  $(this).button('loading');
  	});
  	
  	$('#upload_modal').on('hide', function () {
      $('#upload_button').button('reset');
    });
    
    $('#upload_modal').on('show', function () {
      $('#upload_modal .trigger').click();
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

$('a[data-popup]').live('click', function(e) {
  window.open($(this).attr('href'), $(this).data('dialog-name'),'height=300,width=800,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
  e.preventDefault();
});

Editor.initialize();
