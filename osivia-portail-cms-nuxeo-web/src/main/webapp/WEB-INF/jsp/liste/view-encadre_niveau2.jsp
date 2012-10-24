<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.utils.MetaDataUtils"%>

<%@page import="fr.toutatice.portail.api.urls.Link"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.VocabularyHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>

<%@ page contentType="text/plain; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>


<%@page import="javax.portlet.PortletURL"%>




<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>


<portlet:defineObjects />

<%
NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx")	;

Document doc = (Document) renderRequest.getAttribute("doc");

String titre = doc.getTitle();

String description = doc.getString("dc:description","");

String linkName = MetaDataUtils.getLinkNameFromMetaData(doc, MetaDataUtils.SOURCE_META_DATA);
if(StringUtils.isEmpty(linkName)){
	linkName = titre;
}
Link link = ctx.getLink(doc);
String url = null;
String target = null;
if(link != null){
	url = link.getUrl();
	target = Formater.formatTarget(link);
}

String addedCssClass = "";
int indice = ((Integer) renderRequest.getAttribute("indice")).intValue();

%>
	<li class="colonne">
		<div class="section-damiers article article-niv2">
			<div class="bloc-titre-niv2 bloc-titre-niv2-color-<%= indice %>">
				<h2><%= titre %></h2>
			</div>
			<div class="article-niv2-description">
				<h3><%= description %></h3>
			</div>
			<div class="article-niv2-bottom">
			<div><a class="read-more" <%=target%> href="<%=url%>"><%= linkName %></a></div>
				<div class="article-niv2-footer article-niv2-footer-color-<%= indice %>"/>	
			</div>
		</div>
	</li>