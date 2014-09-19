<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="internationalization" prefix="is" %>

<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Document
Document document = (Document) request.getAttribute("doc");

// Title
pageContext.setAttribute("title", document.getTitle());
// Image
if ((document.getProperties().getMap("annonce:image") != null) && (document.getProperties().getMap("annonce:image").getString("data") != null)) {
 pageContext.setAttribute("image", nuxeoController.createFileLink(document, "annonce:image"));
}
// Date
pageContext.setAttribute("date", document.getDate("dc:created"));
// Resume
pageContext.setAttribute("resume", document.getString("annonce:resume"));
// Content
pageContext.setAttribute("content", document.getString("note:note"));

%>


<article>
    <div class="row">
        <!-- Title -->
        <h3 class="hidden">${title}</h3>
        
        <!-- Image -->
        <c:set var="contentClass" value="col-xs-12" />
        <c:if test="${not empty image}">
            <c:set var="contentClass" value="col-xs-8" />
            <div class="col-xs-4">
                <img src="${image}" alt="" class="img-thumbnail">
            </div>
        </c:if>
        
        <div class="${contentClass}">
            <!-- Date -->
            <p class="small"><fmt:formatDate value="${date}" dateStyle="long"/></p>
            
            <!-- Resume -->
            <div class="lead">${resume}</div>
            
            <!-- Content -->
            <div>${content}</div>
        </div>
    </div>
</article>
