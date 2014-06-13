<!DOCTYPE html>
<%@taglib prefix="p" uri="/WEB-INF/portal-layout.tld"%>

<head>

<meta charset="UTF-8">
<meta content="text">
<meta http-equiv="default-style" content="main_css">

<p:headerContent />
<p:theme themeName="vide" />

</head>


<html>

<body>
    <p:region regionName="AJAXScripts" regionID="AJAXScripts" />

    <header>
        <!-- Barre d'outils -->
        <p:region regionName="toolbar" regionID="toolbar" />
        
        <!-- Recherche -->
        <p:region regionName="search" regionID="search" />
        
        <!-- Onglets -->
        <nav>
            <p:region regionName='tabs' regionID='tabs' />
        </nav>
        
        <!-- Breadcrumb -->
        <p:region regionName='breadcrumb' regionID='breadcrumb' />
    </header>        

    <section class="container">
        <p:region regionName='maximized' regionID='regionMaximized'/>
    </section>

    <p:region regionName='footer' regionID='footer' />
    
    <p:region regionName='AJAXFooter' regionID='AJAXFooter' />

    <p:region regionName="pageSettings" regionID="pageSettings" />
    
</body>

</html>
