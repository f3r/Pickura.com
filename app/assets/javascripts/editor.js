 var Editor = {
  initialize: function(){
  	console.log('initializing');
  	$('.sticker').click(function(){
        Editor.newSticker($(this).attr('src'));
  	});
  	
  	$('#upload_button').click(function(){
  	  $(this).button('loading');
  	});
  	
  	$('#download_button').click(function(){
  	  var button = $(this);
  	  button.button('loading');
  	  setTimeout(function(){
  	    button.button('reset');
  	  }, 2000);
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

var Picker = {
  initialize: function(){
    $('.modal').modal();
    $(".dropdown-toggle").dropdown();
    $('#fb_photo_picker .photo-select').click(function(){
      var box_id = $('#fb_photo_picker').data('box');
      var box = $('#box_' + box_id)
      box.addClass('selected');
      box.find('a').attr('style', 'background-image: url("' + $(this).data('image')) + '")';
      $('#fb_photo_picker .modal').modal('hide');
    });
  }
}

Editor.initialize();
