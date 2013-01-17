<%@page import="org.osivia.portal.api.Constants"%>
<%@ page import="org.jboss.portal.api.PortalURL" %>
<%@ page import="org.jboss.portal.identity.User" %>
<%@page import="java.util.ResourceBundle"%>
<%@ page import="java.security.Principal" %>

<%
   ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
   Principal principal = (Principal)request.getAttribute("org.jboss.portal.header.PRINCIPAL");
   PortalURL loginURL = (PortalURL)request.getAttribute("org.jboss.portal.header.LOGIN_URL");
   PortalURL adminPortalURL = (PortalURL)request.getAttribute("org.jboss.portal.header.ADMIN_PORTAL_URL");
   PortalURL signOutURL = (PortalURL)request.getAttribute("org.jboss.portal.header.SIGN_OUT_URL");
   
   PortalURL monEspaceURL = (PortalURL)request.getAttribute(Constants.ATTR_MY_SPACE_URL);
   PortalURL wizzardURL = (PortalURL)request.getAttribute(Constants.ATTR_WIZZARD_URL);
   String wizzardMode = (String) request.getAttribute(Constants.ATTR_WIZZARD_MODE);
%>

<% if(principal != null){ %>
	
<div class="toolbar-container-show">

<%  if (principal == null)
   {
%>

<%if(request.getAttribute("ssoEnabled") == null){%>

      <a href="<%= loginURL %>"><%= rb.getString("LOGIN") %></a>

<%}else{%>
<a href="<%= loginURL %>"><%= rb.getString("LOGIN") %></a>
<%}%>


<%
}
else
{
%>



<%= rb.getString("LOGGED") %>: <%= principal.getName() %><br/><br/>

<%
 
    
   if (monEspaceURL != null)
   {
%>&nbsp;&nbsp;<a href="<%= monEspaceURL %>"><%= rb.getString("MON_ESPACE") %></a><br/><%
   }
   

   if (adminPortalURL != null)
   {
%>&nbsp;&nbsp;<a href="<%= adminPortalURL %>"><%= rb.getString("ADMIN") %></a><br/><%
   }

 
   if (wizzardURL != null)
   {
	   String title = "Mode édition";
	   if( "normal".equals(wizzardMode))
		   title = "Sortir du mode édition";
	   //TODO : accès RB
%>&nbsp;&nbsp;<a href="<%= wizzardURL %>"><%= title %></a><br/><%
   }
   
%>&nbsp;&nbsp;<a href="<%= signOutURL %>"><%= rb.getString("LOGOUT") %></a>
<%
   } %>
   </div>
   <%
} 
%>
