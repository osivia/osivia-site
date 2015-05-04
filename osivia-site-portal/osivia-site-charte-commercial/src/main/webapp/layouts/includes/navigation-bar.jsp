<%@ taglib prefix="p" uri="portal-layout"%>


<div class="navigation-bar">
    <!-- Navigation top menu -->
    <div class="navigation-top-menu">
        <!-- Drawer -->
        <div id="drawer">
            <p:region regionName="drawer-toolbar" />
            
            <p:region regionName="top-menu" regionID="navigation-menu" cms="true" />
        </div>
    </div>
    
    <!-- Recherche -->
    <div class="navigation-search hidden-xs">
        <p:region regionName="search" />
    </div>
    
    <div class="navigation-line hidden-xs"></div>
</div>
