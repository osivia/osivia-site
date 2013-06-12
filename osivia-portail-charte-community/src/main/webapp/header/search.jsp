<%@page import="org.osivia.portal.api.Constants"%>
<%@page import="java.util.List"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>

<%@page import="org.osivia.portal.api.urls.IPortalUrlFactory"%>
<%@page import="org.osivia.portal.api.contexte.PortalControllerContext"%>


<%
String searchUrl = (String) request.getAttribute(Constants.ATTR_SEARCH_URL);   

IPortalUrlFactory urlFactory = (IPortalUrlFactory) request.getAttribute(Constants.ATTR_URL_FACTORY);
PortalControllerContext ctx =  (PortalControllerContext) request.getAttribute(Constants.ATTR_PORTAL_CTX);

Map<String, String> props = new HashMap<String, String>();
Map<String, String> params = new HashMap<String, String>();
%>


<script type="text/javascript">
function onsubmitGlobalSearch( form)
{

   var searchUrl = "<%=searchUrl%>";
   
   searchUrl = searchUrl.replace("__REPLACE_KEYWORDS__", form.keywords.value);
   form.action = searchUrl;
   

}
</script>

<form onsubmit="return onsubmitGlobalSearch(this);" method="post">
    <input type="text" id="search-text" name="keywords" placeholder="RECHERCHER">
    <button type="submit" id="search-submit">OK</button>
</form>


<!-- <form onsubmit="return onsubmitGlobalSearch( this);" method="post">
		 <span class="search">
			<input class="inputSearch" type="text" size="10" value=" RECHERCHER" name="keywords">&nbsp;&nbsp;<input type="submit" value=" VALIDER">
		 </span>
     </form> -->


