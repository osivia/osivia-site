<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ page isELIgnored="false" %>

Démo édition

<portlet:defineObjects/>

	<div>

	<form method="post" action="<portlet:actionURL/>">
		<label>Valeur perso</label><input type="text" name="perso" value="<%= renderRequest.getAttribute("perso") %>"> <br/>

		<input type="submit" name="modifierPrefs"  value="Envoyer">
		
	</form>

	</div>