

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.customizer.CMSCustomizer"%>
<%@page import="org.osivia.portal.api.urls.Link"%>
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

%>
<div class="illustration-niv2-container">
	<div class="illustration-niv2">
		<img src="<%=ctx.getLink(doc, CMSCustomizer.TEMPLATE_DOWNLOAD).getUrl()%>"/>
	</div>
	<div class="container-lgn-vert-niv2 lgn-vert-niv1">&nbsp;</div>
</div>

