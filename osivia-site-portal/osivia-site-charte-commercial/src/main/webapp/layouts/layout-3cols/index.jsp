<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout"%>


<html>

<head>
    <jsp:include page="../includes/head.jsp" />
</head>


<body class="with-drawer">
    <jsp:include page="../includes/header.jsp" />
    
    <div class="wrapper-outer">
        <div class="wrapper-inner">
            <div id="page-content" class="container">
                <!-- Notifications -->
                <p:region regionName="notifications" />
        
                <div class="row">
                    <!-- Menu -->
                    <div id="drawer">
                        <div class="col-sm-4 col-lg-3">
                            <p:region regionName="col1" cms="true" />
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-8 col-lg-9">
                        <p:region regionName="center" cms="true" />
                    
                        <div class="row">
                            <div class="col-md-6">
                                <p:region regionName="col2" cms="true" />
                            </div>
                            
                            <div class="col-md-6">
                                <p:region regionName="col3" cms="true" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
