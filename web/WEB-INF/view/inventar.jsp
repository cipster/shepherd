<%@ page import="projectManager.enums.StareArticol" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="/css/bootstrap.css" rel="stylesheet">

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
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container" style="margin-bottom: 50px;">
    <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
        <div class="btn-group" style="float:left; margin: 15px;">
            <button id="iese" data-toggle="modal" data-target="#iese-modal" class="btn btn-default"><span class="fa fa-upload">&nbsp;</span> Ie&#351;ire</button>
            <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
                <button id="intra" data-toggle="modal" data-target="#intra-modal" class="btn btn-default"><span class="fa fa-download">&nbsp;</span> Intrare</button>
            </sec:authorize>
            <button id="primire" data-toggle="modal" data-target="#primire-modal" class="btn btn-default"><span class="fa fa-flag-checkered">&nbsp;</span> Primire</button>
        </div>
        <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
            <div class="btn-group" style="float:right; margin: 15px;">
                <button id="add-item" data-toggle="modal" data-target="#add-item-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; articol</button>
                <button id="add-person" data-toggle="modal" data-target="#add-person-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; persoan&#259;</button>
                <button id="add-place" data-toggle="modal"  data-target="#add-place-modal" class="btn btn-default"><span class="fa fa-plus-square-o">&nbsp;</span> Adaug&#259; loc</button>
            </div>
        </sec:authorize>
    </sec:authorize>
    <!-- Main component -->
    <div class="jumbotron">
        <br/>
        <br/>
        <sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
            <table id="inventory-table" class="table" width="100%">
                <thead>
                <tr>
                    <th></th>
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
        </sec:authorize>
    </div>
</div>
<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-item-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDITEM" /></h4>
                </div>
                <form id="adaugaarticol" action="${pageContext.request.contextPath}/api/adaugaarticol" method="post">
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
                            <label for="pretachizitie">Pret achizitie</label>
                            <input id="pretachizitie" name="pretAchizitie" title="" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"><spring:message code="DIALOG.ADD" /></button>
                        <button type="button" id="closeart" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
                    </div>
                </form>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-person-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDPERSON" /></h4>
                </div>
                <form id="adaugapersoana" action="${pageContext.request.contextPath}/api/adaugapersoana" method="post">
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
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-place-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDPLACE" /></h4>
                </div>
                <form id="adaugaloc" action="${pageContext.request.contextPath}/api/adaugaloc" method="post">
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
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
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
                    <button type="button" id="backiese" class="btn btn-default"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK" /></button>
                    <button type="button" id="nextiese" class="btn btn-success ascuns"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT" /></button>
                    <button type="button" id="atribuie-articole" class="btn btn-success ascuns"><span class="fa fa-thumb-tack">&nbsp;</span><spring:message code="DIALOG.ATRIBUIE" /></button>
                    <button type="button" id="closeiese" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE" /></button>
                </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
    <div class="modal fade" id="intra-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><span class="fa fa-barcode">&nbsp;</span><spring:message code="DIALOG.INTRA" /></h4>
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
                    <button type="button" id="backintra" class="btn btn-default ascuns"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK" /></button>
                    <button type="button" id="nextintra" class="btn btn-success pas1"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT" /></button>
                    <button type="button" id="intra-articole" class="btn btn-success ascuns"><span class="fa fa-cubes">&nbsp;</span><spring:message code="DIALOG.ATRIBUIE" /></button>
                    <button type="button" id="closeintra" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE" /></button>
                </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN','ROLE_INVENTAR')">
    <div class="modal fade" id="primire-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.PRIMIRE" /></h4>
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
                    <button type="button" id="backprimire" class="btn btn-default pas1 ascuns"><span class="fa fa-arrow-left">&nbsp;</span><spring:message code="DIALOG.BACK" /></button>
                    <button type="button" id="nextprimire" class="btn btn-success pas1 ascuns"><span class="fa fa-arrow-right">&nbsp;</span><spring:message code="DIALOG.NEXT" /></button>
                    <button type="button" id="primire-scan-articole" class="btn btn-success ascuns"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.AMPRIMIT" /></button>
                    <button type="button" id="primire-introdu-articole" class="btn btn-success ascuns"><span class="fa fa-flag-checkered">&nbsp;</span><spring:message code="DIALOG.AMPRIMIT" /></button>
                    <button type="button" id="closeprimire" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE" /></button>
                </div>
            </div> <!-- /.modal-content -->
        </div> <!-- /.modal-dialog -->
    </div> <!-- /.modal -->
