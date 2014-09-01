
<%
    String httpError = request.getParameter("httpCode");
    if (httpError != null) {
        try {
            int httpCode = Integer.parseInt(httpError);
            response.setStatus(httpCode);
        } catch (Exception e) {

        }
    }
    String msg = "Une erreur est survenue";

    if ("404".equals(httpError))
        msg = "Ressource non trouvée";
    if ("403".equals(httpError))
        msg = "Accès interdit";

    String urlAccueil = "/portal/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Société Osivia</title>
<meta content="text/html;" http-equiv="Content-Type">
<!-- to correct the unsightly Flash of Unstyled Content. -->
<script type="text/javascript"></script>


<link type="text/css"
	href="/osivia-portal-custom-web-assets/css/bootstrap.custom.min.css"
	id="settings_css" rel="stylesheet">
<link href="/osivia-site-charte-community/themes/osivia-site.min.css"
	type="text/css" rel="stylesheet">
<link href="/osivia-site-charte-community/themes/tiles.css"
	type="text/css" rel="stylesheet">

<link
	href="/osivia-site-charte-community/themes/glissade/images/favicon/favicon.ico"
	type="image/x-icon" rel="shortcut icon">

</head>

<body>
	<div id="wrapper">
		<header>
		
			<!-- Bannière et logo -->
			<div class="container-fluid">
				<div class="pull-left">
					<h1>
						<a href="/portal"> <img
							src="/osivia-site-charte-community/themes/glissade/images/logo-osivia.png"
							alt=""> <span>OSIVIA.org</span>
						</a> <small>Site communautaire du portail OSIVIA</small>
					</h1>
				</div>

			</div>

			<!-- Onglets -->
			<div id="menu-wrapper">
				<nav id="menu">&nbsp;</nav>
			</div>
		</header>


		<div class="wrapper-outer">
			<div class="wrapper-inner">
				<div class="container-fluid">
					<section class="container">

						<span id="error-container"><%=msg%> <!-- <%=request.getParameter("err")%> -->
							<!-- <%=httpError%> --></span>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>

</html>