<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Not Found 404</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/cover.css" rel="stylesheet">
</head>

<body>
<div class="main-content">
    <div class="row">
        <div class="col-md-12">
            <div class="panel error-panel">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-puzzle-piece"></i> Page Not Found</h3>
                </div>
                <div class="panel-body">
                    <p>The page you are looking for does not exist.</p>
                    <p>You may have mistyped the address or the page may have moved.</p>
                    <p>
                        <a href="javascript: history.back()" class="btn btn-large btn-primary">
                            <i class="fa fa-reply"></i>
                            Go back to the previous page
                        </a>
                        <a href="/main" class="btn btn-large btn-primary">
                            <i class="fa fa-home"></i>
                            <spring:message code="ERROR.HOME"/>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="mastfoot">
            <div class="inner">
                <p><spring:message code="FOOTER.MORE"/> <a href="http://bostanciprian.wordpress.com/">Shepherd</a><spring:message code="FOOTER.CREATEDBY"/><a
                        href="https://twitter.com/bostanciprian"> @fieldcover</a>.</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="/js/jquery.min.js"></script>--%>
<%--<script src="/js/bootstrap.min.js"></script>--%>
<%--<script src="/js/docs.min.js"></script>--%>
</body>
</html>
