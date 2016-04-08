<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout"%>


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

                <!-- Notifications -->
                <p:region regionName="notifications" />
        
                <div class="row">
                    <!-- Menu -->
                    <div class="col-sm-4 col-lg-3 hidden-xs">
                        <p:region regionName="col1" cms="true" />
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-8 col-lg-9">
                        <!-- Menubar -->
                        <div class="simple-menubar">
                            <p:region regionName="menubar" />
                        </div>
                    
                        <p:region regionName="center" cms="true" />
                    
                        <div class="row">
                            <div class="col-md-6">
                                <p:region regionName="col2-top" cms="true" />
                                <p:region regionName="col2-bottom" cms="true" />
                            </div>
                            
                            <div class="col-md-6">
                                <p:region regionName="col3-top" cms="true" />
                                <p:region regionName="col3-bottom" cms="true" />
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
