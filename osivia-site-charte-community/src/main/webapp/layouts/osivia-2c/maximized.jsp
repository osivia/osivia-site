<!DOCTYPE html>
<%@taglib prefix="p" uri="/WEB-INF/portal-layout.tld"%>

<html>

<head>
<title>OSIVIA.org - Site communautaire du portail OSIVIA</title>

<meta charset="UTF-8">
<meta content="text">
<meta http-equiv="default-style" content="main_css">

<meta name="author" content="OSIVIA">
<meta name="description" content="OSIVIA Portal est une plateforme globale de portail robuste, performante et flexible.">
<meta name="keywords" content="JSR286, JBoss, Nuxeo, Portal, Portail, GED, CMS, ECM, publish, e-commerce, content management, development framework">

<p:headerContent />
<p:theme themeName="osivia-community" />
</head>

<body>
    <p:region regionName="AJAXScripts" regionID="AJAXScripts" />

    <div id="wrapper">
        <header>
            <!-- Barre d'outils -->
            <div id="toolbar-wrapper">
                <p:region regionName="toolbar" regionID="toolbar" />
            </div>
            
            <!-- Mode édition -->
            <div id="page-settings-wrapper">
                <p:region regionName="pageSettings" regionID="pageSettings" />
            </div>
            
            <!-- Recherche -->
            <p:region regionName="search" regionID="search" />
            
            <!-- Bannière et logo -->
            <div id="logo" class="container">
                <a id="banner" href="/portal"><span>OSIVIA Community</span></a>
                <h1><a href="/portal">.org</a></h1>
                <p>Site communautaire du portail OSIVIA</p>
            </div>
            
            <!-- Onglets -->
            <div id="menu-wrapper">
                <nav id="menu">
                    <p:region regionName='tabs' regionID='tabs' />
                </nav>
            </div>
            
            <!-- Breadcrumb -->
            <div class="container">
                <p:region regionName='breadcrumb' regionID='breadcrumb' />
            </div>
        </header>        
    
        <section class="container">
            <p:region regionName='notifications' regionID='notifications' />
        
            <div id="multi-columns">
                <div id="tbox2">
                    <p:region regionName='maximized' regionID='regionMaximized'/>
                </div>
            </div>
        </section>
    </div>

    <p:region regionName='footer' regionID='footer' />
    
    <p:region regionName='AJAXFooter' regionID='AJAXFooter' />
</body>

</html>
