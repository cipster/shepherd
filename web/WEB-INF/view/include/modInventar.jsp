<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li style="font-size: 12pt;" role="presentation" class="active"><a href="#persoane" aria-controls="persoane" role="tab" data-toggle="tab">Persoane</a></li>
        <li style="font-size: 12pt;" role="presentation"><a href="#locuri" aria-controls="locuri" role="tab" data-toggle="tab">Locuri</a></li>
        <li style="font-size: 12pt;" role="presentation"><a href="#articole" aria-controls="articole" role="tab" data-toggle="tab">Articole</a></li>
        <li style="font-size: 12pt;" role="presentation"><a href="#catarticole" aria-controls="catarticole" role="tab" data-toggle="tab">Categorii articole</a></li>
    </ul>

    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="persoane">
            <form method="post" id="modificapersform" action="${pageContext.request.contextPath}/global/admin/inventar/modifyperson">
                <div class="well-sm">
                    <p>Modific&#259; persoana aleas&#259;</p>
                </div>
                <div class="form-group col-md-6">
                    <label for="persoana-mod-select"><spring:message code="MODUSER.PERSOANA"/></label>
                    <select data-placeholder="Alege o persoana..." class="chosen-select" id="persoana-mod-select"> </select>
                </div>

                <div class="form-group col-md-6">
                    <label for="nume-pers">Nume</label>
                    <input type="text" class="form-control" id="nume-pers">
                </div>
                <div class="form-group col-md-6">
                    <label for="cnp-pers">CNP</label>
                    <input type="text" class="form-control" id="cnp-pers">
                </div>

                <div class="form-group col-md-6">
                    <label for="functie-pers">Func&#355;ie</label>
                    <input type="text" class="form-control" id="functie-pers">
                </div>

                <div class="form-group col-md-6">
                    <label for="localitate-pers">Localitate</label>
                    <input type="text" class="form-control" id="localitate-pers">
                </div>
                <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModPers" data-toggle="modal" onclick="atribuiePersMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODPERS.MODPERS"/>
                    </button>
                    <button type="button" class="btn btn-success" id="btnAddPers" data-toggle="modal" data-target="#add-person-modal">
                        <span class="fa fa-plus">&nbsp;</span><spring:message code="MODPERS.ADDPERS"/>
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelPers" data-toggle="modal" onclick="atribuiePersDel()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODPERS.BUTTONDEL"/>
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="locuri">
            <form method="post" id="modificalocform" action="${pageContext.request.contextPath}/global/admin/inventar/modifyloc">
                <div class="well-sm">
                    <p>Modific&#259; locul ales</p>
                </div>
                <div class="form-group col-md-6">
                    <label for="loc-mod-select"><spring:message code="MODUSER.LOC"/></label>
                    <select data-placeholder="Alege un loc..." class="chosen-select" id="loc-mod-select"> </select>
                </div>
                <div class="col-md-12"><br></div>
                <div class="form-group col-md-6">
                    <label for="nume-loc">Nume</label>
                    <input type="text" class="form-control" id="nume-loc">
                </div>
                <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModLoc" data-toggle="modal" onclick="atribuieLocMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODLOC.MODLOC"/>
                    </button>
                    <button type="button" class="btn btn-success" id="btnAddLoc" data-toggle="modal" data-target="#add-loc-modal">
                        <span class="fa fa-plus">&nbsp;</span><spring:message code="MODLOC.ADDLOC"/>
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelLoc" data-toggle="modal" onclick="atribuieLocDel()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODLOC.DELLOC"/>
                    </button>
                </div>
            </form>
        </div>`
        <div role="tabpanel" class="tab-pane fade" id="articole">
            <form method="post" id="modificaarticolform" action="${pageContext.request.contextPath}/global/admin/inventar/modifyarticol">
                <div class="well-sm">
                    <p>Modific&#259; articol ales</p>
                </div>
                <div class="form-group col-md-6">
                    <label for="articol-mod-select"><spring:message code="MODUSER.ARTICOL"/></label>
                    <select data-placeholder="Alege un articol..." class="chosen-select form-control" id="articol-mod-select"> </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="data-articol">Dat&#259; ad&#259;ugare</label>
                    <input disabled type="text" class="form-control" id="data-articol">
                </div>
                <div class="form-group col-md-6">
                    <label for="nume-articol">Denumire</label>
                    <input type="text" class="form-control" <sec:authorize ifNotGranted="ROLE_ADMIN"> disabled="disabled" </sec:authorize> id="nume-articol">
                </div>
                <div class="col-md-12"></div>
                <div class="form-group col-md-6">
                    <label for="stare-articol">Stare</label>
                    <select data-placeholder="Alege o stare..." class="chosen-select form-control" id="stare-articol">
                        <option value="<%=util.enums.StareArticol.STOC.getCode()%>"><%=util.enums.StareArticol.STOC.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.RECUPERAT.getCode()%>"><%=util.enums.StareArticol.RECUPERAT.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.IN_FOLOSINTA.getCode()%>"><%=util.enums.StareArticol.IN_FOLOSINTA.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.TRANZIT.getCode()%>"><%=util.enums.StareArticol.TRANZIT.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.DETERIORAT.getCode()%>"><%=util.enums.StareArticol.DETERIORAT.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.SERVICE.getCode()%>"><%=util.enums.StareArticol.SERVICE.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.DISPARUT.getCode()%>"><%=util.enums.StareArticol.DISPARUT.getLabel()%>
                        </option>
                        <option value="<%=util.enums.StareArticol.CASAT.getCode()%>"><%=util.enums.StareArticol.CASAT.getLabel()%>
                        </option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="loc-articol">Loc</label>
                    <select data-placeholder="Alege un loc..." class="form-control" id="loc-articol"></select>
                </div>
                <div class="col-md-12"><br/></div>
                <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModArticol" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODART.MODART"/>
                    </button>
                    <button type="button" class="btn btn-success" id="btnAddArticol" data-toggle="modal" data-target="#add-item-modal">
                        <span class="fa fa-plus">&nbsp;</span><spring:message code="MODART.ADDART"/>
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelArticol" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODART.DELART"/>
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="catarticole">
            <div class="well-sm">
                <p>Modific&#259; categorii articole</p>
            </div>
            <div class="col-md-5 jumbotron">
                <div class="col-md-12">
                    <span>Cod1</span>
                    <select data-placeholder="Alege un articol..." class="chosen-select form-control" id="cod1-mod-select"> </select>
                </div>

                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <span>Denumire</span>
                    <input type="text" class="form-control" id="nume-cod1">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModCod1" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-edit">&nbsp;</span>Modifică
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelCod1" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span>&#x218;terge
                    </button>
                </div>
            </div>
            <div class="col-md-5 col-md-offset-1 jumbotron">
                <div class="col-md-12 ">
                    <span>Cod2</span>
                    <select data-placeholder="Alege un articol..." class="chosen-select form-control" id="cod2-mod-select"> </select>
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <span>Denumire</span>
                    <input type="text" class="form-control" id="nume-cod2">
                </div>
                <div class="col-md-12"><br/></div>

                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModCod2" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-edit">&nbsp;</span>Modifică
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelCod2" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span>&#x218;terge
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>

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
                            <input id="localitate" name="localitate" title="localitate" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">
                            <span class="fa fa-plus">&nbsp;</span><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closepers" class="btn btn-default" data-dismiss="modal">
                            <span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</sec:authorize>

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
                            <select id="selcod1" name="cod1" data-placeholder="Alege o categorie..."  title=""> </select>
                        </div>
                        <div class="form-group">
                            <label for="selcod2">Alege cod 2</label><br/>
                            <select id="selcod2" name="cod2" data-placeholder="Alege o categorie..." title=""> </select>
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
                        <button type="submit" class="btn btn-success"><span class="fa fa-plus">&nbsp;</span><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closeart" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="add-loc-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.ADDPLACE"/></h4>
                </div>
                <form id="adaugaloc" action="${pageContext.request.contextPath}/global/admin/inventar/addloc" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="denumireloc">Nume</label>
                            <input id="denumireloc" name="denumireloc" title="denumire loc" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">
                            <span class="fa fa-plus">&nbsp;</span><spring:message code="DIALOG.ADD"/></button>
                        <button type="button" id="closeloc" class="btn btn-default" data-dismiss="modal">
                            <span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="estiSigurPersoana">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="MODPERS.MODPERS"/></h4>
                </div>
                <div class="modal-body">
                    <h3><spring:message code="DIALOG.ESTISIGURMODPERS"/> <span id="persNumeMod" style="color: #149bdf"></span>?</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="modifyPerson();">
                        <span class="fa fa-edit">&nbsp;</span>
                        Da
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="NU"/></button>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="estiSigurLoc">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="MODLOC.MODLOC"/></h4>
                </div>
                <div class="modal-body">
                    <h3><spring:message code="DIALOG.ESTISIGURMODLOC"/> <span id="locNumeMod" style="color: #149bdf"></span>?</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="modifyLoc();">
                        <span class="fa fa-edit">&nbsp;</span>
                        Da
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="NU"/></button>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="estiSigurDelPersoana">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="MODPERS.BUTTONDEL"/></h4>
                </div>
                <div class="modal-body">
                    <h3><spring:message code="DIALOG.ESTISIGURDELPERS"/> <span id="persNumeDel" style="color: #149bdf"></span>?</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="deletePerson();">
                        <span class="fa fa-edit">&nbsp;</span>
                        Da
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="NU"/></button>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="estiSigurDelLoc">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="MODLOC.DELLOC"/></h4>
                </div>
                <div class="modal-body">
                    <h3><spring:message code="DIALOG.ESTISIGURDELETELOC"/> <span id="locNumeDel" style="color: #149bdf"></span>?</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="deleteLoc();">
                        <span class="fa fa-edit">&nbsp;</span>
                        Da
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="NU"/></button>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>

<sec:authorize access="hasAnyRole('ROLE_SUPERUSER','ROLE_ADMIN')">
    <div class="modal fade" id="mod-person-modal">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="DIALOG.MODPERSON"/></h4>
                </div>
                <form id="modificapersoana" action="${pageContext.request.contextPath}/global/admin/inventar/modificapersoana" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="nume-mod">Nume</label>
                            <input id="nume-mod" name="nume" title="nume" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="cnp-mod">CNP</label>
                            <input id="cnp-mod" name="cnp" title="cnp" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="functie-mod">Functie</label>
                            <input id="functie-mod" name="functie" title="functie" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">
                            <span class="fa fa-edit">&nbsp;</span><spring:message code="DIALOG.MOD"/></button>
                        <button type="button" id="closepersmod" class="btn btn-default" data-dismiss="modal">
                            <span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</sec:authorize>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">

    function atribuiePersMod() {
        $('#persNumeMod').text($('#nume-pers').val());
    }

    function atribuiePersDel() {
        $('#persNumeDel').text($('#nume-pers').val());
    }

    function modifyPerson() {
        $('#modificapersform').submit();
    }

    function atribuieLocMod() {
        $('#locNumeMod').text($('#nume-loc').val());
    }

    function atribuieLocDel() {
        $('#locNumeDel').text($('#nume-loc').val());
    }

    function modifyLoc() {
        $('#modificalocform').submit();
    }

    function deletePerson() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var idPersoana = $('#persoana-mod-select').val();
        var nume = $('#nume-pers').val();
        var data = {
            "idPersoana": idPersoana,
            "nume": nume
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/global/admin/inventar/deleteperson',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    showNotification(response.message, DANGER);
                    return;
                }
                $('#persoana-mod-select').val(EMPTY);
                $('#nume-pers').val(EMPTY);
                $('#cnp-pers').val(EMPTY);
                $('#functie-pers').val(EMPTY);
                getPersoane();
                hideModal();
                showNotification(response.message);
                $('#btnDelPers').attr('data-target', '');
            },
            error: function (xhr, e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }

    function deleteLoc() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var idLoc = $('#loc-mod-select').val();
        var denumireLoc = $('#nume-loc').val();
        var data = {
            "idLoc": idLoc,
            "denumireLoc": denumireLoc
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/global/admin/inventar/deleteloc',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    showNotification(response.message, DANGER);
                    return;
                }
                $('#loc-mod-select').val(EMPTY);
                $('#nume-loc').val(EMPTY);
                getLocuri();
                hideModal();
                showNotification(response.message);
                $('#btnDelLoc').attr('data-target', '');
            },
            error: function (xhr, e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }

    $(document).ready(function () {
        $('#persoana-mod-select').on('change', function () {
            var id = 'persoana' + $(this).val();
            var persoana = document.getElementById(id);
            if (persoana) {
                $('#nume-pers').val(persoana.getAttribute("label"));
                $('#cnp-pers').val(persoana.getAttribute("data-cnp"));
                $('#functie-pers').val(persoana.getAttribute("data-functie"));
                var localitate = persoana.getAttribute("data-localitate")==='null' ? '' : persoana.getAttribute("data-localitate");
                $('#localitate-pers').val(localitate);
                $('#btnModPers').attr('data-target', '#estiSigurPersoana');
                $('#btnDelPers').attr('data-target', '#estiSigurDelPersoana');
            } else {
                $('#nume-pers').val(EMPTY);
                $('#cnp-pers').val(EMPTY);
                $('#functie-pers').val(EMPTY);
                $('#localitate-pers').val(EMPTY);
                $('#btnModPers').attr('data-target', '');
                $('#btnDelPers').attr('data-target', '');
            }
        });

        $('#adaugapersoana').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var nume = $('#nume').val();
            var cnp = $('#cnp').val();
            var functie = $('#functie').val();
            var localitate = $('#localitate').val();
            if (nume.length < 7) {
                alert('Numele este prea scurt!');
                return;
            }
            if (nume.length == 0) {
                alert('Numele este prea scurt!');
                return;
            }
            if (cnp.length == 0) {
                alert('Cnp-ul este obligatoriu!');
                return;
            }
            if (cnp.length != 13) {
                alert('Cnp-ul trebuie sa aiba 13 cifre!');
                return;
            }
            if (!validCNP(cnp)) {
                alert('Cnp-ul nu este valid');
                return;
            }
            if (functie.length == 0) {
                alert('Functia este obligatorie!');
                return;
            }
            if (functie.length < 5) {
                alert('Functia este prea scurta!');
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
                    $('#localitate').val(EMPTY);

                    $('#nume-pers').val(EMPTY);
                    $('#cnp-pers').val(EMPTY);
                    $('#functie-pers').val(EMPTY);
                    $('#localitate-pers').val(EMPTY);
                    hideModal();
                    getPersoane();
                    showNotification(response.message)
                },
                error: function (err) {
                    alert('Eroare la conexiune!');
                }
            });
        });

        $('#modificapersform').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var idPersoana = $('#persoana-mod-select').val();
            var nume = $('#nume-pers').val();
            var cnp = $('#cnp-pers').val();
            var functie = $('#functie-pers').val();
            var localitate = $('#localitate-pers').val();
            var data = {
                "idPersoana": idPersoana,
                "nume": nume,
                "cnp": cnp,
                "functie": functie,
                "localitate": localitate
            };

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
                    if (response && response.httpStatus == 500) {
                        showNotification(response.message, DANGER);
                        return;
                    }
                    $('#persoana-mod-select').val(EMPTY);
                    $('#nume-pers').val(EMPTY);
                    $('#cnp-pers').val(EMPTY);
                    $('#functie-pers').val(EMPTY);
                    $('#localitate-pers').val(EMPTY);
                    chosenUnselect('#persoana-mod-select');
                    hideModal();
                    getPersoane();
                    showNotification(response.message);
                    $('#btnModPers').attr('data-target', '');
                },
                error: function (xhr, e) {
                    alert("Eroare la conexiune!" + e);
                }
            });

        });

        $('#loc-mod-select').on('change', function () {
            var id = 'loc' + $(this).val();
            var loc = document.getElementById(id);
            if (loc) {
                $('#nume-loc').val(loc.getAttribute("label"));
                $('#btnModLoc').attr('data-target', '#estiSigurLoc');
                $('#btnDelLoc').attr('data-target', '#estiSigurDelLoc');
            } else {
                $('#nume-loc').val(EMPTY);
                $('#btnModLoc').attr('data-target', EMPTY);
                $('#btnDelLoc').attr('data-target', EMPTY);
            }
        });

        $('#modificalocform').on('submit', function (e) {
            e.preventDefault();

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var idLoc = $('#loc-mod-select').val();
            var nume = $('#nume-loc').val();
            var data = {
                "idLoc": idLoc,
                "denumireLoc": nume
            };

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
                    if (response && response.httpStatus == 500) {
                        showNotification(response.message, DANGER);
                        return;
                    }
                    $('#loc-mod-select').val(EMPTY);
                    $('#nume-loc').val(EMPTY);
                    hideModal();
                    getLocuri();
                    showNotification(response.message);
                    $('#btnModLoc').attr('data-target', '');
                },
                error: function (xhr, e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });

        $('#adaugaloc').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var denumireloc = $('#denumireloc').val();

            if (denumireloc.length < 7) {
                alert('Numele este prea scurt!');
                return;
            }
            if (denumireloc.length == 0) {
                alert('Numele este prea scurt!');
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
                    $('#denumireloc').val(EMPTY);
                    $('#nume_loc').val(EMPTY);
                    hideModal();
                    getLocuri();
                    showNotification(response.message)
                },
                error: function (err) {
                    alert('Eroare la conexiune!');
                }
            });
        });

        $('#articol-mod-select').on('change', function () {
            var id = 'articol' + $(this).val();
            var articol = document.getElementById(id);
            if (articol) {
                $('#nume-articol').val(articol.getAttribute("label"));
                $('#stare-articol').val(articol.getAttribute("data-stare"));
                $('#stare-articol').trigger('chosen:updated');
                $('#loc-articol').val(articol.getAttribute("data-loc"));
                $('#loc-articol').trigger('chosen:updated');
                $('#data-articol').val(articol.getAttribute("data-data"));
            } else {
                $('#nume-articol').val(EMPTY);
                $('#stare-articol').val(EMPTY);
                $('#loc-articol').val(EMPTY);
                $('#data-articol').val(EMPTY);
            }
        });

        $('#modificaarticolform').on('submit', function (e) {
            e.preventDefault();

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var idLoc = $('#loc-mod-select').val();
            var nume = $('#nume-loc').val();
            var data = {
                "idLoc": idLoc,
                "denumireLoc": nume
            };

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
                    if (response && response.httpStatus == 500) {
                        showNotification(response.message, DANGER);
                        return;
                    }
                    $('#loc-mod-select').val(EMPTY);
                    $('#nume-loc').val(EMPTY);
                    hideModal();
                    getLocuri();
                    showNotification(response.message);
                    $('#btnModLoc').attr('data-target', '');
                },
                error: function (xhr, e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });

        $('#cod1-mod-select').on('change', function () {
            var id = 'cod1-' + $(this).val();
            getCod2ByCod1($(this).val());
            var cod1 = document.getElementById(id);
            if (cod1) {
                $('#nume-cod1').val(cod1.getAttribute("label"));
            } else {
                $('#nume-cod1').val(EMPTY);
            }
        });

        $('#cod2-mod-select').on('change', function () {
            var id = 'cod2-' + $(this).val();
            var cod2 = document.getElementById(id);
            if (cod2) {
                $('#nume-cod2').val(cod2.getAttribute("label"));
            } else {
                $('#nume-cod2').val(EMPTY);
            }
        });

        $('#adaugaarticol').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var cod1 = $('#selcod1').val();
            var cod2 = $('#selcod2').val();
            var denumire3 = $('#denumire3').val();
            var detalii = $('#detalii').val();
            var pret = $('#pretachizitie').val();

            if (cod1 <= 0) {
                alert('Cod 1 este obligatoriu!');
                return;
            }
            if (cod2 <= 0) {
                alert('Cod 2 este obligatoriu!');
                return;
            }
            if (denumire3.length == 0) {
                alert('Denumirea este obligatorie!');
                return;
            }
            if (denumire3.length < 5) {
                alert('Denumirea este prea scurta!');
                return;
            }
            if (detalii.length < 10) {
                alert('Detaliile trebuie sa contina mai mult de 10 caractere!');
                return;
            }
            if (pret.length == 0) {
                alert('Pretul este obligatoriu!');
                return;
            }

            var data = {
                "cod1": cod1, "cod2": cod2, "denumire3": denumire3,
                "detalii": detalii, "pretAchizitie": pret
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
                    $('#articol-mod-select').val(UNSELECT);
                    $('#data-articol').val(EMPTY);
                    $('#nume-articol').val(EMPTY);
                    $('#stare-articol').val(UNSELECT);
                    $('#loc-articol').val(UNSELECT);
                    $('#selcod1').val(UNSELECT);
                    $('#selcod2').val(UNSELECT);
                    $('#denumire3').val(EMPTY);
                    $('#detalii').val(EMPTY);
                    $('#pretachizitie').val(EMPTY);
                    hideModal();
                    getArticole();
                    showNotification(response.message);

                },
                error: function (err) {
                    alert('Eroare la conexiune!');
                }
            });
        });

    });
</script>