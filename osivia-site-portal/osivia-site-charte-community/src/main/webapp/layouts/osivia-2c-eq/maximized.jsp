<!DOCTYPE html>
<%@ taglib prefix="p" uri="portal-layout" %>

<html>

<head>
    <jsp:include page="../includes/head.jsp" />
</head>

<body>
    <jsp:include page="../includes/header.jsp" />

    <div id="page-content" class="container-fluid">
		<!-- Content navbar -->
        <jsp:include page="../includes/content-navbar.jsp" />
        <!-- Notifications -->
        <p:region regionName="notifications" />

         <!-- Menu -->
         <div id="drawer">
             <p:region regionName="drawer-toolbar" />
             
             <div class="col-sm-6 col-lg-6">
                 <p:region regionName="col1" />
             </div>
         </div>
                 
         
         <div class="col-sm-6">
         	<!-- Back -->
             <p:region regionName="back" />
             <p:region regionName="maximized" />
         </div>
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
