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

        <p:region regionName="center" cms="true" />

        <!-- Layout line separator -->
        <div class="line-separator"></div>

        <div class="row">
            <div class="col-sm-6">
                <p:region regionName="col1" cms="true" />
            </div>
            
            <div class="col-sm-6">
                <p:region regionName="col2" cms="true" />
            </div>
        </div>
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
