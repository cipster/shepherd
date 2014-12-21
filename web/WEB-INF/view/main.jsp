<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/datatables.bootstrap.css" rel="stylesheet">

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

            <ul class="nav nav-tabs nav-navbar">
                <li class="active"><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>
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


<div class="container">

    <!-- Main component -->
    <div class="jumbotron">
        <br/>
        <table id="tabelProiecte" class="table unselectable" width="auto">
            <thead>
            <th hidden="hidden">Id</th>
            <th><spring:message code="MAIN.NR" /></th>
            <th><spring:message code="MAIN.AN" /></th>
            <th><spring:message code="MAIN.NUME" /></th>
            <th><spring:message code="MAIN.CLIENT" /></th>
            </thead>
            <tbody>
            <c:forEach items="${listaProiecte}" var="prj">
                <tr id="${prj.idProiect}" class="idTabel" data-id="${prj.idProiect}" data-idBd="${prj.idBd}"
                    data-idPropunere="${prj.idPropunere}" data-idChestionarFinal="${prj.idChestionarFinal}"
                    data-idRaportFinal="${prj.idRaportFinal}" data-idAlteMateriale="${prj.idAlteMateriale}">
                    <td hidden="hidden" class="id">${prj.idProiect}</td>
                    <td>${prj.nrProiect} </td>
                    <td>${prj.an}</td>
                    <td>${prj.numeProiect}</td>
                    <td>
                        <c:forEach items="${listaClienti}" var="clnt">
                            <c:if test="${prj.idClient == clnt.idClient}">
                                ${clnt.client}
                            </c:if>

                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
    <sec:authorize access="hasRole('ROLE_DOWNLOAD')">
        <div id="childrcmenu" class="unselectable">
                <div class="menuItem" onclick="download();"><spring:message code="MAIN.DESCARCA" /></div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <input id="idMaster" hidden="hidden"/>
                <input id="id" hidden="hidden"/>
                <input id="category" hidden="hidden"/>
                <input id="fileName" hidden="hidden"/>
                <div class="menuItem" data-toggle="modal"
                     data-target="#estiSigurFile" onclick="atribuieNumeFile();"><spring:message code="MAIN.DELETE" /></div>
            </sec:authorize>
        </div>
    </sec:authorize>
<div id="rcmenu" class="unselectable">
    <div class="menuItem" data-toggle="modal" data-target="#cercCheltuieli"><spring:message code="MAIN.CHELTUIELI" /></div>
    <div class="menuItem" data-toggle="modal" data-target="#uploadPropunere"><spring:message code="MAIN.PROPUNERE" /></div>
    <div class="menuItem" data-toggle="modal" data-target="#uploadChestionar"><spring:message code="MAIN.CHESTIONAR" /></div>
    <div class="menuItem" data-toggle="modal" data-target="#uploadRaport"><spring:message code="MAIN.RAPORT" /></div>
    <div class="menuItem" data-toggle="modal" data-target="#uploadBd"><spring:message code="MAIN.BD" /></div>
    <div class="menuItem" data-toggle="modal" data-target="#uploadAlteMateriale"><spring:message code="MAIN.ALTEMATERIALE" /></div>
</div>


</div> <!-- /container -->


<div class="modal fade" id="uploadPropunere">
    <c:import url="include/uploadPropunere.jsp"></c:import>
</div>
<!-- /.modal -->

<div class="modal fade" id="uploadChestionar">
    <c:import url="include/uploadChestionar.jsp"></c:import>
</div>
<!-- /.modal -->

<div class="modal fade" id="uploadRaport">
    <c:import url="include/uploadRaport.jsp"></c:import>
</div>
<!-- /.modal -->

<div class="modal fade" id="uploadBd" role="dialog">
    <c:import url="include/uploadBd.jsp"></c:import>
</div>
<!-- /.modal -->

<div class="modal fade" id="uploadAlteMateriale">
    <c:import url="include/uploadAlteMateriale.jsp"></c:import>
