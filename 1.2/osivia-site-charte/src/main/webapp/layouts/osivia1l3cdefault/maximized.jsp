<%@ page import="org.jboss.portal.server.PortalConstants"%>
<%@ taglib uri="/WEB-INF/theme/portal-layout.tld" prefix="p"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<jsp:include page="../../header/metadata.jsp" />

<!-- to correct the unsightly Flash of Unstyled Content. -->
<script type="text/javascript"></script>

<p:headerContent />

<p:theme themeName="osivia-site" />

</head>

<body id="body">
    <p:region regionName='AJAXScripts' regionID='AJAXScripts' />

    <div id="portal-container">
        <div id="sizer">
            <div id="expander">
                <p:region regionName='toolbar' regionID='toolbar' />
                <div id="ligneentete">
                    <jsp:include page="../../header/logo.jsp" />

                    <div id="global_header">

                        <div id="header_utils">
                            <div id="header">
                                <p:region regionName="pageSettings" regionID="pageSettings" />
                                <div class="menu-et-recherche">
                                    <div class="navbar">
                                        <div class="navbar-inner">
                                            <jsp:include page="../../language/language.jsp" />

                                            <!-- navigation tabs and such -->
                                            <p:region regionName='tabs' regionID='tabs-atomo' />

                                            <p:region regionName='search' regionID='search' />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="content-container">
                    <div class="container bottom-vert-pistache">
                        <div class="row">
                            <div class="span12">
                                <div class="row">
                                    <div style="width: 100%">
                                        <h2>Other template</h2>
                                        <p:region regionName='lgn1' regionID='regionLgn1' />
                                    </div>
                                    <div class="menu-gauche span2" style="width: 20%">
                                        <p:region regionName='col1' regionID='regionCol1' />
                                    </div>
                                    <div class="span10" style="width: 70%">
                                        <div class="row">
                                            <div class="span4" style="width: 70%">
                                                <p:region regionName='maximized' regionID='regionMaximized' />
                                            </div>
                                            <div class="span6 row span5" style="width: 25%">
                                                <p:region regionName='col3' regionID='regionCol3' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <p:region regionName='footer' regionID='footer' />

        <p:region regionName='AJAXFooter' regionID='AJAXFooter' />
    </div>
</body>
</html>
