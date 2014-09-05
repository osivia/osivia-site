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
// Image
if ((document.getProperties().getMap("annonce:image") != null) && (document.getProperties().getMap("annonce:image").getString("data") != null)) {
 pageContext.setAttribute("image", nuxeoController.createFileLink(document, "annonce:image"));
}
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Content
pageContext.setAttribute("content", document.getString("note:note"));

%>


<portlet:defineObjects />


<li>
    <div class="col-md-6 col-lg-4">
        <article>
            <!-- Title -->
            <h3 class="text-right">
                <span>${title}</span>
            </h3>
            
            <!-- Image -->
            <c:if test="${not empty image}">
                <img src="${image}" alt="" class="center-block" />
            </c:if>
            
            <!-- Description -->
            <p class="lead">${description}</p>
            
            <div>${content}</div>
        </article>
    </div>
</li>
