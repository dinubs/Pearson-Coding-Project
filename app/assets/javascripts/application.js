// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require_tree .

$(document).on ('ready page:load',function(){
	$('p').linkify();
	if($("body").hasClass("relax")) {
		var rand = Math.floor(Math.random() * 3103);
		$.ajax({url:"https://api.giphy.com/v1/gifs/search?q=puppies&api_key=dc6zaTOxFJmzC&limit=3203&offset=0",success:function(data){
			var rand = Math.floor(Math.random() * 100);
			console.log(data.data[rand].images.original.url);
			$(".relax").css("background", "url(" + data.data[rand].images.original.url + ") no-repeat center center fixed");
			$(".relax").css("background-size", "cover");
  		}});
  		$(document).keyup(function(evt) {
    		var rand = Math.floor(Math.random() * 3103);
			$.ajax({url:"https://api.giphy.com/v1/gifs/search?q=puppies&api_key=dc6zaTOxFJmzC&limit=3203&offset=0",success:function(data){
				var rand = Math.floor(Math.random() * 100);
				console.log(data.data[rand].images.original.url);
				$(".relax").css("background", "url(" + data.data[rand].images.original.url + ") no-repeat center center fixed");
				$(".relax").css("background-size", "cover");
  			}});
  		})
	}
});
