<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">

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
                <ul class="nav nav-tabs">
                    <li><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                    <%--<li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>--%>
                    <li class="active"><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                    <li><a href="/inventar"><spring:message code="NAVBAR.INVENTAR" /></a></li>
                    <li><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>

    <div class="container">
        <div class="jumbotron col-md-12" style="height: 557px;">
            <div class="list-group col-md-3">
                <a href="#adauga" id="adauga" class="list-group-item">
                    <span class="fa fa-plus">&nbsp;</span> <spring:message code="ADMIN.ADDPROJ" /></a>
                <a href="#modifica" id="modifica" class="list-group-item">
                    <span class="fa fa-pencil">&nbsp;</span>
                    <spring:message code="ADMIN.MODPROJ" /></a>
                <a href="#sterge" id="sterge" class="list-group-item">
                    <span class="fa fa-remove">&nbsp;</span>
                    <spring:message code="ADMIN.DELPROJ" /></a>
                <a href="#utilizatori" id="utilizatori" class="list-group-item">
                    <span class="fa fa-user">&nbsp;</span> <spring:message code="ADMIN.MODUSER" /></a>
            </div>
            <div class="well col-md-9 col-md-offset-0" id="continut">

                <h3 style="text-align: center;" id="sfat"><spring:message code="ADMIN.PLACEHOLDER" /></h3>

                <div id="addProj" style="display: none">
                    <c:import url="include/addProj.jsp"></c:import>
                </div>
                <div id="modProj" style="display: none">
                    <c:import url="include/modProj.jsp"></c:import>
                </div>
                <div id="delProj" style="display: none">
                    <c:import url="include/delProj.jsp"></c:import>
                </div>
                <div id="modUsers" style="display: none">
                    <c:import url="include/modUsers.jsp"></c:import>
                </div>
            </div>
        </div>
    </div><!--/.container-->

    <form action="/logout" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
    <footer class="panel-footer">
        <p>&copy; fieldcover 2014 <a href="#"></a> &middot; <a href="#">Shepherd</a></p>
    </footer>
</body>
</html>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script type="text/javascript">
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }

        $(document).ready(function () {
            $("#adminInput").chosen({
                width: "100%",
                search_contains: true,
                no_results_text: "Rolul nu exista!"
            });
            $("#idProiect").chosen({
                width: "100%",
                search_contains: true,
                no_results_text: "Proiectul nu exista!",
                allow_single_deselect: true
            });
            $("#idProiectSelect").chosen({
                width: "100%",
                search_contains: true,
                no_results_text: "Proiectul nu exista!",
                allow_single_deselect: true
            });
            $("#idUserSelect").chosen({
                width: "100%",
                search_contains: true,
                no_results_text: "Utilizatorul nu exista!",
                allow_single_deselect: true,
                disable_search_threshold: 5
            });
           $("#statusInput").chosen({
                width: "100%",
                disable_search: true,
                allow_single_deselect: true
            });
            $("#idProiect").val([]);
            $("#idProiect").trigger("chosen:updated");
            $("#idUserSelect").val([]);
            $("#idUserSelect").trigger("chosen:updated");
            $("#idProiectSelect").val([]);
            $("#idProiectSelect").trigger("chosen:updated");

            $("#addProj").css('display', "none");
            $("#modProj").css('display', "none");
            $("#delProj").css('display', "none");
            $("#modUsers").css('display', "none");

            $("#adauga").click(function () {
                $("#adauga").prop('class', "list-group-item active");
                $("#modifica").prop('class', "list-group-item");
                $("#sterge").prop('class', "list-group-item");
                $("#utilizatori").prop('class', "list-group-item");
                $("#addProj").css('display', "block");
                $("#modProj").css('display', "none");
                $("#delProj").css('display', "none");
                $("#modUsers").css('display', "none");
                $("#sfat").css('display', "none");


            });

            $("#modifica").click(function () {
                $("#modifica").prop('class', "list-group-item  active");
                $("#adauga").prop('class', "list-group-item");
                $("#sterge").prop('class', "list-group-item");
                $("#utilizatori").prop('class', "list-group-item");
                $("#addProj").css('display', "none");
                $("#modProj").css('display', "block");
                $("#delProj").css('display', "none");
                $("#modUsers").css('display', "none");
                $("#sfat").css('display', "none");


            });

            $("#sterge").click(function () {
                $("#sterge").prop('class', "list-group-item  active");
                $("#adauga").prop('class', "list-group-item");
                $("#modifica").prop('class', "list-group-item");
                $("#utilizatori").prop('class', "list-group-item");
                $("#addProj").css('display', "none");
                $("#modProj").css('display', "none");
                $("#delProj").css('display', "block");
                $("#modUsers").css('display', "none");
                $("#sfat").css('display', "none");


            });

            $("#utilizatori").click(function () {
                $("#utilizatori").prop('class', "list-group-item active");
                $("#adauga").prop('class', "list-group-item");
                $("#modifica").prop('class', "list-group-item");
                $("#sterge").prop('class', "list-group-item");
                $("#addProj").css('display', "none");
                $("#modProj").css('display', "none");
                $("#delProj").css('display', "none");
                $("#modUsers").css('display', "block");
                $("#sfat").css('display', "none");


            });


        });


</script>
