<%@page import="org.osivia.portal.api.theming.UserPage" %>
<%@page import="org.osivia.portal.api.theming.UserPortal" %>
<%@page import="org.osivia.portal.api.theming.Breadcrumb"%>
<%@page import="org.osivia.portal.api.theming.BreadcrumbItem"%>
<%@page import="java.util.List"%>

<%

StringBuffer url = new StringBuffer();
url.append("/");
url.append(request.getRequestURI().split("/")[1]);
url.append("/");
String urlAccueil = url.toString();

%>
<!-- Google Analytic -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35816865-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>

<div class="navbar">
    <div class="navbar-links">
        <a href="http://www.osivia.org/portal/cms/default-domain/community-ws/documentation" target="_blank">Doc.</a>
        <a href="http://demo.osivia.org" target="_blank">Démo</a>
        <a href="http://www.osivia.org/portal/cms/default-domain/community-ws/telechargements" target="_blank">Téléchargements</a>
    </div>

	<div class="navbar-inner">
	    <h1><a class="brand" href="<%= urlAccueil %>"><img src="/osivia-site-charte/themes/atomo/images/logo-osivia.jpg" id="logo-entete" alt="Logo Osivia" title="Logo Osivia"/></a></h1>
	</div>
</div>
