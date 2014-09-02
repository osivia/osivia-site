<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout"%>


<html>

<head>
    <p:region regionName="header-metadata" />

    <meta charset="UTF-8">
    <meta content="text">
    <meta http-equiv="default-style" content="main_css">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    
    <p:headerContent />
    <p:theme themeName="osivia-site-charte-commercial" />
</head>


<body>
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
    

    <div id="page-content" class="container">
        <!-- Notifications -->
        <p:region regionName="notifications" />

        <p:region regionName="center" cms="true" />

        <!-- Layout line separator -->
        <div class="line-separator"></div>

        <div class="row">
            <div class="col-sm-6">
                <p:region regionName="col1" cms="true" />
            </div>
            
            <div class="col-sm-6">
                <p:region regionName="col2" cms="true" />
            </div>
        </div>
    </div>
    
        
    <!-- Footer -->
    <footer class="container">
        <p:region regionName="footer-navigation" cms="true" />
    </footer>
    
    
    <!-- AJAX scripts -->
    <p:region regionName="AJAXScripts" />
    <!-- AJAX footer -->
    <p:region regionName="AJAXFooter" />    
    <!-- Page settings -->
    <p:region regionName="pageSettings" />

</body>

</html>
