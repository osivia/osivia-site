<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ page isELIgnored="false" %>

<portlet:defineObjects/>

	<div>
		<form method="post" action="<portlet:actionURL/>">
		
			<label>Délai</label><input type="text" name="delai" value="<%= renderRequest.getAttribute("delai") %>">
			<input type="submit" name="modifierPrefs"  value="Valider">
			<input type="submit" name="annuler"  value="Annuler">
		</form>
	</div>
	
	<p class="action-parag">
		<a href='<portlet:renderURL portletMode="view" windowState="normal">
					<portlet:param name="display" value="view" />
				</portlet:renderURL>'
		>
			Retour en mode visualisation
		</a>
	</p>