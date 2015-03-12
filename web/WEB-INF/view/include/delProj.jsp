<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="page-header">
        <h2><spring:message code="DELPROJ.BUTTONDEL"/></h2>
    </div>
    <div class="well col-md-12" style="background-color: #b6e7ff;">
        <h5 style="color:red; font-weight: bolder;"><spring:message code="DELPROJ.MSG"/></h5>
        <h5><spring:message code="DELPROJ.MSG2"/></h5>
    </div>
    <div class="form-group col-md-7">
        <label for="idProiect">Alege un proiect</label>
        <select id="idProiect" data-placeholder="Alege un proiect..." class="chosen-select form-control"> </select>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="form-group">
        <div class="col-sm-10">
            <button type="button" class="btn btn-danger" id="btnDelProj" onclick="delBut();">
                <span class="fa fa-times">&nbsp;</span><spring:message code="DELPROJ.BUTTONDEL"/>
            </button>
        </div>
    </div>
</div>

<div class="modal fade" id="estiSigurClient">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="DELPROJ.BUTTONDEL"/></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURDELETEPROJ"/> <span id="projNumeDel" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="deleteProject();">
                    <span class="fa fa-times">&nbsp;</span>Da
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <span class="fa fa-reply">&nbsp;</span><spring:message code="NU"/></button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script src="/js/jquery.min.js"></script>
<script type="application/javascript">

    function delBut() {
        if ($("#idProiect").val() <= ZERO) {
            alert("Alege un proiect din lista!");
        } else {
            $("#estiSigurClient").modal('show');
            atribuieNumeDel();
        }
    }

    function atribuieNumeDel() {
        $("#projNumeDel").text($('#idProiect').find('option:selected').text());
    }

    function deleteProject() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var idProiect = $("#idProiect").val();
        if (idProiect <= 0) {
            hideModal();
            alert("Alege un proiect din lista!");
            return;
        }
        var data = 'idProiect=' + idProiect;
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/global/admin/project/deleteproject',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: data,
            cache: false,
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    showNotification(response.message, DANGER);
                    return;
                }
                chosenUnselect('#idProiect');
                hideModal();
                showNotification(response.message)
                $('#sterge').click();
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }

</script>