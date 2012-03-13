// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery
//= require best_in_place
//= require twitter/bootstrap
//= require_tree .

// Follow us on Twitter Button
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

$(document).ready( function(){

    var date = new Date(2012,02,15);

    $("#time").countdown({
      "date" : date
    });

    $('#countdown .close').click(function () {
      document.cookie = 'hide_countdown=true; expires='+ date +'; path=/'
    })
    
    $('#search-form').submit(function(){
    	document.location = "http://www.pickura.com/search/" + $('#query').val();
    	// document.location = "http://localhost:3000/search/" + $('#query').val();
    	return false;
    })
});      