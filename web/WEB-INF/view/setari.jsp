<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="cipster">
    <link rel="icon" href="/img/favico.png">

    <title>Shepherd</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">

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
                <li><a href="javascript:formSubmit()"><spring:message code="NAVBAR.LOG_OUT" /></a></li>
            </ul>
            <ul class="nav nav-tabs">
                <li><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                </sec:authorize>
                <li class="active"><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<div class="container">
    <div class="row well">

        <div class="col-md-12">
            <div class="panel">
                <img class="pic img-circle"
                     src="/img/userPhoto.jpg"
                     alt="...">

                <div class="name">
                    <small>${pageContext.request.userPrincipal.name}</small>
                </div>
            </div>

            <br/><br/><br/>

            <div class="col-md-offset-1">
                <span class="col-md-1"><strong><spring:message code="PASSWORD" /></strong></span>

                <a class="btn btn-xs btn-primary">Schimba <span class="glyphicon glyphicon-edit"></span></a>
            </div>


        </div>

    </div>
</div>

<form action="/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

</body>
<footer class="panel-footer">
    <p>&copy; fieldcover 2014 <a href="#"></a> &middot; <a href="#">Shepherd</a></p>
</footer>
</html>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

</script>