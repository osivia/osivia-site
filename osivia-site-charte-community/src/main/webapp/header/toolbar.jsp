<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="internationalization" prefix="is"%>

<c:set var="appsLogout"
	value="${requestScope['osivia.site.customizer.applications']}" />



<div class="toolbar-content">
	<div class="toolbar-fixed-content">
		<c:choose>
			<c:when test="${empty requestScope['osivia.toolbar.principal']}">
				<!-- Login -->
				<a href="${requestScope['osivia.toolbar.loginURL']}"><is:getProperty
						key="LOGIN" /></a>
			</c:when>
			<c:otherwise>
				<!-- Administration -->
				<c:out
					value="${requestScope['osivia.toolbar.administrationContent']}"
					escapeXml="false" />

				<script type="text/javascript">
					function callLogout() {

						$JQry('#msglogout').show();

						var delog = '';

						<c:forEach var="app" items="${appsLogout}" varStatus="status" >
						delog = delog + "<img src=\"${app}\" />";
						</c:forEach>


						$('deco').update(delog);



						window.setTimeout("portalLogout()", 3000)

					}

					function portalLogout() {
						document.location = "${requestScope['osivia.toolbar.signOutURL']}";
					}
				</script>
				<div id="deco"></div>

				<div id="msglogout">
					<p>
						<is:getProperty key="LOGOUT_MESSAGE" />
					</p>
				</div>



				<a href="#" class="logout" onclick="callLogout();">${requestScope['osivia.toolbar.principal'].name}
					- <is:getProperty key="LOGOUT" />
				</a>
				<!-- Refresh page -->
				<a id="refresh-page"
					href="${requestScope['osivia.toolbar.refreshPageURL']}"
					title='<is:getProperty key="REFRESH_PAGE" />'></a>
			</c:otherwise>
		</c:choose>
	</div>
</div>