</div>
<!-- /.modal -->
<div class="modal fade" id="estiSigurFile">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DIALOG.DELETE" /></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURDELETE" /> <span id="fileNameDel" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="deleteFile();"><spring:message code="DIALOG.DEL" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="NU" /></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- /.modal -->
<div class="modal fade" id="cercCheltuieli">
    <div class="modal-dialog modal-xlg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MAIN.CHELTUIELI" /></h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>
                            <div class="pic img-circle"></div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary pull-left" onclick=""><spring:message code="DIALOG.ADD" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div id="alert" class="notifications"></div>


<form action="/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
</form>

<input id="username" hidden="hidden" value="${pageContext.request.userPrincipal.name}"/>
<sec:authorize access="hasRole('ROLE_DOWNLOAD')">
    <input id="propDownloadString" hidden="hidden" value="1">
    <input id="chestDownloadString" hidden="hidden" value="1">
    <input id="rapDownloadString" hidden="hidden" value="1">
    <input id="bdDownloadString" hidden="hidden" value="1">
    <input id="amDownloadString" hidden="hidden" value="1">
    <input id="download" hidden="hidden">
</sec:authorize>
<input hidden="hidden" id="appLangCode" value="">
</body>
<footer class="panel-footer">
    <p class="pull-right"><a href="#"><spring:message code="NAVBAR.BACKTOTOP" /></a></p>
    <p>&copy; fieldcover 2014 <a href="#"></a> &middot; <a href="#">Shepherd</a></p>
