<%@page import="java.io.IOException"%>
<%@page import="java.util.List"%>
<%@page import="org.osivia.portal.api.contexte.PortalControllerContext"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.osivia.portal.api.urls.IPortalUrlFactory"%>
<%@ page import="java.util.Iterator" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="org.osivia.portal.api.charte.UserPage" %>
<%@ page import="org.osivia.portal.api.charte.UserPortal" %>
<%@ page import="org.osivia.portal.api.charte.Breadcrumb"%>
<%@page import="org.osivia.portal.api.charte.BreadcrumbItem"%>

<%
UserPortal siteMap = (UserPortal) request.getAttribute("pia.siteMap");
 
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
                                    <a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fosivia%252Fsites%252Fmentions-legales.1351064807797&permLinkType=cms&action=permLink">Mentions Légales</a>
                                </li>
                                <li>
                                    <a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fosivia%252Fsites%252Fcredit.1351065175907&permLinkType=cms&action=permLink">Crédit</a>
                                </li>
                                <li>
                                    <a href="/portal/commands?cmsPath=%252Fdefault-domain%252Fespace-osivia%252Fcontact&permLinkType=cms&action=permLink">Nous contacter</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
