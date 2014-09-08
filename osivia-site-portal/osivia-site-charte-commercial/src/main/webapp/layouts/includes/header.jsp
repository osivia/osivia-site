<%@ taglib prefix="p" uri="portal-layout"%>


<!-- Barre d'outils -->
<p:region regionName="toolbar" />

<header class="container">
    <div class="banner">
        <!-- Logo -->
        <p:region regionName="logo" />
        
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