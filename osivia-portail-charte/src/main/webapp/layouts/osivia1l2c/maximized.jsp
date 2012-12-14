<%@ page import="org.jboss.portal.server.PortalConstants" %>
<%@ taglib uri="/WEB-INF/theme/portal-layout.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <title>Osivia - Editeur d'une solution globale de portail, ECM</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta http-equiv="pragma" content="no-cache" />
		
		
		<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
		<meta name="DC.Title" content="Osivia - Editeur d'une solution globale de portail, ECM" />
		<meta name="DC.Creator" content="Osivia" />
		<meta name="DC.Subject" lang="fr-FR" content="" />
		<meta name="DC.Description" lang="fr-FR" content="" />
		<meta name="DC.Publisher" content="Osivia" />
		<meta name="DC.Date.created" scheme="W3CDTF" content="20121120" />
		<meta name="DC.Date.modified" scheme="W3CDTF" content="20121126" />
		<meta name="DC.Language" scheme="RFC3066" content="fr-FR" />
		<meta name="DC.Rights" content="Copyright &copy; Osivia" />

	

		<meta name="author" lang="fr-FR" content="Osivia" />
		<meta name="keywords" content="JSR286, JBoss, Nuxeo, Portal, Portail, GED, CMS, ECM, publish, e-commerce, content management, development framework" />
		<meta name="description" content="Osivia Portal est une plateforme globale de portail robuste, performante et flexible." />
		<meta name="Date-Creation-yyyymmdd" content="20121120" />
		<meta name="Date-Revision-yyyymmdd" content="20121126" />
		<meta name="copyright" content="Copyright &copy; Osivia" />
		<meta name="reply-to" content="contact@osivia.com" />
		<meta name="category" content="Internet" />
		<meta name="robots" content="index, follow" />
		<meta name="distribution" content="global" />
		<meta name="identifier-url" content="http://www.osivia.com/" />
		<meta name="resource-type" content="document" />
		<meta name="expires" content="-1" />
		<meta name="Generator" content="Osivia Portal" />
		<meta name="Formatter" content="Osivia Portal" />
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
      <div class="container">
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
         </div>
         
         <div id="content-container">
	         	<div style="width:100%">
	               <p:region regionName='lgn1' regionID='regionLgn1'/>
	            </div>
	     <div class="container bottom-vert-pistache">
	     	<div class="row">
				<div class="span12">
					<div class="">
						<div class="row"> 
	            		<div class="offset1 span10"> 
			               	<p:region regionName='maximized' regionID='regionMaximized'/>
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
