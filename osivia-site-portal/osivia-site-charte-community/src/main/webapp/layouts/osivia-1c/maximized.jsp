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

		<p:region regionName="back" />
        <p:region regionName="maximized" />
    </div>

    <jsp:include page="../includes/footer.jsp" />
</body>

</html>
