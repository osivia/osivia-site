<%@page import="org.osivia.portal.api.Constants"%>
<%@ page import="org.jboss.portal.api.PortalURL" %>
<%@ page import="org.jboss.portal.identity.User" %>
<%@page import="java.util.ResourceBundle"%>
<%@ page import="java.security.Principal" %>

<%
   ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
   Principal principal = (Principal)request.getAttribute(Constants.ATTR_TOOLBAR_PRINCIPAL);
   
   PortalURL loginURL = (PortalURL)request.getAttribute(Constants.ATTR_TOOLBAR_LOGIN_URL);
   PortalURL signOutURL = (PortalURL)request.getAttribute(Constants.ATTR_TOOLBAR_SIGN_OUT_URL);   
   PortalURL monEspaceURL = (PortalURL)request.getAttribute(Constants.ATTR_TOOLBAR_MY_SPACE_URL);
   PortalURL refreshPageUrl = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_REFRESH_PAGE_URL);

   String administrationHtmlContent = (String) request.getAttribute(Constants.ATTR_TOOLBAR_ADMINISTRATION_CONTENT);
%>


<%
if(principal != null) {
    %>
<div id="toolbar-display">
    <div class="gauche">
        <%=administrationHtmlContent %>
    </div>
    
    <div class="droite">
        <p><%= rb.getString("LOGGED") %> : <%= principal.getName() %></p>
    
        <% 
        if (monEspaceURL != null) {
            %>
            <a href="<%= monEspaceURL %>"><%= rb.getString("MON_ESPACE") %></a>
            <%
        }
        %>
    
        <!-- Utilisateur et déconnexion -->
        <a href="<%=signOutURL %>"><%=rb.getString("LOGOUT") %></a>    
    
        <!-- Actualisation de la page -->
        <a id="refresh-page" href="<%=refreshPageUrl %>" title="<%=rb.getString("REFRESH_PAGE") %>">&nbsp;</a>
    </div>
</div>
    <%
} 
%>
