<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout" %>

<html>

<head>
    <p:region regionName="header-metadata" />

	<p:headerContent />
	<p:theme themeName="osivia-community" />
</head>

<body class="with-drawer">
    <!-- Barre d'outils -->
    <p:region regionName="toolbar" />

    <!-- Header -->
    <header class="container-fluid">
        <!-- Banni�re -->
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
                    <!-- Menu -->
                    <div id="drawer">
                        <div class="col-sm-6">
                            <p:region regionName="col1" />
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-6">
                        <p:region regionName="col2" />
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
