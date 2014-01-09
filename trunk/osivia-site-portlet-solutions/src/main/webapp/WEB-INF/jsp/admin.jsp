<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ page isELIgnored="false" %>

<portlet:defineObjects/>

	<div>
		<form method="post" action="<portlet:actionURL/>">
		
			<label>path</label><input type="text" name="path" value="<%= renderRequest.getAttribute("path") %>">
			<input type="submit" name="modifierPrefs"  value="Valider">
			<input type="submit" name="annuler"  value="Annuler">
		</form>
	</div>
	
	