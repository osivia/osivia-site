<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<div class="btn-toolbar">
    <div class="btn-group">
        <c:forEach var="link" items="${links}">
            <c:remove var="target" />
            <c:if test="${link.external}">
                <c:set var="target" value="_blank" />
            </c:if>
        
            <a href="${link.url}" target="${target}" class="btn btn-default">
                <c:if test="${not empty link.glyphicon}">
                    <i class="glyphicons ${link.glyphicon}"></i>
                </c:if>
                
                <span>${link.title}</span>
            </a>
        </c:forEach>
    </div>
</div>
