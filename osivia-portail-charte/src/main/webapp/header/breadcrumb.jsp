<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@ page import="java.util.Iterator" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="fr.toutatice.portail.api.charte.Breadcrumb"%>
<%@page import="fr.toutatice.portail.api.charte.BreadcrumbItem"%>

<%
Breadcrumb breadcrumb = (Breadcrumb) request.getAttribute("pia.breadcrumb");
%>


<ul >
<%
if( breadcrumb != null)	{
	for (BreadcrumbItem bi : breadcrumb.getChilds())	{
%>
		<li>
			<a href="<%= bi.getUrl() %>" ><%= bi.getName() %> </a>
		</li>
<%
	}
}
%>

</ul>
