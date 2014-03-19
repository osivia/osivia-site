
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

function changeStatusPlayer(webapp, definitiveStop){
	var player = document.getElementById("player");
	
	if(definitiveStop){
		player.setAttribute("src", webapp + "/img/play.jpeg");
		clearTimeout( timer);
	}else{	
		var playerStatus = player.getAttribute("src");
		if(playerStatus.indexOf("play") != -1){
			player.setAttribute("src", webapp + "/img/pause.jpeg");
			timer = setTimeout("sliderTimeOut()", 5000);
		}else if(playerStatus.indexOf("pause") != -1){
			player.setAttribute("src", webapp + "/img/play.jpeg");
			clearTimeout( timer);
		}
	}
}

