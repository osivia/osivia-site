<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout" %>

<html>

<head>
    <p:region regionName="header-metadata" />
    
    <meta http-equiv="default-style" content="OSIVIA.org">

	<p:headerContent />
	<p:theme themeName="osivia-community" />
</head>

<body class="with-drawer">
    <!-- Barre d'outils -->
    <p:region regionName="toolbar" />

    <!-- Header -->
    <header class="container-fluid">
        <!-- Bannière -->
        <div class="clearfix">
            <!-- Logo -->
            <p:region regionName="logo" />

            <!-- Recherche -->
            <p:region regionName="search" />
        </div>

        <!-- Onglets -->
        <p:region regionName="tabs" />
    </header>

    <div class="wrapper-outer">
        <div class="wrapper-inner">
            <div class="container-fluid">
                <!-- Notifications -->
                <p:region regionName="notifications" />
                <!-- Breadcrumb -->
                <p:region regionName="breadcrumb" />
        
                <div class="row">
                    <div id="drawer">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <p:region regionName="col1" />
                        </div>
                    </div>
                    
                    <div class="col-sm-7 col-md-8 col-lg-9">
                        <p:region regionName="maximized" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="container-fluid">
        <p:region regionName="footer" />
    </footer>


    <!-- AJAX scripts -->
    <p:region regionName="AJAXScripts" />
    <!-- AJAX footer -->
    <p:region regionName="AJAXFooter" />    
    <!-- Page settings -->
    <p:region regionName="pageSettings" />
</body>

</html>
