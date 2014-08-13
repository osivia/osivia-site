<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="internationalization" prefix="is" %>


<c:set var="logoAlt"><is:getProperty key="LOGO_ALT" /></c:set>


<div class="clearfix">
    <!-- Ligne d'entête -->
    <div class="header-line"></div>


    <!-- Logo -->
    <h1 class="pull-left">
        <a href="${requestScope['osivia.home.url']}">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="${logoAlt}" />
        </a>
    </h1>


    <!-- Raccourcis -->
    <nav class="pull-right">
        <h2 class="hidden"><is:getProperty key="SHORTCUTS_TITLE" /></h2>


        <!-- Recherche -->
        <a href="#search-input" class="btn btn-default accessibility-shortcut">
            <i class="glyphicons halflings search"></i>
            <span><is:getProperty key="SHORTCUT_SEARCH" /></span>
        </a>
        
        <!-- Contenu -->
        <a href="#page-content" class="btn btn-default accessibility-shortcut">
            <i class="glyphicons book_open"></i>
            <span><is:getProperty key="SHORTCUT_PAGE_CONTENT" /></span>
        </a>

        
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
</div>
