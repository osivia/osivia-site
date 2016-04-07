<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.osivia.org/jsp/taglib/osivia-portal" prefix="op" %>


<c:set var="userPortal" value="${requestScope['osivia.userPortal']}" />
<c:set var="userPages" value="${userPortal.userPages}" />
<c:set var="currentId" value="${requestScope['osivia.currentPageId']}" />


<nav class="tabs tabs-community" role="navigation">
    <!-- Title -->
    <h2 class="hidden"><op:translate key="TABS_TITLE" /></h2>

    
    <!-- Tabs -->
    <ul>
        <c:forEach var="userPage" items="${userPages}">
            <li role="presentation"
                <c:if test="${userPage.id eq currentId}">class="active"</c:if>
            >
                <a href="${userPage.url}">
                    <span>${userPage.name}</span>
                </a>
            </li>
        </c:forEach>
    </ul>
</nav>
