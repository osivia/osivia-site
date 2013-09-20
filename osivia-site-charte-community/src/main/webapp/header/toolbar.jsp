<%@ page import="java.util.ResourceBundle" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
ResourceBundle rb = ResourceBundle.getBundle("Resource", request.getLocale());
%>

<c:choose>
    <c:when test="${empty requestScope['osivia.toolbar.principal']}">
        <div class="toolbar-content offline">
            <!-- Login -->
            <a href="${requestScope['osivia.toolbar.loginURL']}">
                <%=rb.getString("LOGIN") %>
            </a>
        </div>
    </c:when>
        
    <c:otherwise>
        <div class="toolbar-content">
            <!-- Administration -->
            <c:out value="${requestScope['osivia.toolbar.administrationContent']}" escapeXml="false" />
            
            <!-- Logout -->
            <a href="${requestScope['osivia.toolbar.signOutURL']}">
                ${requestScope['osivia.toolbar.principal'].name} - <%=rb.getString("LOGOUT") %>
            </a>
            
            <!-- Refresh page -->
            <a id="refresh-page" href="${requestScope['osivia.toolbar.refreshPageURL']}" title="<%=rb.getString("REFRESH_PAGE") %>">&nbsp;</a>
        </div>
    </c:otherwise>
</c:choose>
