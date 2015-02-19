<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/cover.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="cover-container">

    <div class="inner cover">
        <h3 class="cover-heading"><spring:message code="ACCESS.HI" /> ${username} </h3>

        <p class="lead"><spring:message code="ACCESS.NORIGHT" /></p>

        <p class="lead">
            <a href="/main" class="btn btn-large btn-info"><i class="fa fa-home"></i> <spring:message code="ERROR.HOME" /></a>
        </p>
    </div>

    <div class="mastfoot">
        <div class="inner">
            <p><spring:message code="FOOTER.MORE" /> <a href="http://bostanciprian.wordpress.com/">Shepherd</a><spring:message code="FOOTER.CREATEDBY" /><a
                    href="https://twitter.com/bostanciprian">@fieldcover</a>.</p>
        </div>
    </div>

</div>
<!--/.container-->

<form action="/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/docs.min.js"></script>

</body>
</html>
<script type="text/javascript">

    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

</script>
