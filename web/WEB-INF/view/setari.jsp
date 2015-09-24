<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ro">
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
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
</head>

<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
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
                <h4 class="modal-title"><spring:message code="MODUSER.CHANGEPASS"/></h4>
            </div>
            <form method="POST" id="adminChangePass" action="${pageContext.request.contextPath}/api/schimbaparola">
                <div class="modal-body">
                    <div class="container-fluid form-horizontal">
                        <div class="form-group col-md-6">
                            <label for="chPasswordInput"><spring:message code="MODUSER.PASSNEW"/></label>
                            <input type="password" id="chPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12"></div>
                        <div class="form-group col-md-6">
                            <label for="chRepeatPasswordInput"><spring:message code="MODUSER.REPETAPAROLA"/></label>
                            <input type="password" id="chRepeatPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="chShowPass"/> <spring:message code="MODUSER.ARATAPAROLA"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><span class="fa fa-lock fa-fw">&nbsp;</span> <spring:message code="MODUSER.CHANGEPASS"/></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times fa-fw">&nbsp;</span> <spring:message code="DIALOG.CLOSE"/></button>
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
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.min.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">

    $(document).ready(function() {

        $('#slashsetari').addClass('active');
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
                showNotification('Parolele nu se potrivesc!', WARNING);
                return;
            }

            if(pass.length < 8){
                showNotification('Parola trebuie sa aiba 8 sau mai multe caractere!', WARNING);
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
                        showNotification('Parola nu a fost schimbata!', DANGER, 15000);
                        return;
                    }
                    $('#chPasswordInput').val(EMPTY);
                    $('#chRepeatPasswordInput').val(EMPTY);
                    var respContent = 'Parola a fost actualizata!';
                    hideModal();
                    showNotification(respContent);
                },
                error: function (e) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });
        });
    });

</script>