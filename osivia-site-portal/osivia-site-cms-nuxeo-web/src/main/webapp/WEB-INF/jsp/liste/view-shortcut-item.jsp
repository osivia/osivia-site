<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Nuxeo document
Document document = (Document) request.getAttribute("doc");

// Title
pageContext.setAttribute("title", document.getTitle());
// URL & target
String path = document.getString("zoom:path");
if (path != null) {
    if (path.startsWith("/")) {
        pageContext.setAttribute("url", nuxeoController.getCMSLinkByPath(path, null).getUrl());
    } else {
        pageContext.setAttribute("url", path);
        if (!path.startsWith("#")) {
            pageContext.setAttribute("target", "_blank");
        }
    }
}
// Glyphicon
pageContext.setAttribute("glyphicon", document.getString("zoom:style"));
%>


<a href="${url}" target="${target}" class="btn btn-default">
    <i class="glyphicons ${glyphicon}"></i>
    <span>${title}</span>
</a>
