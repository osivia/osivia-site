<%@ page import="org.jboss.portal.server.PortalConstants" %>
<%@ taglib uri="/WEB-INF/theme/portal-layout.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	   <title>Osivia - Editeur d'une solution globale de portail, ECM</title>
	   	<meta http-equiv="Content-Type" content="text/html;"/>
	   	<meta http-equiv="Content-language" content="fr-FR" />
		<meta name="author" content="Osivia Portal" />
		<meta name="copyright" content="Osivia" />
		<meta name="description" content="Osivia Portal est une plateforme globale de portail robuste, performante et flexible. Elle est normalis&eacute;e (J2EE, JSR286) et permet de r&eacute;pondre aux différentes attentes fonctionnelles et techniques du march&eacute; « Xnet, ECM » avec une orientation naturelle vers les clients disposant d’une organisation complexe." />
		<meta name="keywords" content="JSR286, JBoss, Nuxeo, Portal, Portail, GED, CMS, ECM, publish, e-commerce, content management, development framework" />
		<meta name="generator" content="Osivia Portal" />
	   <!-- to correct the unsightly Flash of Unstyled Content. -->
	   <script type="text/javascript"></script>
	   
	  <script type="text/javascript" src="/toutatice-portail-custom-web-assets/js/jquery.js"></script>	   


	   <p:headerContent/>

	   <link rel="stylesheet" id="settings_css" href="/toutatice-portail-custom-web-assets/common-css/common.css" type="text/css"/>
	   
	   
	   <p:theme themeName="osivia-site"/>
	   
	</head>

<body id="body">
<p:region regionName='AJAXScripts' regionID='AJAXScripts'/>

<div id="portal-container">
   <div id="sizer">
      <div id="expander">
      <div id="ligneentete">        
         <jsp:include page="../../header/logo.jsp" />
         
	        <div id="global_header">
		        	
		         <div id="header_utils"> 
			         <div id="header">
			         	<p:region regionName='toolbar' regionID='toolbar'/>	
			         	<p:region regionName="pageSettings" regionID="pageSettings"/> 	             
				             <div class="menu-et-recherche">
				             	<div class="navbar">
									<div class="navbar-inner">
				             			<jsp:include page="../../language/language.jsp" />            
								
								        <!-- navigation tabs and such -->
								        <p:region regionName='tabs' regionID='tabs'/>
 
								        <p:region regionName='search' regionID='search'/>

			             </div>
			           </div>
			          </div> 
			    	</div>
				</div>  
									 
			</div>
         </div>              
         
           <div id="content-container">
         <div class="container bottom-vert-pistache"">
         <div class="row">
			<div class="span12">
				<div class="row">
			          <div class="menu-gauche span2">
			             <p:region regionName='col1' regionID='regionCol1'/>
			          </div>
			          <div class="span10 span10-niv2">
						<div class="span6 span6-niv2 span6-niv2-max">
					        <p:region regionName='maximized' regionID='regionMaximized'/>
					    </div>
					    <div class="span3 span3-max">
					        <p:region regionName='col3' regionID='regionCol3'/>
					    </div>
					   </div>
					</div>
				</div>
			</div>
			</div>
         </div>
      </div>
   </div>


<p:region regionName='footer' regionID='footer'/>

<p:region regionName='AJAXFooter' regionID='AJAXFooter'/>
</div>
</body>
</html>
