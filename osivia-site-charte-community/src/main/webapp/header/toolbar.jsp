<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="internationalization" prefix="is"%>

<%
ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
%>


<c:set var="appsLogout" value="${requestScope['osivia.site.customizer.applications']}" />


<script type="text/javascript">
function callLogout() {
	
	var $jq = jQuery.noConflict();
	$jq('#msglogout').show();
	
	var delog = '';
	
	<c:forEach var="app" items="${appsLogout}" varStatus="status" >
		delog = delog + "<img src=\"${app}\" />" ;
	</c:forEach>
	
	$jq('deco').append(delog);
	window.setTimeout("portalLogout()",3000)
}

function portalLogout() {
	document.location="${requestScope['osivia.toolbar.signOutURL']}";
}

</script>

<div class="toolbar-content">
    <div class="toolbar-fixed-content">
        <c:choose>
            <c:when test="${empty requestScope['osivia.toolbar.principal']}">
                <!-- Login -->
                <a href="${requestScope['osivia.toolbar.loginURL']}"><is:getProperty key="LOGIN" /></a>
            </c:when>

                <!-- Logout -->
                <a href="#" onclick="callLogout();">
                	<img src="${requestScope['osivia.toolbar.principal.avatar.url'].url}" alt="avatar"/>
                
                	${requestScope['osivia.toolbar.principal.alias']} - <is:getProperty key="LOGOUT" /></a>

                <!-- Refresh page -->
                <a id="refresh-page" href="${requestScope['osivia.toolbar.refreshPageURL']}" title='<is:getProperty key="REFRESH_PAGE" />'></a>
            </c:otherwise>
        </c:choose>
    </div>
</div>


<div id="deco" style="display:inline"></div>

<div id="msglogout">
	<p><is:getProperty key="LOGOUT_MESSAGE" /></p>
</div>
