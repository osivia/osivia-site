<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout" %>

<html>

<head>
	<title>OSIVIA.org - Site communautaire du portail OSIVIA</title>
	
	<meta charset="UTF-8">
	<meta content="text">
	<meta http-equiv="default-style" content="main_css">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">	
	
	<meta name="author" content="OSIVIA">
	<meta name="description" content="OSIVIA Portal est une plateforme globale de portail robuste, performante et flexible.">
	<meta name="keywords" content="JSR286, JBoss, Nuxeo, Portal, Portail, GED, CMS, ECM, publish, e-commerce, content management, development framework">
	
	<p:headerContent />
	<p:theme themeName="osivia-community" />
</head>

<body class="with-drawer">
    <!-- Barre d'outils -->
    <p:region regionName="toolbar" />

	<div id="wrapper">
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
	                    <!-- Menu -->
	                    <div id="drawer">
	                        <div class="col-sm-12">
	                            <p:region regionName="maximized" regionID="col1" />
	                        </div>
	                    </div>

	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    <!-- Footer -->
    <footer class="container-fluid">
    	
    	<p:region regionName='footer' />
    	
    </footer>

    
    <!-- AJAX scripts -->
    <p:region regionName="AJAXScripts" />
    <!-- AJAX footer -->
    <p:region regionName="AJAXFooter" />    
    <!-- Page settings -->
    <p:region regionName="pageSettings" />
</body>

</html>
