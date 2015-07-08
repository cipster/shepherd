<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal-dialog ">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title"><spring:message code="DIALOG.UPLOADFILES" /></h4>
        </div>
        <div class="modal-body">
            <div id="inprogress" class="inprogress-gif"></div>
            <div class="col-md-12"><br/></div>
            <div class="input-group">
                <div class="col-md-4">
                    <form method="POST" enctype="multipart/form-data">

                        <div class="col-md-12"><br/></div>
                        <div class="col-md-12">
                            <input type="text" hidden="hidden" name="idProiect" id="idProiectChestionar">
                            <input id="chestionarFile" type="file" name="file" data-filename-placement="inside"
                                   title="Click aici pentru a selecta un chestionar final" required="true"/>

                            <div class="col-md-12"><br/></div>
                            <span id="mesajAlertaC" style="color: red; display: none;"><spring:message code="DIALOG.NOFILE" /></span>

                            <div class="col-md-12"><br/></div>
                            <a type="button" class="btn btn-primary"
                               onclick="verificaFisierC();"><span class="fa fa-upload "></span> <spring:message code="MAIN.CHESTIONAR" /></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>

        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

<div class="col-md-12"><br/></div>