</sec:authorize>

<div id="alert" class="notifications"></div>

<form action="${pageContext.request.contextPath}/logout" method="post" id="logoutForm">
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
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script src="//cdn.datatables.net/tabletools/2.2.3/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript">
    var table;
    var idArticol;

    function golestePrimire(){
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

    function toJSDate (dateTime,ora) {
        var options = {
            weekday: "long",
            year: "numeric",
            month: "long",
            day: "numeric",
            "second":"2-digit",
            "minute":"2-digit",
            "hour":"2-digit"
        };
        var dateTime = dateTime.split(" ");//dateTime[0] = date, dateTime[1] = time
        var time;
        var date = dateTime[0].split("-");
        if(ora && ora == 1){
            time = dateTime[1].split(":");
            return new Date(date[0], date[1], date[2], time[0], time[1], time[2], 0).toLocaleString('ro', options);
        }


//(year, month, day, hours, minutes, seconds, milliseconds)
        return new Date(date[0], date[1], date[2]).toLocaleString('ro', options);

    }

    function drawBarcode(id){
        var canvas = document.getElementById('barcode' + id);
        if (canvas.getContext){
            var ctx = canvas.getContext('2d');
        }
    }

    /* Formatting function for row details */
    function format ( d ) {
        var evidentaInventar;
        var data;
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
        var useUserRecuperat =false;
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
                data = toJSDate(d.dataAdaugare, 1);
                dataTitle = 'Ad&#259;ugat la:';
                break;
            case 2:
                loc = getLocById(d.idLoc).denumireLoc;
                stare = '<%=StareArticol.RECUPERAT.getLabel()%>';
                stareIcon = 'fa-recycle';
                data = toJSDate(d.dataRecuperare, 1);
                dataTitle = 'Recuperat la:';
                detalii = d.detaliiRecuperare;
                if (detalii.length > 0) {
                    detaliiTitle = 'Detalii recuperare';
                    useDetalii = true;
                }
                userRecuperat = d.modificatDe;
                if(userRecuperat && userRecuperat.length > 0){
                    useUserRecuperat = true;
                }
                break;
            case 3:
                evidentaInventar = getTranzactie(d.idCod3);
                loc = getLocById(evidentaInventar.idLoc).denumireLoc;
                stare = '<%=StareArticol.IN_FOLOSINTA.getLabel()%>';
                data = toJSDate(evidentaInventar.dataPreluarii,1);
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
                if(dataPrimire) {
                    dataPrimire = toJSDate(dataPrimire, 1);
                    if (dataPrimire < data) {
                        dataPrimire = undefined;

                    }
                }
                if(dataPrimire) {
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
                data = toJSDate(evidentaInventar.dataPreluarii,1);
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
                if(dataPrimire) {
                    dataPrimire = toJSDate(dataPrimire, 1);
                    if (dataPrimire < data) {
                        dataPrimire = undefined;

                    }
                }
                usePrimire = true;
                if(dataPrimire) {
                    dataPrimire = toJSDate(dataPrimire, 1)
                } else {
                    dataPrimire = '&#206;nc&#259; nu a ajuns la destina&#355;ie';
                }
                break;
            case 5:
                stare = '<%=StareArticol.DETERIORAT.getLabel()%>';
                stareIcon = 'fa-bug';
                break;
            case 6:
                stare = '<%=StareArticol.SERVICE.getLabel()%>';
                stareIcon = 'fa-wrench';
                break;
            case 7:
                stare = '<%=StareArticol.DISPARUT.getLabel()%>';
                stareIcon = 'fa-exclamation-triangle';
                break;
            case 8:
                stare = '<%=StareArticol.CASAT.getLabel()%>';
                stareIcon = 'fa-trash';
                break;
            default:
                return;
        }
        var retString = '<div class="well"><table class="table" cellpadding="5" cellspacing="0" border="0" style="margin-left:auto;margin-right: auto ;padding-left:100px;width: 90%!important;">'+
                '<tr>'+
                '<td width="200px;"><span class="fa fa-map-marker fa-fw">&nbsp;</span><b>Localizare:</b></td>'+
                '<td width="350px;">'+ loc +'</td>'+
                '<td rowspan="10" style="vertical-align: middle; text-align: center"><div>' +
                '<img  width="200" height="100"  src="/barcode/' + barcode + '.png" alt="Inca nu s-a generat">' +
                '<br><span class="text-center">' + barcode + '</span></div>' +
                '</td>' +
                '</tr>' +
                '<tr>'+
                '<td><span class="fa ' + stareIcon +' fa-fw">&nbsp;</span><b>Stare:</b></td>'+
                '<td>'+ stare +'</td>'+
                '</tr>';

        if(usePrimire){
            retString += '<tr>'+
            '<td><span class="fa fa-truck fa-fw">&nbsp;</span><b>Stare anterioar&#259;:</b></td>'+
            '<td>Tranzit</td>'+
            '</tr>';
        }

        retString += '<tr>'+
        '<td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>' + dataTitle + '</b></td>'+
        '<td>'+ data +'</td>'+
        '</tr>';
        if(usePrimire){
            retString += '<tr><td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>Primit la:</b></td>'+
            '<td>' + dataPrimire + '</td>'+
            '</tr>';
        }
        if(usePersoana){
            retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Persoan&#259;:</b></td>'+
            '<td>' + persoana + '</td>'+
            '</tr>';
        }
        if(useUserRecuperat){
            retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Recuperat de:</b></td>'+
            '<td>' + userRecuperat + '</td>'+
            '</tr>';
        }
        if(useDetalii){
            retString += '<tr><td><span class="fa fa-comment fa-fw">&nbsp;</span><b>' + detaliiTitle + ':</b></td>'+
            '<td>' + detalii + '</td>'+
            '</tr>';
        }
        retString += '<tr><td colspan="2"><button class="btn btn-default"><span class="fa fa-print"> &nbsp;</span> Print cod de bare</button></td></tr>';
        retString += '</table></div>';

        return retString;
    }

    function getTranzactie(idArticol) {
        var tranzactie;
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/tranzactie/' + idArticol,
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    tranzactie = response;
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });

        return tranzactie;
    }

    function getLocById(idLoc) {
        var locsor;
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/getLoc/' + idLoc,
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    locsor = response;
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });

        return locsor;
    }

    function getPersoanaById(idPersoana) {
        var persoana;
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/getPersoana/' + idPersoana,
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    persoana = response;
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });

        return persoana;
    }

    function validCNP( p_cnp ) {
        var i=0 , year=0 , hashResult=0 , cnp=[] , hashTable=[2,7,9,1,4,6,3,5,8,2,7,9];
        if( p_cnp.length !== 13 ) { return false; }
        for( i=0 ; i<13 ; i++ ) {
            cnp[i] = parseInt( p_cnp.charAt(i) , 10 );
            if( isNaN( cnp[i] ) ) { return false; }
            if( i < 12 ) { hashResult = hashResult + ( cnp[i] * hashTable[i] ); }
        }
        hashResult = hashResult % 11;
        if( hashResult === 10 ) { hashResult = 1; }
        year = (cnp[1]*10)+cnp[2];
        switch( cnp[0] ) {
            case 1  : case 2 : { year += 1900; } break;
            case 3  : case 4 : { year += 1800; } break;
            case 5  : case 6 : { year += 2000; } break;
            case 7  : case 8 : case 9 : { year += 2000; if( year > ( parseInt( new Date().getYear() , 10 ) - 14 ) ) { year -= 100; } } break;
            default : { return false; }
        }
        if( year < 1800 || year > 2099 ) { return false; }
        return ( cnp[12] === hashResult );
    }

    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

    function generateBarcode(barcode){
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/generatebarcode/' + barcode,
            cache: false,
            success: function (response) {

            },
            error: function(err){
                alert('Erroare la conexiune');
            }
        });
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

    function getArticolePrimire(){
        var articoleJSON = [];
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/articoleprimire',
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    articoleJSON = response;

                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });

        return articoleJSON;
    }

    function getCod2ByCod1(idCod1){
        var cod2 = $('#selcod2');
        cod2.html('');
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/api/cod2list/' + idCod1,
            contentType: "application/json",
            async: false,
            success: function (response) {
                if(typeof response !== 'undefined') {
                    for (var i = 0; i < response.length; i++) {
                        cod2.append($("<option>").val(response[i].cod2).text(response[i].denumire2));
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        cod2.val(-1);
        cod2.trigger('chosen:updated');
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
                        $("#intraloc").append($("<option>").val(response[i].idLoc).text(response[i].denumireLoc));
                    }
                }
            },
            error: function (e) {
                alert("Connection error!");
            }
        });
        $("#ieseloc").val(-1);
        $("#ieseloc").trigger("chosen:updated");
        $("#intraloc").val(-1);
        $("#intraloc").trigger("chosen:updated");
    }

    //nu se mai foloseste
    function drawDisponibil(table){
        tableData = table.rows().nodes();
        for (var i = 0; i < tableData.length; i++) {
            var td = $(tableData[i]).find("td:eq(7)");
            td.css('text-align','center');
            var bul = td.text();
            switch (bul) {
                case '1':
                    td.html('<div class="btn btn-success"><span class="fa fa-cubes fa-fw"></span></div>');
                    break;
                case '2':
                    td.html('<div class="btn btn-success"><span class="fa fa-recycle fa-fw"></span></div>');
                    break;
                case '3':
                    td.html('<div class="btn btn-primary"><span class="fa fa-thumb-tack fa-fw"></span></div>');
                    break;
                case '4':
                    td.html('<div class="btn btn-warning"><span class="fa fa-truck fa-fw"></span></div>');
                    break;
                case '5':
                    td.html('<div class="btn btn-danger"><span class="fa fa-bug fa-fw"></span></div>');
                    break;
                case '6':
                    td.html('<div class="btn btn-danger"><span class="fa fa-wrench fa-fw"></span></div>');
                    break;
                case '7':
                    td.html('<div class="btn btn-danger"><span class="fa fa-exclamation-triangle fa-fw"></span></div>');
                    break;
                case '8':
                    td.html('<div class="btn btn-danger"><span class="fa fa-trash fa-fw"></span></div>');
                    break;
            }
        }
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
        try{
            table = $('#inventory-table').DataTable( {
                "ajax": {
                    "url": '${pageContext.request.contextPath}/api/getinventory',
                    "dataSrc": ""
                },
                "aLengthMenu": [[10, 25, 50, 100,-1], [10, 25, 50, 100, "Toate"]],
                "language": {
                    "url": '/fonts/ro_RO.txt'
                },
                stateSave: true,
                "columns": [
                    {
                        "className":      'details-control',
                        "orderable":      false,
                        "data":           null,
                        "defaultContent": '',
                        "searchable": false
                    },
                    { "data": "idCod3" },
                    { "data": "denumire1" },
                    { "data": "denumire2" },
                    { "data": "denumire3" },
                    { "data": "barcode" },
                    { "data": "detalii" },
                    { "data": "stare" },
                    { "data": "idLoc",
                        "visible": false,
                        "searchable": false },
                    { "data": "dataAdaugare",
                        "visible": false,
                        "searchable": false },
                    { "data": "dataRecuperare",
                        "visible": false,
                        "searchable": false },
                    { "data": "detaliiRecuperare",
                        "visible": false,
                        "searchable": false },
                    { "data": "dataPrimire",
                        "visible": false,
                        "searchable": false },
                    { "data": "modificatDe",
                        "visible": false,
                        "searchable": false }
                ],
                "columnDefs": [
                    {
                        "targets": [ 1 ],
                        "visible": true,
                        "searchable": false
                    },
                    {
                        "targets": [ 7 ],
                        "bUseRendered": true,
                        "visible": true,
                        "fnCreatedCell": function (nTd, sData, oData, i) {
                            switch (sData) {
                                case 1:
                                    $(nTd).html('<div class="btn btn-success"><span class="fa fa-cubes fa-fw"></span></div>');
                                    break;
                                case 2:
                                    $(nTd).html('<div class="btn btn-success"><span class="fa fa-recycle fa-fw"></span></div>');
                                    break;
                                case 3:
                                    $(nTd).html('<div class="btn btn-primary"><span class="fa fa-thumb-tack fa-fw"></span></div>');
                                    break;
                                case 4:
                                    $(nTd).html('<div class="btn btn-warning"><span class="fa fa-truck fa-fw"></span></div>');
                                    break;
                                case 5:
                                    $(nTd).html('<div class="btn btn-danger"><span class="fa fa-bug fa-fw"></span></div>');
                                    break;
                                case 6:
                                    $(nTd).html('<div class="btn btn-danger"><span class="fa fa-wrench fa-fw"></span></div>');
                                    break;
                                case 7:
                                    $(nTd).html('<div class="btn btn-danger"><span class="fa fa-exclamation-triangle fa-fw"></span></div>');
                                    break;
                                case 8:
                                    $(nTd).html('<div class="btn btn-danger"><span class="fa fa-trash fa-fw"></span></div>');
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
                            "mColumns": [0, 1, 2, 3, 4,5 ,6],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "xls",
                            "sButtonClass": "btn btn-default",
                            "sCharSet": "utf16le",
                            "sButtonText": '<span class="fa fa-file-excel-o">&nbsp;&nbsp;</span><span>XLS</span>',
                            "mColumns": [0, 1, 2, 3, 4,5 ,6],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        },
                        {
                            "sExtends": "pdf",
                            "sButtonClass": "btn btn-default",
                            "sButtonText": '<span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span><span>PDF</span>',
                            "mColumns": [0, 1, 2, 3, 4,5 ,6],
                            "oSelectorOpts": {
                                page: 'current'
                            }
                        }
                    ]
                }
            } );

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

        } catch (err){
            console.log(err);
        }

        function amPrimit(idContainer, useScan){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var articole = [];
            var querySelector = '#' + idContainer;
            $(querySelector).find('li').each(function(){
                if($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var data = {"cod3": articole, "scan": useScan};
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/amprimit',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                success: function (response) {
                    $('#closeprimire').click();
                    table.ajax.reload();
                    $("#alert").notify({
                        message: { text: 'Ai confirmat primirea cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                },
                error: function(err){
                    $("#alert").notify({
                        message: { text: 'Operatie nereusita!' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                }
            });
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

        selcod1.on('change', function(){
            getCod2ByCod1(selcod1.val());
        });

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
        iesestare.val(-1);
        iesestare.trigger('chosen:updated');

        $('#intra-modal').on('shown.bs.modal', function (e) {
            $('#intrabarcodeinput').focus();
        });

        $('#primire-modal').on('show.bs.modal', function (e) {
            var listaPrimire = $('#primire-articole-cautate');
            listaPrimire.html('');
            var count = 1;
            var articolePrimire = getArticolePrimire();
            if(articolePrimire && articolePrimire.length > 0){
                $('#primire-info').addClass('ascuns');
                $('#primire-board').removeClass('ascuns');
                $('#nextprimire').removeClass('ascuns');
                $.each(articolePrimire,function(i,articol){
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

        $('#nextprimire').on('click', function(){
            $(this).addClass('ascuns');
            if($('#primire-articole-cautate').html() != ''){
                $('#primire-board').addClass('ascuns');
                $('#primireq').removeClass('ascuns');
                $('#backprimire').removeClass('ascuns');
            } else {
                $('#primire-info').removeClass('ascuns');
                $('#primire-board').addClass('ascuns');
            }
        });

        $('#backprimire').on('click', function(){
            if($(this).hasClass('pas1')){
                $('#nextprimire').removeClass('ascuns');
                $('#primire-board').removeClass('ascuns');
                $('#primireq').addClass('ascuns');
                $('#backprimire').addClass('ascuns');
            } else if($(this).hasClass('pas2')){
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
        $('#scaneaza-primire').on('click', function(){
            $('#primireq').addClass('ascuns');
            $('#backprimire').removeClass('pas1');
            $('#backprimire').addClass('pas2');
            $('#primire-scan-div').removeClass('ascuns');
            $('#primire-scan-articole').removeClass('ascuns');
            $('#primirescanbarcodeinput').focus();
        });

        //butonul de manual la primire
        $('#introdu-primire').on('click', function(){
            $('#primireq').addClass('ascuns');
            $('#backprimire').removeClass('pas1');
            $('#backprimire').addClass('pas2');
            $('#primire-manual-div').removeClass('ascuns');
            $('#primire-introdu-articole').removeClass('ascuns');
            $('#primireintrodubarcodeinput').focus();
        });

        $('#primirescanbarcodeinput').on('keyup', function(e){
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if(keyCode === 13){
                var code= $(this).val();
                $(this).val('');
                if(code === ''){
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if(typeof  articolJSON !== 'undefined') {
                    if(articolJSON.idCod3 == 0){
                        alert('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.');
                    } else if(articolJSON.stare == 4 ) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if(!tranzactie || tranzactie.idEvidentaInventar == 0){
                            alert('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul');
                            return;
                        }
                        if($('#articolescanateprimire').html().trim() === ''){
                            $('#articolescanateprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            $('#articolescanateprimire').find('li').each(function(){
                                if($(this).prop('id') && $(this).prop('id') != articolJSON.cod3) {
                                    $('#articolescanateprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                                }
                            });
                        }
                    } else if(articolJSON.stare != 4){
                        alert('Articolul nu este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, contactati managerul');
                    } else {
                        alert('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou');
                    }

                } else {
                    alert('Articolul nu a fost gasit!');
                }
                $(this).focus();
            }
        });

        $('#primireintrodubarcodeinput').on('keyup', function(e){
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if(keyCode === 13){
                var code= $(this).val();
                $(this).val('');
                if(code === ''){
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if(typeof  articolJSON !== 'undefined') {
                    if(articolJSON.idCod3 == 0){
                        alert('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.');
                    } else if(articolJSON.stare == 4 ) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if(!tranzactie || tranzactie.idEvidentaInventar == 0){
                            alert('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul');
                            return;
                        }
                        if($('#articoleintroduseprimire').html().trim() === ''){
                            $('#articoleintroduseprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            $('#articoleintroduseprimire').find('li').each(function(){
                                if($(this).prop('id') && $(this).prop('id') != articolJSON.cod3) {
                                    $('#articoleintroduseprimire').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit">' + articolJSON.denumire3 + '</li></h3>');
                                }
                            });
                        }
                    } else if(articolJSON.stare != 4){
                        alert('Articolul nu este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, contactati managerul');
                    } else {
                        alert('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou');
                    }

                } else {
                    alert('Articolul nu a fost gasit!');
                }
                $(this).focus();
            }
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

        //butonul de back de la scanare iese
        $('#backintra').on('click', function(){
            if($(this).hasClass('pas3')){
                $('#intraalege').removeClass('ascuns');
                $('#detaliiintra-group').addClass('ascuns');
                $('#intra-articole').addClass('ascuns');
                $('#nextintra').removeClass('ascuns');
                $(this).removeClass('pas3');
                $(this).addClass('pas2');
            } else if($(this).hasClass('pas2')){
                $(this).removeClass('pas2');
                $(this).addClass('ascuns');
                $('#intraalege').addClass('ascuns');
                $('#intrascan').show();
                $('#nextintra').removeClass('pas2');
                $('#nextintra').addClass('pas1');
            }
        });

        //actiunea cand se schimba livrarea la scan iese
        iesestare.on('change', function(){
            if($(this).val() > 0 && ieseloc.val() > 0 && iesepers.val() > 0){
                $('#iesebarcode').show();
                setTimeout(function(){
                    iesestare.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //actiunea cand se schimba persoana la scan iese
        iesepers.on('change', function(){
            if($(this).val() > 0 && ieseloc.val() > 0 && iesestare.val() > 0){
                $('#iesebarcode').show();
                setTimeout(function(){
                    iesepers.removeClass('chosen-container-active');
                    $('#iesebarcodeinput').focus();
                }, 0);
            }
        });

        //actiunea cand se schimba locul la scan iese
        ieseloc.on('change', function(){
            if($(this).val() > 0 && iesepers.val() > 0 && iesestare.val() > 0){
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

        //la click pe text se face focus pt scan
        $('#intrabarcode').on('click', function(){
            $('#intrabarcodeinput').focus();
        });

        //la click pe text se face focus pt scan
        $('#primire-scan-div').on('click', function(){
            $('#articolescanateprimire').focus();
        });

        //aduce valoarea articolului dupa ce a fost scanat
        $('#iesebarcodeinput').on('keyup', function(e){
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if(keyCode === 13){
                var code= $(this).val();
                $(this).val('');
                if(code === ''){
                    return;
                }
                var articolJSON = getArticol(code);
                if(typeof  articolJSON !== 'undefined') {
                    if(articolJSON.idCod3 == 0){
                        alert('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.');
                    } else if(articolJSON.stare == 1 || articolJSON.stare == 2 ) {
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
                    } else if(articolJSON.stare == 4){
                        alert('Articolul este in tranzit!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou');
                    } else {
                        alert('Articolul este deja alocat!\nDaca aceasta situatie nu corespunde cu realitatea, recuperati articolul si incercati din nou');
                    }

                } else {
                    alert('Articolul nu a fost gasit!');
                }
            }
        });

        $('#intrabarcodeinput').on('keyup', function(e){
            var keyCode = e.keyCode ? e.keyCode : e.which;
            if(keyCode === 13){
                var code= $(this).val();
                $(this).val('');
                if(code === ''){
                    return;
                }
                var articolJSON = getArticol(code);
                var tranzactie;
                if(typeof  articolJSON !== 'undefined') {
                    if(articolJSON.idCod3 == 0){
                        alert('Articolul nu a fost gasit in inventar!\nAdaugati articolul in inventar si incercati din nou.');
                    } else if(articolJSON.stare == 3) {
                        var idArticol = articolJSON.cod3;
                        tranzactie = getTranzactie(idArticol);
                        if(!tranzactie || tranzactie.idEvidentaInventar == 0){
                            alert('Articolul nu este prezent in evidenta inventar!\nLuati legatura cu managerul');
                            return;
                        }
                        if($('#intraarticolecautate').html().trim() === ''){
                            $('#intraarticolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit" data-evidenta="' + tranzactie.idEvidentaInventar + '" data-persoana="' + tranzactie.idPersoana + '" data-loc="' + tranzactie.idLoc + '" data-data="' + tranzactie.dataPreluarii + '">' + articolJSON.denumire3 + '</li></h3>');

                        } else {
                            $('#intraarticolecautate').find('li').each(function(){
                                if($(this).prop('id') && $(this).prop('id') != articolJSON.cod3) {
                                    if($(this).attr('data-evidenta') == tranzactie.idPersoana && $(this).attr('data-loc') == tranzactie.idLoc && $(this).attr('data-data') == tranzactie.dataPreluarii) {
                                        $('#intraarticolecautate').append('<h3><li id="' + articolJSON.cod3 + '" class="articolgasit" data-evidenta="' + tranzactie.idEvidentaInventar + '" data-persoana="' + tranzactie.idPersoana + '" data-loc="' + tranzactie.idLoc + '"  data-data="' + tranzactie.dataPreluarii + '">' + articolJSON.denumire3 + '</li></h3>');
                                    } else {
                                        alert('Articolele nu sunt atribuite aceleasi persoane!');
                                    }
                                }
                            });
                        }
                    } else if(articolJSON.stare == 4) {
                        alert('Articolul este in tranzit!\nIntrati in meniul de primire mai intai');
                    } else {
                        alert('Articolul nu este alocat!\nDaca aceasta situatie nu corespunde cu realitatea, luati legatura cu managerul');
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

        $('#nextintra').on('click', function() {
            if($('#intraarticolecautate').find('li').length == 0){
                alert('Scaneaza articole mai intai!');
                $('#intrabarcodeinput').focus();
                return;
            }
            if($(this).hasClass('pas1')){
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
            } else if($(this).hasClass('pas2')) {
                if( $('#intraloc').val() <= 0){
                    alert('Alege locul unde se recupereaza!');
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
        $('#atribuie-articole').on('click', function(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var pers = $(iesepers).val();
            var loc = $(ieseloc).val();
            var livrare = iesestare.val();
            var stare;
            switch (livrare){
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
            $('#articolecautate').find('li').each(function(){
                if($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var detalii = $('#detaliiiese').val().replace(/=/g , "-").replace(/:/g , "-");
            if(pers <= 0){
                alert('Alege o persoana!');
                return;
            }
            if(loc <= 0){
                alert('Alege un loc!');
                return;
            }
            if(livrare <= 0){
                alert('Alege o metoda de iesire!');
                return;
            }
            if(detalii.length < 10){
                alert('Insuficiente informatii!');
                return;
            }
            if(stare == 0){
                alert('Alege o metoda de iesire din lista!');
                return;
            }
            var data = { "idPersoana" : pers, "idLoc" : loc, "cod3": articole, "detalii": detalii, "stare": stare };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/evidentaiese',
                beforeSend: function(xhr){
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
                    $("#alert").notify({
                        message: { text: 'Atribuire articole cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                },
                error: function(err){
                    $("#alert").notify({
                        message: { text: 'Operatie nereusita!' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                }
            });
        });

        //butonul care introduce datele in evidenta de inventar
        $('#intra-articole').on('click', function(){
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var loc = intraloc.val();
            var articole = [];
            $('#intraarticolecautate').find('li').each(function(){
                if($(this).prop('id')) {
                    articole.push($(this).prop('id'));
                }
            });
            var detalii = $('#detaliiintra').val();
            if(loc <= 0){
                alert('Alege un loc!');
                return;
            }
            if(detalii.length < 10){
                alert('Insuficiente informatii!');
                return;
            }
            var data = { "idLoc" : loc, "cod3": articole, "detalii": detalii };
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/api/evidentaintra',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                success: function (response) {
                    $('#closeintra').click();
                    intraloc.val(-1);
                    intraloc.trigger('chosen:updated');
                    $('#detaliiintra').val('');
                    $('#intrabarcodeinput').val('');
                    $('#detaliiintra-group').addClass('ascuns');
                    $('#nextintra').removeClass('pas2');
                    $('#nextintra').addClass('pas1');
                    $('#nextintra').removeClass('ascuns');
                    $('#backintra').removeClass('pas3');
                    $('#backintra').addClass('ascuns');
                    $('#intraalege').addClass('ascuns');
                    $('#intra-articole').addClass('ascuns');
                    $('#intrascan').show();

                    $('#intraarticolecautate').html('');
                    table.ajax.reload();
                    $("#alert").notify({
                        message: { text: 'Recuperare cu succes!' },
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                },
                error: function(err){
                    $("#alert").notify({
                        message: { text: 'Operatie nereusita!' },
                        type: 'danger',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: { enabled: true, delay: 3500 }
                    }).show();
                }
            });
        });

        $('#primire-introdu-articole').on('click', function(){
            if($('#articoleintroduseprimire').find('li').length == 0){
                alert('Trebuie sa scanezi articole inainte!');
                $('#primireintrodubarcodeinput').focus();
                return;
            }
            amPrimit('articoleintroduseprimire', 0);
        });

        $('#primire-scan-articole').on('click', function(){
            if($('#articolescanateprimire').find('li').length == 0){
                alert('Trebuie sa scanezi articole inainte!');
                $('#primirescanbarcodeinput').focus();
                return;
            }
            amPrimit('articolescanateprimire', 0);
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
            if(cod1 <= 0){
                alert('Cod 1 este obligatoriu!');
                return;
            }
            if(cod2 <= 0){
                alert('Cod 2 este obligatoriu!');
                return;
            }
            if(denumire3.length == 0){
                alert('Denumirea este obligatorie!');
                return;
            }
            if(denumire3.length < 5){
                alert('Denumirea este prea scurta!');
                return;
            }
            if(detalii.length < 10){
                alert('Detaliile trebuie sa contina mai mult de 10 caractere!');
                return;
            }
            if(pret.length == 0){
                alert('Pretul este obligatoriu!');
                return;
            }

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
                    table.ajax.reload();
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
            if(nume.length < 7){
                alert('Numele este prea scurt!');
                return;
            }
            if(nume.length == 0){
                alert('Numele este prea scurt!');
                return;
            }
            if(cnp.length == 0){
                alert('Cnp-ul este obligatoriu!');
                return;
            }
            if(cnp.length != 13){
                alert('Cnp-ul trebuie sa aiba 13 cifre!');
                return;
            }
            if(!validCNP(cnp)){
                alert('Cnp-ul nu este valid');
                return;
            }
            if(functie.length == 0){
                alert('Functia este obligatorie!');
                return;
            }
            if(functie.length < 5){
                alert('Functia este prea scurta!');
                return;
            }
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
            if(denumireloc.length == 0){
                alert('Denumirea este obligatorie!');
                return;
            }
            if(denumireloc.length < 5){
                alert('Denumirea este prea scurta!');
                return;
            }
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
    });

</script>
