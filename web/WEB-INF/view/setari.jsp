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
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
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
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                </sec:authorize>
                <li><a href="/inventar"><spring:message code="NAVBAR.INVENTAR" /></a></li>
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
                    <small id="username">${pageContext.request.userPrincipal.name}</small>
                </div>
            </div>

            <br/><br/><br/>

            <div class="col-md-offset-1">
                <span class="col-md-1"><strong><spring:message code="PASSWORD" /></strong></span>
                <button class="btn btn-xs btn-primary" data-toggle="modal" data-target="#schimbaparola"><spring:message code="MODUSER.CHANGEPASS" /> <span class="fa fa-edit"></span></button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="schimbaparola">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODUSER.CHANGEPASS" /></h4>
            </div>
            <form method="POST" id="adminChangePass" action="${pageContext.request.contextPath}/api/schimbaparola">
                <div class="modal-body">
                    <div class="input-group">
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <label for="chPasswordInput"><spring:message code="MODUSER.PASSNEW" /></label>
                            <input type="password" id="chPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <label for="chRepeatPasswordInput"><spring:message code="MODUSER.REPETAPAROLA" /></label>
                            <input type="password" id="chRepeatPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <label for="chShowPass"><spring:message code="MODUSER.ARATAPAROLA" /></label>
                            <input type="checkbox" id="chShowPass" class="checkbox"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" ><spring:message code="MODUSER.CHANGEPASS" /></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<form action="/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

<div id="alert" class="notifications"></div>

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
<script src="/js/bootstrap-notify.js"></script>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

    $(document).ready(function() {

        $('#chShowPass').on('click', function(e){
            var pass = $('#chPasswordInput');
            var rpass = $('#chRepeatPasswordInput');
            if(pass.attr('type') == 'password'){
                pass.attr('type', 'text');
                rpass.attr('type', 'text');
            } else {
                pass.attr('type', 'password');
                rpass.attr('type', 'password');
            }
        });

        $("#adminChangePass").on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var user = $("#username").text();
            var pass = $('#chPasswordInput').val();
            var rpass = $('#chRepeatPasswordInput').val();
            if(pass.trim().length == 0 && rpass.trim().length == 0 ){
                return;
            }
            if(pass !== rpass){
                alert('Parolele nu se potrivesc!');
                return;
            }
            data = 'user=' + user + '&password=' + pass;
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: data,
                success: function (response) {
                    if (response === '-1') {
                        $("#alert").notify({
                            message: {text: 'Parola nu a fost schimbata!'},
                            type: 'danger',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: {enabled: true, delay: 15000}
                        }).show();
                        return;
                    }
                    $('#chPasswordInput').val('');
                    $('#chRepeatPasswordInput').val('');
                    var respContent = 'Parola a fost actualizata!';

                    $('.modal.in').modal('hide');
                    $('body').removeClass('modal-open');
                    $('.modal-backdrop').remove();
                    $("#alert").notify({
                        message: {text: respContent},
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: {enabled: true, delay: 15000}
                    }).show();
                },
                error: function (e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });
    });

</script>