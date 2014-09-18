<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .error {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .msg {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }

    </style>
</head>

<body style="text-align:center;">

<div class="container" style="text-align:center;">


    <form class="form-signin" name='loginForm'
          action="/login" method="POST">
        <h2 class="form-signin-heading"><img style="margin-top: 6px;" width="200"
                                             src="/img/logoLogin.png"/></h2>
        <input name="username" type="text" class="form-control" placeholder="<spring:message code="USER" />"
                />
        <input name="password" type="password" class="form-control" placeholder="<spring:message code="PASSWORD" />"
                />
        <button id="btnLogin" class="btn btn-lg btn-primary btn-block" type="submit"><span
                class="glyphicon glyphicon-login"></span> Sign in
        </button>
        <input type="hidden"
               name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>

</div>
<!-- /container -->
<div id="downloadChrome" class="jumbotron" style="width: 60%;height:auto; margin-left:auto; margin-right: auto;">
    <div>
    <h3><spring:message code="DOWNLOADCHROME" /></h3>
    <div>
    <a class="btn btn-primary pull-right" href="http://google.com">Google Chrome</a>  <a class="btn btn-primary pull-right" href="">Chromium</a>
    </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="application/javascript">
    $(".container").hide();
    $("#downloadChrome").hide();

    if(/chrom(e|ium)/.test(navigator.userAgent.toLowerCase())){
        $("#downloadChrome").hide();
        $(".container").show();
    } else {
        $(".container").hide()
        $("#downloadChrome").show()
    }
</script>
