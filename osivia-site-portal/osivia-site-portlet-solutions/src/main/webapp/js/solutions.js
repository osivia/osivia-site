
var timer ;
var sliderContainer;
var sliderUrl;

var playerStop;


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

function play(player, webapp){
	player.setAttribute("src", webapp + "/img/play.jpeg");
	clearTimeout( timer);
}

function pause(player, webapp){
	player.setAttribute("src", webapp + "/img/pause.jpeg");
	timer = setTimeout("sliderTimeOut()", 5000);
}

function initPlayer(webapp){
	var player = document.getElementById("player");
	if(player != null){
		if(playerStop){
			play(player, webapp)
		}else{
			pause(player, webapp)
		}
	}
}

function changeStatusPlayer(webapp, nextUrl, stop){	
	var player = document.getElementById("player");
	playerStop = stop;
	if(stop){
		play(player, webapp)
	}else{	
		var playerStatus = player.getAttribute("src");
		if(playerStatus.indexOf("play") != -1){
			sliderUrl = nextUrl;
			pause(player, webapp)
		}else if(playerStatus.indexOf("pause") != -1){
			play(player, webapp)
		}
	}
}

