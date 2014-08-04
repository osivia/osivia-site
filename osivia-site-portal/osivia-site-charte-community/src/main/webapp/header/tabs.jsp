<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="internationalization" prefix="is" %>


<c:set var="userPages" value="${requestScope['osivia.userPortal'].userPages}" />


<nav role="navigation">
    <h2 class="hidden"><is:getProperty key="TABS_TITLE" /></h2>

    <ul class="tabs-menu">
        <c:forEach var="userPage" items="${userPages}" varStatus="status">
            <c:if test="${'templates' != fn:toLowerCase(userPage.name)}">
                <c:set var="active" value="" />
                <c:if test="${userPage.id == requestScope['osivia.currentPageId']}">
                    <c:set var="active" value="active" />
                </c:if>
                
                <li>
                    <a href="${userPage.url}" class="btn ${active}">
                        <span class="tabs-title">${userPage.name}</span>
                    </a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</nav>
