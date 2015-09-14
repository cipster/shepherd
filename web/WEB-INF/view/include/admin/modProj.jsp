<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="page-header">
        <h2><spring:message code="MODPROJ.TITLE"/></h2>
    </div>
    <div class="form-group col-md-12">
        <label for="idProiectSelect"><spring:message code="MODPROJ.ALEGE"/></label>
        <select id="idProiectSelect" data-placeholder="Alege un proiect..." class="chosen-select"> </select>
    </div>
    <div class="form-group col-md-12">
        <label for="numeProiectInput"><spring:message code="FORM.NUME"/></label>
        <input id="numeProiectInput" class="form-control input-sm"/>
    </div>
    <div class="form-group col-md-6">
        <label for="nrProiectInput"><spring:message code="FORM.NR"/></label>
        <input id="nrProiectInput" class="form-control input-sm"/>
    </div>
    <div class="form-group col-md-6">
        <label for="anSelInput"><spring:message code="FORM.AN"/></label>
        <select id="anSelInput" data-placeholder="Alege un an..." class="chosen-select">
            <c:forEach var="ani" begin="2008" end="2030">
                <option value="${ani}" label="${ani}">${ani}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group col-md-12">
        <label for="idClientInput"><spring:message code="FORM.CLIENT"/></label>
        <select id="idClientInput" data-placeholder="Alege un client..." class="chosen-select"> </select>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <button type="button" class="btn btn-primary" id="btnMod" data-toggle="modal" onclick="atribuieNumeMod();">
                <span class="fa fa-edit">&nbsp;</span><spring:message code="DIALOG.MOD"/>
            </button>
        </div>
    </div>
</div>

<div class="modal fade" id="estiSigurProiect">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODPROJ.TITLE"/></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURMOD"/> <span id="projNumeMod" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="modifyProiect();">
                    <span class="fa fa-edit">&nbsp;</span>
                    Da
                </button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    <span class="fa fa-times">&nbsp;</span><spring:message code="NU"/></button>
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
        if ($("#idProiectSelect").val() <= ZERO) {
            showNotification('Alege un proiect din lista!', WARNING);
            return false;
        }
        if ($("#nrProiectInput").val() === '' || $("#anSelInput").val() <= ZERO || $("#numeProiectInput").val() === '' || $("#idClientInput").val() <= ZERO) {
            hideModal();
            showNotification('Asigurati-vă că ati completat toate campurile!', DANGER);
            return;
        }

        $("#projNumeMod").text($('#idProiectSelect option:selected').text());
        $('#btnMod').attr('data-target', '#estiSigurProiect');
    }

    function modifyProiect() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var nrProiect = $("#nrProiectInput").val();
        var anInput = $("#anSelInput").val();
        var numeProiect = $("#numeProiectInput").val();
        var idClient = $("#idClientInput").val();
        var idProiect = $("#idProiectSelect").val();


        if (idProiect <= ZERO) {
            hideModal();
            showNotification('Alege un proiect din lista!', WARNING);
            return;
        }
        var data = {
            "nrProiect": nrProiect,
            "an": anInput,
            "numeProiect": numeProiect,
            "idClient": idClient,
            "idProiect": idProiect
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/global/admin/project/modifyproject',
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
                $('#nrProiectInput').val(EMPTY);
                $('#numeProiectInput').val(EMPTY);
                chosenUnselect("#idProiectSelect");
                chosenUnselect('#anSelInput');
                chosenUnselect("#idClientInput");
                hideModal();
                showNotification(response.message);
                $('#btnMod').attr('data-target', '');
                $('#modifica').click();
            },
            error: function (xhr, e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });
    }

    $(document).ready(function () {
        $("#idProiectSelect").on('change', function (evt, params) {
            var id = $("#idProiectSelect").val();
            var proiect = document.getElementById(id);
            $("#numeProiectInput").val(proiect.getAttribute("data-nume"));
            $("#nrProiectInput").val(proiect.getAttribute("data-nr"));
            $("#anSelInput").val(proiect.getAttribute("data-an"));
            $("#anSelInput").trigger(chosenUpdated);
            $("#idClientInput").val(proiect.getAttribute("data-idClient"));
            $("#idClientInput").trigger(chosenUpdated);
        });
    });

</script>

