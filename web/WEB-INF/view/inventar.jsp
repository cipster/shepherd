<%@ page import="util.enums.StareArticol" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/css/datatables.bootstrap.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <link href="/css/datatabletools.css" rel="stylesheet">
</head>

<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div id="spinner-container" class="container" style="margin-bottom: 50px;">
    <img id="spinner" src="/img/spinner.gif" class="spinner" style="display: none;">
    <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
        <%--ToDo: modificat sa apara fisiere--%>
        <div class="btn-group btn-group-lg" style="float:left; margin: 15px;">
            <button id="iese" data-toggle="modal" data-target="#iese-modal" class="btn btn-default btn-lg"><span class="fa fa-upload">&nbsp;</span> Ie&#351;ire</button>
            <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
                <button id="intra" data-toggle="modal" data-target="#intra-modal" class="btn btn-default btn-lg"><span class="fa fa-download">&nbsp;</span> Intrare</button>
            </sec:authorize>
            <button id="primire" data-toggle="modal" data-target="#primire-modal" class="btn btn-default btn-lg"><span class="fa fa-flag-checkered">&nbsp;</span> Primire</button>
        </div>
    </sec:authorize>
    <!-- Main component -->
    <div class="jumbotron">
        <br/>
        <br/>
        <table id="inventory-table" class="table" width="100%">
            <thead>
            <tr>
                <th></th>
                <th>Nr</th>
                <th><spring:message code="INVENTAR.CATEGORIE"/></th>
                <th><spring:message code="INVENTAR.TIP"/></th>
                <th><spring:message code="INVENTAR.ARTICOL"/></th>
                <th><spring:message code="INVENTAR.COD"/></th>
                <th><spring:message code="INVENTAR.DETALII"/></th>
                <th><spring:message code="INVENTAR.ALOCAT"/></th>
            </tr>
            </thead>

        </table>
    </div>
</div>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-item-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDITEM"/></h4>
                </div>
                <form id="adaugaarticol" action="${pageContext.request.contextPath}/global/admin/inventar/addarticol" method="post">
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

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="denumire3">Denumire articol</label>
                            <input id="denumire3" name="denumire3" title="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="detalii">Detalii articol</label>
                            <textarea id="detalii" name="detalii" title="" style="max-width: 558px;" class="form-control" rows="4" cols="76" placeholder="mai mult"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="loc-add-articol">Loc</label>
                            <select id="loc-add-articol" name="loc-add-articol" title="" class="form-control" data-placeholder="Alege un loc..."></select>
                        </div>
                        <div class="form-group">
                            <label for="pretachizitie">Pret achizitie</label>
                            <input id="pretachizitie" name="pretAchizitie" title="" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closeart" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-person-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDPERSON"/></h4>
                </div>
                <form id="adaugapersoana" action="${pageContext.request.contextPath}/global/admin/inventar/addpersoana" method="post">
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
                        <div class="form-group">
                            <label for="localitate">Localitate</label>
                            <input id="localitate" title="localitate" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closepers" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE"/></button>

                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-place-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDPLACE"/></h4>
                </div>
                <form id="adaugaloc" action="${pageContext.request.contextPath}/api/adaugaloc" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="denumireLoc">Denumire loc</label>
                            <input id="denumireLoc" name="denumireLoc" title="denumireLoc" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closeloc" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
    <div class="modal fade" id="iese-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><span class="fa fa-barcode">&nbsp;</span><spring:message code="DIALOG.IESE"/></h4>
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
                            <label for="iesestare">Alege metoda de livrare</label><br/>
                            <select id="iesestare">
                                <option value="1">Personal&#259;</option>
                                <option value="2">Curier</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <ol id="articolecautate"></ol>
                        </div>
                        <div id="iesebarcode" class="form-group">
                            <h3 class="scan">Scaneaz&#259; articolul</h3>
                        </div>
                        <input id="iesebarcodeinput">
                    </div>
                    <div id="detalii-group" class="form-group">
                        <label for="detaliiiese">Detalii</label>
                        <textarea id="detaliiiese" rows="3" cols="75" placeholder="adauga un motiv" style="max-width: 558px;" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="backiese" class="btn btn-default"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK"/></button>
                    <button type="button" id="nextiese" class="btn btn-success ascuns"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT"/></button>
                    <button type="button" id="atribuie-articole" class="btn btn-success ascuns"><span class="fa fa-thumb-tack">&nbsp;</span><spring:message code="DIALOG.ATRIBUIE"/></button>
                    <button type="button" id="closeiese" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
    <div class="modal fade" id="intra-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><span class="fa fa-barcode">&nbsp;</span><spring:message code="DIALOG.INTRA"/></h4>
                </div>
                <div class="modal-body">
                    <div id="intrascan">
                        <div id="intrabarcode" class="form-group">
                            <h3 class="scan">Scaneaz&#259; articolul</h3>
                            <input id="intrabarcodeinput">

                            <div class="form-group">
                                <ol id="intraarticolecautate"></ol>
                            </div>
                        </div>
                    </div>
                    <div id="intraalege" class="ascuns">
                        <div class="form-group">
                            <label for="intraloc">Alege locul</label><br/>
                            Din <span id="intradinloc" style="color: #149bdf;"></span> in <select id="intraloc"></select>
                        </div>
                    </div>
                    <div id="detaliiintra-group" class="form-group ascuns">
                        <label for="detaliiintra">Detalii</label>
                        <textarea id="detaliiintra" rows="3" cols="75" placeholder="adauga un motiv" style="max-width: 558px;" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="backintra" class="btn btn-default ascuns"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK"/></button>
                    <button type="button" id="nextintra" class="btn btn-success pas1"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT"/></button>
                    <button type="button" id="intra-articole" class="btn btn-success ascuns"><span class="fa fa-cubes">&nbsp;</span><spring:message code="DIALOG.ATRIBUIE"/></button>
                    <button type="button" id="closeintra" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
    <div class="modal fade" id="primire-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.PRIMIRE"/></h4>
                </div>
                <div class="modal-body">
                    <div id="primire-info" class="text-center">
                        <h3>Nu sunt articole &#238;n tranzit pentru tine</h3>
                    </div>
                    <div id="primire-board" class="ascuns">
                        <table id="primire-articole-cautate" class="table table-responsive" cellspacing="0" cellpadding="3" style="font-size: 12pt;"></table>
                    </div>
                    <div id="primireq" class="text-center ascuns">
                        <h3>Vrei s&#259; scanezi sau s&#259; introduci manual codurile?</h3>
                        <br>
                        <button id="scaneaza-primire" class="btn btn-success text-center" style="min-width: 100px;"><span class="fa fa-barcode">&nbsp;</span> Scan</button>
                        <br><br>
                        <button id="introdu-primire" class="btn btn-primary text-center" style="min-width: 100px;"><span class="fa fa-pencil">&nbsp;</span> Manual</button>
                    </div>
                    <div id="primire-scan-div" class="ascuns">
                        <h3 class="scan text-center">Scaneaz&#259; articolul</h3>
                        <input id="primirescanbarcodeinput">

                        <div class="form-group">
                            <ol id="articolescanateprimire"></ol>
                        </div>
                    </div>
                    <div id="primire-manual-div" class="ascuns">
                        <div class="text-center">
                            <h3 class="scan text-center">Introduce&#355;i codul &#351;i apoi ap&#259;sa&#355;i enter</h3>
                            <input id="primireintrodubarcodeinput" class="form-control"
                                   style="width: 50%; margin-left: auto; margin-right: auto;">
                        </div>
                        <div class="form-group">
                            <ol id="articoleintroduseprimire"></ol>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="backprimire" class="btn btn-default pas1 ascuns"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK"/></button>
                    <button type="button" id="nextprimire" class="btn btn-success pas1 ascuns"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT"/></button>
                    <button type="button" id="primire-scan-articole" class="btn btn-success ascuns"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.AMPRIMIT"/></button>
                    <button type="button" id="primire-introdu-articole" class="btn btn-success ascuns"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.AMPRIMIT"/></button>
                    <button type="button" id="closeprimire" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</sec:authorize>

