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
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <link href="/css/datatabletools.css" rel="stylesheet">


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


<div class="container" style="margin-bottom: 50px;">

    <div class="btn-group" style="float:left; margin: 15px;">
        <button id="iese" data-toggle="modal" data-target="#iese-modal" class="btn btn-default"><span class="fa fa-upload">&nbsp;</span> Ie&#351;ire</button>
        <button id="intra" data-toggle="modal" data-target="#intra-modal" class="btn btn-default"><span class="fa fa-download">&nbsp;</span> Recuperare</button>
    </div>
    <sec:authorize access="hasRole('ROLE_SUPERUSER')">
        <div class="btn-group" style="float:right; margin: 15px;">
            <button id="add-item" data-toggle="modal" data-target="#add-item-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; articol</button>
            <button id="add-person" data-toggle="modal" data-target="#add-person-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; persoan&#259;</button>
            <button id="add-place" data-toggle="modal"  data-target="#add-place-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; loc</button>
        </div>
    </sec:authorize>
    <!-- Main component -->
    <div class="jumbotron">
        <br/>
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
                    <button type="button" id="closeart" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
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
            <form id="adaugapersoana" action="api/adaugapersoana" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nume">Nume</label>
                        <input id="nume" name="nume" title="nume" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="cnp">CNP</label>
                        <input id="cnp" name="cnp" title="cnp" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="functie">Functie</label>
                        <input id="functie" name="functie" title="functie" class="form-control">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD" /></button>
                    <button type="button" id="closepers" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

                </div>
            </form>
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
            <form id="adaugaloc" action="/api/adaugaloc" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="denumireLoc">Denumire loc</label>
                        <input id="denumireLoc" name="denumireLoc" title="denumireLoc" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD" /></button>
                    <button type="button" id="closeloc" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="iese-modal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><span class="fa fa-barcode">&nbsp;</span><spring:message code="DIALOG.IESE" /></h4>
            </div>
            <div class="modal-body">
                <div id="ieseas" class="ieseas">
                    <div class="form-group">
                        <label for="ieseloc">Alege locul</label><br/>
                        <select id="ieseloc"></select>
                    </div>
                    <div class="form-group">
                        <label for="iesepers">Alege persoana</label><br/>
                        <select id="iesepers"></select>
                    </div>
                    <div class="form-group">
                        <ol id="articolecautate"></ol>
                    </div>
                    <div id="iesebarcode" class="form-group">
                        <h3>Scaneaza articolul</h3>
                    </div>
                    <input id="iesebarcodeinput">
                </div>
                <div id="detalii-group" class="form-group">
                    <label for="detaliiiese">Detalii</label>
                    <textarea id="detaliiiese" rows="3" cols="75" class="form-control"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="backiese" class="btn btn-default"><span class="fa fa-">&nbsp;</span><spring:message code="DIALOG.BACK" /></button>
                <button type="button" id="nextiese" class="btn btn-success ascuns"><span class="fa fa-">&nbsp;</span><spring:message code="DIALOG.NEXT" /></button>
                <button type="button" id="atribuie-articole" class="btn btn-success ascuns"><span class="fa fa-">&nbsp;</span><spring:message code="DIALOG.ATRIBUIE" /></button>
                <button type="button" id="closeiese" class="btn btn-default" data-dismiss="modal"><span class="fa fa-cross"></span><spring:message code="DIALOG.CLOSE" /></button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="intra-modal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><span class="fa fa-barcode">&nbsp;</span><spring:message code="DIALOG.INTRA" /></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" id="closeintra" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
            </div>
            </form>
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
    <p class="pull-right"><a href="#top"><spring:message code="NAVBAR.BACKTOTOP" /></a></p>
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
<%--<script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="//cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>--%>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script src="//cdn.datatables.net/tabletools/2.2.3/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript">
    var table;
    var idArticol;

    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

    function showBarcode(idArticol){
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/generatebarcode/' + idArticol,
            datatype:"image/jpeg",
            cache: false,
            success: function (response) {
                var $img = $('#barcode');
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

    function getArticol(code){
        var articolJSON;
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/articol/' + code,
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    articolJSON = response;
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });

        return articolJSON;
    }

    function getPersoane(){
        $("#iesepers").html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/persoane',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        $("#iesepers").append($("<option>").val(response[i].idPersoana).text(response[i].nume + '  ' + response[i].cnp));
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        $("#iesepers").val(-1);
        $("#iesepers").trigger("chosen:updated");

    }

    function getLoc(){
        $("#ieseloc").html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/locuri',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        $("#ieseloc").append($("<option>").val(response[i].idLoc).text(response[i].denumireLoc));
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        $("#ieseloc").val(-1);
        $("#ieseloc").trigger("chosen:updated");

    }

    function drawDisponibil(table){
        tableData = table.rows().nodes();
        for (var i = 0; i < tableData.length; i++) {
            var td = $(tableData[i]).find("td:eq(6)");
            td.css('text-align','center');
            var bul = td.text();
            if(bul == 1){
                td.html('<div class="btn btn-success"><span class="fa fa-check"></span></div>');
            } else {
                td.html('<div class="btn btn-danger"><span class="fa fa-ban"></span></div>');
            }
        }
    }

    $(document).ready(function () {
        var selcod1 = $('#selcod1');
        var selcod2 = $('#selcod2');
        var iesepers = $('#iesepers');
        var ieseloc = $('#ieseloc');
        var tableData;
        try{
            table = $('#inventory-table').DataTable( {
                "ajax": {
                    "url": '${pageContext.request.contextPath}/api/getinventory',
                    "dataSrc": ""
                },
                "language": {
                    "url": '/fonts/ro_RO.txt'
                },
                stateSave: true,
                "columns": [
                    { "data": "idCod3" },
                    { "data": "denumire1" },
                    { "data": "denumire2" },
                    { "data": "denumire3" },
                    { "data": "barcode" },
                    { "data": "detalii" },
                    { "data": "stare" }
                ],
                "columnDefs": [
                    {
                        "targets": [ 0 ],
                        "visible": true,
                        "searchable": false
                    }
                ],
                dom: 'T<"clear"><"break-row">lfrtip<"break-row-lg">',
                tableTools: {
                    "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
                    "aButtons": [
                        {
                            "sExtends": "csv",
                            "sButtonClass": "btn btn-default",
                            "sButtonText": '<span class="fa fa-file-o">&nbsp;&nbsp;</span><span>CSV</span>',
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "xls",
                            "sButtonClass": "btn btn-default",
                            "sCharSet": "utf16le",
                            "sButtonText": '<span class="fa fa-file-excel-o">&nbsp;&nbsp;</span><span>XLS</span>',
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "pdf",
                            "sButtonClass": "btn btn-default",
                            "sButtonText": '<span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span><span>PDF</span>',
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        }
                    ]
                }
            } );


            $('#inventory-table tbody').on( 'click', 'tr', function () {
                if ( $(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            } );
        } catch (err){
            console.log(err);
        }

        setTimeout(function() {
            drawDisponibil(table);
        },3000);

        $("#iesebarcodeinput").css({
            position: 'absolute',
            top: '-700px'
        });

        selcod1.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune...',
            disable_search: true
        });
        selcod1.val(-1);
        selcod1.trigger('chosen:updated');

        selcod2.chosen({
            width: "60%",
            placeholder_text_single: 'Alege o optiune...',
            allow_single_deselect: true,
            disable_search: true
        });
        selcod2.val(-1);
        selcod2.trigger('chosen:updated');

        iesepers.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune...',
            no_results_text: 'Nu a fost gasit...'
        });
        getPersoane();

        ieseloc.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune...',
            no_results_text: 'Nu a fost gasit...'
        });
        getLoc();

        //butonul de scan la iese
        $('#scanbut').on('click', function(){
//            $('#ieseq').hide();
            $('#backiese').show();
            $('#ieseas').show();
        });

        //butonul de back de la scanare iese
        $('#backiese').on('click', function(){
            if($(this).hasClass('pas2')){
                $('#backiese').hide();
                $('#ieseas').show();
                $('#detalii-group').hide();
                $('#nextiese').removeClass('ascuns');
                $('#iesebarcodeinput').focus();
                $('#atribuie-articole').addClass('ascuns');
                $(this).removeClass('pas2');
            } else {
                ieseloc.val(-1);
                ieseloc.trigger('chosen:updated');
                iesepers.val(-1);
                iesepers.trigger('chosen:updated');
                $('#iesebarcodeinput').val('');
                $('#ieseq').show();
                $('#backiese').hide();
                $('#ieseas').hide();
                $('#atribuie-articole').addClass('ascuns');
                $('#iesebarcode').addClass('ascuns');
                $('#articolecautate').html('');
                $('#nextiese').addClass('ascuns');
                $('#detaliiiese').val('');
            }
        });

        //actiunea cand se schimba persoana la scan iese
        iesepers.on('change', function(){
            if($(this).val() > 0 && ieseloc.val() > 0){
                $('#iesebarcode').show();
                setTimeout(function(){
                    iesepers.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //actiunea cand se schimba locul la scan iese
        ieseloc.on('change', function(){
            if($(this).val() > 0 && iesepers.val() > 0){
                $('#iesebarcode').show();
                setTimeout(function(){
                    ieseloc.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //la click pe text se face focus pt scan
        $('#iesebarcode').on('click', function(){
            $('#iesebarcodeinput').focus();
        });

        //aduce valoarea articolului dupa ce a fost scanat
        $('#iesebarcodeinput').on('keyup', function(e){
            if(e.keyCode == 13){
                var code= $(this).val();
                $(this).val('');
                var articolJSON = getArticol(code);
                if(typeof  articolJSON !== 'undefined') {
                    if(articolJSON.stare != 0) {
                        if($('#articolecautate').html().trim() === ''){
                            $('#articolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            $('#articolecautate').find('li').each(function(){
                                if($(this).prop('id') && $(this).prop('id') != articolJSON.cod3) {
                                    $('#articolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                                }
                            });
                        }

                        if($('#nextiese').hasClass('ascuns')){
                            $('#nextiese').removeClass('ascuns');
                        }
                    } else {
                        alert('Articolul este deja alocat! Daca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou');
                    }

                } else {
                    alert('Articolul nu a fost gasit!');
                }
            }
        });

        //butonul de next
        //la apasarea next se afiseaza detaliile si apare butonul de final
        $('#nextiese').on('click', function() {
            $('#backiese').show();
            $('#ieseas').hide();
            if ($('#atribuie-articole').hasClass('ascuns')) {
                $('#atribuie-articole').removeClass('ascuns');
                $('#backiese').addClass('pas2');
            }
            $('#nextiese').addClass('ascuns');
            $('#detalii-group').show();
        });
        //butonul care introduce datele in evidenta de inventar
        $('#atribuie-articole').on('click', function(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var pers = iesepers.val();
            var loc = ieseloc.val();
            var articole = [];
            $('#articolecautate').find('li').each(function(){
                if($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var detalii = $('#detaliiiese').val();
            var data = { "idPersoana" : pers, "idLoc" : loc, "cod3": articole, "detalii": detalii, "stare": 0 };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/evidentaiese',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                success: function (response) {
                    ieseloc.val(-1);
                    ieseloc.trigger('chosen:updated');
                    iesepers.val(-1);
                    iesepers.trigger('chosen:updated');
                    $('#iesebarcodeinput').val('');
                    $('#detalii-group').hide();
                    $('#nextiese').addClass('ascuns');
                    $('#atribuie-articole').addClass('ascuns');
                    $('#backiese').removeClass('pas2');
                    $('#backiese').hide();
                    $('#iesebarcode').hide();
                    $('#ieseq').show();
                    $('#articolecautate').html('');
                    $('#closeiese').click();
                    table.ajax.reload();
                    setTimeout(function(){
                        drawDisponibil(table);
                    },1000)
                    $("#alert").notify({
                        message: { text: 'Operatie cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();

                },
                error: function(err){
                }
            });

        });



        $('#adaugaarticol').on('submit', function(e){
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var cod1 = $('#selcod1').val();
            var cod2 = $('#selcod2').val();
            var denumire3 = $('#denumire3').val();
            var detalii = $('#detalii').val();
            var pret = $('#pretachizitie').val();
            var data = { "cod1" : cod1, "cod2" : cod2, "denumire3": denumire3,
                "detalii": detalii, "pretAchizitie": pret};
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    $('#selcod1').val(-1);
                    $('#selcod1').trigger('chosen:updated');
                    $('#selcod2').val(-1);
                    $('#selcod2').trigger('chosen:updated');
                    $('#denumire3').val('');
                    $('#detalii').val('');
                    $('#pret').val('');
                    $('#closeart').click();
                    $("#alert").notify({
                        message: { text: 'Articol adaugat cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                },
                error: function(err){
                    alert('Eroare la conexiune!');
                }
            });
        });

        $('#adaugapersoana').on('submit', function(e){
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var nume = $('#nume').val();
            var cnp = $('#cnp').val();
            var functie = $('#functie').val();
            var data = { "nume" : nume, "cnp" : cnp, "functie": functie};
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    $('#nume').val('');
                    $('#cnp').val('');
                    $('#functie').val('');
                    $('#closepers').click();
                    getPersoane();
                    $("#alert").notify({
                        message: { text: 'Persoana adaugata cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show()
                },
                error: function(err){
                    alert('Eroare la conexiune!');
                }
            });

        });

        $('#adaugaloc').on('submit', function(e){
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var denumireloc = $('#denumireLoc').val();
            var data = { "denumireLoc" : denumireloc};
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    $('#denumireLoc').val('');
                    $('#closeloc').click();
                    getLoc();
                    $("#alert").notify({
                        message: { text: 'Loc adaugat cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show()
                },
                error: function(err){
                    alert('Eroare la conexiune!');
                }
            });
        });

        document.getElementById("inventory-table").oncontextmenu = function () {
            return false;
        }

    })
</script>
