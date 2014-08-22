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
// Glyphicon
pageContext.setAttribute("glyphicon", document.getString("zoom:style"));

%>


<li>
    <a href="${link.url}">
        <i class="glyphicons ${glyphicon}"></i>
        <span>${title}</span>
    </a>
</li>
