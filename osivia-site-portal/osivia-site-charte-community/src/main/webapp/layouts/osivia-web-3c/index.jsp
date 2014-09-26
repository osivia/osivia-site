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
                <!-- Notifications -->
                <p:region regionName="notifications" />
                <!-- Breadcrumb -->
                <p:region regionName="breadcrumb" />

                <div class="row">
                    <!-- Menu -->
                    <div id="drawer">
                        <div class="col-sm-5 col-md-4 col-lg-3">
                            <p:region regionName="col1" cms="false" />
                        </div>
                    </div>
                    
                    <!-- Content -->
                    <div class="col-sm-7 col-md-8 col-lg-9">
                        <div class="row">
                            <div class="col-sm-6">
                                <p:region regionName="col2" cms="true" />
                            </div>

                            <div class="col-sm-6">
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
