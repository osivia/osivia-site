<%@page import="java.io.IOException"%>
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
UserPortal siteMap = (UserPortal) request.getAttribute("pia.siteMap");
 
%>


<div id="footer-container">

<%!public void displayItem(javax.servlet.jsp.JspWriter out, List<UserPage> pageList, int level,
			int maxLevels) throws IOException {

		String cssClass = "";
		cssClass = "level_" + level;
		

		
		out.println("<ul class=\"" + cssClass + "\">");
		
		int iChild = 0;


		for (UserPage child : pageList) {
			{
				String li = "<li class=\"" + cssClass + "\"";
				li += ">";

				out.println(li);

				out.println("<a  class=\"" + cssClass + "\"  href=\"" + child.getUrl() + "\">" + child.getName() + "</a>");

				if (child.getChildren().size() > 0) {
					if( level + 1 < maxLevels)
							displayItem(out, child.getChildren(), level + 1, maxLevels);
				}

				out.println("</li>");
				
				iChild ++;
			}

		}
		out.println("</ul>");

	}%>

<%
		displayItem(out, siteMap.getUserPages(), 0, 3);
%>






</div>