<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="internationalization" prefix="is"%>


<c:set var="userPortal" value="${requestScope['osivia.userPortal']}" />
<c:set var="userPages" value="${userPortal.userPages}" />

<c:set var="searchPlaceholder"><is:getProperty key="SEARCH_PLACEHOLDER" /></c:set>


<div class="visible-xs clearfix">
    <div class="col-xs-12 drawer-toolbar-header">
        <div>
            <!-- Search -->
            <div class="drawer-toolbar-search">
                <div class="media">
                    <div class="media-left">
                        <button type="button" onclick="hideDrawerSearch();" class="btn btn-link">
                            <i class="halflings halflings-arrow-left"></i>
                        </button>
                    </div>
                
                    <div class="media-body">
                        <form class="form-inline" action="${requestScope['osivia.search.web.url']}" method="get" role="search">
                            <label class="sr-only" for="drawer-search-input"><is:getProperty key="SEARCH" /></label>
                            <div class="input-group">
                                <input id="drawer-search-input" type="text" name="q" class="form-control" placeholder="${searchPlaceholder}">
                                <span class="input-group-btn">    
                                    <button type="submit" class="btn btn-default">
                                        <i class="halflings halflings-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        
            <!-- Title -->
            <div class="drawer-toolbar-title">
                <div class="media">
                    <div class="media-body">
                        <div>
                            <p class="text-middle text-overflow">
                                <span><is:getProperty key="BRAND" /></span>
                            </p>
                        </div>
                    </div>
                
                    <div class="media-right text-nowrap">
                        <button type="button" onclick="showDrawerSearch();" class="btn btn-link">
                            <i class="halflings halflings-search"></i>
                        </button>
                        
                        <c:choose>
                            <c:when test="${empty requestScope['osivia.toolbar.principal']}">
                                <a href="${requestScope['osivia.toolbar.loginURL']}" class="btn btn-link">
                                    <i class="halflings halflings-log-in"></i>
                                </a>
                            </c:when>
                            
                            <c:otherwise>
                                <div class="btn-group dropdown">
                                    <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                        <img class="avatar" src="${requestScope['osivia.toolbar.person'].avatar.url}" />
                                        <small><i class="halflings halflings-triangle-bottom"></i></small>
                                    </button>

                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <li class="dropdown-header" role="presentation">${requestScope['osivia.toolbar.person'].displayName}</li>
                                    
                                        <li role="presentation">
                                            <a href="${requestScope['osivia.toolbar.myprofile']}" role="menuitem">
                                                <i class="glyphicons glyphicons-nameplate"></i>
                                                <span><is:getProperty key="MY_PROFILE" /></span>
                                            </a>
                                        </li>
                                        
                                        <li role="presentation">
                                            <a href="${requestScope['osivia.toolbar.signOutURL']}" data-toggle="collapse" role="menuitem">
                                                <i class="halflings halflings-log-out"></i>
                                                <span><is:getProperty key="LOGOUT" /></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
