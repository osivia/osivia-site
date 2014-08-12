<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="internationalization" prefix="is" %>


<c:set var="logoAlt"><is:getProperty key="LOGO_ALT" /></c:set>


<div class="clearfix">
    <!-- Ligne d'entête -->
    <div class="header-line"></div>


    <!-- Raccourcis -->
    <nav class="pull-right">
        <h2 class="hidden"><is:getProperty key="SHORTCUTS" /></h2>
        
        <div class="btn-toolbar" role="toolbar">
            <div class="btn-group">
                <!-- Documentation -->
                <a href="http://www.osivia.org/portal/cms/default-domain/community-ws/documentation" target="_blank" class="btn btn-default">
                    <i class="glyphicons halflings book"></i>
                    <span><is:getProperty key="SHORTCUT_DOCUMENTATION" /></span>
                </a>
                
                <!-- Démo -->
                <a href="http://demo.osivia.org" target="_blank" class="btn btn-default">
                    <i class="glyphicons coat_hanger"></i>
                    <span><is:getProperty key="SHORTCUT_DEMO" /></span>
                </a>
                
                <!-- Téléchargements -->
                <a href="http://www.osivia.org/portal/cms/default-domain/community-ws/telechargements" target="_blank" class="btn btn-default">
                    <i class="glyphicons download_alt"></i>
                    <span><is:getProperty key="SHORTCUT_DOWNLOADS" /></span>
                </a>
            </div>
        </div>
    </nav>


    <!-- Logo -->
    <h1 class="pull-left">
        <a href="${requestScope['osivia.home.url']}">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="${logoAlt}" />
        </a>
    </h1>
</div>