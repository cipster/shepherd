<%@ page import="enums.StareArticol" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                <div class="col-md-6">
                    <span><spring:message code="MODUSER.PERSOANA" /></span>
                    <select data-placeholder="Alege o persoana..."  class="chosen-select" id="persoana-mod-select">

                    </select>
                </div>

                <div class="col-md-6">
                    <span>Nume</span>
                    <input type="text" class="form-control" id="nume-pers">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-6">
                    <span>CNP</span>
                    <input type="text" class="form-control" id="cnp-pers">
                </div>

                <div class="col-md-6">
                    <span>Func&#355;ie</span>
                    <input type="text" class="form-control" id="functie-pers">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModPers" data-toggle="modal" onclick="atribuiePersMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODPERS.MODPERS" />
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelPers" data-toggle="modal" onclick="atribuiePersMod()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODPERS.BUTTONDEL" />
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="locuri">
            <form method="post" id="modificalocform" action="${pageContext.request.contextPath}/api/modificaloc">
                <div class="well-sm">
                    <p>Modific&#259; locul ales</p>
                </div>
                <div class="col-md-6">
                    <span><spring:message code="MODUSER.PERSOANA" /></span>
                    <select data-placeholder="Alege un loc..."  class="chosen-select" id="loc-mod-select"> </select>
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-6">
                    <span>Nume</span>
                    <input type="text" class="form-control" id="nume-loc">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModLoc" data-toggle="modal" onclick="atribuieLocMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODLOC.MODLOC" />
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelLoc" data-toggle="modal" onclick="atribuieLocMod()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODLOC.DELLOC" />
                    </button>
                </div>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="articole">
            <form method="post" id="modificaarticolform" action="${pageContext.request.contextPath}/api/modificaarticol">
                <div class="well-sm">
                    <p>Modific&#259; articol ales</p>
                </div>
                <div class="col-md-6">
                    <span><spring:message code="MODUSER.ARTICOL" /></span>
                    <select data-placeholder="Alege un articol..." class="chosen-select form-control" id="articol-mod-select"> </select>
                </div>
                <div class="col-md-6">
                    <span>Dat&#259; ad&#259;ugare</span>
                    <input disabled type="text" class="form-control" id="data-articol">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-6">
                    <span>Denumire</span>
                    <input type="text" class="form-control" id="nume-articol">
                </div>
                <div class="col-md-12"><br/></div>
                <div class="col-md-6">
                    <span>Stare</span>
                    <select data-placeholder="Alege o stare..." class="chosen-select form-control" id="stare-articol">
                        <option value="<%=enums.StareArticol.STOC.getCode()%>"><%=enums.StareArticol.STOC.getLabel()%></option>
                        <option value="<%=enums.StareArticol.RECUPERAT.getCode()%>"><%=enums.StareArticol.RECUPERAT.getLabel()%></option>
                        <option value="<%=enums.StareArticol.IN_FOLOSINTA.getCode()%>"><%=enums.StareArticol.IN_FOLOSINTA.getLabel()%></option>
                        <option value="<%=enums.StareArticol.TRANZIT.getCode()%>"><%=enums.StareArticol.TRANZIT.getLabel()%></option>
                        <option value="<%=enums.StareArticol.DETERIORAT.getCode()%>"><%=enums.StareArticol.DETERIORAT.getLabel()%></option>
                        <option value="<%=enums.StareArticol.SERVICE.getCode()%>"><%=enums.StareArticol.SERVICE.getLabel()%></option>
                        <option value="<%=enums.StareArticol.DISPARUT.getCode()%>"><%=enums.StareArticol.DISPARUT.getLabel()%></option>
                        <option value="<%=enums.StareArticol.CASAT.getCode()%>"><%=enums.StareArticol.CASAT.getLabel()%></option>
                    </select>
                </div>
                <div class="col-md-6">
                    <span>Loc</span>
                    <select data-placeholder="Alege un loc..." class="form-control" id="loc-articol"></select>
                </div>

                <div class="col-md-12"><br/></div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="btnModArticol" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-edit">&nbsp;</span><spring:message code="MODART.MODART" />
                    </button>
                    <button type="button" class="btn btn-danger" id="btnDelArticol" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span><spring:message code="MODART.DELART" />
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
                        <span class="fa fa-edit">&nbsp;</span>Modifică </button>
                    <button type="button" class="btn btn-danger" id="btnDelCod1" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span>&#x218;terge</button>
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
                        <span class="fa fa-edit">&nbsp;</span>Modifică</button>
                    <button type="button" class="btn btn-danger" id="btnDelCod2" data-toggle="modal" onclick="atribuieArticolMod()">
                        <span class="fa fa-times">&nbsp;</span>&#x218;terge</button>
                </div>
            </div>
        </div>
    </div>

</div>


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(document).ready(function(){
        $('#persoana-mod-select').on('change', function(){
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

        $('#articol-mod-select').on('change', function(){
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

        $('#loc-mod-select').on('change', function(){
            var id = 'loc' + $(this).val();
            var loc = document.getElementById(id);
            if (loc) {
                $('#nume-loc').val(loc.getAttribute("label"));
            } else {
                $('#nume-loc').val('');
            }
        });

        $('#cod1-mod-select').on('change', function(){
            var id = 'cod1-' + $(this).val();
            getCod2ByCod1($(this).val());
            var cod1 = document.getElementById(id);
            if (cod1) {
                $('#nume-cod1').val(cod1.getAttribute("label"));
            } else {
                $('#nume-cod1').val('');
            }
        });

        $('#cod2-mod-select').on('change', function(){
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