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
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>Shepherd</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/css/datatables.bootstrap.css" rel="stylesheet">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <style type="text/css">
        @media print
        {
            body * { visibility: hidden; }
            .barcode * { visibility: visible; }
            .barcode { position: absolute; top: 40px; left: 30px; }
        }
    </style>

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
                <li><a href="/main"><spring:message code="NAVBAR.PROIECTE" /></a></li>
                <li><a href="/about"><spring:message code="NAVBAR.DESPRE" /></a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin"><spring:message code="NAVBAR.ADMIN" /></a></li>
                </sec:authorize>
                <li class="active"><a href="/inventar"><spring:message code="NAVBAR.INVENTAR" /></a></li>
                <li><a href="/setari"><spring:message code="NAVBAR.SETARI" /></a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>


<div class="container">

    <div class="btn-group" style="float:right; margin: 15px;">
        <button id="add-item" data-toggle="modal" data-target="#add-item-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adauga articol</button>
        <button id="add-person" data-toggle="modal" data-target="#add-person-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adauga persoana</button>
        <button id="add-place" data-toggle="modal"  data-target="#add-place-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adauga loc</button>
    </div>

    <!-- Main component -->
    <div class="jumbotron">
        <br/>
        <table id="inventory-table" class="table unselectable" width="100%">
            <thead>
            <tr>
                <th>Nr</th>
                <th><spring:message code="INVENTAR.CATEGORIE" /></th>
                <th><spring:message code="INVENTAR.TIP" /></th>
                <th><spring:message code="INVENTAR.ARTICOL" /></th>
                <th><spring:message code="INVENTAR.COD" /></th>
                <th><spring:message code="INVENTAR.DETALII" /></th>
                <th><spring:message code="INVENTAR.ALOCAT" /></th>
            </tr>
            </thead>

        </table>

    </div>
</div>

<div class="modal fade" id="add-item-modal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DIALOG.ADDITEM" /></h4>
            </div>
            <form id="adaugaarticol" action="/api/adaugaarticol" method="post">
            <div class="modal-body">
                <div class="form-group">
                    <label for="selcod1">Alege cod 1</label><br/>
                    <select id="selcod1" name="cod1" title="">
                        <c:forEach items="${cod1}" var="codunu">
                            <option value="${codunu.cod1}">${codunu.denumire1}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selcod2">Alege cod 2</label><br/>
                    <select id="selcod2" name="cod2" title="">
                        <c:forEach items="${cod2}" var="coddoi">
                            <option value="${coddoi.cod2}">${coddoi.denumire2}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="denumire3">Denumire articol</label>
                    <input id="denumire3" name="denumire3" title="" class="form-control">
                </div>
                <div class="form-group">
                    <label for="detalii">Detalii articol</label>
                    <textarea id="detalii" name="detalii" title="" class="form-control" rows="4" cols="76" placeholder="mai mult"></textarea>
                </div>
                <div class="form-group">
                    <label for="pretachizitie">Pret achizitie</label>
                    <input id="pretachizitie" name="pretAchizitie" title="" class="form-control">
                </div>

            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
            </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="add-person-modal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DIALOG.ADDPERSON" /></h4>
            </div>
            <div class="modal-body">
                <div class="form-control">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick=""><spring:message code="DIALOG.ADD" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div class="modal fade" id="add-place-modal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DIALOG.ADDPLACE" /></h4>
            </div>
            <div class="modal-body">
                <div class="form-control">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick=""><spring:message code="DIALOG.ADD" /></button>
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
<script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script type="text/javascript">
    var table;
    var idArticol;

    function showBarcode(idArticol){
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/generatebarcode/' + idArticol,
            datatype:"image/jpeg",
            cache: false,
            success: function (response) {
                var $img = $('#barcode');debugger;
                $img.empty();
                var encodedData = window.btoa(response);
                $img.html('<img src="data:image/jpeg;base64,'+ encodedData + '" />');
            },
            error: function(err){
                alert('Erroare la conexiune');
            }
        });
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

            success: function (response) {
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
        var buttonString =  '<tr class="copil">  <td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadPropunere"><span class="fa fa-upload "></span> Upload Propunere</a></td>' +
                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadChestionar"><span class="fa fa-upload "></span> Upload Chestionar</a></td>' +
                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadRaport"><span class="fa fa-upload"></span> Upload Raport</a></td>' +
                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadBd"><span class="fa fa-upload "></span> Upload Baza de date</a></td>' +
                '<td><a type="button" class="btn btn-sm btn-primary" style="margin:10px; width: 150px !important;" onclick="getProjId(' + idProj + ');" data-toggle="modal" data-target="#uploadAlteMateriale"><span class="fa fa-upload "></span> Upload Alte Materiale</a></td></tr>';
        childString += propString + chestString + rapString + bdString + amString + '</tr>';
        childString += buttonString;
        childString += '</tbody></table></div>';

        return childString;
    }

    $(document).ready(function () {
        var selcod1 = $('#selcod1');
        var selcod2 = $('#selcod2');
        selcod1.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune',
            disable_search: true
        });
        selcod1.val(-1)
        selcod1.trigger('chosen:updated');
        selcod2.chosen({
            width: "60%",
            placeholder_text_single: 'Alege o optiune',
            allow_single_deselect: true,
            disable_search: true
        });
        selcod2.val(-1)
        selcod2.trigger('chosen:updated');

        table = $('#inventory-table').dataTable( {
            "ajax": {
                "url": '${pageContext.request.contextPath}/api/getinventory',
                "dataSrc": ""
            },
            "columns": [
                { "data": "idCod3" },
                { "data": "denumire1" },
                { "data": "denumire2" },
                { "data": "denumire3" },
                { "data": "barcode" },
                { "data": "detalii" },
                { "data": "pretAchizitie" }
            ],
            "columnDefs": [
                {
                    "targets": [ 0 ],
                    "visible": true,
                    "searchable": false
                }
            ]
        } );

        $('#inventory-table tbody').on( 'click', 'tr', function () {
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                idArticol = $(this).children().first().text();
                showBarcode(idArticol);
                $(this).addClass('selected');
            }
        } );

        $('#adaugaarticol').on('submit', function(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                data: $(this).serialize(),
                success: function (response) {
                    $("#alert").notify({
                        message: { text: 'Articol adaugat cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 1500 }
                    }).show()
                },
                error: function(err){
                    alert('Eroare la conexiune!');
                }
            });
        });
