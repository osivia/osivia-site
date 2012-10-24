

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.customizer.CMSCustomizer"%>
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

%>
<div class="img-container-niv3">
	<div class="illustration-niv3 no-decalage">
		<span><img src="<%=ctx.getLink(doc, CMSCustomizer.TEMPLATE_DOWNLOAD).getUrl()%>"/></span>
	</div>
	<div class="img-ligne-kaki">&nbsp;</div>
</div>