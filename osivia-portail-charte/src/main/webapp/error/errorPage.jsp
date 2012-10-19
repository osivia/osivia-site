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
%>


<html xmlns="http://www.w3.org/1999/xhtml"><head>



	
	   <title>Test charte</title>
	   <meta content="text/html;" http-equiv="Content-Type">
	   <!-- to correct the unsightly Flash of Unstyled Content. -->
	   <script type="text/javascript"></script>
	   
	   
	   <link type="text/css" href="/toutatice-portail-custom-web-assets/common-css/common.css" id="settings_css" rel="stylesheet">
	   <link href="/toutatice-portail-demo-charte/themes/atomo/main.css" id="main_css" type="text/css" rel="stylesheet">
	   
	</head><body id="body">

<link type="text/css" href="/portal-ajax/dyna/style.css" id="dyna_css" rel="stylesheet">



<div id="portal-container">
   <div id="sizer">
      <div id="expander">
         <div id="ligneentete">      
         	<jsp:include page="../header/logo.jsp" />
         
         <table cellspacing="0" cellpadding="0" border="0" id="header-container">
            <tbody><tr> 
               <td valign="top" align="center" id="header">
                   
                  <div class="dyna-region"><div id="pageSettings"></div></div>
                  
                  <div id="spacer"></div>
               </td>
            </tr>
         </tbody></table>
        </div> 
        <div id="content-container">
            <table width="100%">
              <tr>
                <td width="100%"  align="center" height="300px" valign="middle">
                 	<div id="error-container"><%= msg %> <!-- <%= request.getParameter("err") %> --> <!-- <%= httpError %> --></div>
                </td>
                </tr>
            </table>
            <hr class="cleaner"/>
         </div>
      </div>
   </div>
</div>

<div class="portal-copyright" id="footer-container">Démo PIA</div>




</body></html>