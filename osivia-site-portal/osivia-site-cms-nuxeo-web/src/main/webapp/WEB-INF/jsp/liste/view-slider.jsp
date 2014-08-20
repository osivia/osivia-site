<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Current Nuxeo document
Document document = (Document) request.getAttribute("doc");

// Title
pageContext.setAttribute("title", document.getTitle());
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Content
pageContext.setAttribute("content", document.getString("note:note"));
// Image
if ((document.getProperties().getMap("annonce:image") != null) && (document.getProperties().getMap("annonce:image").getString("data") != null)) {
    pageContext.setAttribute("image", nuxeoController.createFileLink(document, "annonce:image"));
}

%>


<portlet:defineObjects />


<li class="bxslider-slide">
    <article class="clearfix">
        <div class="col-sm-6">
            <!-- Titles -->
            <c:forEach var="document" items="${docs}" varStatus="status">
                <c:set var="rowClass" value="hidden-noscript" />
                <c:if test="${status.index == index}">
                    <c:set var="rowClass" value="active" />
                </c:if>
            
                <div class="row title ${rowClass}">
                    <div class="col-sm-11 col-sm-offset-1">
                        <!-- Title -->
                        <c:choose>
                            <c:when test="${status.first}">
                                <h2>
                                    <a href="#" onclick="goToSlide(${status.index})">${document.title}</a>
                                </h2>
                            </c:when>
                            
                            <c:otherwise>
                                <h3>
                                    <a href="#" onclick="goToSlide(${status.index})">${document.title}</a>
                                </h3>
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
            <img src="${image}" alt="" />
        </div>
    </article>
</li>
