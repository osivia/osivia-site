
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.lang.Math"%>
<%@page import="java.lang.Double"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="javax.portlet.ResourceURL"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.StringHelper"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>
<%@page import="fr.toutatice.portail.api.menubar.MenubarItem"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.customizer.CMSCustomizer"%>

<portlet:defineObjects />

<%
NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx");
Document doc = (Document) renderRequest.getAttribute("doc");

String src = ctx.createFileLink(doc,"file:content");
%>

<div class="img-container-niv1">
	<div class="illustration-container">
		<span class="illustration">
			<img src="<%= src %>"/>
		</span>
	</div>
	<div class="container-lgn-vert-niv1 lgn-vert-niv1">&nbsp;</div>
</div>

