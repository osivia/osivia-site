


function popup2print(  title, divName)	{

	url = '/toutatice-portail-demo-charte/print/print.jsp?portlet=' + divName  + "&title="+encodeURIComponent(title);
    w=window.open(url);
 

}

