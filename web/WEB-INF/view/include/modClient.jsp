<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
    <div class="page-header">
        <h2><spring:message code="MODCLIENT.CLIENTTITLE"/></h2>
    </div>
    <div class="form-group col-md-6">
        <label for="clientselect"><spring:message code="MODCLIENT.ALEGE"/></label>
        <select id="clientselect" data-placeholder="Alege un client..." class="chosen-select"> </select>
    </div>
    <div class="col-md-12"></div>
    <div class="form-group col-md-6">
        <label for="numeClient"><spring:message code="FORM.CLIENT"/></label>
        <input id="numeClient" class="form-control input-sm"/>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="form-group col-md-12">
        <button type="button" class="btn btn-primary" id="btnModClient" onclick="atribuieNumeModClient();">
            <span class="fa fa-plus fa-fw">&nbsp;</span><spring:message code="ADDPROJ.MODCLIENT"/>
        </button>
        <button type="button" class="btn btn-success" id="btnAddClient" data-toggle="modal" data-target="#addclientmodal">
            <span class="fa fa-edit fa-fw">&nbsp;</span>Adaugă
        </button>
        <button type="button" class="btn btn-danger" id="btnDelClient" data-toggle="modal" onclick="atribuieNumeDelClient();">
            <span class="fa fa-times fa-fw">&nbsp;</span><spring:message code="ADDPROJ.DELCLIENT"/>
        </button>
    </div>
</div>

<div class="modal fade" id="addclientmodal">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="ADDPROJ.ADDCLIENT"/></h4>
            </div>
            <div class="modal-body">
                <div class="container">
                <div class="form-group col-md-6">
                    <label for="clientnumeInput">Nume Client</label>
                    <input id="clientnumeInput" class="form-control input-sm"/>
                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="addClient();">
                    <span class="fa fa-plus fa-fw">&nbsp;</span><spring:message code="ADDPROJ.ADDCLIENT"/>
                </button>
                <button type="button" id="closeaddclient" class="btn btn-danger" data-dismiss="modal">
                    <span class="fa fa-times fa-fw">&nbsp;</span><spring:message code="DIALOG.CLOSE"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="estiSigurClientMod">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODCLIENT.CLIENTTITLE"/></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURCLIENTMOD"/> <span id="clientNumeMod" style="color: #149bdf"></span> in <span id="clientNumeMod2" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="modifyClient();">
                    <span class="fa fa-edit fa-fw">&nbsp;</span><spring:message code="DIALOG.MOD"/>
                </button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    <span class="fa fa-times fa-fw">&nbsp;</span><spring:message code="DIALOG.CLOSE"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="delclientmodal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODCLIENT.DELCLIENT"/></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURCLIENTDEL"/> <span id="clientNumeDel" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="deleteClient();">
                    <span class="fa fa-times">&nbsp;</span><spring:message code="DIALOG.DEL"/>
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <span class="fa fa-reply">&nbsp;</span><spring:message code="DIALOG.CLOSE"/>
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script src="/js/jquery.min.js"></script>
<script type="application/javascript">

    function atribuieNumeModClient() {
        $("#clientNumeMod").text($('#clientselect option:selected').text());
        $("#clientNumeMod2").text($('#numeClient').val());
    }

    function atribuieNumeDelClient() {
        $("#clientNumeDel").text($('#clientselect option:selected').text());
    }

    function deleteClient() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var numeClient = $('#numeClient').val();
        var idClient = $('#clientselect').val();
        var data = {"idClient": idClient, "client": numeClient};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/apis/v1/admin/client/deleteclient',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    hideModal();
                    showNotification(response.message, DANGER);
                    return;
                }
                $('#numeClient').val(EMPTY);
                chosenUnselect('#clientselect');
                hideModal();
                showNotification(response.message);
                $('#clienti').click();
            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err.message);
            }
        });
    }

    function modifyClient() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var numeClient = $('#numeClient').val();
        var idClient = $('#clientselect').val();
        var data = {
            "idClient": idClient,
            "client": numeClient
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/apis/v1/admin/client/modifyclient',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    hideModal();
                    showNotification(response.message, DANGER);
                    return;
                }
                $('#numeClient').val(EMPTY);
                chosenUnselect('#clientselect');
                hideModal();
                showNotification(response.message);
                $('#clienti').click();

            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err);
            }
        });
    }

    function addClient() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var client = $('#clientnumeInput').val();

        if (client === EMPTY) {
            alert("Asigurati-vă că ati completat campul!");
            return;
        }
        var data = {
            "client": client
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/apis/v1/admin/client/addclient',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                if (response && response.httpStatus == 500) {
                    hideModal();
                    showNotification(response.message, DANGER);
                    return;
                }
                $('#clientnumeInput').val(EMPTY);
                hideModal();
                showNotification(response.message);
                $('#clienti').click();
            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err);
            }
        });
    }

    $(document).ready(function () {
        $('#clientselect').on('change', function () {
            $('#numeClient').val($('#clientselect option:selected').text());
            if ($(this).val() > ZERO) {
                $('#btnModClient').attr('data-toggle', 'modal');
                $('#btnModClient').attr('data-target', '#estiSigurClientMod');
                $('#btnDelClient').attr('data-target', '#delclientmodal');
            }
        });
    });

</script>