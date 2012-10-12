
<%@page import="java.util.List"%>
<%@page import="javax.portlet.PortletURL"%>
<%@ page contentType="text/plain; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>


<%@page import="javax.portlet.ResourceURL"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="fr.toutatice.portail.api.menubar.MenubarItem"%>


<portlet:defineObjects />




<%

PortletURL menuBarUrl = renderResponse.createRenderURL();
menuBarUrl.setParameter("test-param", "menu-bar-test");

List<MenubarItem> menuBar = (List<MenubarItem>) request.getAttribute("pia.menuBar");
menuBar.add(new MenubarItem("Test menu", 15,  menuBarUrl.toString(), null, "portlet-menuitem-menu-bar-test", null));

%>



version 1.0.7




<%
	ResourceURL resourceURL = renderResponse.createResourceURL();
	resourceURL.setResourceID("ma_vignette");
	resourceURL.setParameter("type", "vignette");


%>

<div>


	<span>Portlet test 5</span> <br/>
	
	<span>session.userId = <%= renderRequest.getAttribute("session.userId") %></span> <br/>
	
	

	<span><%= renderRequest.getAttribute("test") %></span> 

	<form method="post" action="<portlet:actionURL/>">
	
	
		Delai <%= renderRequest.getAttribute("delai") %> <br/>
	
		User <%= renderRequest.getAttribute("id-user") %> <br/>
	
		<label>Valeur perso</label> <%= renderRequest.getAttribute("perso") %> <br/>
	
		<input type="submit" name="testAction"  value="Test action"> (<input type="checkbox" name="exceptionAction" value="1" />Exception) <br/>
	
		<portlet:renderURL var="urlErreur">
			<portlet:param name="erreurRender" value="true"/>
		</portlet:renderURL>
	
		<a href="<%=urlErreur%>">Erreur render</a> <br/>
		
		
		<portlet:renderURL var="urlNullPointer">
			<portlet:param name="NullPointer" value="true"/>
		</portlet:renderURL>
	
		<a href="<%=urlNullPointer%>">Erreur null pointer</a> <br/>
		


		<portlet:renderURL var="url1">
			<portlet:param name="test-param" value="<%= renderRequest.getAttribute("test-param") + "*" %>"/>
		</portlet:renderURL>

		<a href="<%=url1%>">Test param</a> [<%= renderRequest.getAttribute("test-param") %>] <br/>
		
<!-- JMETER_URL_PARAM="<%= url1 %>" --> 


		<a href="<portlet:renderURL windowState="<%= WindowState.MAXIMIZED.toString() %>"/>">Max</a> <br/>
		
	
<!-- JMETER_URL_MAX="<portlet:renderURL windowState="<%= WindowState.MAXIMIZED.toString() %>"/>" --> 
	
		Expiration : <%= renderRequest.getAttribute("expiration") %>  <br/>
		
	
		

<div class="no-ajax-link">		
		<a href="<%= renderRequest.getAttribute("TestPortletUrl") %>">Create test window</a> <br/>
</div>			
		
		<img width="50px" src="<%=resourceURL.toString()%>" />
		
		
		Complete name : <%= renderRequest.getAttribute("completeName") %>  <br/>


	</form>
	
</div>





