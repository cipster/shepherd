<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="/css/octicons.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/cover.css" rel="stylesheet">
    <link href="/css/carousel.css" rel="stylesheet">


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
            <ul class="nav navbar-nav navbar-right">

            </ul>
            <ul class="nav nav-tabs nav-navbar">
                <li><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <li class="active"><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                </sec:authorize>
                <li><a href="/inventar"><spring:message code="NAVBAR.INVENTAR" /></a></li>
                <li><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<!-- Carousel
================================================== -->
<div id="myCarousel"  class="carousel slide unselectable" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">

        <div class="item active">
            <img src="/img/pont2.png" alt="">

            <div class="container">
                <div class="carousel-caption">
                    <p class="lead"><spring:message code="ABOUT.MSG1" /></p>
                    <p class="lead">
                        <a href="http://www.360insights.eu"><img style="height:30px;" src="/img/logo.png"></a>
                    </p>

                </div>
            </div>
        </div>

        <div class="item ">
            <img src="/img/pont2.png" alt="">

            <div class="container">
                <div class="carousel-caption">
                    <h1><spring:message code="ABOUT.MSG2" /></h1>
                    <p><spring:message code="ABOUT.MSG3" /></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="/img/clickdreapta.png" alt="">

            <div class="container">
                <div class="carousel-caption">
                    <h1><spring:message code="ABOUT.MSG4" /></h1>
                    <h3><br/></h3>
                    <p><spring:message code="ABOUT.MSG5" /></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="/img/setaricont.png" alt="">

            <div class="container">
                <div class="carousel-caption">
                    <h1><spring:message code="ABOUT.MSG6" /></h1>
                    <h3><br/></h3>
                    <p><spring:message code="ABOUT.MSG7" /></p>

                    <p><a class="btn btn-lg btn-primary" href="/setari" role="button"><spring:message code="NAVBAR.SETARI" /></a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" style="display: table-cell" href="#myCarousel" data-slide="prev"><span
            class="fa fa-2x fa-chevron-left" style="vertical-align: middle;"></span></a>
    <a class="right carousel-control" style="display: table-cell" href="#myCarousel" data-slide="next"><span
            class="fa fa-2x fa-chevron-right" style="top:100px;"></span></a>
</div>
<!-- /.carousel -->

<div class="mastfoot">
    <div class="inner">
        <p><spring:message code="FOOTER.MORE" /> <a href="http://bostanciprian.wordpress.com/">Shepherd</a><spring:message code="FOOTER.CREATEDBY" /><a
                href="https://twitter.com/bostanciprian"> @fieldcover</a>.</p>
    </div>
</div>

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
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>