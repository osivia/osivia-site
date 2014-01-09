
 var currentTab = 0;
 var currentFirstTab = 0;
 var stepTab = 1;
 
function initTab(  firstTab, selectedTab, step, excludeFirstPage )	{

	currentFirstTab = firstTab;
	currentTab = selectedTab;	
	stepTab = step;
	
	// force to left
	if( currentTab < currentFirstTab )	{
		currentFirstTab = Math.max( currentTab - step + 1, 0);
	}
	
	// force to right
	if( currentTab >= currentFirstTab +step )	{
		currentFirstTab = Math.max( currentTab - step + 1, 0);
	}
	
	refreshTabs( excludeFirstPage );
}


function stepToTab( step, excludeFirstPage)
{
	var el = $('hiddenTabs').immediateDescendants();
	var count = el.length;
	
	currentFirstTab += step;
	currentFirstTab = Math.min( currentFirstTab, count - 1);
	currentFirstTab = Math.max( currentFirstTab, 0);
	
	refreshTabs(excludeFirstPage);
	
}

function refreshTabs( excludeFirstPage )
{
	// delete old values
	var destroy = $('dynamicTab').immediateDescendants();
	var nbDestroys = destroy.length;
	for(var i = 0; i < nbDestroys; i++) {
		destroy[i].remove();
	}
	
	var tabsElement = new Element('ul', { 'id': 'tabsHeader'});
	
	// left arrow 
	if(excludeFirstPage){
		borneArrow = 1;
	}
	
	if( currentFirstTab > borneArrow)	{
	    var divElement = new Element('div', { 'class': 'leftTabStep' }).update('<a href="javascript:stepToTab( -'+stepTab+','+excludeFirstPage+');"></a>');	 
	    $("dynamicTab").appendChild(divElement);
		
	} else {
	    var divElement = new Element('div', { 'class': 'emptyTabStep' });	 
	    $("dynamicTab").appendChild(divElement);
	} 
	
	
	$("dynamicTab").appendChild( tabsElement)

	
	// tabs
	var el = $('hiddenTabs').immediateDescendants();
	var count = el.length;
	
	var borne = 0;
	if(excludeFirstPage && (currentFirstTab == 0)){
		borne = 1;
	}
	
	var ret = -1;
	var nbTabs = Math.min( count, currentFirstTab +stepTab);
	for(var i = currentFirstTab + borne; i < nbTabs ; i++) {
		
		liHTML = el[i].innerHTML;
		
		liHTML = liHTML.replace(/firstTab=0/g , 'firstTab=' + currentFirstTab);
		
		
	    var liElement = new Element('li').update(liHTML);	   
	    
	    if(i == currentTab){
	    	liElement.addClassName('current');
	    }
	    
   
	    tabsElement.appendChild(liElement);

	}
	
	//right arrow
	if( currentFirstTab + stepTab  < count)	{
	    var divElement = new Element('div', { 'class': 'rightTabStep' }).update('<a href="javascript:stepToTab( '+stepTab+','+excludeFirstPage+');"></a>');	 
	    $("dynamicTab").appendChild(divElement);
		
	} 
		

}