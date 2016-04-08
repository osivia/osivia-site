<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<c:if test="${external}">
    <c:set var="target" value="_blank" />
</c:if>


<article class="reference clearfix">
    <!-- Title -->
    <h3 class="h4 text-right">
        <a href="${url}" target="${target}" class="no-ajax-link">${title}</a>
    </h3>
    
    <!-- Picture -->
    <c:if test="${not empty imageSource}">
        <p>
            <img src="${imageSource}" alt="" class="img-responsive center-block" />
        </p>
    </c:if>
    
    <!-- Content -->
    <c:if test="${not empty content}">
        <div>${content}</div>
    </c:if>
</article>
