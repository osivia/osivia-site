<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="internationalization" prefix="is" %>


<c:set var="logoAlt"><is:getProperty key="LOGO_ALT" /></c:set>


<div class="clearfix">
    <!-- Ligne d'entête -->
    <div class="header-line"></div>


    <!-- Logo -->
    <h1 class="pull-left">
        <a href="${requestScope['osivia.home.url']}">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="${logoAlt}" />
        </a>
    </h1>
    
    
    <!-- Recherche -->
    <a href="#search-input" class="btn btn-default accessibility-shortcut">
        <i class="glyphicons halflings search"></i>
        <span><is:getProperty key="SHORTCUT_SEARCH" /></span>
    </a>
    
    <!-- Contenu -->
    <a href="#page-content" class="btn btn-default accessibility-shortcut">
        <i class="glyphicons book_open"></i>
        <span><is:getProperty key="SHORTCUT_PAGE_CONTENT" /></span>
    </a>
</div>