<div id="alert" class="notifications"></div>

<input hidden="hidden" id="appLangCode" value="">

<jsp:include page="include/footer.jsp"></jsp:include>
</body>

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
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script src="//cdn.datatables.net/tabletools/2.2.3/js/dataTables.tableTools.min.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
    var table;
    var idArticol;

    function golestePrimire() {
        $('#primire-info').removeClass('ascuns');
        $('#primire-board').addClass('ascuns');
        $('#primireq').addClass('ascuns');
        $('#backprimire').removeClass('pas2');
        $('#backprimire').addClass('ascuns');
        $('#backprimire').addClass('pas1');
        $('#nextprimire').addClass('ascuns');
        $('#primire-scan-div').addClass('ascuns');
        $('#primire-manual-div').addClass('ascuns');
        $('#primire-scan-articole').addClass('ascuns');
        $('#primire-introdu-articole').addClass('ascuns');
        $('#primireintrodubarcodeinput').val('');
        $('#primirescanbarcodeinput').val('');
        $('#articoleintroduseprimire').html('');
        $('#articolescanateprimire').html('');
    }

    function drawBarcode(id) {
        var canvas = document.getElementById('barcode' + id);
        if (canvas.getContext) {
            var ctx = canvas.getContext('2d');
        }
    }

    function format(d) {
        var evidentaInventar;
        var dataPreluare;
        var loc;
        var stare;
        var dataTitle;
        var usePersoana = false;
        var stareIcon;
        var persoana;
        var useDetalii = false;
        var detalii;
        var detaliiTitle;
        var usePrimire = false;
        var dataPrimire;
        var useUserRecuperat = false;
        var userRecuperat;
        var primitPrinTranzit;
        var barcode = d.barcode;
        generateBarcode(barcode);
        // `d` is the original data object for the row
        switch (d.stare) {
            case 1:
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.STOC.getLabel()%>';
                stareIcon = 'fa-cubes';
                dataPreluare = toJSDate(d.dataAdaugare, 1);
                dataTitle = 'Ad&#259;ugat la:';
                break;
            case 2:
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.RECUPERAT.getLabel()%>';
                stareIcon = 'fa-recycle';
                dataPreluare = toJSDate(d.dataRecuperare, 1);
                dataTitle = 'Recuperat la:';
                detalii = d.detaliiRecuperare;
                if (detalii.length > 0) {
                    detaliiTitle = 'Detalii recuperare';
                    useDetalii = true;
                }
                userRecuperat = d.modificatDe;
                if (userRecuperat && userRecuperat.length > 0) {
                    useUserRecuperat = true;
                }
                break;
            case 3:
                evidentaInventar = getTranzactie(d.idCod3);
                loc = getLocById(evidentaInventar.idLoc).denumireLoc;
                stare = '<%=StareArticol.IN_FOLOSINTA.getLabel()%>';
                dataPreluare = toJSDate(evidentaInventar.dataPreluarii, 1);
                dataTitle = 'Atribuit la:';
                stareIcon = 'fa-thumb-tack';
                persoana = getPersoanaById(evidentaInventar.idPersoana).nume;
                if (persoana.length > 0) {
                    usePersoana = true;
                }
                detalii = evidentaInventar.detalii;
                if (detalii.length > 0) {
                    detaliiTitle = 'Detalii preluare';
                    useDetalii = true;
                }
                dataPrimire = d.dataPrimire;
                if (dataPrimire) {
                    dataPrimire = toJSDate(dataPrimire, 1);
                    if (dataPrimire < dataPreluare) {
                        dataPrimire = null;

                    }
                }
                if (dataPrimire) {
                    usePrimire = true;
                    primitPrinTranzit = 'Primit prin tranzit'

                } else {
                    dataPrimire = '&#206;nc&#259; nu a ajuns la destina&#355;ie';
                }

                break;
            case 4:
                evidentaInventar = getTranzactie(d.idCod3);
                loc = getLocById(evidentaInventar.idLoc).denumireLoc;
                stare = '<%=StareArticol.TRANZIT.getLabel()%>';
                stareIcon = 'fa-truck';
                detalii = evidentaInventar.detalii;
                dataPreluare = toJSDate(evidentaInventar.dataPreluarii, 1);
                dataTitle = 'Plecat la:';
                persoana = getPersoanaById(evidentaInventar.idPersoana).nume;
                if (persoana.length > 0) {
                    usePersoana = true;
                }
                if (detalii.length > 0) {
                    detaliiTitle = 'Detalii tranzit';
                    useDetalii = true;
                }
                dataPrimire = d.dataPrimire;
                if (dataPrimire) {
                    dataPrimire = toJSDate(dataPrimire, 1);
                    if (dataPrimire < dataPreluare) {
                        dataPrimire = null;
                        usePrimire = false;
                    }
                }
                if (dataPrimire) {
                    usePrimire = true;
                    dataPrimire = toJSDate(dataPrimire, 1)
                } else {
                    dataPrimire = '&#206;nc&#259; nu a ajuns la destina&#355;ie';
                }
                break;
            case 5:
                loc = getLocById(d.idLoc).denumireLoc;
                dataTitle = 'Atribuit la:';
                stare = '<%=StareArticol.DETERIORAT.getLabel()%>';
                stareIcon = 'fa-bug';
                break;
            case 6:
                dataTitle = 'Atribuit la:';
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.SERVICE.getLabel()%>';
                stareIcon = 'fa-wrench';
                break;
            case 7:
                dataTitle = 'Atribuit la:';
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.DISPARUT.getLabel()%>';
                stareIcon = 'fa-exclamation-triangle';
                break;
            case 8:
                dataTitle = 'Atribuit la:';
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.CASAT.getLabel()%>';
                stareIcon = 'fa-trash';
                break;
            default:
                return;
        }
        var retString = '<div class="well"><table class="table" cellpadding="5" cellspacing="0" border="0" style="margin-left:auto;margin-right: auto ;padding-left:100px;width: 90%!important;">' +
                '<tr>' +
                '<td width="200px;"><span class="fa fa-map-marker fa-fw">&nbsp;</span><b>Localizare:</b></td>' +
                '<td width="350px;">' + loc + '</td>' +
                '<td rowspan="10" style="vertical-align: middle; text-align: center"><div>' +
                '<img  width="200" height="100"  src="/barcode/' + barcode + '.png" alt="Inca nu s-a generat">' +
                '<br><span class="text-center">' + barcode + '</span></div>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td><span class="fa ' + stareIcon + ' fa-fw">&nbsp;</span><b>Stare:</b></td>' +
                '<td>' + stare + '</td>' +
                '</tr>';


        retString += '<tr>' +
                '<td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>' + dataTitle + '</b></td>' +
                '<td>' + dataPreluare + '</td>' +
                '</tr>';
        if (usePrimire) {
            retString += '<tr><td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>Primit la:</b></td>' +
                    '<td>' + dataPrimire + '</td>' +
                    '</tr>';
        }
        if (usePersoana) {
            retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Persoan&#259;:</b></td>' +
                    '<td>' + persoana + '</td>' +
                    '</tr>';
        }
        if (useUserRecuperat) {
            retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Recuperat de:</b></td>' +
                    '<td>' + userRecuperat + '</td>' +
                    '</tr>';
        }
        if (useDetalii) {
            retString += '<tr><td><span class="fa fa-comment fa-fw">&nbsp;</span><b>' + detaliiTitle + ':</b></td>' +
                    '<td>' + detalii + '</td>' +
                    '</tr>';
        }
        retString += '<tr>' +
                '<td><a id="history-' + barcode + '" class="btn btn-warning"><span class="fa fa-history"> &nbsp;</span> Arată istoric</a></td>' +
                '<td><a href="/download/barcode/' + barcode + '.png" class="btn btn-primary  pull-right"><span class="fa fa-floppy-o"> &nbsp;</span> Salvează cod de bare</a></td>' +
                '</tr>';
        retString += '</table></div>';

        return retString;
    }

    function amPrimit(idContainer, useScan) {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var articole = [];
        var querySelector = '#' + idContainer;
        $(querySelector).find('li').each(function () {
            if ($(this).prop('id')) {
                articole.push($(this).prop('id'));
            }
        });
        var data = {"cod3": articole, "scan": useScan};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/api/amprimit',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify(data),
            success: function (response) {
                $('#closeprimire').click();
                table.ajax.reload();
                showNotification('Ai confirmat primirea cu succes!', SUCCESS, 3500);
            },
            error: function (err) {
                showNotification('Operatie nereusita!', DANGER);
            }
        });
    }

    function getTranzactie(idArticol) {
        var tranzactie;
        $.ajax({
            type: 'get',
            async: false,
            url: '${pageContext.request.contextPath}/api/tranzactie/' + idArticol,
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    tranzactie = response;
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });

        return tranzactie;
    }

    function getLocById(idLoc) {
        var locsor;
        $.ajax({
            type: 'get',
            async: false,
            url: '${pageContext.request.contextPath}/api/getLoc/' + idLoc,
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    locsor = response;
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });

        return locsor;
    }

    function getPersoanaById(idPersoana) {
        var persoana;
        $.ajax({
            type: 'get',
            async: false,
            url: '${pageContext.request.contextPath}/api/getPersoana/' + idPersoana,
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    persoana = response;
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });

        return persoana;
    }

    function generateBarcode(barcode) {
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/generatebarcode/' + barcode,
            cache: false,
            async: false,
            success: function (response) {

            },
            error: function (err) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });
    }

    function getArticol(code) {
        var articolJSON;
        $.ajax({
            type: 'get',
            async: false,
            url: '${pageContext.request.contextPath}/api/articol/' + code,
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    articolJSON = response;
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });
        return articolJSON;
    }

    function getArticolePrimire() {
        var articoleJSON = [];
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/articoleprimire',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if (typeof response !== 'undefined') {
                    articoleJSON = response;
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });

        return articoleJSON;
    }


    function getPersoane() {
        $("#iesepers").html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/persoane',
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        $("#iesepers").append($("<option>").val(response[i].idPersoana).text(response[i].nume + '  ' + response[i].cnp));
                    }
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            },
            complete: function (e) {
                chosenUnselect("#iesepers")
            }
        });
    }

    function getLoc() {
        $("#ieseloc").html("");
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/locuri',
            contentType: "application/json",
            success: function (response) {
                if (typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        $("#ieseloc").append($("<option>").val(response[i].idLoc).text(response[i].denumireLoc));
                        $("#intraloc").append($("<option>").val(response[i].idLoc).text(response[i].denumireLoc));
                    }
                }
            },
            error: function (e) {
                showNotification('Eroare la conexiune!', DANGER);
            },
            complete: function (e) {
                chosenUnselect("#ieseloc");
                chosenUnselect("#intraloc");
            }
        });

    }

    $(document).ready(function () {
        $('#slashinventar').addClass('active');
        var selcod1 = $('#selcod1');
        var selcod2 = $('#selcod2');
        var iesepers = $('#iesepers');
        var intrapers = $('#intrapers');
        var ieseloc = $('#ieseloc');
        var intraloc = $('#intraloc');
        var iesestare = $('#iesestare');
        var tableData;
        try {
            table = $('#inventory-table').DataTable({
                "ajax": {
                    "url": '${pageContext.request.contextPath}/global/inventar/articole/getinventory',
                    "dataSrc": ""
                },
                "aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "Toate"]],
                "language": {
                    "url": '/fonts/ro_RO.txt'
                },
                stateSave: true,
                "columns": [
                    {
                        "sWidth": "15px",
                        "bSortable": false,
                        "className": 'details-control',
                        "orderable": false,
                        "data": null,
                        "defaultContent": '',
                        "searchable": false
                    },
                    {"data": "idCod3"},
                    {"data": "denumire1"},
                    {"data": "denumire2"},
                    {"data": "denumire3"},
                    {"data": "barcode"},
                    {"data": "detalii"},
                    {"data": "stare"},
                    {
                        "data": "idLoc",
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "data": "dataAdaugare",
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "data": "dataRecuperare",
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "data": "detaliiRecuperare",
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "data": "dataPrimire",
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "data": "modificatDe",
                        "visible": false,
                        "searchable": false
                    }
                ],
                "columnDefs": [
                    {
                        "targets": [1],
                        "visible": true,
                        "searchable": false
                    },
                    {
                        "targets": [7],
                        "bUseRendered": true,
                        "visible": true,
                        "fnCreatedCell": function (nTd, sData, oData, i) {
                            switch (sData) {
                                case 1:
                                    $(nTd).html('<div class="btn btn-success stare-icon"><span class="fa fa-cubes fa-fw"></span></div>');
                                    break;
                                case 2:
                                    $(nTd).html('<div class="btn btn-success stare-icon"><span class="fa fa-recycle fa-fw"></span></div>');
                                    break;
                                case 3:
                                    $(nTd).html('<div class="btn btn-primary stare-icon"><span class="fa fa-thumb-tack fa-fw"></span></div>');
                                    break;
                                case 4:
                                    $(nTd).html('<div class="btn btn-warning stare-icon"><span class="fa fa-truck fa-fw"></span></div>');
                                    break;
                                case 5:
                                    $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-bug fa-fw"></span></div>');
                                    break;
                                case 6:
                                    $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-wrench fa-fw"></span></div>');
                                    break;
                                case 7:
                                    $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-exclamation-triangle fa-fw"></span></div>');
                                    break;
                                case 8:
                                    $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-trash fa-fw"></span></div>');
                                    break;
                            }
                        }
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
                            "mColumns": [1, 2, 3, 4, 5, 6, 7],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "xls",
                            "sButtonClass": "btn btn-default",
                            "sCharSet": "utf16le",
                            "sButtonText": '<span class="fa fa-file-excel-o">&nbsp;&nbsp;</span><span>XLS</span>',
                            "mColumns": [1, 2, 3, 4, 5, 6, 7],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "pdf",
                            "sButtonClass": "btn btn-default",
                            "sButtonText": '<span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span><span>PDF</span>',
                            "mColumns": [1, 2, 3, 4, 5, 6, 7],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        }
                    ]
                }
            });

            $('#inventory-table tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                }
            });

            $('#inventory-table tbody').on('click', 'div.stare-icon', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                }
            });

        } catch (err) {
            console.log(err);
        }

        $("#iesebarcodeinput").css({
            position: 'absolute',
            top: '-700px'
        });
        $("#intrabarcodeinput").css({
            position: 'absolute',
            top: '-700px'
        });

        $("#primirescanbarcodeinput").css({
            position: 'absolute',
            top: '-700px'
        });

        selcod1.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune...',
            disable_search: true
        });
        selcod1.val(UNSELECT);
        selcod1.trigger('chosen:updated');

        selcod2.chosen({
            width: "60%",
            placeholder_text_single: 'Alege o optiune...',
            allow_single_deselect: true,
            disable_search: true
        });
        selcod2.val(UNSELECT);
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
        intraloc.chosen({
            width: "60%",
            allow_single_deselect: true,
            placeholder_text_single: 'Alege o optiune...',
            no_results_text: 'Nu a fost gasit...'
        });
        getLoc();

        iesestare.chosen({
            width: "60%",
            allow_single_deselect: true,
            disable_search: true,
            placeholder_text_single: 'Alege o optiune...',
            no_results_text: 'Nu a fost gasit...'
        });
        iesestare.val(UNSELECT);
        iesestare.trigger('chosen:updated');

        $('#intra-modal').on('shown.bs.modal', function (e) {
            $('#intrabarcodeinput').focus();
        });

        $('body').on('click', 'button[id$="-modal-close"]', function () {
            var id = $(this).attr('id');
            id = '#' + id.replace('-close', '');
            hideModal();
            $(id).remove();
        });

        $('body').on('click', 'a[id^="history-"]', function () {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var id = $(this).attr('id');
            var barcode = id.replace('history-', '');

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/global/inventar/articole/gethistory/' + barcode,
                contentType: "application/json",
                mimeType: 'application/json',
                dataType: 'json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (response) {
                    id = id + '-modal';
                    var titlu = 'Istoric pentru articolul ' + barcode;
                    var tabel = generateHistoryTable(response);

                    showModal(id, titlu, tabel);
                },
                error: function (err) {
                    showNotification('Eroare! Contactati administratorul', DANGER);
                }
            });
        });

        $('#primire-modal').on('show.bs.modal', function (e) {
            var listaPrimire = $('#primire-articole-cautate');
            listaPrimire.html('');
            var count = 1;
            var articolePrimire = getArticolePrimire();
            if (articolePrimire && articolePrimire.length > 0) {
                $('#primire-info').addClass('ascuns');
                $('#primire-board').removeClass('ascuns');
                $('#nextprimire').removeClass('ascuns');
                $.each(articolePrimire, function (i, articol) {
                    listaPrimire
                            .append('<tr id="' + articol.cod3 + '" class="articolgasit" data-loc="' + articol.idLoc + '">' +
                                //'<td><input type="checkbox" class="checkbox-inventar" id="bifa-primire" /></td>' +
                            '<td>' + count + '</td>' +
                            '<td>' + articol.denumire3 + '</td>' +
                            '</tr>');
                    count++;
                });
            }
        });

        $('#primire-modal').on('hidden.bs.modal', function (e) {
            golestePrimire();
        });

        $('#nextprimire').on('click', function () {
            $(this).addClass('ascuns');
            if ($('#primire-articole-cautate').html() != '') {
                $('#primire-board').addClass('ascuns');
                $('#primireq').removeClass('ascuns');
                $('#backprimire').removeClass('ascuns');
            } else {
                $('#primire-info').removeClass('ascuns');
                $('#primire-board').addClass('ascuns');
            }
        });

        $('#backprimire').on('click', function () {
            if ($(this).hasClass('pas1')) {
                $('#nextprimire').removeClass('ascuns');
                $('#primire-board').removeClass('ascuns');
                $('#primireq').addClass('ascuns');
                $('#backprimire').addClass('ascuns');
            } else if ($(this).hasClass('pas2')) {
                $(this).removeClass('pas2');
                $(this).addClass('pas1');
                $('#primireq').removeClass('ascuns');
                $('#primire-scan-div').addClass('ascuns');
                $('#primire-manual-div').addClass('ascuns');
                $('#primire-scan-articole').addClass('ascuns');
                $('#primire-introdu-articole').addClass('ascuns');
                $('#primireintrodubarcodeinput').val('');
                $('#primirescanbarcodeinput').val('');
                $('#articoleintroduseprimire').html('');
                $('#articolescanateprimire').html('');
            }
        });

        //butonul de scan la primire
        $('#scaneaza-primire').on('click', function () {
            $('#primireq').addClass('ascuns');
            $('#backprimire').removeClass('pas1');
            $('#backprimire').addClass('pas2');
            $('#primire-scan-div').removeClass('ascuns');
            $('#primire-scan-articole').removeClass('ascuns');
            $('#primirescanbarcodeinput').focus();
        });

        //butonul de manual la primire
        $('#introdu-primire').on('click', function () {
            $('#primireq').addClass('ascuns');
            $('#backprimire').removeClass('pas1');
            $('#backprimire').addClass('pas2');
            $('#primire-manual-div').removeClass('ascuns');
            $('#primire-introdu-articole').removeClass('ascuns');
            $('#primireintrodubarcodeinput').focus();
        });

        $('#primirescanbarcodeinput').on('keyup', function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if (keyCode === 13) {
                var code = $(this).val();
                $(this).val('');
                if (code === '') {
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if (typeof  articolJSON !== 'undefined') {
                    if (articolJSON.idCod3 == 0) {
                        showNotification('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.', WARNING);
                    } else if (articolJSON.stare == 4) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if (!tranzactie || tranzactie.idEvidentaInventar == 0) {
                            showNotification('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul', DANGER);
                            return;
                        }
                        if ($('#articolescanateprimire').html().trim() === '') {
                            $('#articolescanateprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            var notAdded = true;
                            $('#articolescanateprimire').find('li').each(function () {
                                if ($(this).prop('id') && $(this).prop('id') == articolJSON.cod3) {
                                    notAdded = false;
                                }
                            });
                            if (notAdded) {
                                $('#articolescanateprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                            }
                        }
                    } else if (articolJSON.stare != 4) {
                        showNotification('Articolul nu este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, contactati managerul', DANGER);
                    } else {
                        showNotification('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou', DANGER);
                    }

                } else {
                    showNotification('Articolul nu a fost gasit!', INFO);
                }
                $(this).focus();
            }
        });

        $('#primireintrodubarcodeinput').on('keyup', function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if (keyCode === 13) {
                var code = $(this).val();
                $(this).val('');
                if (code === '') {
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if (typeof  articolJSON !== 'undefined') {
                    if (articolJSON.idCod3 == 0) {
                        showNotification('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.', WARNING);
                    } else if (articolJSON.stare == 4) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if (!tranzactie || tranzactie.idEvidentaInventar == 0) {
                            showNotification('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul', DANGER);
                            return;
                        }
                        if ($('#articoleintroduseprimire').html().trim() === '') {
                            $('#articoleintroduseprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            var notAdded = true;
                            $('#articoleintroduseprimire').find('li').each(function () {
                                if ($(this).prop('id') && $(this).prop('id') == articolJSON.cod3) {
                                    notAdded = false;
                                }
                            });
                            if (notAdded) {
                                $('#articoleintroduseprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                            }
                        }
                    } else if (articolJSON.stare != 4) {
                        showNotification('Articolul nu este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, contactati managerul', DANGER);
                    } else {
                        showNotification('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou', WARNING);
                    }

                } else {
                    showNotification('Articolul nu a fost gasit!', INFO);
                }
                $(this).focus();
            }
        });

        //butonul de back de la scanare iese
        $('#backiese').on('click', function () {
            if ($(this).hasClass('pas2')) {
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

        //butonul de back de la scanare iese
        $('#backintra').on('click', function () {
            if ($(this).hasClass('pas3')) {
                $('#intraalege').removeClass('ascuns');
                $('#detaliiintra-group').addClass('ascuns');
                $('#intra-articole').addClass('ascuns');
                $('#nextintra').removeClass('ascuns');
                $(this).removeClass('pas3');
                $(this).addClass('pas2');
            } else if ($(this).hasClass('pas2')) {
                $(this).removeClass('pas2');
                $(this).addClass('ascuns');
                $('#intraalege').addClass('ascuns');
                $('#intrascan').show();
                $('#nextintra').removeClass('pas2');
                $('#nextintra').addClass('pas1');
            }
        });

        //actiunea cand se schimba livrarea la scan iese
        iesestare.on('change', function () {
            if ($(this).val() > 0 && ieseloc.val() > 0 && iesepers.val() > 0) {
                $('#iesebarcode').show();
                setTimeout(function () {
                    iesestare.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //actiunea cand se schimba persoana la scan iese
        iesepers.on('change', function () {
            if ($(this).val() > 0 && ieseloc.val() > 0 && iesestare.val() > 0) {
                $('#iesebarcode').show();
                setTimeout(function () {
                    iesepers.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //actiunea cand se schimba locul la scan iese
        ieseloc.on('change', function () {
            if ($(this).val() > 0 && iesepers.val() > 0 && iesestare.val() > 0) {
                $('#iesebarcode').show();
                setTimeout(function () {
                    ieseloc.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //la click pe text se face focus pt scan
        $('#iesebarcode').on('click', function () {
            $('#iesebarcodeinput').focus();
        });

        //la click pe text se face focus pt scan
        $('#intrabarcode').on('click', function () {
            $('#intrabarcodeinput').focus();
        });

        //la click pe text se face focus pt scan
        $('#primire-scan-div').on('click', function () {
            $('#articolescanateprimire').focus();
        });

        //aduce valoarea articolului dupa ce a fost scanat
        $('#iesebarcodeinput').on('keyup', function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if (keyCode === 13) {
                var code = $(this).val();
                $(this).val('');
                if (code === '') {
                    return;
                }
                var articolJSON = getArticol(code);
                if (typeof  articolJSON !== 'undefined') {
                    if (articolJSON.idCod3 == 0) {
                        showNotification('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.', WARNING);
                    } else if (articolJSON.stare == 1 || articolJSON.stare == 2) {
                        if ($('#articolecautate').html().trim() === '') {
                            $('#articolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            var notAdded = true;
                            $('#articolecautate').find('li').each(function (i) {
                                if ($(this).prop('id') && $(this).prop('id') == articolJSON.cod3) {
                                    notAdded = false;
                                }
                            });
                            if (notAdded) {
                                $('#articolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                            }
                        }
                        if ($('#nextiese').hasClass('ascuns')) {
                            $('#nextiese').removeClass('ascuns');
                        }
                    } else if (articolJSON.stare == 4) {
                        showNotification('Articolul este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou', INFO);
                    } else {
                        showNotification('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou', INFO);
                    }

                } else {
                    showNotification('Articolul nu a fost gasit!', INFO);
                }
            }
        });

        $('#intrabarcodeinput').on('keyup', function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if (keyCode === 13) {
                var code = $(this).val();
                $(this).val(EMPTY);
                if (code === EMPTY) {
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if (typeof  articolJSON !== 'undefined') {
                    if (articolJSON.idCod3 == 0) {
                        showNotification('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.', WARNING);
                    } else if (articolJSON.stare == 3) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if (!tranzactie || tranzactie.idEvidentaInventar == 0) {
                            showNotification('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul', WARNING);
                            return;
                        }
                        if ($('#intraarticolecautate').html().trim() === '') {
                            $('#intraarticolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit" data-evidenta="' + tranzactie.idEvidentaInventar + '" data-persoana="' + tranzactie.idPersoana + '" data-loc="' + tranzactie.idLoc + '" data-data="' + tranzactie.dataPreluarii + '">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            var notAdded = true;
                            var notSameTranzaction = false;
                            $('#intraarticolecautate').find('li').each(function () {
                                if ($(this).prop('id') && $(this).prop('id') == articolJSON.cod3) {
                                    notAdded = false;
                                }
                                if ($(this).attr('data-evidenta') != tranzactie.idPersoana || $(this).attr('data-loc') != tranzactie.idLoc) {
                                    notSameTranzaction = true;
                                    notAdded = false;
                                }
                                if (notAdded) {
                                    $('#intraarticolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit" data-evidenta="' + tranzactie.idEvidentaInventar + '" data-persoana="' + tranzactie.idPersoana + '" data-loc="' + tranzactie.idLoc + '"  data-data="' + tranzactie.dataPreluarii + '">' + articolJSON.denumire3 + '</li></h3>');
                                } else if(notSameTranzaction){
                                    showNotification('Articolele nu sunt atribuite aceleasi persoane!', DANGER);
                                }
                            });
                        }
                    } else if (articolJSON.stare == 4) {
                        showNotification('Articolul este in tranzit!\nIntrati in meniul de primire mai intai', INFO);
                    } else {
                        showNotification('Articolul nu este alocat!\nDaca aceasta situatie nu corespunde cu realitatea, luati legatura cu managerul', DANGER);
                    }

                } else {
                    showNotification('Articolul nu a fost gasit!', DANGER);
                }
            }
        });

        //butonul de next
        //la apasarea next se afiseaza detaliile si apare butonul de final
        $('#nextiese').on('click', function () {
            $('#backiese').show();
            $('#ieseas').hide();
            if ($('#atribuie-articole').hasClass('ascuns')) {
                $('#atribuie-articole').removeClass('ascuns');
                $('#backiese').addClass('pas2');
            }
            $('#nextiese').addClass('ascuns');
            $('#detalii-group').show();
        });

        $('#nextintra').on('click', function () {
            if ($('#intraarticolecautate').find('li').length == 0) {
                showNotification('Scaneaza articole mai intai!', WARNING);
                $('#intrabarcodeinput').focus();
                return;
            }
            if ($(this).hasClass('pas1')) {
                var idLoc = $('#intraarticolecautate').find('li')[0].getAttribute('data-loc');
                $('#intraloc').val(idLoc);
                var loc = $('#intraloc').find(':selected').text();
                $('#intraloc').val(-1);
                $('#intradinloc').text(loc);
                $('#backintra').removeClass('ascuns');
                $('#backintra').addClass('pas2');
                $('#intraalege').removeClass('ascuns');
                $('#intrascan').hide();
                $(this).removeClass('pas1');
                $(this).addClass('pas2');
            } else if ($(this).hasClass('pas2')) {
                if ($('#intraloc').val() <= 0) {
                    showNotification('Alege locul unde se recupereaza!', WARNING);
                    return;
                }
                $('#intraalege').addClass('ascuns');
                $('#detaliiintra-group').removeClass('ascuns');
                if ($('#intra-articole').hasClass('ascuns')) {
                    $('#intra-articole').removeClass('ascuns');
                    $('#backintra').addClass('pas3');
                }
                $('#nextintra').addClass('ascuns');
            }
        });

        //butonul care introduce datele in evidenta de inventar
        $('#atribuie-articole').on('click', function () {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var pers = $(iesepers).val();
            var loc = $(ieseloc).val();
            var livrare = iesestare.val();
            var stare;
            switch (livrare) {
                case '1':
                    stare =<%=StareArticol.IN_FOLOSINTA.getCode()%>;
                    break;
                case '2':
                    stare =<%=StareArticol.TRANZIT.getCode()%>;
                    break;
                default:
                    stare = 0;
                    break;
            }
            var articole = [];
            $('#articolecautate').find('li').each(function () {
                if ($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var detalii = $('#detaliiiese').val().replace(/=/g, "-").replace(/:/g, "-");
            if (pers <= 0) {
                showNotification('Alege o persoana!', WARNING);
                return;
            }
            if (loc <= 0) {
                showNotification('Alege un loc!', WARNING);
                return;
            }
            if (livrare <= 0) {
                showNotification('Alege o metoda de iesire!', WARNING);
                return;
            }
            if (detalii.length < 10) {
                showNotification('Insuficiente informatii!', WARNING);
                return;
            }
            if (stare == 0) {
                showNotification('Alege o metoda de iesire din lista!', WARNING);
                return;
            }
            var data = {"idPersoana": pers, "idLoc": loc, "cod3": articole, "detalii": detalii, "stare": stare};
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/evidentaiese',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                success: function (response) {
                    $('#closeiese').click();
                    ieseloc.val(-1);
                    ieseloc.trigger('chosen:updated');
                    iesepers.val(-1);
                    iesepers.trigger('chosen:updated');
                    iesestare.val(-1);
                    iesestare.trigger('chosen:updated');
                    $('#detaliiiese').val('');
                    $('#iesebarcodeinput').val('');
                    $('#detalii-group').hide();
                    $('#nextiese').addClass('ascuns');
                    $('#atribuie-articole').addClass('ascuns');
                    $('#backiese').removeClass('pas2');
                    $('#backiese').hide();
                    $('#iesebarcode').hide();
                    $('#ieseas').show();
                    $('#articolecautate').html('');
                    table.ajax.reload();
                    showNotification('Atribuire articole cu succes!');
                },
                error: function (err) {
                    showNotification('Operatie nereusita!', DANGER);
                }
            });
        });

        //butonul care introduce datele in evidenta de inventar
        $('#intra-articole').on('click', function () {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var loc = intraloc.val();
            var articole = [];
            $('#intraarticolecautate').find('li').each(function () {
                if ($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var detalii = $('#detaliiintra').val();
            if (loc <= 0) {
                showNotification('Alege un loc!', WARNING);
                return;
            }
            if (detalii.length < 10) {
                showNotification('Insuficiente informatii!', WARNING);
                return;
            }
            var data = {"idLoc": loc, "cod3": articole, "detalii": detalii};
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/evidentaintra',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                success: function (response) {
                    $('#closeintra').click();
                    intraloc.val(UNSELECT);
                    intraloc.trigger(chosenUpdated);
                    $('#detaliiintra').val(EMPTY);
                    $('#intrabarcodeinput').val(EMPTY);
                    $('#detaliiintra-group').addClass('ascuns');
                    $('#nextintra').removeClass('pas2');
                    $('#nextintra').addClass('pas1');
                    $('#nextintra').removeClass('ascuns');
                    $('#backintra').removeClass('pas3');
                    $('#backintra').addClass('ascuns');
                    $('#intraalege').addClass('ascuns');
                    $('#intra-articole').addClass('ascuns');
                    $('#intrascan').show();

                    $('#intraarticolecautate').html(EMPTY);
                    table.ajax.reload();
                    showNotification('Recuperare cu succes!');
                },
                error: function (err) {
                    showNotification('Operatie nereusita!', DANGER);
                }
            });
        });

        $('#primire-introdu-articole').on('click', function () {
            if ($('#articoleintroduseprimire').find('li').length == 0) {
                alert('Trebuie sa scanezi articole inainte!');
                $('#primireintrodubarcodeinput').focus();
                return;
            }
            amPrimit('articoleintroduseprimire', 0);
        });

        $('#primire-scan-articole').on('click', function () {
            if ($('#articolescanateprimire').find('li').length == 0) {
                alert('Trebuie sa scanezi articole inainte!');
                $('#primirescanbarcodeinput').focus();
                return;
            }
            amPrimit('articolescanateprimire', 0);
        });

        $('#adaugaarticol').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var cod1 = $('#selcod1').val();
            var cod2 = $('#selcod2').val();
            var denumire3 = $('#denumire3').val();
            var detalii = $('#detalii').val();
            var loc = $('#loc-add-articol').val();
            var pret = $('#pretachizitie').val();
            if (cod1 <= 0) {
                showNotification('Cod 1 este obligatoriu!', WARNING);
                return;
            }
            if (cod2 <= 0) {
                showNotification('Cod 2 este obligatoriu!', WARNING);
                return;
            }
            if (denumire3.length == 0) {
                showNotification('Denumirea este obligatorie!', WARNING);
                return;
            }
            if (denumire3.length < 5) {
                showNotification('Denumirea este prea scurta!', WARNING);
                return;
            }
            if (detalii.length < 10) {
                showNotification('Detaliile trebuie sa contina mai mult de 10 caractere!', WARNING);
                return;
            }
            if (loc <= 0) {
                showNotification('Locul este obligatoriu!', WARNING);
                return;
            }
            if (pret.length == 0) {
                showNotification('Pretul este obligatoriu!', WARNING);
                return;
            }

            var data = {
                "cod1": cod1, "cod2": cod2, "denumire3": denumire3,
                "detalii": detalii, "pretAchizitie": pret, "idLoc": loc
            };
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    chosenUnselect('#selcod1');
                    chosenUnselect('#selcod2');
                    chosenUnselect('#loc-add-articol');
                    $('#denumire3').val(EMPTY);
                    $('#detalii').val(EMPTY);
                    $('#pret').val(EMPTY);
                    $('#closeart').click();
                    table.ajax.reload();
                    showNotification(response.message);
                },
                error: function (err) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });
        });

        $('#adaugapersoana').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var nume = $('#nume').val();
            var cnp = $('#cnp').val();
            var functie = $('#functie').val();
            var localitate = $('#localitate').val();
            if (nume.length < 3) {
                showNotification('Numele este prea scurt!', WARNING);
                return;
            }
            if (nume.length == 0) {
                showNotification('Numele este obligatoriu!', WARNING);
                return;
            }
            if (cnp.length == 0) {
                showNotification('Cnp-ul este obligatoriu!', WARNING);
                return;
            }
            if (cnp.length != 13) {
                showNotification('Cnp-ul trebuie sa aiba 13 cifre!', WARNING);
                return;
            }
            if (!validCNP(cnp)) {
                showNotification('Cnp-ul nu este valid', WARNING);
                return;
            }
            if (functie.length == 0) {
                showNotification('Functia este obligatorie!', WARNING);
                return;
            }
            if (functie.length < 5) {
                showNotification('Functia este prea scurta!', WARNING);
                return;
            }
            var data = {
                "nume": nume,
                "cnp": cnp,
                "functie": functie,
                "localitate": localitate
            };
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    $('#nume').val(EMPTY);
                    $('#cnp').val(EMPTY);
                    $('#functie').val(EMPTY);
                    $('#closepers').click();
                    getPersoane();
                    showNotification(response.message)
                },
                error: function (err) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });

        });

        $('#adaugaloc').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var denumireloc = $('#denumireLoc').val();
            if (denumireloc.length == 0) {
                showNotification('Denumirea este obligatorie!', WARNING);
                return;
            }
            if (denumireloc.length < 5) {
                showNotification('Denumirea este prea scurta!', WARNING);
                return;
            }
            var data = {"denumireLoc": denumireloc};
            // will pass the form date using the jQuery serialize function
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    $('#denumireLoc').val(EMPTY);
                    $('#closeloc').click();
                    getLoc();
                    showNotification('Loc adaugat cu succes!');
                },
                error: function (err) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });
        });

        document.getElementById("inventory-table").oncontextmenu = function () {
            return false;
        }
    });

</script>
