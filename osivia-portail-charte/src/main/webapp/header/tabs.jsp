<%@page import="java.util.List"%>
<%@page import="fr.toutatice.portail.api.contexte.PortalControllerContext"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="fr.toutatice.portail.api.urls.IPortalUrlFactory"%>
<%@ page import="java.util.Iterator" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.toutatice.portail.api.charte.UserPage" %>
<%@ page import="fr.toutatice.portail.api.charte.UserPortal" %>
<%@ page import="fr.toutatice.portail.api.charte.Breadcrumb"%>
<%@page import="fr.toutatice.portail.api.charte.BreadcrumbItem"%>

<%
UserPortal userPortal = (UserPortal) request.getAttribute("pia.userPortal");
Object currentPageId = request.getAttribute("pia.currentPageId");

//Get current tab

int currentTab = -1;
int iTab = 0;
Iterator<UserPage> tabPages = userPortal.getUserPages().iterator();
while (tabPages.hasNext())	{
	UserPage userPage = tabPages.next();
	if (userPage.getId().equals( currentPageId))
		currentTab = iTab;
	
	iTab ++;	
}

%>
<ul class="nav">
<%

int indexPage = 0;
int nbPages = userPortal.getUserPages().size();
Iterator<UserPage> pages = userPortal.getUserPages().iterator();

while (pages.hasNext()){  
	UserPage userPage = pages.next();
	if(!"accueil".equalsIgnoreCase(userPage.getName())
			&& !"templates".equalsIgnoreCase(userPage.getName())){
		String className = "";
		if(indexPage == 0){
			className = "first";
		}
		if(indexPage == nbPages){
			className = "last";
		}
		if(indexPage == currentTab){
			className += " current";
		}
	
%>
	<li class="<%= className %>">
		<a href="<%= userPage.getUrl() %>"><span><%= userPage.getName() %></span></a>
		<% if (userPage.getChildren().size() > 0){ %>
			 <ul class="subMenuHidden" onmouseover="this.class='subMenuShow'">
	         <%
	            for (Iterator<UserPage> j = userPage.getChildren().iterator(); j.hasNext();){
	            	UserPage userSubPage = j.next();
	         %>
	         <li><a href="<%= userSubPage.getUrl() %>"><span><%= userSubPage.getName() %></span>
	         </a></li>
	         <%
            }
         %>
      </ul>
		<% } %>
	</li>
                           
<% 		
	}
	indexPage++;  
 } 
%>
</ul>
