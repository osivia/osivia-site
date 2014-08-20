<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<ul class="list-unstyled">
    <c:set var="childLevel" value="${level + 1}" />

    <c:forEach var="child" items="${parent.children}">
        <!-- External link ? -->
        <c:remove var="target" />
        <c:if test="${child.external}">
            <c:set var="target" value="_blank" />
        </c:if>
        
        <!-- Current item ? -->
        <c:remove var="current" />
        <c:if test="${child.current}">
            <c:set var="current" value="active" />
        </c:if>
    
    
        <li class="${current}">
            <!-- Link -->
            <a href="${child.url}" target="${target}">            
                <span>${child.title}</span>
                <c:if test="${child.external}">
                    <span class="glyphicon glyphicon-new-window"></span>
                </c:if>
            </a>
            
            <c:if test="${not empty child.children}">
                <c:set var="parent" value="${child}" scope="request" />
                <c:set var="level" value="${childLevel}" scope="request" />
                <jsp:include page="display-items.jsp" />
            </c:if>
        </li>
    </c:forEach>
</ul>