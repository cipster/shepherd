<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/img/favico.png">


    <title>Shepherd</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/carousel.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/css/datatables.bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

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
                <li><a href="/setari" data-toggle="tooltip" data-placement="bottom"
                       title="<spring:message code="MAIN.ESTI_INREGISTRAT_CA" /> ${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
                </li>
                <li><a href="javascript:formSubmit()"><spring:message code="NAVBAR.LOG_OUT" /></a></li>
            </ul>

            <ul class="nav nav-tabs nav-navbar">
                <li><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>
                <li><a href="/buget">Bugete</a></li>
                <li class="active"><a href="/cheltuieli"><spring:message code="MAIN.CHELTUIELI" /></a></li>
                <li><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                <li><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<c:import url="include/cheltuieliBody.jsp"/>

<footer class="panel-footer">
    <p>&copy; fieldcover 2014 <a href="#"></a> &middot; <a href="#">Shepherd</a></p>
</footer>

<form action="/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

</body>
</html>

