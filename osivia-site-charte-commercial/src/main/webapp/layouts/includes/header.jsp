<%@ taglib uri="portal-layout" prefix="p"%>
<%@ taglib uri="http://www.osivia.org/jsp/taglib/osivia-portal" prefix="op" %>


<!-- Barre d'outils -->
<p:region regionName="toolbar" />

<header class="container">
    <div class="banner">
        <!-- Title -->
        <p:region regionName="title" />
    
        <!-- Recherche -->
        <a href="#search-input" class="btn btn-default accessibility-shortcut">
            <i class="halflings halflings-search"></i>
            <span><op:translate key="SHORTCUT_SEARCH" /></span>
        </a>
        
        <!-- Contenu -->
        <a href="#page-content" class="btn btn-default accessibility-shortcut">
            <i class="glyphicons glyphicons-book-open"></i>
            <span><op:translate key="SHORTCUT_PAGE_CONTENT" /></span>
        </a>
    
        <!-- Logo -->
        <div class="clearfix">
            <div class="header-line"></div>
            <p:region regionName="logo" cms="true" />
        </div>
        
        <!-- Raccourcis -->
        <p:region regionName="shortcuts" cms="true" />
    </div>
</header>
