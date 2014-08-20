var $JQry = jQuery.noConflict();

var sliderReady = false;
var slider;

$JQry(document).ready(function($) {
	if (!sliderReady) {
		slider = $(".bxslider").bxSlider({
			// General
			mode : "fade",  // Type of transition between slides
			
			// Controls
			autoControls : true,  // If true, "Start" / "Stop" controls will be added
			
			// Auto
			auto : true,  // Slides will automatically transition
			pause : 6000,  // The amount of time (in ms) between each auto transition
			autoHover : true,  // Auto show will pause when mouse hovers over slider
			autoDelay : 3000  // Time (in ms) auto show should wait before starting
		});

		sliderReady = true;
	}
});


function goToSlide(index) {
	slider.goToSlide(index);
	slider.stopAuto();
}
