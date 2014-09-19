<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3><spring:message code="DELPROJ.BUTTONDEL" /></h3>

<div class="well col-md-12" style="background-color: #b6e7ff;">
    <h5 style="color:red; font-weight: bolder;"><spring:message code="DELPROJ.MSG" /></h5>
    <h5><spring:message code="DELPROJ.MSG2" /></h5>
</div>
<form id="delProjForm" method="get">
    <div class="input-group col-md-12">
        <div class="col-md-12">
            <select id="idProiect" data-placeholder="Alege un proiect..." class="chosen-select">
                <c:forEach items="${listaProiecte}" var="users">
                    <option value="${users.idProiect}" label="${users.nrProiect}  ${users.numeProiect}">${users.nrProiect}  ${users.numeProiect}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="col-md-12">
        <button type="button" class="btn btn-danger col-md-2" id="btnDelProj" onclick="delBut();">
            <spring:message code="DELPROJ.BUTTONDEL" />
        </button>
        <div id="delProjResponse"></div>
    </div>
</form>

<div class="modal fade" id="estiSigurClient">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DELPROJ.BUTTONDEL" /></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURDELETEPROJ" /> <span id="projNumeDel" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="delProjAjaxCall();"><spring:message code="MAIN.DELETE" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="NU" /></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script src="/js/jquery.min.js"></script>
<script type="application/javascript">

    function delBut(){
        if ($("#idProiect").val() == null) {
            alert("Alege un proiect din lista!");
            return;
        } else {
            $("#estiSigurClient").modal('show');
            atribuieNumeDel();
        }
    }

    function atribuieNumeDel() {
        $("#projNumeDel").text($('#idProiect').find('option:selected').attr('label'))
    }

    function delProjAjaxCall() {
        if ($("#idProiect").val() == 0) {
            $('.modal.in').modal('hide');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
            alert("Alege un proiect din lista!");
            return;
        }

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/deleteProj',
            data: 'idProiect=' + $('#idProiect').val(),
            cache: false,

            success: function (response) {

                var respContent = "";
                $("#delProjResponse").html("");
                if (response === 'undefined' || response === 0) {
                    respContent = "<label class='label-danger'>Proiectul nu a fost sters!</label>";
                } else {
                    $('#idProiect').val([]);
                    $("#idProiect").trigger("chosen:updated");
                    respContent += "<label class='label-success'>Proiectul a fost sters cu succes!</label>";

                }
                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#delProjResponse").html(respContent);
                $("#delProjResponse").css('display', 'block');
                $("#delProjResponse").fadeOut(6000);
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }

</script>