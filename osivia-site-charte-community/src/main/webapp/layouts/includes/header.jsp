<%@ taglib prefix="p" uri="portal-layout"%>


<!-- Barre d'outils -->
<p:region regionName="toolbar" />

<!-- Header -->
<header class="container-fluid hidden-xs">
    <!-- Bannière -->
    <div class="clearfix">
        <!-- Logo -->
        <div class="pull-left">
            <h1>
                <a href="/">
                    <img src="/osivia-site-charte-community/img/logo-osivia.png" alt="">
                    <span>OSIVIA.org</span>
                </a>
                
                <small>Site communautaire du portail OSIVIA</small>
            </h1>
        </div>

        <!-- Recherche -->
        <p:region regionName="search" />
    </div>

    <!-- Onglets -->
    <p:region regionName="tabs" />
</header>
