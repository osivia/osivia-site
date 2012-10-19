<%@ page import="org.jboss.portal.server.PortalConstants" %>
<%@ taglib uri="/WEB-INF/theme/portal-layout.tld" prefix="p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	   <title>Soci�t� Osivia</title>
	   <meta http-equiv="Content-Type" content="text/html;"/>
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
				                  
				             <div id="spacer"></div>
			             </div>
			           </div>
			          </div> 
			    	</div>
				</div>  
									 
			</div>
         </div>
         
         <p:region regionName='breadcrumb' regionID='breadcrumb'/>
                 
         <div id="content-container">
         <div class="container">
         <div class="row">
			<div class="span12 bottom-vert-pistache">
				<div class="row">
			          <div class="menu-gauche span2">
			             <p:region regionName='col1' regionID='regionCol1'/>
			          </div>
			          <div class="span10">
				          	<div class="col col-left-niv3">
						       <p:region regionName='col2' regionID='regionCol2'/>
						    </div>
						    <div class="col col-right-niv3">
						       <p:region regionName='col3' regionID='regionCol1'/>
						    </div>
						    <div class="lgn-niv3">
		               			<p:region regionName='lgn1' regionID='regionLgn1'/>
		            		</div>
					   </div>
					</div>
				</div>
			</div>
			</div>
            <hr class="cleaner"/>
         </div>
      </div>
   </div>
</div>

<p:region regionName='footer' regionID='footer'/>

<p:region regionName='AJAXFooter' regionID='AJAXFooter'/>

</body>
</html>