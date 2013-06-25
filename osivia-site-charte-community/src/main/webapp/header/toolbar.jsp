<%@page import="org.apache.commons.lang.BooleanUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.osivia.portal.api.Constants" %>
<%@page import="org.jboss.portal.api.PortalURL" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.security.Principal" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%
ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
Principal principal = (Principal) request.getAttribute(Constants.ATTR_TOOLBAR_PRINCIPAL);

PortalURL loginUrl = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_LOGIN_URL);
PortalURL signOutUrl = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_SIGN_OUT_URL);
PortalURL refreshPageUrl = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_REFRESH_PAGE_URL);

String administrationHtmlContent = (String) request.getAttribute(Constants.ATTR_TOOLBAR_ADMINISTRATION_CONTENT);
%>


<%
if (principal == null) {
    %>
        
<!-- Connexion -->
<a href="<%=loginUrl %>"><%=rb.getString("LOGIN") %></a>
    
    <%
} else {       
    %>
<div class="gauche">
    <%=administrationHtmlContent %>
</div>


<div class="droite">

    <!-- Menu de raccourcis -->
    <div class="toolbar-menu">
        <a class="toolbar-menu-title"><%=rb.getString("MENU_SHORTCUTS") %></a>
        <ul>
            <!-- Accès à l'accueil -->
            <li><a href="/portal"><%=rb.getString("SUBMENU_HOME_ACCESS") %></a></li>            
        </ul>
    </div>

    <!-- Utilisateur et déconnexion -->
    <a href="<%=signOutUrl%>"><%=principal.getName() %> - <%=rb.getString("LOGOUT") %></a>    

    <!-- Actualisation de la page -->
    <a id="refresh-page" href="<%=refreshPageUrl %>" title="<%=rb.getString("REFRESH_PAGE") %>">&nbsp;</a>
</div>
    <%
}
%>
