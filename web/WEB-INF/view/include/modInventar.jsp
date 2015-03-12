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
            <form method="post" id="modificapersform" action="${pageContext.request.contextPath}/api/modificapersoana">
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
                <div class="col-md-12"><br/></div>
                <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModPers" data-toggle="modal" onclick="atribuiePersMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODPERS.MODPERS"/>
                    </button>
                    <button type="button" class="btn btn-success" id="btnAddPers" data-toggle="modal">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODPERS.ADDPERS"/>
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelPers" data-toggle="modal" onclick="atribuiePersDel()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODPERS.BUTTONDEL"/>
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="locuri">
            <form method="post" id="modificalocform" action="${pageContext.request.contextPath}/api/modificaloc">
                <div class="well-sm">
                    <p>Modific&#259; locul ales</p>
                </div>
                <div class="form-group col-md-6">
                    <label for="loc-mod-select"><spring:message code="MODUSER.PERSOANA"/></label>
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
                    <button type="button" class="btn btn-success" id="btnAddLoc" data-toggle="modal">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODLOC.ADDLOC"/>
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelLoc" data-toggle="modal" onclick="atribuieLocMod()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODLOC.DELLOC"/>
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="articole">
            <form method="post" id="modificaarticolform" action="${pageContext.request.contextPath}/api/modificaarticol">
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
                    <button type="button" class="btn btn-success" id="btnAddArticol" data-toggle="modal">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODART.MODART"/>
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


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $('#persoana-mod-select').on('change', function () {
            var id = 'persoana' + $(this).val();
            var persoana = document.getElementById(id);
            if (persoana) {
                $('#nume-pers').val(persoana.getAttribute("label"));
                $('#cnp-pers').val(persoana.getAttribute("data-cnp"));
                $('#functie-pers').val(persoana.getAttribute("data-functie"));
            } else {
                $('#nume-pers').val('');
                $('#cnp-pers').val('');
                $('#functie-pers').val('');
            }
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
                $('#nume-articol').val('');
                $('#stare-articol').val('');
                $('#loc-articol').val('');
                $('#data-articol').val('');
            }
        });

        $('#loc-mod-select').on('change', function () {
            var id = 'loc' + $(this).val();
            var loc = document.getElementById(id);
            if (loc) {
                $('#nume-loc').val(loc.getAttribute("label"));
            } else {
                $('#nume-loc').val('');
            }
        });

        $('#cod1-mod-select').on('change', function () {
            var id = 'cod1-' + $(this).val();
            getCod2ByCod1($(this).val());
            var cod1 = document.getElementById(id);
            if (cod1) {
                $('#nume-cod1').val(cod1.getAttribute("label"));
            } else {
                $('#nume-cod1').val('');
            }
        });

        $('#cod2-mod-select').on('change', function () {
            var id = 'cod2-' + $(this).val();
            var cod2 = document.getElementById(id);
            if (cod2) {
                $('#nume-cod2').val(cod2.getAttribute("label"));
            } else {
                $('#nume-cod2').val('');
            }
        });
    });
</script>