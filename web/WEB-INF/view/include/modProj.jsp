<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3><spring:message code="MODPROJ.TITLE" /></h3>

<form method="post" id="modifica">

    <div class="input-group col-md-12">

        <div class="input-group col-md-12">

            <div class="col-md-12"><br/></div>

            <div class="col-md-12">
                <span><spring:message code="MODPROJ.ALEGE" /></span>
                <select id="idProiectSelect" data-placeholder="Alege un proiect..." class="chosen-select">

                </select>
            </div>
            <div class="col-md-12"><br/></div>
            <div class="col-md-12">

                <span><spring:message code="FORM.NUME" /></span>
                <input id="numeProiectInput" class="form-control input-sm"
                       required="required" />
            </div>
            <div class="col-md-12"><br/></div>
            <div class="col-md-6">
                <span><spring:message code="FORM.NR" /></span>
                <input id="nrProiectInput" class="form-control input-sm"/>
            </div>
            <div class="col-md-6">
                <span><spring:message code="FORM.AN" /></span>
                <select id="anSelInput" data-placeholder="Alege un an..." class="chosen-select">
                    <c:forEach var="ani" begin="2008" end="2030">
                        <option value="${ani}" label="${ani}">${ani}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-12"><br/></div>
            <div class="col-md-12">
                <span><spring:message code="FORM.CLIENT" /></span>
                <select id="idClientInput" data-placeholder="Alege un client..." class="chosen-select">

                </select>
            </div>
            <div class="col-md-12"><br/></div>
            <div class="col-md-12">
                <button type="button" class="btn btn-primary col-md-2" id="btnMod" data-toggle="modal"
                        data-target="#estiSigurProiect" onclick="atribuieNumeMod();">
                    <spring:message code="DIALOG.MOD" />
                </button>
                <div id="updatedProj"></div>
            </div>
        </div>
    </div>
</form>

<div class="modal fade" id="estiSigurProiect">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODPROJ.TITLE" /></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURMOD" /> <span id="projNumeMod" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="modProjAxajCall();"><spring:message code="DIALOG.MOD" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="NU" /></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jqBootstrapValidation.js"></script>
<script type="text/javascript">

    function atribuieNumeMod() {
        $("#projNumeMod").text($('#idProiectSelect option:selected').text());
    }

    $(document).ready(function(){
        $("#idProiectSelect").on('change', function(evt, params) {
            var id = $("#idProiectSelect").val();
            var proiect = document.getElementById(id);
            $("#numeProiectInput").val(proiect.getAttribute("data-nume"));
            $("#nrProiectInput").val(proiect.getAttribute("data-nr"));
            $("#anSelInput").val(proiect.getAttribute("data-an"));
            $("#anSelInput").trigger('chosen:updated');
            $("#idClientInput").val(proiect.getAttribute("data-idClient"));
            $("#idClientInput").trigger('chosen:updated');
        });
    });

    function modProjAxajCall() {

        if ($("#idProiectSelect").val() == 0) {
            $('.modal.in').modal('hide');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
            alert("Alege un proiect din lista!");
            return;
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/modificaProj',
            data: 'nrProiect=' + $("#nrProiectInput").val() + "&an=" + $("#anSelInput").val() + "&numeProiect=" + $("#numeProiectInput").val() + "&idClient=" + $("#idClientInput").val() + "&idProiect=" + $("#idProiectSelect").val(),
            cache: false,

            success: function (response) {
                $("#updatedProj").html("");
                $("#idProiectSelect").val("0");
                $('#nrProiectInput').val("");
                $('#anSelInput').val("0");
                $('#numeProiectInput').val("");
                $("#idClientInput").val("0");

                var respContent = "";
                var project = JSON.parse(response);
                respContent += "<label class='label-success'>Proiectul ";
                respContent += project.nrProiect + " / ";
                respContent += project.numeProiect +
                        " a fost modificat cu succes!</label>";

                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#updatedProj").html(respContent);
                $("#updatedProj").css('display', 'block');
                $("#updatedProj").fadeOut(6000);
                $('#modifica').click();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;
</script>

