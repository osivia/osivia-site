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


<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.StringHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%><portlet:defineObjects />

<%
/* Taille du texte contenu dans une colonne; TODO: à exporter ailleurs? */
final int TEXT_LENGTH_BY_COL = 2300;

Document doc = (Document) renderRequest.getAttribute("doc");

NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx")	;

String titre = doc.getString("dc:title","");

String resume = doc.getString("dc:description","");

String contenu = doc.getString("note:note", "");
if(contenu != null){
	contenu = ctx.transformHTMLContent(contenu);	
}
String contentColUne = contenu;
String contentColDeux = "";
if(contenu.length() > TEXT_LENGTH_BY_COL){
	contentColUne = contenu.substring(0,TEXT_LENGTH_BY_COL);
	contentColDeux = contenu.substring(TEXT_LENGTH_BY_COL + 1, contenu.length());
	if(contentColDeux.length() > TEXT_LENGTH_BY_COL){
		contentColDeux = contenu.substring(TEXT_LENGTH_BY_COL + 1, 2*TEXT_LENGTH_BY_COL);
	}
}
%>

<h2><%= titre %></h2>
<p class="sous-titre"><%= resume %></p>
<div class="row">
	<div class="span5">
		<div class="section-texte border-right"><%= contentColUne %></div>
	</div></div>
	<div class="span5">
		<div class="section-texte"><%= contentColDeux %></div>
	</div>
</div>                   

			
	
