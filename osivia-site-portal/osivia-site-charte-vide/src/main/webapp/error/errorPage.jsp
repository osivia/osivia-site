
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
<meta
    content="text/html;"
    http-equiv="Content-Type">
<!-- to correct the unsightly Flash of Unstyled Content. -->
<script type="text/javascript"></script>


<link
    type="text/css"
    href="/osivia-portal-custom-web-assets/common-css/common.css"
    id="settings_css"
    rel="stylesheet">
<link
    href="/osivia-site-charte-community/themes/glissade/style.css"
    type="text/css"
    rel="stylesheet">
<link
    href="/osivia-site-charte-community/themes/glissade/images/favicon/favicon.ico"
    type="image/x-icon"
    rel="shortcut icon">

</head>

<body>
    <div id="wrapper">
        <header>
            <!-- Bannière et logo -->
            <div
                id="logo"
                class="container">
                <a
                    id="banner"
                    href="/portal"><span>OSIVIA Community</span></a>
                <h1>
                    <a href="/portal">.org</a>
                </h1>
                <p>Site communautaire du portail OSIVIA</p>
            </div>

            <!-- Onglets -->
            <div id="menu-wrapper">
                <nav id="menu">&nbsp;</nav>
            </div>
        </header>

        <section class="container">
            <div id="one-column">
                <div id="tbox1">
                    <div id="content-container-error">
                        <span id="error-container"><%=msg%> <!-- <%=request.getParameter("err")%> --> <!-- <%=httpError%> --></span>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>