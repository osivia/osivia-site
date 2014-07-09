<%@page import="java.util.Date"%>
<%@ page contentType="text/plain; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.portlet.PortletURL"%>


<%@page import="javax.portlet.WindowState"%>

<%@page import="org.osivia.portal.api.urls.Link"%>

<%@page import="org.nuxeo.ecm.automation.client.model.Blob"%>


<%@page import="javax.portlet.ResourceURL"%>
<%@page import="org.nuxeo.ecm.automation.client.model.Document"%>
<%@page import="org.nuxeo.ecm.automation.client.model.PropertyList"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.StringHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>

<%@page import="org.nuxeo.ecm.automation.client.model.PropertyMap"%><portlet:defineObjects />

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

String notes = doc.getString("rmpd:releaseNotes", "");
String releaseState = doc.getString("rmpd:releaseState", "");
Date releaseDate = doc.getDate("rmpd:releaseDate");


PropertyList packageContent = doc.getProperties().getList("rmpd:packageContent");


%>

<table class="roadmaptable">
	<tr>
		<td class="roadmapcol1">
			<h3 class="state<%=releaseState%>">
				<%= srcImage %>
				<a href="<%= url %>"><%= titre %></a>
			</h3>

			<%=releaseDate.toLocaleString()%>
			
						<%=notes%>
						
						<br />
						DOCUMENTATION 
		</td>
		<td class="roadmapcol2">
			TELECHARGER

			<br />
			
			Contenu du paquet :
			<ul>
			<%
			for (int pkgIndex = 0; pkgIndex < packageContent.size(); pkgIndex++) {
			%>
				<li><%=packageContent.getMap(pkgIndex).get("packageName")%></li>
			<% } %>
			</ul>
			
		</td>
	</tr>
</table>

	