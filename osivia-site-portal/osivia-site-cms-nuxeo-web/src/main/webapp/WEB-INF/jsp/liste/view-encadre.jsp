<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Nuxeo document
Document document = (Document) request.getAttribute("doc");

// Title
pageContext.setAttribute("title", document.getTitle());
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Image
if ((document.getProperties().getMap("annonce:image") != null) && (document.getProperties().getMap("annonce:image").getString("data") != null)) {
    pageContext.setAttribute("image", nuxeoController.createFileLink(document, "annonce:image"));
}
// Abstract
pageContext.setAttribute("abstract", document.getString("annonce:resume"));

%>


<li>
    <div class="col-xs-6 col-sm-12 col-lg-6">
        <article class="clearfix">
            <!-- Title -->
            <h3 class="text-right">
                <span>${title}</span>
            </h3>
            
            <!-- Description -->
            <c:if test="${not empty description}">
                <p class="description lead">${description}</p>
            </c:if>
            
            <!-- Image -->
            <c:if test="${not empty image}">
                <div class="image text-center">
                    <img src="${image}" alt="" />
                </div>
            </c:if>
            
            <!-- Abstract -->
            <c:if test="${not empty abstract}">
                <div class="abstract small">${abstract}</div>
            </c:if>
        </article>
    </div>
</li>
