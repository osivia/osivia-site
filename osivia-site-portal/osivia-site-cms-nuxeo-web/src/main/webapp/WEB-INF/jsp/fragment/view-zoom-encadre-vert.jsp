<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<article class="encadre vert clearfix">
    <!-- Title -->
    <h3 class="h4 text-right">
        <a href="${url}">${title}</a>
    </h3>
    
    <!-- Picture -->
    <c:if test="${not empty imageSource}">
        <p>
            <img src="${imageSource}" alt="" class="img-responsive center-block" />
        </p>
    </c:if>
    
    <!-- Content -->
    <c:if test="${not empty content}">
        <div class="lead">${content}</div>
    </c:if>
</article>
