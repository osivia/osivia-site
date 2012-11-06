<%
String httpError =  request.getParameter("httpCode") ;
if (httpError != null)	{
	try	{
	int httpCode = Integer.parseInt(httpError);
	response.setStatus( httpCode);
	} catch( Exception e){
		
	}
}
String msg = "Une erreur est survenue";

if( "404".equals (httpError))
	msg = "Ressource non trouvée";
if( "403".equals (httpError))
	msg = "Accès interdit";

String urlAccueil = "/portal/";

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	   <title>Société Osivia</title>
	   <meta content="text/html;" http-equiv="Content-Type">
	   <!-- to correct the unsightly Flash of Unstyled Content. -->
	   <script type="text/javascript"></script>
	   
	   
	   <link type="text/css" href="/toutatice-portail-custom-web-assets/common-css/common.css" id="settings_css" rel="stylesheet">
	   <link href="/osivia-portail-charte/themes/atomo/main.css" id="main_css" type="text/css" rel="stylesheet">
	   <link rel="stylesheet" href="/osivia-portail-charte/themes/atomo/bootstrap.css" type="text/css"/>
	   <link rel="stylesheet" href="/osivia-portail-charte/themes/atomo/osivia.css" type="text/css"/>
	   <link href="/osivia-portail-charte/themes/atomo/images/favicon/favicon.ico" type="image/x-icon" rel="shortcut icon">
	   
</head>

<body id="body">

<div id="portal-container">
   <div id="sizer">
      <div id="expander">
         <div id="ligneentete">      
         	<div class="navbar">
				<div class="navbar-inner">
	    			<h1><a class="brand" href="<%= urlAccueil %>"><img src="/osivia-portail-charte/themes/atomo/images/logo-osivia.jpg" id="logo-entete" alt="Logo Osivia" title="Logo Osivia"/></a></h1>
				</div>
			</div>
         
         <div id="global_header">
		 	<div id="header_utils"> 
				<div id="header">
					<p:region regionName='toolbar' regionID='toolbar'/>	
					<p:region regionName="pageSettings" regionID="pageSettings"/>	
        		</div> 
        	</div>
        </div>
        <div id="content-container-error">
             <span id="error-container"><%= msg %> <!-- <%= request.getParameter("err") %> --> <!-- <%= httpError %> --></span>
      </div>
   </div>
</div>

<div>
<footer>
	 <div class="derniere-ligne">
		<div class="row">
			<div class="offset1 span7">
				<ul>
					<li>
                    	<a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fosivia%252Fsites%252Fmentions-legales.1351064807797&permLinkType=cms&action=permLink">Mentions Légales</a>
                    </li>
                    <li>
                        <a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fosivia%252Fsites%252Fcredit.1351065175907&permLinkType=cms&action=permLink">Crédit</a>
                   	</li>
                   	<li>
                    	<a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fcontact&permLinkType=cms&action=permLink">Nous contacter</a>
                    </li>
				</ul>
			</div>
		</div>
	</div>
</footer>
</div>



</body></html>