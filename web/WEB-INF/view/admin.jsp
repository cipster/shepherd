<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="cipster">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
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
    <style>
        input select {
            font-size: 13pt!important;
        }
    </style>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
    <div class="jumbotron col-md-12" style="min-height: 500px;">
        <div class="list-group col-md-3">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a href="#adauga" id="adauga" class="list-group-item">
                    <span class="fa fa-plus">&nbsp;</span> <spring:message code="ADMIN.ADDPROJ" /></a>
                <a href="#modifica" id="modifica" class="list-group-item">
                    <span class="fa fa-pencil">&nbsp;</span>
                    <spring:message code="ADMIN.MODPROJ" /></a>
                <a href="#sterge" id="sterge" class="list-group-item">
                    <span class="fa fa-remove">&nbsp;</span>
                    <spring:message code="ADMIN.DELPROJ" /></a>
                <a href="#clienti" id="clienti" class="list-group-item">
                    <span class="fa fa-briefcase">&nbsp;</span> <spring:message code="ADMIN.MODCLIENTI" /></a>
            </sec:authorize>
            <a href="#utilizatori" id="utilizatori" class="list-group-item">
                <span class="fa fa-group">&nbsp;</span> <spring:message code="ADMIN.MODUSER" /></a>
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
            <div id="modClienti" style="display: none">
                <c:import url="include/modClient.jsp"></c:import>
            </div>
            <div id="modUsers" style="display: none">
                <c:import url="include/modUsers.jsp"></c:import>
            </div>
        </div>
    </div>
</div><!--/.container-->

