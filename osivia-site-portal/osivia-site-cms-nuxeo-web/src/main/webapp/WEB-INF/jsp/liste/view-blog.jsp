<%@ page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page import="java.util.Locale"%>
<%@ page import="org.nuxeo.ecm.automation.client.model.Document"%>
<%@ page import="org.osivia.portal.site.customizer.Formatter"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>


<%
// Nuxeo controller
NuxeoController nuxeoController = (NuxeoController) request.getAttribute("ctx");
// Current Nuxeo document
Document document = (Document) request.getAttribute("doc");

// Locale
Locale locale = request.getLocale();

// Date
pageContext.setAttribute("date", Formatter.formatDate(document, locale, false));
// Titre
pageContext.setAttribute("titre", document.getTitle());
// Lien du titre
pageContext.setAttribute("lien", nuxeoController.getLink(document).getUrl());
// Description
pageContext.setAttribute("description", document.getString("dc:description"));
// Contenu
pageContext.setAttribute("contenu", nuxeoController.transformHTMLContent(document.getString("webp:content")));

%>


<li class="list-group-item blog-post">
    <!-- Date -->
    <p>${date}</p>
    
    <!-- Title -->
    <p class="h3"><a href="${lien}">${titre}</a></p>
    
    <!-- Description -->
    <p class="lead">${description}</p>
    
    <!-- Content -->
    <div>${contenu}</div>      
</li>
