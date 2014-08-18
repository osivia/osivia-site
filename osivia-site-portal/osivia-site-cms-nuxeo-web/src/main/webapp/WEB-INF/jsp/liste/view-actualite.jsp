<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Nuxeo document
Document document = (Document) request.getAttribute("doc");

// Title
pageContext.setAttribute("title", document.getTitle());
// Vignette
if ((document.getProperties().getMap("ttc:vignette") != null) && (document.getProperties().getMap("ttc:vignette").getString("data") != null)) {
    pageContext.setAttribute("vignette", nuxeoController.createFileLink(document, "ttc:vignette"));
}
// Date
pageContext.setAttribute("date", document.getDate("dc:created"));
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Link
pageContext.setAttribute("link", nuxeoController.getLink(document));

%>


<li>
    <article class="clearfix">
        <h4>
            <!-- Vignette -->
            <c:if test="${not empty vignette}">
                <a href="${link.url}" class="vignette pull-left">
                    <img src="${vignette}" />
                </a>
            </c:if>
            
            <!-- Title -->
            <a href="${link.url}" class="title">${title}</a>
        </h4>
        
        <!-- Date -->
        <p class="date"><fmt:formatDate value="${date}" dateStyle="medium"/></p>
        
        <!-- Description -->
        <p class="description">${description}</p>
    </article>
</li>
