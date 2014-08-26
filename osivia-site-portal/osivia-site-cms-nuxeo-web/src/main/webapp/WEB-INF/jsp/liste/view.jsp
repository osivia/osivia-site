<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="internationalization" prefix="is" %>


<%@ page isELIgnored="false" %>


<script src="${pageContext.request.contextPath}/bxslider/jquery.bxslider.min.js"></script>
<link href="${pageContext.request.contextPath}/bxslider/jquery.bxslider.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/js/bxslider-integration.js"></script>


<portlet:defineObjects />


<!-- Add files content -->
<jsp:include page="../files/add-content.jsp"></jsp:include>


<!-- Customize menubar -->
<jsp:include page="menubar.jsp" />


<div class="nuxeo-list-${style}">
    <c:choose>
        <c:when test="${empty error}">
            <!-- Request -->
            <c:if test="${not empty nuxeoRequest}">
                <div class="alert alert-info">${nuxeoRequest}</div>
            </c:if>
        
        
            <!-- Documents -->
            <div class="no-ajax-link">
                <!-- Specific attributes -->
                <c:set var="listClass" value="list-unstyled" />
                <c:if test="${fn:toLowerCase(style) eq 'slider'}">
                    <c:set var="listClass" value="list-unstyled bxslider" />
                </c:if>
                <c:if test="${fn:toLowerCase(style) eq 'footer-links'}">
                    <c:set var="listClass" value="list-inline text-center" />
                </c:if>
            
            
                <!-- List -->
                <ul class="clearfix ${listClass}">
                    <c:forEach var="doc" items="${docs}" varStatus="status">
                        <c:set var="doc" value="${doc}" scope="request" />
                        <c:set var="index" value="${status.index}" scope="request" />
                        <c:set var="parite" value="${status.count % 2}" scope="request" />
                        <jsp:include page="view-${fn:toLowerCase(style)}.jsp" />
                    </c:forEach>
                </ul>
            </div>
            
            
            <!-- Pagination -->
            <jsp:include page="pagination.jsp" />
            
            
            <!-- Footer -->
            <jsp:include page="footer.jsp" />
        </c:when>
        
        <c:otherwise>
            <p class="text-danger">
                <i class="glyphicons halflings exclamation-sign"></i>
                <span>${error}</span>
            </p>
            
            <c:if test="${not empty errorMessage}">
                <p class="text-danger">${errorMessage}</p>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>
