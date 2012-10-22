
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Document"%>
<%@page import="fr.toutatice.portail.cms.nuxeo.api.NuxeoController"%>
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.Documents"%>
<%@page import="javax.portlet.filter.ResourceResponseWrapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.portlet.PortletURL"%> 
<%@page import="org.nuxeo.ecm.automation.client.jaxrs.model.PropertyMap"%>
<%@page import="com.osivia.portail.site.portlets.solutions.ISolutionsConstantes" %>
<%@page import="com.osivia.portail.site.portlets.utils.StringHelper" %>
<%@ page contentType="text/plain; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>


<%@page import="javax.portlet.ResourceURL"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="fr.toutatice.portail.api.menubar.MenubarItem"%>

<portlet:defineObjects />


<div id="slider">


<div class="container">
	<div class="ligne-vert-kaki">
		<div class="row">
			<div class="span12"> 
				<div id="slide-complet">
					

<%	
	
Documents docs = (Documents) renderRequest.getAttribute("docs");
NuxeoController nuxeoCtrl = (NuxeoController) renderRequest.getAttribute("nuxeoCtrl")	;

String resumeFormat = null;
String contenuFormat = null;
String srcImage = null;
String urlDoc = null;


Document selectedDoc = null;
int indexDoc = 0;
int indexSelectedDoc = 0;

String currentPath = renderRequest.getParameter(ISolutionsConstantes.PARAM_CURR_ITEM_PATH);

	for(Iterator<Document> iDoc = docs.iterator(); iDoc.hasNext();){

		Document doc = iDoc.next();
		String title = doc.getTitle();
		
		String currentClass = "";

		/* Tag <hx></hx> */
		String hSize = ISolutionsConstantes.H3; 
		
		 if(doc.getPath().equals(currentPath)) {
				// Insertion barre d'item
				nuxeoCtrl.setCurrentDoc(doc);
				nuxeoCtrl.insertContentMenuBarItems();	
				indexSelectedDoc = indexDoc;
		 }
		
		if(indexDoc == ISolutionsConstantes.SOLUTIONS_MENU_ID){
			hSize = ISolutionsConstantes.H2;
			selectedDoc = doc;
	    } else {
	    	
			 if(doc.getPath().equals(currentPath)) {
					currentClass =  ISolutionsConstantes.CURRENT_CLASS;
					selectedDoc = doc;
					

			 }
			 
	    }
		
		PortletURL itemUrl = renderResponse.createRenderURL();
		itemUrl.setParameter(ISolutionsConstantes.PARAM_CURR_ITEM_PATH, doc.getPath());
				
		%>
			<div class="titre-slide">
				<h<%= hSize %> class="<%= currentClass %>"><a href="<%= itemUrl.toString() %>"><%= title %></a></h<%= hSize %>>		
		<%
		indexDoc++;
	} 
	
	if(selectedDoc != null)	{
		/* Récupération des données du document sélectionné */
		PropertyMap mapImage = selectedDoc.getProperties().getMap("annonce:image");
		if( mapImage != null && mapImage.getString("data") != null){
			srcImage = nuxeoCtrl.createFileLink(selectedDoc, "annonce:image");
		}
	
		
		String resume = selectedDoc.getProperties().getString("annonce:resume");
		if (resume != null && resume.length() > 0)	{
			resumeFormat = StringHelper.formatText( resume, true);
		}
		
		String contenu = selectedDoc.getString("note:note", "");
		if( contenu != null){
			contenuFormat = nuxeoCtrl.transformHTMLContent(contenu);	
		}
	
	}
	
%>


<% if(resumeFormat != null){ %>
	<div class="text-slide"><h4><%= resumeFormat %></h4>
<% } %>
<% if(contenuFormat != null){ %>
<%= contenuFormat %>
<% } %>
	</div>
</div>

<% if(srcImage != null){ %>
<div class="img-solution-container">
	<span class="img-solution">
		<img src="<%= srcImage %>" />
	</span>
</div>
<% } %>

				</div>
			</div>
		</div>
	</div>
</div>

</div>


<%

String nextUrl = "NO_REFRESH";

if( currentPath == null || ("1".equals(renderRequest.getParameter(ISolutionsConstantes.PARAM_AJAX_MODE))))	{

	Document nextSliderDoc = null;
	nextSliderDoc = docs.get(( indexSelectedDoc + 1 ) % docs.size());


	PortletURL jsPortletUrl = renderResponse.createRenderURL();
	jsPortletUrl.setParameter(ISolutionsConstantes.PARAM_CURR_ITEM_PATH, nextSliderDoc.getPath());
	jsPortletUrl.setParameter(ISolutionsConstantes.PARAM_AJAX_MODE, "1");
 	nextUrl = jsPortletUrl.toString();

 	
}



%>					


<script type="text/javascript" language="Javascript">
   activeSlider( $('slider'), '<%= nextUrl %>');
</script>


