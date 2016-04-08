<!DOCTYPE html>
<%@ taglib uri="portal-layout" prefix="p" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>

<head>
    <jsp:include page="../includes/head.jsp" />
</head>


<body>
    <jsp:include page="../includes/header.jsp" />
    
    <div class="wrapper-outer">
        <div class="wrapper-inner">
            <div id="page-content" class="container">
                <jsp:include page="../includes/navigation-bar.jsp" />
            
                <!-- Content navbar -->
                <jsp:include page="../includes/content-navbar.jsp" />
            
                <!-- Notifications -->
                <p:region regionName="notifications" />
        
                <div class="row">
                    <div class="taskbar-container">
                        <!-- Menu -->
                        <div class="col-auto">
                            <div class="row">
                                <div class="col-auto">
                                    <p:region regionName="col1" />
                                </div>
                                
                                <div
                                    <c:choose>
                                        <c:when test="${requestScope['osivia.panels.navigation-panel.closed']}">class="hidden"</c:when>
                                        <c:otherwise>class="col-auto"</c:otherwise>
                                    </c:choose>
                                >
                                    <p:region regionName="navigation-panel" />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div>
                        <div class="col-sm-12">
                            <p:region regionName="maximized" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
