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
            <div id="page-content" class="container-fluid">
            <!-- Content navbar -->
                <jsp:include page="../includes/content-navbar.jsp" />
                <!-- Notifications -->
                <p:region regionName="notifications" />


                <div class="row">
                    <!-- Menu -->
                    <div id="drawer">
                        <p:region regionName="drawer-toolbar" />
                        
                        <div class="col-sm-4 col-lg-3">
                            <p:region regionName="col1" />
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-7 col-md-8 col-lg-9">
                        <div class="row">
                            <div class="col-sm-8">
                                <!-- Back -->
                        		<p:region regionName="back" />
                            
                                <p:region regionName="col2" />
                            </div>

                            <div class="col-sm-4">
                                <p:region regionName="col3" />
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
