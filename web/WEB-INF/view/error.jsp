<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <title><spring:message code="ERROR.TITLE" /></title>


    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/cover.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="site-wrapper">


    <div class="cover-container">


        <div class="inner cover">
            <h1 class="cover-heading"><spring:message code="ERROR.TITLE"/></h1>

            <p class="lead"><spring:message code="ERROR.MSG" /></p>

            <p class="lead">
                <a href="/main" class="btn btn-large btn-primary">
                    <i class="glyphicon glyphicon-home"></i>
                    <spring:message code="ERROR.HOME"/>
                </a>
            </p>
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
