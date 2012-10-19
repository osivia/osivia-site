<%@page import="fr.toutatice.portail.api.menubar.MenubarItem"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>

<%@ page contentType="text/plain; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Documents"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>

<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.list.ViewListPortlet"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.portlets.bridge.Formater"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%>

<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PaginableDocuments"%><portlet:defineObjects />

<%
PaginableDocuments docs = (PaginableDocuments) renderRequest.getAttribute("docs")	;
NuxeoController ctx = (NuxeoController) renderRequest.getAttribute("ctx")	;
String style = (String) renderRequest.getAttribute("style")	;
int currentPage = (Integer) request.getAttribute("currentPage");
int nbPages = (Integer) renderRequest.getAttribute("nbPages")	;

String nuxeoRequest = (String) renderRequest.getAttribute("nuxeoRequest")	;
String selectors = (String) renderRequest.getAttribute("selectors")	;

/* Méthode spécifique d'affichage du titre de la liste Actualités ... */
String bottomClass = "";
if("actualite".equals(style)){ %>
<div id="actus">
	<h2>actualités</h2>
</div>
<% bottomClass = " bottom_bleu";
}
%> 

<div class="nuxeo-list-<%=style%><%= bottomClass %>">


<div class="no-ajax-link">
	<ul>
<%
int indice = 0;
int parite = 0;
Iterator it = docs.iterator();
while( it.hasNext())	
{
	indice++;
	parite = indice % 2;
	Document doc = (Document) it.next();
	

		// Appel de la jsp
		
		String jspName = "view-"+ ViewListPortlet.getListTemplates().get(style).getKey().toLowerCase() + ".jsp";
		renderRequest.setAttribute("indice", indice);
		renderRequest.setAttribute("parite", parite);
		renderRequest.setAttribute("doc", doc);
		
%>
		<jsp:include page="<%= jspName %>"></jsp:include>
<%		


}
%>
	</ul>
	
</div>	
<% 
if ( nbPages > 1 )	
{ %>	
	<div class="pagination">
	Page
<%

int minPage = Math.max(0, currentPage - 5);
int maxPage = Math.min(currentPage + 5, nbPages);

for( int numPage = minPage; numPage < maxPage; numPage++)	{
	PortletURL pageURL = renderResponse.createRenderURL();

	pageURL.setParameter( "currentPage", Integer.toString(numPage));
	pageURL.setParameter( "currentState", renderRequest.getWindowState().toString());
	
	if( selectors != null)
		pageURL.setParameter( "lastSelectors", selectors);	
	
	if( currentPage == numPage)	{
%>
			<b><span><%= (numPage + 1) %></span></b>
<%	} else { %>
			<!-- JMETER_URL_LIST="<%= pageURL.toString()%>" --> <a href="<%= pageURL.toString()%>"><span><%= (numPage + 1) %></span></a>
<%	}  
}
%>
	</div>

<% } %>





</div>




<%= ctx.getDebugInfos() %>
