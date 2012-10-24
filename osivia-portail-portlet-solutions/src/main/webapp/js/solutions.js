
var timer ;
var sliderContainer;
var sliderUrl;


function sliderTimeOut(  )	{
	updatePortletContent( sliderContainer, sliderUrl);
}

function activeSlider(  container, url )	{

	sliderContainer = container;
	sliderUrl = url;
	
	if( timer != null) 
		clearTimeout( timer);
	
	if( url != "NO_REFRESH"){
		timer = setTimeout("sliderTimeOut()", 5000);
	}
}