//        // Add event listener for opening and closing details
//        $('#inventory-table tbody').on('dblclick', 'tr', function () {
//            var tr = $(this).closest('tr');
//            var row = table.row(tr);
//            if (!$(this).hasClass('copil')) {
//                if (row.child.isShown()) {
//                    // This row is already open - close it
//                    row.child.hide();
//                    tr.removeClass('shown');
//                }
//                else {
//                    // Open this row
//                    row.child(format(tr.prop("id"))).show();
//                    tr.next().addClass('copil');
//                    $("#copil").children().addClass('copil');
//                    tr.addClass('shown');
//                }
//            }
//        });

//        $('#inventory-table tbody').on('mousedown', 'tr', function (e) {
//            var tr = $(this).closest('tr');
//            if (!tr.hasClass('copil')) {
//                if ($(this).hasClass('selected')) {
//                    var id = $(this).closest('tr').attr('id');
//                    $("input[name='idProiect']").val(id);
//                    $("#idMaster").val(id);
//                } else {
//                    table.$('tr.selected').removeClass('selected');
//                    $(this).addClass('selected');
//                    var id = $(this).closest('tr').attr('id');
//                    $("input[name='idProiect']").val(id);
//                }
//
//                if (e.button == 2) {
//                    $("#rcmenu").css('left', e.pageX + 5);
//                    $("#rcmenu").css('top', e.pageY + 5);
//                    $("#rcmenu").fadeIn(80);
//                }
//            }
//
//
//        });
//
//        $('#inventory-table tbody').on('mousedown', 'tr', function (e) {
//            var elem = $(event.target).closest("a");
//            if (elem.hasClass('download')) {
//                if (e.button == 2) {
//                    $("#download").val(elem.attr('href'));
//                    if(elem.hasClass('am')) {
//                        $("#id").val(elem.data('ida'));
//                        $("#category").val("am");
//                    } else if(elem.hasClass('pr')) {
//                        $("#id").val(elem.data('idp'));
//                        $("#category").val("p");
//                    } else if(elem.hasClass('ch')) {
//                        $("#id").val(elem.data('idc'));
//                        $("#category").val("c");
//                    } else if(elem.hasClass('ra')) {
//                        $("#id").val(elem.data('idr'));
//                        $("#category").val("r");
//                    } else {
//                        $("#id").val(elem.data('idb'));
//                        $("#category").val("bd");
//                    }
//                    $('#fileName').val(elem.text());
//                    $("#childrcmenu").css('left', e.pageX + 5);
//                    $("#childrcmenu").css('top', e.pageY + 5);
//                    $("#childrcmenu").fadeIn(80);
//                }
//            }
//        });
//
        document.getElementById("inventory-table").oncontextmenu = function () {
            return false;
        }
//
//        $(document).click(function (e) {
//            if (e.button == 0 ||e.button == 1 ) {
//                $("#rcmenu").fadeOut(40);
//                $("#childrcmenu").fadeOut(40);
//            }
//        });
    })
</script>
