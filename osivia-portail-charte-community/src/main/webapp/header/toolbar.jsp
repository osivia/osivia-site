<%@page import="org.apache.commons.lang.BooleanUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.osivia.portal.api.Constants" %>
<%@page import="org.jboss.portal.api.PortalURL" %>
<%@page import="org.jboss.portal.identity.User" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.security.Principal" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%
ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
Principal principal = (Principal) request.getAttribute(Constants.ATTR_TOOLBAR_PRINCIPAL);

Boolean editablePage = (Boolean) request.getAttribute(Constants.ATTR_TOOLBAR_EDITABLE_PAGE);

PortalURL loginURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_LOGIN_URL);
PortalURL adminPortalURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_ADMIN_PORTAL_URL);
PortalURL signOutURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_SIGN_OUT_URL);
PortalURL monEspaceURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_MON_ESPACE_URL);
PortalURL wizardURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_WIZARD_URL);
PortalURL cmsEditionModeURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_CMS_EDITION_URL);
String templateAccessURL = (String) request.getAttribute(Constants.ATTR_TOOLBAR_TEMPLATE_ACCESS_URL);

String wizardMode = (String) request.getAttribute(Constants.ATTR_TOOLBAR_WIZARD_MODE);
String cachesInitURL = (String) request.getAttribute(Constants.ATTR_TOOLBAR_CACHES_INIT_URL);
PortalURL refreshPageURL = (PortalURL) request.getAttribute(Constants.ATTR_TOOLBAR_REFRESH_PAGE_URL);


// String cmsEditionMode = (String) request.getAttribute(Constants.ATTR_TOOLBAR_CMS_EDITION_MODE);
%>


<%
if (principal == null) {
    %>
        
    <!-- Connexion -->
    <a href="<%=loginURL %>"><%=rb.getString("LOGIN") %></a>
    
    <%
} else {
    %>

<div class="gauche">

    <!-- Edition -->
    <%
    if (wizardURL != null) {
        String modeEdition;
        if (StringUtils.equals(wizardMode, Constants.VALUE_TOOLBAR_WIZARD_MODE)) {
            modeEdition = "editionActive";
        } else {
            modeEdition = "editionInactive";
        }
        %>
        <a href="<%=wizardURL %>" class="<%=modeEdition %>"><%=rb.getString("EDITION_MODE") %></a>    
        <%
    }
    %>
    
    <!-- Menu de configuration -->
    <div class="toolbar-menu">
        <a class="toolbar-menu-title"><%=rb.getString("MENU_CONFIGURE") %></a>
        <ul>
            <!-- Choix de la page d'accueil du portail -->
            <li><a href="#home-page-selection" class="fancybox_inline" title="<%=rb.getString("SUBMENU_HOME_SELECT") %>"><%=rb.getString("SUBMENU_HOME_SELECT") %></a></li>
            
            <!-- Création de page -->
            <li><a href="#page-creation" class="fancybox_inline" title="<%=rb.getString("SUBMENU_PAGE_CREATE") %>"><%=rb.getString("SUBMENU_PAGE_CREATE") %></a></li>
                    
            <!-- Accès au template -->    
            <%
            if (templateAccessURL != null) {
                %>                
                <li><a href="<%=templateAccessURL %>"><%=rb.getString("SUBMENU_TEMPLATE_ACCESS") %></a></li>
                <%
            }
            
            if (BooleanUtils.isTrue(editablePage)) {
                %>
                <!-- Propriétés de la page -->
                <li><a href="#page-properties" class="fancybox_inline" title="<%=rb.getString("SUBMENU_PROPERTIES") %>"><%=rb.getString("SUBMENU_PROPERTIES") %></a></li>
                
                <!-- Emplacement de la page -->
                <li><a href="#page-order" class="fancybox_inline" title="<%=rb.getString("SUBMENU_ORDER") %>"><%=rb.getString("SUBMENU_ORDER") %></a></li>
                
                <!-- Droits -->
                <li><a href="#page-rights" class="fancybox_inline" title="<%=rb.getString("SUBMENU_RIGHTS") %>"><%=rb.getString("SUBMENU_RIGHTS") %></a></li>
                
                <!-- CMS -->
                <li><a href="#page-cms" class="fancybox_inline" title="<%=rb.getString("SUBMENU_CMS") %>"><%=rb.getString("SUBMENU_CMS") %></a></li>
                
                <!-- Suppression -->
                <li><a href="#page-suppression" class="fancybox_inline" title="<%=rb.getString("SUBMENU_DELETE") %>"><%=rb.getString("SUBMENU_DELETE") %></a></li>
                <%
            }
            %>
            
            <!-- Initialisation des caches -->
            <li><a href="<%=cachesInitURL %>"><%=rb.getString("CACHES_INIT") %></a><li>
            
            <!-- Liste des pages -->
            <li><a href="#pages-list" class="fancybox_inline" title="<%=rb.getString("SUBMENU_PAGES_LIST_ACCESS") %>"><%=rb.getString("SUBMENU_PAGES_LIST_ACCESS") %></a></li>
        </ul>
    </div>



<%-- <!-- TEMPORAIRE : Edition CMS -->
<%
if (cmsEditionModeURL != null) {
    String cmsEditionTitle = "Edition CMS";
    if ("preview".equals(cmsEditionMode)) {
        cmsEditionTitle = "Sortir du mode CMS";
        // TODO : accès RB
    }
    %>
    <a href="<%=cmsEditionModeURL%>"><%=cmsEditionTitle%></a>
    <%
}
%> --%>





</div>

<div class="droite">

    <!-- Menu de raccourcis -->
    <div class="toolbar-menu">
        <a class="toolbar-menu-title"><%=rb.getString("MENU_SHORTCUTS") %></a>
        <ul>
            <!-- Accès à l'accueil -->
            <li><a href="/portal"><%=rb.getString("SUBMENU_HOME_ACCESS") %></a></li>
        
            <%-- 
            <!-- Accès à "Mon espace" -->
            <%
            if (monEspaceURL != null) {
                %>
                <li><a href="<%=monEspaceURL %>"><%=rb.getString("SUBMENU_MY_SPACE_ACCESS") %></a></li>
                <%
            }
            %>
             --%>
        
            <!-- Accès à l'administration -->
            <%
            if (adminPortalURL != null) {
                %>
                <li><a href="<%=adminPortalURL %>"><%=rb.getString("SUBMENU_ADMIN_ACCESS") %></a></li>
                <%
            }
            %>
            
            
        </ul>
    </div>

    <!-- Utilisateur et déconnexion -->
    <a href="<%=signOutURL%>"><%=principal.getName() %> - <%=rb.getString("LOGOUT") %></a>    

    <!-- Initialisation des caches -->
    <a id="cache-init" href="<%=refreshPageURL %>" title="<%=rb.getString("REFRESH_PAGE") %>">&nbsp;</a>
</div>
    <%
}
%>
