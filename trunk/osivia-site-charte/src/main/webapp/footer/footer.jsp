<%@page import="org.osivia.portal.api.Constants"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page import="org.osivia.portal.api.context.PortalControllerContext"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.osivia.portal.api.urls.IPortalUrlFactory"%>
<%@ page import="java.util.Iterator" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="org.osivia.portal.api.theming.UserPage" %>
<%@ page import="org.osivia.portal.api.theming.UserPortal" %>
<%@ page import="org.osivia.portal.api.theming.Breadcrumb"%>
<%@page import="org.osivia.portal.api.theming.BreadcrumbItem"%>

<%
UserPortal siteMap = (UserPortal) request.getAttribute(Constants.ATTR_SITE_MAP);
 
%>

<footer>
                <div class="container">
                    <div class="row">
                        <div class="offset1 span10">
                           


<%!public void displayItem(javax.servlet.jsp.JspWriter out, List<UserPage> pageList, int level,
			int maxLevels) throws IOException {

		
		String ulClass = "";
		
		if( level == 0)
			ulClass = "titres-footer";

		
		out.println("<ul class=\"" + ulClass + "\">");
		
		int iChild = 0;


		for (UserPage child : pageList) {
			
			
			{
				
				if(!"accueil".equalsIgnoreCase(child.getName()))	{
				
					String liClass = "";
					
					if( iChild == pageList.size() -1)
						 liClass = "";
					
					String li = "<li class=\"" + liClass + "\"";
					li += ">";
	
					out.println(li);
					
					if( level == 0)
						out.println("<h2>");
	
					out.println("<a  href=\"" + child.getUrl() + "\">" + child.getName() + "</a>");
					
					if( level == 0)
						out.println("</h2>");				
	
					if (child.getChildren().size() > 0) {
						if( level + 1 < maxLevels)
								displayItem(out, child.getChildren(), level + 1, maxLevels);
					}
	
					out.println("</li>");
				}
				
				iChild ++;
			}

		}
		out.println("</ul>");

	}%>

<%
		displayItem(out, siteMap.getUserPages(), 0, 2);
%>




                        </div>
                    </div>
                </div>
                <div class="derniere-ligne">
                    <div class="row">
                        <div class="offset1 span7">
                            <ul>
                                <li>
                                    <a href="/portal/cms/default-domain/espace-osivia/osivia/sites/mentions-legales">Mentions L�gales</a>
                                </li>
                                <li>
                                    <a href="/portal/cms/default-domain/espace-osivia/osivia/sites/credit">Cr�dit</a>
                                </li>
                                <li>
                                    <a href="/portal/cms/default-domain/espace-osivia/osivia/contact">Nous contacter</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
