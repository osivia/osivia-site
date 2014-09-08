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
// Link
String path = document.getString("zoom:path");
if ((path != null) && (path.startsWith("/"))) {
    pageContext.setAttribute("link", nuxeoController.getCMSLinkByPath(path, null));
}
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Image
if ((document.getProperties().getMap("zoom:image") != null) && (document.getProperties().getMap("zoom:image").getString("data") != null)) {
    pageContext.setAttribute("image", nuxeoController.createFileLink(document, "zoom:image"));
}
// Color
pageContext.setAttribute("color", document.getString("zoom:color"));

%>


<li>
    <div class="col-xs-6">
        <article class="clearfix ${color}">
            <!-- Title -->
            <h3 class="h4 text-right">
                <a href="${link.url}">${title}</a>
            </h3>

            <!-- Description -->
            <c:if test="${not empty description}">
                <p class="description lead">${description}</p>
            </c:if>
        
            <!-- Image -->
            <c:if test="${not empty image}">
                <img src="${image}" alt="" class="center-block" />
            </c:if>
        </article>
    </div>
</li>
