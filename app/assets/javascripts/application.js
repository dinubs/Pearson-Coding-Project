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
//= require jquery
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker

$.fn.exists = function(){
    return $( ':not(' + this.selector + ')' ).length < $( '*' ).length;
}
document.addEventListener('page:change', function() {
	if($(".home").length) {
		document.getElementsByClassName("home")[0].className += ' animated fadeIn';
	}
	if($(".relax").length) {
		document.getElementsByClassName("relax")[0].className += ' animated fadeIn';
	}
  document.getElementById('primary-content').className += ' animated fadeIn';
	$('p').linkify();
	if($(".relax").exists()) {
		var rand = Math.floor(Math.random() * 3103);
		console.log("YES");
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
document.addEventListener('page:fetch', function() {
	if($(".home").length) {	
		document.getElementsByClassName("home")[0].className += ' animated fadeOut';
	}
	if($(".relax").length) {
		document.getElementsByClassName("relax")[0].className += ' animated fadeIn';
	}
	document.getElementById('primary-content').className += ' animated fadeOut';
});