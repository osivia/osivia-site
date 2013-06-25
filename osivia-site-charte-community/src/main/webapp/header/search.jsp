<%@page import="java.util.ResourceBundle"%>
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
ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
String searchUrl = (String) request.getAttribute(Constants.ATTR_SEARCH_URL);   

%>


<script type="text/javascript">
function onsubmitGlobalSearch(form) {
   var searchUrl = "<%=searchUrl%>";
   
   searchUrl = searchUrl.replace("__REPLACE_KEYWORDS__", form.keywords.value);
   form.action = searchUrl;
}
</script>

<form onsubmit="return onsubmitGlobalSearch(this);" method="post">
    <input type="text" id="search-text" name="keywords" placeholder="<%=rb.getString("SEARCH_PLACEHOLDER") %>">
    <button type="submit" id="search-submit"><%=rb.getString("SEARCH_SUBMIT") %></button>
</form>

