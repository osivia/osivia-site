<%@ page contentType="text/plain; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.portlet.PortletURL"%>


<%@page import="javax.portlet.WindowState"%>

<%@page import="org.osivia.portal.api.urls.Link"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Blob"%>


<%@page import="javax.portlet.ResourceURL"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyList"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.StringHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%><portlet:defineObjects />

<%


Document doc = (Document) renderRequest.getAttribute("doc");
NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx");

String srcImage = "";
PropertyMap mapImage = doc.getProperties().getMap("ttc:vignette");
if( mapImage != null && mapImage.getString("data") != null){
	srcImage = "<img class=\"actualite-image\" src=\""+ ctx.createFileLink(doc,"ttc:vignette") + "\" />";
}

Link link = ctx.getLink(doc);
String url = link.getUrl();
		
String titre = doc.getString("dc:title", "");

String date = Formater.formatDate(doc);

String description = Formater.formatDescription(doc);

%>

<div class="actus">
<h3>
	<a href="<%= url %>"><%= srcImage %></a>
	<a href="<%= url %>">
		<%= titre %>
	</a>
</h3>
<p class="date"><%= date %></p>
<% if(!"".equals(srcImage)){ %>
<div class="actualite-description">
	<p><%= description %></p>
</div>
<% } else { %>
	<p><%= description %></p>
<% } %>
</div>



	