<div id="alert" class="notifications"></div>

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
<script src="/js/bootstrap-notify.js"></script>
<script type="text/javascript">
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

    function getClients(){
        $("#clientselect").html("");
        $("#idClient").html("");
        $("#idClientInput").html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/clientlist',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        $("#clientselect").append($("<option>").val(response[i].idClient).text(response[i].client));
                        $("#idClientInput").append($("<option>").val(response[i].idClient).text(response[i].client));
                        $("#idClient").append($("<option>").val(response[i].idClient).text(response[i].client));
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        $("#clientselect").val(-1);
        $("#clientselect").trigger("chosen:updated");
        $("#idClientInput").val(-1);
        $("#idClientInput").trigger("chosen:updated");
        $("#idClient").val(-1);
        $("#idClient").trigger("chosen:updated");

    }

    function getUsers(){
        var idUserSelect = $("#idUserSelect");
        idUserSelect.html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/userlist',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        idUserSelect
                                .append( $('<option id="' + response[i].username + '" data-username="' + response[i].username +'" data-password="' + response[i].password +'" data-status="' + response[i].enabled + '">')
                                        .val(response[i].username).text(response[i].username) );
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        idUserSelect.val(-1);
        idUserSelect.trigger("chosen:updated");
    }

    function getProjects(){
        var idProiectSelect = $("#idProiectSelect");
        var idProiect = $("#idProiect");
        idProiectSelect.html("");
        idProiect.html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/proiectelist',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        idProiectSelect
                                .append($('<option id="' + response[i].idProiect + '" data-nume="' + response[i].numeProiect +'" data-nr="' + response[i].nrProiect +'" data-an="' + response[i].an + '" data-idClient="' + response[i].idClient +'">')
                                        .val(response[i].idProiect).text(response[i].nrProiect + ' ' + response[i].numeProiect + ' ' + response[i].an));
                        idProiect
                                .append($('<option id="' + response[i].idProiect + '" data-nume="' + response[i].numeProiect +'" data-nr="' + response[i].nrProiect +'" data-an="' + response[i].an + '" data-idClient="' + response[i].idClient +'">')
                                        .val(response[i].idProiect).text(response[i].nrProiect + ' ' + response[i].numeProiect + ' ' + response[i].an));


                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        idProiectSelect.val(-1);
        idProiectSelect.trigger("chosen:updated");
        idProiect.val(-1);
        idProiect.trigger("chosen:updated");

    }

    $(document).ready(function () {

        $('#slashadmin').addClass('active');
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
        $("#clientselect").chosen({
            width: "100%",
            search_contains: true,
            no_results_text: "Clientul nu exista!",
            allow_single_deselect: true
        });
        $("#idClient").chosen({
            width: "100%",
            search_contains: true,
            no_results_text: "Clientul nu exista!",
            allow_single_deselect: true
        });
        $("#idClientInput").chosen({
            width: "100%",
            search_contains: true,
            no_results_text: "Clientul nu exista!",
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

        $("#anInput").chosen({
            width: "100%",
            disable_search: true,
            allow_single_deselect: true
        });

        $("#anSelInput").chosen({
            width: "100%",
            disable_search: true,
            allow_single_deselect: true
        });

        $("#newRoluriInput").chosen({
            width: "100%",
            disable_search: true,
            allow_single_deselect: true
        });

        getClients();
        getProjects();

        $("#anSelInput").val(-1);
        $("#anSelInput").trigger("chosen:updated");
        $("#idProiect").val([]);
        $("#idProiect").trigger("chosen:updated");
        $("#idUserSelect").val([]);
        $("#idUserSelect").trigger("chosen:updated");
        $("#idProiectSelect").val([]);
        $("#idProiectSelect").trigger("chosen:updated");
        $("#clientselect").val([]);
        $("#clientselect").trigger("chosen:updated");

        $("#addProj").css('display', "none");
        $("#modProj").css('display', "none");
        $("#delProj").css('display', "none");
        $("#modUsers").css('display', "none");
        $("#modClienti").css('display', "none");

        $("#adauga").click(function () {
            $("#adauga").prop('class', "list-group-item active");
            $("#modifica").prop('class', "list-group-item");
            $("#sterge").prop('class', "list-group-item");
            $("#utilizatori").prop('class', "list-group-item");
            $("#clienti").prop('class', "list-group-item");
            $("#addProj").css('display', "block");
            $("#modProj").css('display', "none");
            $("#delProj").css('display', "none");
            $("#modUsers").css('display', "none");
            $("#modClienti").css('display', "none");
            $("#sfat").css('display', "none");


        });

        $("#modifica").click(function () {
            $("#modifica").prop('class', "list-group-item  active");
            $("#adauga").prop('class', "list-group-item");
            $("#sterge").prop('class', "list-group-item");
            $("#utilizatori").prop('class', "list-group-item");
            $("#clienti").prop('class', "list-group-item");
            $("#addProj").css('display', "none");
            $("#modProj").css('display', "block");
            $("#delProj").css('display', "none");
            $("#modUsers").css('display', "none");
            $("#modClienti").css('display', "none");
            $("#sfat").css('display', "none");
            getProjects();
            getClients();


        });

        $("#sterge").click(function () {
            $("#sterge").prop('class', "list-group-item  active");
            $("#adauga").prop('class', "list-group-item");
            $("#modifica").prop('class', "list-group-item");
            $("#utilizatori").prop('class', "list-group-item");
            $("#clienti").prop('class', "list-group-item");
            $("#addProj").css('display', "none");
            $("#modProj").css('display', "none");
            $("#delProj").css('display', "block");
            $("#modUsers").css('display', "none");
            $("#modClienti").css('display', "none");
            $("#sfat").css('display', "none");
            getProjects();


        });

        $("#clienti").click(function () {
            $("#utilizatori").prop('class', "list-group-item");
            $("#adauga").prop('class', "list-group-item");
            $("#modifica").prop('class', "list-group-item");
            $("#sterge").prop('class', "list-group-item");
            $("#clienti").prop('class', "list-group-item active");
            $("#addProj").css('display', "none");
            $("#modProj").css('display', "none");
            $("#delProj").css('display', "none");
            $("#modUsers").css('display', "none");
            $("#modClienti").css('display', "block");
            $("#sfat").css('display', "none");
            getClients();
            $('#btnModClient').attr('data-target', '');
            $('#btnDelClient').attr('data-target', '');
            $('#numeClient').val('');

        });

        $("#utilizatori").click(function () {
            $("#utilizatori").prop('class', "list-group-item active");
            $("#adauga").prop('class', "list-group-item");
            $("#modifica").prop('class', "list-group-item");
            $("#sterge").prop('class', "list-group-item");
            $("#clienti").prop('class', "list-group-item");
            $("#addProj").css('display', "none");
            $("#modProj").css('display', "none");
            $("#delProj").css('display', "none");
            $("#modUsers").css('display', "block");
            $("#modClienti").css('display', "none");
            $("#sfat").css('display', "none");
            getUsers();
            $('#btnChPass').attr('data-target','');
            $('#btnModUser').attr('data-target','');

        });
    });

</script>
