<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@ page contentType="text/plain; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.portlet.PortletURL"%>


<%@page import="javax.portlet.WindowState"%>



<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Blob"%>


<%@page import="javax.portlet.ResourceURL"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyList"%>

<%@page import="org.osivia.portal.api.urls.Link"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.StringHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.utils.MetaDataUtils"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%>

<%@page import="org.apache.commons.lang.StringUtils"%>

<portlet:defineObjects />

<%
Document doc = (Document) renderRequest.getAttribute("doc");
NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx");

/* Titre obligatoire à la saisie dans Nuxeo */
String titre = doc.getString("dc:title", "");

String resume = doc.getString("annonce:resume","");
resume = Formater.formatText(resume, true);

String contenu = doc.getString("note:note", "");
if( contenu != null){
	contenu = ctx.transformHTMLContent(contenu);	
}

String image = "";
PropertyMap map = doc.getProperties().getMap("annonce:image");
if( map != null && map.getString("data") != null){	
	image = "<div class=\"article-img-container\"><span class=\"article-img\"><img src=\""+ ctx.createFileLink(doc, "annonce:image") + "\" /></span></div>";
}

String linkName = MetaDataUtils.getLinkNameFromMetaData(doc, MetaDataUtils.SOURCE_META_DATA);
String targetNuxeoPath = MetaDataUtils.getTargetLinkFromMetadata(doc, MetaDataUtils.SOURCE_META_DATA);
String targetLink = null;
if(StringUtils.isNotEmpty(linkName)
		&& StringUtils.isNotEmpty(targetNuxeoPath)){
	targetLink = ctx.getCMSLinkByPath(targetNuxeoPath, null).getUrl();
}

String styles = MetaDataUtils.getStylesFromMetaData(doc, MetaDataUtils.SOURCE_META_DATA);

%>
			
 <div class="section-damiers article <%= styles %>">
	<div class="bloc-titre">
		<h2><%= titre %></h2>
	</div>
    <h3><%= resume %></h3>
    <p><%= contenu %><p>
    <%= image %>
    <% if(targetLink != null){ %>                                              
		<a class="read-more" href="<%= targetLink %>"><%= linkName %></a>
	<% } %>
</div>	
