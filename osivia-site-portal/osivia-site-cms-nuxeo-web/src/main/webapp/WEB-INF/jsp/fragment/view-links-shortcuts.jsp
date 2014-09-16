<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<div class="btn-toolbar">
    <div class="btn-group">
        <c:forEach var="link" items="${links}">
            <a href="${link.href}" class="btn btn-default" target="_blank">
                <c:if test="${not empty link.icon}">
                    <i class="glyphicons ${link.icon}"></i>
                </c:if>
                
                <span>${link.title}</span>
            </a>
        </c:forEach>
    </div>
</div>
