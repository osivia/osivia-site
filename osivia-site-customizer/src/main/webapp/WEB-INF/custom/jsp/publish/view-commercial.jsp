<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.osivia.org/jsp/taglib/osivia-portal" prefix="op" %>

<%@ page contentType="text/html" isELIgnored="false" %>


<portlet:defineObjects />


<div class="nuxeo-publish-navigation">
    <c:choose>
        <c:when test="${not empty displayItem}">
            <nav class="menu-commercial">
                <!-- Title -->
                <h3 class="hidden"><op:translate key="MENU_TITLE_DEFAULT" /></h3>
        
                <!-- Current item ? -->
                <c:remove var="current" />
                <c:if test="${displayItem.current}">
                    <c:set var="current" value="btn-primary" />
                </c:if>
            
                <!-- Navigation home link -->
                <a href="${displayItem.url}" class="btn btn-default btn-block visible-xs ${current}">
                    <i class="glyphicons halflings home"></i>
                    <span>${displayItem.title}</span>
                </a>
            
                <!-- Menu -->
                <ul class="list-unstyled">
                    <c:forEach var="child" items="${displayItem.children}">
                        <!-- External link ? -->
                        <c:remove var="target" />
                        <c:if test="${child.external}">
                            <c:set var="target" value="_blank" />
                        </c:if>
                        
                        <!-- selected item ? -->
                        <c:remove var="selected" />
                        <c:if test="${child.selected}">
                            <c:set var="selected" value="active" />
                        </c:if>
                    
                    
                        <li class="${selected}">
                            <!-- Link -->
                            <a href="${child.url}" target="${target}">            
                                <span>${child.title}</span>
                                <c:if test="${child.external}">
                                    <span class="glyphicon glyphicon-new-window"></span>
                                </c:if>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:when>
    
        <c:otherwise>
            <p class="text-danger">
                <i class="glyphicons halflings exclamation-sign"></i>
                <span><op:translate key="MESSAGE_PATH_NOT_DEFINED" /></span>
            </p>
        </c:otherwise>
    </c:choose>
</div>
