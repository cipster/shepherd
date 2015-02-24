<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h3><spring:message code="MODCLIENT.CLIENTTITLE" /></h3>

<div class="input-group col-md-12">
    <div class="col-md-12">
        <span><spring:message code="MODCLIENT.ALEGE" /></span>
        <select id="clientselect" data-placeholder="Alege un client..." class="chosen-select">

        </select>
        <br>
        <br>
        <br>
        <span><spring:message code="FORM.CLIENT" /></span>
        <input id="numeClient" class="form-control input-sm"/>


    </div>
</div>
<div class="col-md-12"><br/></div>
<button type="button" class="btn btn-primary col-md-2" id="btnModClient" onclick="atribuieNumeModClient();">
    <spring:message code="ADDPROJ.MODCLIENT" />
</button>
<button type="button" class="btn btn-success col-md-2 col-md-offset-1" id="btnAddClient" data-toggle="modal" data-target="#addclientmodal" >
    <spring:message code="ADDPROJ.ADDCLIENT" />
</button>
<button type="button" class="btn btn-danger col-md-2 col-md-offset-1" id="btnDelClient" data-toggle="modal" onclick="atribuieNumeDelClient();">
    <spring:message code="ADDPROJ.DELCLIENT" />
</button>
<div id="newClientAdded">
</div>

<div class="modal fade" id="addclientmodal">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="ADDPROJ.ADDCLIENT" /></h4>
            </div>
            <div class="modal-body">
                <div class="input-group col-md-12">
                    <div class="col-md-12">
                        <label for="clientnumeInput">Nume Client</label>
                        <input id="clientnumeInput" required="true" class="form-control input-sm"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="addClientAxajCall();"><spring:message code="ADDPROJ.ADDCLIENT" /></button>
                <button type="button" id="closeaddclient" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
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
                <h4 class="modal-title"><spring:message code="MODCLIENT.CLIENTTITLE" /></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURCLIENTMOD" /> <span id="clientNumeMod" style="color: #149bdf"></span> in <span id="clientNumeMod2" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="modClientAxajCall();"><spring:message code="DIALOG.MOD" /></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="NU" /></button>

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
                <h4 class="modal-title"><spring:message code="MODCLIENT.DELCLIENT" /></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="DIALOG.ESTISIGURCLIENTDEL" /> <span id="clientNumeDel" style="color: #149bdf"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="delClientAxajCall();"><spring:message code="ADDPROJ.DELCLIENT" /></button>
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

    function atribuieNumeModClient() {
        $("#clientNumeMod").text($('#clientselect option:selected').text());
        $("#clientNumeMod2").text($('#numeClient').val());
    }

    function atribuieNumeDelClient() {
        $("#clientNumeDel").text($('#clientselect option:selected').text());
    }

    function delClientAxajCall(){
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var numeClient = $('#numeClient').val();
        var idClient = $('#clientselect').val();
        var data = {"idClient": idClient, "client": numeClient};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/api/stergeclient',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                var respContent = "";
                $("#newClientAdded").html("");
                if (response === 'undefined' || response === '') {
                    respContent = "<label class='label-danger'>Clientul exista deja!</label>";
                } else {
                    $('#numeClient').val('');
                    $('#clientselect').val(-1);
                    $('#clientselect').trigger('chosen:updated');
                    $('.modal.in').modal('hide');
                    $('body').removeClass('modal-open');
                    $('.modal-backdrop').remove();
                    respContent = '<label class="label-success">Clientul a fost sters!</label>';
                }

                $("#newClientAdded").html(respContent);
                $("#newClientAdded").css('display', 'block');
                $("#newClientAdded").fadeOut(6000);
                $('#clienti').click();
            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err);
            }
        });
    }

    function modClientAxajCall(){
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var numeClient = $('#numeClient').val();
        var idClient = $('#clientselect').val();
        var data = {"idClient": idClient, "client": numeClient};
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/api/modificaclient',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            dataType: 'json',
            contentType: 'application/json',
            mimeType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                var respContent = "";
                $("#newClientAdded").html("");
                if (response === 'undefined' || response === '') {
                    respContent = "<label class='label-danger'>Clientul exista deja!</label>";
                } else {
                    $('#numeClient').val('');
                    $('#clientselect').val(-1);
                    $('#clientselect').trigger('chosen:updated');
                    $('.modal.in').modal('hide');
                    $('body').removeClass('modal-open');
                    $('.modal-backdrop').remove();
                    respContent = '<label class="label-success">Clientul a fost modificat!</label>';
                }

                $("#newClientAdded").html(respContent);
                $("#newClientAdded").css('display', 'block');
                $("#newClientAdded").fadeOut(6000);
                $('#clienti').click();

            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err);
            }
        });
    }

    function addClientAxajCall() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        if ($("#clientInput").val() == 0) {
            alert("Asigurati-va ca ati completat campul!");
            return;
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/adaugaClient',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            data: 'client=' + $('#clientnumeInput').val(),
            cache: false,
            success: function (response) {
                var respContent = "";
                $("#newClientAdded").html("");
                if (response === 'undefined' || response === '') {
                    respContent = "<label class='label-danger'>Clientul exista deja!</label>";
                } else {
                    $('#clientnumeInput').val('');
                    var client = JSON.parse(response);
                    respContent += "<label class='label-success'>Clientul ";
                    respContent += client.client + " a fost creat!</label>";
                }
                $('.modal.in').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
                $("#newClientAdded").html(respContent);
                $("#newClientAdded").css('display', 'block');
                $("#newClientAdded").fadeOut(6000);
                $('#clienti').click();
            },
            error: function (xhr, err) {
                alert("Eroare la conexiune!" + err);
            }
        });
    }

    $(document).ready(function(){
        $('#clientselect').on('change', function(){
            $('#numeClient').val($('#clientselect option:selected').text());
            if($(this).val() > 0) {
                $('#btnModClient').attr('data-toggle', 'modal');
                $('#btnModClient').attr('data-target', '#estiSigurClientMod');
                $('#btnDelClient').attr('data-target', '#delclientmodal');
            }
        });
    });

</script>