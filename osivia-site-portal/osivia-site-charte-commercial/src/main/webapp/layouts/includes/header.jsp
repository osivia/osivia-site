<%@ taglib prefix="p" uri="portal-layout"%>
<%@ taglib uri="internationalization" prefix="is" %>


<!-- Barre d'outils -->
<p:region regionName="toolbar" />

<header class="container">
    <div class="banner">
        <!-- Title -->
        <p:region regionName="title" />
    
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
    
        <!-- Logo -->
        <div class="clearfix">
            <div class="header-line"></div>
            <p:region regionName="logo" cms="true" />
        </div>
        
        <!-- Raccourcis -->
        <p:region regionName="shortcuts" cms="true" />
    </div>
    
    <div class="navigation-bar">
        <!-- Navigation top menu -->
        <div class="navigation-top-menu">
            <p:region regionName="top-menu" regionID="navigation-menu" cms="true" />
        </div>
        
        <!-- Recherche -->
        <div class="navigation-search">
            <p:region regionName="search" />
        </div>
        
        <div class="navigation-line"></div>
    </div>
</header>