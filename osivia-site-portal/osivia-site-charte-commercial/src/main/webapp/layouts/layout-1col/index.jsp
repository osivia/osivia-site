<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout"%>


<html>

<head>
    <jsp:include page="../includes/head.jsp" />
</head>


<body>
    <jsp:include page="../includes/header.jsp" />
    
    <div id="page-content" class="container">
        <!-- Notifications -->
        <p:region regionName="notifications" />

        <!-- Content -->
        <p:region regionName="center" cms="true" />
        
        <p:region regionName="col1" cms="true" />
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
