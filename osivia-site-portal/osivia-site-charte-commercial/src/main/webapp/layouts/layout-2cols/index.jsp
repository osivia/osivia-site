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


<body class="with-drawer">
    <!-- Barre d'outils -->
    <p:region regionName="toolbar" />
    
    <header class="container">
        <!-- Bannière -->
        <p:region regionName="banner" />
        
        <div class="navigation-bar">
            <!-- Navigation top menu -->
            <div class="navigation-top-menu">
                <p:region regionName="top-menu" regionID="navigation-menu" cms="false" />
            </div>
            
            <!-- Recherche -->
            <div class="navigation-search">
                <p:region regionName="search" />
            </div>
            
            <div class="navigation-line"></div>
        </div>
    </header>
    
     <div class="wrapper-outer">
        <div class="wrapper-inner">
            <div id="page-content" class="container">
                <!-- Notifications -->
                <p:region regionName="notifications" />
        
                <div class="row">
                    <!-- Menu -->
                    <div id="drawer">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <p:region regionName="col1" cms="false" />
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-7 col-md-8 col-lg-9">
                        <p:region regionName="col2" cms="true" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Footer -->
    <footer class="container">
        <p:region regionName="footer-navigation" cms="false" />
    </footer>
    
    
    <!-- AJAX scripts -->
    <p:region regionName="AJAXScripts" />
    <!-- AJAX footer -->
    <p:region regionName="AJAXFooter" />    
    <!-- Page settings -->
    <p:region regionName="pageSettings" />

</body>

</html>
