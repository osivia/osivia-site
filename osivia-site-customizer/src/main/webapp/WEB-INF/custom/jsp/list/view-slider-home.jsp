<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.osivia.org/jsp/taglib/osivia-portal" prefix="op" %>
<%@ taglib uri="http://www.toutatice.fr/jsp/taglib/toutatice" prefix="ttc" %>

<%@ page isELIgnored="false"%>


<div class="bxslider-container">
    <ul class="list-unstyled bxslider bxslider-com clearfix">
        <c:forEach var="document" items="${documents}" varStatus="status">
            <!-- Document properties -->
            <c:set var="description" value="${document.properties['dc:description']}" />
            <c:set var="content"><ttc:transform document="${document}" property="note:note"/></c:set>
            <c:set var="imageURL"><ttc:pictureLink document="${document}" property="annonce:image" /></c:set>
        
        
            <li class="bxslider-slide">
                <article class="clearfix">
                    <div class="col-sm-6">
                        <!-- Titles -->
                        <c:forEach var="innerDocument" items="${documents}" varStatus="innerStatus">
                            <c:set var="rowClass" value="hidden-noscript" />
                            <c:if test="${innerStatus.index == status.index}">
                                <c:set var="rowClass" value="active" />
                            </c:if>
                            
                            <c:set var="titleClass" value="h3" />
                            <c:if test="${innerStatus.first}">
                                <c:set var="titleClass" value="h2" />
                            </c:if>
                        
                            <div class="row title ${rowClass}">
                                <div class="col-sm-11 col-sm-offset-1">
                                    <!-- Title -->
                                    <c:choose>
                                        <c:when test="${innerStatus.index == status.index}">
                                            <h3 class="${titleClass}">${innerDocument.title}</h3>
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <p class="${titleClass}">
                                                <a href="#" onclick="goToSlide(event, ${innerStatus.index})" class="no-ajax-link">${innerDocument.title}</a>
                                            </p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    
                        
                        <!-- Text -->
                        <div class="row content">
                            <div class="col-sm-11 col-sm-offset-1">
                                <!-- Description -->
                                <c:if test="${not empty description}">
                                    <p class="lead">${description}</p>
                                </c:if>
                                
                                <!-- Content -->
                                <p>${content}</p>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-sm-6">
                        <!-- Image -->
                        <img src="${imageURL}" alt="" class="img-responsive center-block" />
                    </div>
                </article>
            </li>
        </c:forEach>
    </ul>
</div>
