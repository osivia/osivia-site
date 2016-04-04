var $sliderCom;

$JQry(document).ready(function() {
	if (typeof $sliderCom === "undefined") {
		$sliderCom = $JQry(".bxslider.bxslider-com").bxSlider({
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
	}
});


function goToSlide(event, index) {
	event.preventDefault();
	
	$sliderCom.goToSlide(index);
	$sliderCom.stopAuto();
}