</footer>
</html>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/docs.min.js"></script>
<script src="/js/bootstrap.file-input.js"></script>
<script src="/js/datatables.js"></script>
<script src="/js/datatables.bootstrap.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script type="text/javascript">
    var table;
    var appLangCode = getUrlParameter("lang");
    var appLang;

    switch(appLangCode){
        case '':
            appLang = "/fonts/ro_RO.txt";
            break;
        case 'ro':
            appLang = "/fonts/ro_RO.txt";
            break;
        case 'en':
            appLang = "/fonts/en_EN.txt";
            break;
        default:
            appLang = "/fonts/ro_RO.txt";
            break;
    }

    function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i=0; i < sURLVariables.length; i++){
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) {
                return sParameterName[1];
            }
        }
    }
    function deleteFile(){
        var category = $("#category").val();
        switch(category) {
            case 'p':
                propunereDelete();
                break;
            case 'c':
                chestionarDelete();
                break;
            case 'r':
                raportDelete();
                break;
            case 'bd':
                bdDelete();
                break;
            case 'am':
                alteMaterialeDelete();
                break;
            default:
                return;
        }
    }

    function atribuieNumeFile() {
        $("#fileNameDel").text($('#fileName').val());
    }

    function download(){
        window.location = $("#download").val();
    }

    function verificaFisierC() {
        if ($("#filechestionarFile").text() == "Click aici pentru a selecta un chestionar final") {
            $('#mesajAlertaC').show();
            $('#mesajAlertaC').fadeOut(3000);
        } else {
            chestionarAjaxCall();
        }
    }

    function verificaFisierP() {
        if ($("#filepropunereFile").text() == "Click aici pentru a selecta o propunere") {
            $('#mesajAlertaP').show();
            $('#mesajAlertaP').fadeOut(3000);
        } else {
            propunereAjaxCall();
        }
    }

    function verificaFisierR() {
        if ($("#fileraportFile").text() == "Click aici pentru a selecta un raport final") {
            $('#mesajAlertaR').show();
            $('#mesajAlertaR').fadeOut(3000);
        } else {
            raportAjaxCall();
        }
    }

    function verificaFisierBD() {
        if ($("#filebdFile").text() === "Click aici pentru a selecta o baza de date") {
            $('#mesajAlertaBD').show();
            $('#mesajAlertaBD').fadeOut(3000);
        } else {
            bdAjaxCall();
        }
    }

    function verificaFisierAM() {
        if ($("#filealteMaterialeFile").text() == "Click aici pentru a selecta alte materiale") {
            $('#mesajAlertaAM').show();
            $('#mesajAlertaAM').fadeOut(3000);
        } else {
            alteMaterialeAjaxCall();
        }
    }

    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

    $('input[type=file]').bootstrapFileInput();
    $('.file-inputs').bootstrapFileInput();

    function bdAjaxCall() {
        var data;
        var idProiect = $('#idProiectBd').val();
        data = new FormData();
        data.append('file', $('#bdFile')[0].files[0]);
        data.append('idProiect', idProiect);
        data.append('user', $('#username').val());
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/upload/uploadBd',
            data: data,
            dataType: 'text',
            processData: false,
            contentType: false,
            xhr: function() {  // custom xhr
                var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // check if upload property exists
                    myXhr.upload.addEventListener('progress', function (evt) {
                        if (evt.lengthComputable) {
                            $('#progress').css('width', evt.loaded);
                        }
                    }, false);
                }
                return myXhr;
            },
            success: function (response) {
                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#uploadAlert").html("");
                $("#bdFile").val("");
                $("#filebdFile").text("Click aici pentru a selecta o baza de date");


                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(JSON.parse(response));

                respContent += "Fisierul ";
                respContent += uploadResponse.fileName;
                respContent += " a fost adaugat cu succes in sectiunea baza de date!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'success',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function propunereAjaxCall() {
        var data;
        var idProiect = $('#idProiectPropunere').val();
        data = new FormData();
        data.append('file', $('#propunereFile')[0].files[0]);
        data.append('idProiect', idProiect);
        data.append('user', $('#username').val());
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/upload/uploadPropunere',
            data: data,
            dataType: 'text',
            processData: false,
            contentType: false,
            success: function (response) {
                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');
                $("#uploadAlert").html("");
                $("#propunereFile").val("");
                $("#filepropunereFile").text("Click aici pentru a selecta o propunere");

                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }

                var respContent = "";
                var uploadResponse = JSON.parse(JSON.parse(response));
                respContent += "Fisierul ";
                respContent += uploadResponse.fileName;
                respContent += " a fost adaugat cu succes in sectiunea propunere!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#alert").show();
                $("#alert").notify({
                    message: { text: respContent},
                    type: 'success',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function chestionarAjaxCall() {
        var data;
        var idProiect = $('#idProiectChestionar').val();
        data = new FormData();
        data.append('file', $('#chestionarFile')[0].files[0]);
        data.append('idProiect', idProiect);
        data.append('user', $('#username').val());
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/upload/uploadChestionar',
            data: data,
            dataType: 'text',
            processData: false,
            contentType: false,
            success: function (response) {
                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');
                $("#uploadAlert").html("");
                $("#chestionarFile").val("");
                $("#filechestionarFile").text("Click aici pentru a selecta un chestionar final");

                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }

                var respContent = "";
                var uploadResponse = JSON.parse(JSON.parse(response));

                respContent += "Fisierul ";
                respContent += uploadResponse.fileName;
                respContent += " a fost adaugat cu succes in sectiunea chestionar final!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#alert").show();
                $("#alert").notify({
                    message: { text: respContent + " "},
                    type: 'success',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function raportAjaxCall() {
        var data;
        var idProiect = $('#idProiectRaport').val();
        data = new FormData();
        data.append('file', $('#raportFile')[0].files[0]);
        data.append('idProiect', idProiect);
        data.append('user', $('#username').val());
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/upload/uploadRaport',
            data: data,
            dataType: 'text',
            processData: false,
            contentType: false,
            success: function (response) {
                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');
                $("#uploadAlert").html("");
                $("#raportFile").val("");
                $("#fileraportFile").text("Click aici pentru a selecta un raport final");

                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }

                var respContent = "";
                var uploadResponse = JSON.parse(JSON.parse(response));

                respContent += "Fisierul ";
                respContent += uploadResponse.fileName;
                respContent += " a fost adaugat cu succes in sectiunea raport final!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#alert").show();
                $("#alert").notify({
                    message: { text: respContent + " "},
                    type: 'success',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function alteMaterialeAjaxCall() {
        var data;
        var idProiect = $('#idProiectAlteMateriale').val();
        data = new FormData();
        data.append('file', $('#alteMaterialeFile')[0].files[0]);
        data.append('idProiect', idProiect);
        data.append('user', $('#username').val());
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/upload/uploadAlteMateriale',
            data: data,
            dataType: 'text',
            processData: false,
            contentType: false,
            success: function (response) {
                $("#uploadAlert").html("");
                $("#alteMaterialeFile").val("");
                $("#filealteMaterialeFile").text("Click aici pentru a selecta alte materiale");

                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
debugger;
                var respContent = "";
                var uploadResponse = JSON.parse(JSON.parse(response));

                respContent += "Fisierul ";
                respContent += uploadResponse.fileName;
                respContent += " a fost adaugat cu succes in sectiunea alte materiale!  ";

                var t = '#' + uploadResponse.idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#alert").show();
                $("#alert").notify({
                    message: { text: respContent + " "},
                    type: 'success',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function alteMaterialeDelete() {
        var idProiect = $('#idMaster').val();
        var idAM = $('#id').val() ;
        var fileName = $('#fileName').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/delete/altemateriale',
            data: 'idProiect=' + idProiect + "&idAM=" + idAM,
            cache: false,

            success: function (response) {
                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(response);

                respContent += "Fisierul ";
                respContent += uploadResponse.nume;
                respContent += " a fost sters!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'info',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function propunereDelete() {
        var idProiect = $('#idMaster').val();
        var idP = $('#id').val() ;
        var fileName = $('#fileName').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/delete/propunere',
            data: 'idProiect=' + idProiect + "&idP=" + idP,
            cache: false,

            success: function (response) {
                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(response);

                respContent += "Fisierul ";
                respContent += uploadResponse.nume;
                respContent += " a fost sters!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'info',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function chestionarDelete() {
        var idProiect = $('#idMaster').val();
        var idC = $('#id').val() ;
        var fileName = $('#fileName').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/delete/chestionar',
            data: 'idProiect=' + idProiect + "&idC=" + idC,
            cache: false,

            success: function (response) {
                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(response);

                respContent += "Fisierul ";
                respContent += uploadResponse.nume;
                respContent += " a fost sters!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'info',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function raportDelete() {
        var idProiect = $('#idMaster').val();
        var idR = $('#id').val() ;
        var fileName = $('#fileName').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/delete/raport',
            data: 'idProiect=' + idProiect + "&idR=" + idR,
            cache: false,

            success: function (response) {
                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(response);

                respContent += "Fisierul ";
                respContent += uploadResponse.nume;
                respContent += " a fost sters!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'info',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function bdDelete() {
        var idProiect = $('#idMaster').val();
        var idB = $('#id').val() ;
        var fileName = $('#fileName').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/delete/bd',
            data: 'idProiect=' + idProiect + "&idB=" + idB,
            cache: false,

            success: function (response) {
                if (response == "error") {
                    $("#alert").notify({
                        message: { text: 'Fisierul este gol  ' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 15000 }
                    }).show();
                    return;
                }
                var respContent = "";
                var uploadResponse = JSON.parse(response);

                respContent += "Fisierul ";
                respContent += uploadResponse.nume;
                respContent += " a fost sters!  ";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();

                var t = '#' + idProiect;
                var tr = $(t);
                var row = table.row(tr);
                row.child(format(tr.prop("id"))).show();
                tr.next().addClass('copil');
                $("#copil").children().addClass('copil');

                $("#alert").notify({
                    message: { text: respContent},
                    type: 'info',
                    closeable: 'true',
                    transition: 'fade',
                    fadeOut: { enabled: true, delay: 15000 }
                }).show();

            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function getProjId(id) {
        $("input[name='idProiect']").val(id);
    }

    function format(idProj) {
        var childString = '<div id="copil" class="well copil"><table class="table copil" style="width: 100%;font-size: 8pt;"><thead class="copil" style="margin-bottom:10px;"><tr class="copil"><th>Propunere</th><th>Chestionar final</th><th>Raport final</th><th>Baza de date</th><th>Alte materiale</th></tr></thead><tbody class="copil"><tr class="copil"> ';
        var propString  = '<td style="vertical-align: top;">';
        var chestString = '<td style="vertical-align: top;">';
        var rapString   = '<td style="vertical-align: top;">';
        var bdString    = '<td style="vertical-align: top;">';
        var amString    = '<td style="vertical-align: top;">';

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/files/' + idProj,
            async: false,
            cache: false,

            success: function (response) {debugger;
                var project = JSON.parse(response);

                var propunere = project.propunere;
                var chestionar = project.chestionar;
                var raport = project.raport;
                var bd = project.bd;
                var alteMateriale = project.alteMateriale;

                var propArr = propunere.toString().split(",");
                var chestArr = chestionar.toString().split(",");
                var rapArr = raport.toString().split(",");
                var bdArr = bd.toString().split(",");
                var amArr = alteMateriale.toString().split(",");

                for (var i = 0; i < propArr.length; i++) {
                    var arr = propArr[i];
                    arr = arr.split("=");
                    if (arr[0] != 0 || arr[1] != "null") {
                        var id = '' + arr[0];
                        id = id.replace(" ","");
                        var downloadLink = '';
                        if($("#propDownloadString") && $("#propDownloadString").val() == 1) {
                            downloadLink = 'href="\/download\/propunere\/' + id + '" title="Click pentru download"';
                        }
                        propString += '<a class="download pr"' + downloadLink + ' id="prop' + id + '" data-idp="' + id + '"> &#9658; ' + arr[1] + '</a><br style="margin: 3px;"/>'
                    }
                }
                for (var i = 0; i < chestArr.length; i++) {
                    var arr = chestArr[i];
                    arr = arr.split("=");
                    if (arr[0] != 0 || arr[1] != "null") {
                        var id = '' + arr[0];
                        id = id.replace(" ","");
                        var downloadLink = '';
                        if($("#chestDownloadString") && $("#chestDownloadString").val() == 1) {
                            downloadLink = 'href="\/download\/chestionar\/' + id + '" title="Click pentru download"';
                        }
                        chestString += '<a class="download ch" ' + downloadLink +' id="chest' + id + '" data-idc="' + id + '"> &#9658; ' + arr[1] + '</a><br style="margin: 3px;"/>'
                    }
                }
                for (var i = 0; i < rapArr.length; i++) {
                    var arr = rapArr[i];
                    arr = arr.split("=");
                    if (arr[0] != 0 || arr[1] != "null") {
                        var id = '' + arr[0];
                        id = id.replace(" ","");
                        var downloadLink = '';
                        if($("#rapDownloadString") && $("#rapDownloadString").val() == 1) {
                            downloadLink = 'href="\/download\/raport\/' + id + '" title="Click pentru download"';
                        }
                        rapString += '<a class="download ra" ' + downloadLink + ' id="rap' + id + '" data-idr="' + id + '"> &#9658; ' + arr[1] + '</a><br style="margin: 3px;"/>'
                    }
                }
                for (var i = 0; i < bdArr.length; i++) {
                    var arr = bdArr[i];
                    arr = arr.split("=");
                    if (arr[0] != 0 || arr[1] != "null") {
                        var id = '' + arr[0];
                        id = id.replace(" ","");
                        var downloadLink = '';
                        if($("#bdDownloadString") && $("#bdDownloadString").val() == 1) {
                            downloadLink = 'href="\/download\/bd\/' + id + '" title="Click pentru download"';
                        }
                        bdString += '<a class="download bd" ' + downloadLink + ' id="bd' + id + '" data-idb="' + id + '""> &#9658; ' + arr[1] + '</a><br style="margin: 3px;"/>'
                    }
                }
                for (var i = 0; i < amArr.length; i++) {
                    var arr = amArr[i];
                    arr = arr.split("=");
                    if (arr[0] != 0 || arr[1] != "null") {
                        var id = '' + arr[0];
                        id = id.replace(" ","");
                        var downloadLink = '';
                        if($("#amDownloadString") && $("#amDownloadString").val() == 1) {
                            downloadLink = 'href="\/download\/altemateriale\/' + id + '" title="Click pentru download"';
                        }
                        amString += '<a class="download am" ' + downloadLink + ' id="am' + id + '" data-ida="' + id + '"> &#9658; ' + arr[1] + '</a><br style="margin: 3px;"/>'
                    }
                }
            },
            error: function (e) {
                alert("Nu sunt fisiere la acest proiect!");
                return;
            }
        });
        propString += '</td>';
        chestString += '</td>';
        rapString += '</td>';
        bdString += '</td>';
        amString += '</td>';
        var buttonString =  '<tr class="copil">  <td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadPropunere"><span class="fa fa-upload ">&nbsp;</span> Upload Propunere</a></td>' +
                                                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadChestionar"><span class="fa fa-upload ">&nbsp;</span> Upload Chestionar</a></td>' +
                                                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadRaport"><span class="fa fa-upload">&nbsp;</span> Upload Raport</a></td>' +
                                                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadBd"><span class="fa fa-upload ">&nbsp;</span> Upload Baza de date</a></td>' +
                                                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadAlteMateriale"><span class="fa fa-upload ">&nbsp;</span> Upload Alte Materiale</a></td></tr>';
        childString += propString + chestString + rapString + bdString + amString + '</tr>';
        childString += buttonString;
        childString += '</tbody></table></div>';

        return childString;
    }

    $(document).ready(function () {
        table = $('#tabelProiecte').DataTable({
            "language": {
                "url": appLang
            }
        });

        // Add event listener for opening and closing details
        $('#tabelProiecte tbody').on('dblclick', 'tr', function () {
            var tr = $(this).closest('tr');
            var row = table.row(tr);
            if (!$(this).hasClass('copil')) {
                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    // Open this row
                    row.child(format(tr.prop("id"))).show();
                    tr.next().addClass('copil');
                    $("#copil").children().addClass('copil');
                    tr.addClass('shown');
                }
            }
        });

        $('#tabelProiecte tbody').on('mousedown', 'tr', function (e) {
            var tr = $(this).closest('tr');
            if (!tr.hasClass('copil')) {
                if ($(this).hasClass('selected')) {
                    var id = $(this).closest('tr').attr('id');
                    $("input[name='idProiect']").val(id);
                    $("#idMaster").val(id);
                } else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                    var id = $(this).closest('tr').attr('id');
                    $("input[name='idProiect']").val(id);
                }

                if (e.button == 2) {
                    $("#rcmenu").css('left', e.pageX + 5);
                    $("#rcmenu").css('top', e.pageY + 5);
                    $("#rcmenu").fadeIn(80);
                }
            }


        });

        $('#tabelProiecte tbody').on('mousedown', 'tr', function (e) {
            var elem = $(event.target).closest("a");
            if (elem.hasClass('download')) {
                if (e.button == 2) {
                    $("#download").val(elem.attr('href'));
                    if(elem.hasClass('am')) {
                        $("#id").val(elem.data('ida'));
                        $("#category").val("am");
                    } else if(elem.hasClass('pr')) {
                        $("#id").val(elem.data('idp'));
                        $("#category").val("p");
                    } else if(elem.hasClass('ch')) {
                        $("#id").val(elem.data('idc'));
                        $("#category").val("c");
                    } else if(elem.hasClass('ra')) {
                        $("#id").val(elem.data('idr'));
                        $("#category").val("r");
                    } else {
                        $("#id").val(elem.data('idb'));
                        $("#category").val("bd");
                    }
                    $('#fileName').val(elem.text());
                    $("#childrcmenu").css('left', e.pageX + 5);
                    $("#childrcmenu").css('top', e.pageY + 5);
                    $("#childrcmenu").fadeIn(80);
                }
            }
        });

        document.getElementById("tabelProiecte").oncontextmenu = function () {
            return false;
        }

        $(document).click(function (e) {
            if (e.button == 0 ||e.button == 1 ) {
                $("#rcmenu").fadeOut(40);
                $("#childrcmenu").fadeOut(40);
            }
        });
    })
</script>
