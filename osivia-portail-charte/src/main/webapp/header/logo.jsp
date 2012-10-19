<%@ page import="fr.toutatice.portail.api.charte.UserPage" %>
<%@ page import="fr.toutatice.portail.api.charte.UserPortal" %>

<%@page import="java.util.List"%>

<%@ page import="fr.toutatice.portail.api.charte.Breadcrumb"%>
<%@page import="fr.toutatice.portail.api.charte.BreadcrumbItem"%>

<%

StringBuffer url = new StringBuffer();
url.append("http://");
url.append(request.getServerName());
int port = request.getServerPort();
if(port != 80){
	url.append(":");
	url.append(port);
}
url.append("/");
url.append(request.getRequestURI().split("/")[1]);
url.append("/");
String urlAccueil = url.toString();

/*String urlAccueil = null;
Breadcrumb breadcrumb = (Breadcrumb) request.getAttribute("pia.breadcrumb");

if( breadcrumb != null)	{
	List<BreadcrumbItem> listItems = breadcrumb.getChilds();
	if(listItems != null && listItems.size() > 0){
		urlAccueil = listItems.get(0).getUrl();
	}
}*/
%>


<div class="navbar">
	<div class="navbar-inner">
	    <h1><a class="brand" href="<%= urlAccueil %>"><img src="/osivia-portail-charte/themes/atomo/images/logo-osivia.jpg" id="logo-entete" alt="Logo Osivia" title="Logo Osivia"/></a></h1>
	</div>
</div>
