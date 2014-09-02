<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="internationalization" prefix="is" %>


<%@ page isELIgnored="false" %>


<div class="btn-toolbar">
    <div class="btn-group">
        <c:forEach var="doc" items="${docs}">
            <c:set var="doc" value="${doc}" scope="request" />
            <jsp:include page="view-shortcut-item.jsp" />
        </c:forEach>
    </div>
</div>
