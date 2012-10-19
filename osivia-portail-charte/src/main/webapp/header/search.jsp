<%@page import="java.util.List"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>

<%@page import="fr.toutatice.portail.api.urls.IPortalUrlFactory"%>
<%@page import="fr.toutatice.portail.api.contexte.PortalControllerContext"%>


<%


String searchUrl = (String) request.getAttribute("pia.searchUrl");   

IPortalUrlFactory urlFactory = (IPortalUrlFactory) request.getAttribute("pia.urlfactory");
PortalControllerContext ctx =  (PortalControllerContext) request.getAttribute("pia.ctrlctx");

Map<String, String> props = new HashMap<String, String>();
Map<String, String> params = new HashMap<String, String>();

String advancedSearchUrl = urlFactory.getStartPageUrl(ctx, "/default", "advanced_search", "/default/templates/advanced_search", props, params);
%>


<script type="text/javascript">
function onsubmitGlobalSearch( form)
{
   var searchUrl = "<%=searchUrl%>";
   
   searchUrl = searchUrl.replace("__REPLACE_KEYWORDS__", form.keywords.value);
   form.action = searchUrl;

}
</script>

<div class="ligne-recherche">
	<form class="form-search" onsubmit="return onsubmitGlobalSearch( this);" method="post">
		<div class="input-append">
			<input type="text" class="span2 search-query" placeholder="RECHERCHER">
				<button type="submit" class="btn">VALIDER</button>
		</div>
	</form>
</div>


		<!-- <form onsubmit="return onsubmitGlobalSearch( this);" method="post">
		 <span class="search">
			<input class="inputSearch" type="text" size="10" value=" RECHERCHER" name="keywords">&nbsp;&nbsp;<input type="submit" value=" VALIDER">
		 </span>
		</form> -->
		

