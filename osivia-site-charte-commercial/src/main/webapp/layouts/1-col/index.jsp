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

                <!-- Menubar -->
                <div class="simple-menubar">
                    <p:region regionName="menubar" />
                </div>
                
		        <!-- Content -->
		        <p:region regionName="center" cms="true" />
		        
		        <p:region regionName="col1" cms="true" />
		    </div>
        </div>
    </div>
    
    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
