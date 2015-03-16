<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/main"><img style="height:30px;"
                                                      src="/img/logo360.png"/></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a style="color: darkmagenta" href="/setari" data-toggle="tooltip" data-placement="bottom"
                       title="<spring:message code="MAIN.ESTI_INREGISTRAT_CA" /> ${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
                </li>
                <li><a href="javascript:formSubmit()"><spring:message code="NAVBAR.LOG_OUT" /></a></li>
            </ul>

            <ul class="nav nav-tabs nav-navbar">
                <li id="slashmain"><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <%--<li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>--%>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')">
                    <li id="slashadmin"><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_INVENTAR','ROLE_ADMIN','ROLE_SUPERUSER')">
                    <li id="slashinventar"><a href="/inventar"><spring:message code="NAVBAR.INVENTAR" /></a></li>
                </sec:authorize>
                <li id="slashsetari"><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>
