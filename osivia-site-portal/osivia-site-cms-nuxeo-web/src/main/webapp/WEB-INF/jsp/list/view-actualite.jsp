<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="internationalization" prefix="is"%>
<%@ taglib uri="toutatice" prefix="ttc"%>

<%@ page isELIgnored="false"%>


<ul class="list-unstyled list-group">
    <c:forEach var="document" items="${documents}">
        <!-- Document properties -->
        <c:set var="url"><ttc:documentLink document="${document}" /></c:set>
        <c:set var="vignetteURL"><ttc:getImageURL document="${document}" property="ttc:vignette" /></c:set>
        <c:set var="description" value="${document.properties['dc:description']}" />
        <c:set var="date" value="${document.properties['dc:created']}" />
    
    
        <li>
            <article class="actualite clearfix">
                <h3 class="h4">
                    <!-- Vignette -->
                    <c:if test="${not empty vignetteURL}">
                        <a href="${url}" class="vignette pull-left">
                            <img src="${vignetteURL}" />
                        </a>
                    </c:if>
                    
                    <!-- Title -->
                    <a href="${url}" class="title">${document.title}</a>
                </h3>
                
                <!-- Date -->
                <p class="date"><fmt:formatDate value="${date}" dateStyle="medium"/></p>
                
                <!-- Description -->
                <p class="description">${description}</p>
            </article>
        </li>
    </c:forEach>
</ul>
