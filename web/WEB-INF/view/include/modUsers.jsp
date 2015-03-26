<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container">
    <div class="page-header">
        <h2><spring:message code="MODUSER.TITLE"/></h2>
    </div>
    <form method="post" id="modificauserform" class="form-group" action="${pageContext.request.contextPath}/api/modificauser">
        <div class="form-group col-md-6">
            <label for="idUserSelect"><spring:message code="MODUSER.ALEGE"/></label>
            <select id="idUserSelect" data-placeholder="Alege un utilizator..." class="chosen-select"></select>
        </div>
        <div class="form-group col-md-6">
            <label for="statusInput"><spring:message code="MODUSER.STATUS"/></label>
            <select id="statusInput" data-placeholder="Alege starea utilizatorului" class="chosen-select">
                <option value="1"><spring:message code="MODUSER.ACTIVE"/></option>
                <option value="0"><spring:message code="MODUSER.INACTIVE"/></option>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="usernameInput"><spring:message code="USER"/></label>
            <input id="usernameInput" class="form-control input-sm" disabled/>
        </div>
        <div class="form-group col-md-6">
            <label for="adminInput"><spring:message code="MODUSER.ROLURI"/></label>
            <select multiple data-placeholder="Alege un rol..." class="chosen-select" id="adminInput">
                <c:forEach items="${listaRoluri}" var="roluri">
                    <option value="${roluri.idRole}" label="${roluri.role}">${roluri.role}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-12"></div>
        <div class="col-md-6 form-group">
            <label for="persoana-select"><spring:message code="MODUSER.PERSOANA"/></label>
            <select data-placeholder="Alege o persoana..." class="chosen-select" id="persoana-select"></select>
        </div>
        <div class="form-group">
            <div class="col-sm-10">
                <button type="button" class="btn btn-warning" id="btnChPass" data-toggle="modal">
                    <span class="fa fa-lock fa-fw">&nbsp;</span><spring:message code="MODUSER.CHANGEPASS"/>
                </button>
            </div>
        </div>
        <div class="col-md-12"><br/></div>
        <div class="form-group col-md-12">
            <button type="button" class="btn btn-primary" id="btnModUser" data-toggle="modal" onclick="atribuieUserMod()">
                <span class="fa fa-edit fa-fw">&nbsp;</span><spring:message code="MODUSER.MODUSER"/>
            </button>
            <button type="button" class="btn btn-success" id="btnAddUser" data-toggle="modal" data-target="#userNou">
                <span class="fa fa-plus fa-fw">&nbsp;</span><spring:message code="MODUSER.ADDUSER"/>
            </button>
        </div>
    </form>
</div>

<div class="modal fade" id="userNou">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODUSER.ADDUSER"/></h4>
            </div>
            <form id="adduserform" method="POST" action="${pageContext.request.contextPath}/api/adaugauser">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-group col-md-8">
                            <label for="newUsernameInput"><spring:message code="USER"/></label>
                            <input id="newUsernameInput" class="form-control col-md-12"/>
                        </div>
                        <div class="col-md-7  well" style="margin-left: 23px; font-size: 13pt;">
                            <span><span class="fa fa-info-circle fa-fw">&nbsp;&nbsp;</span>Parola provizorie este <b><code>qwerty</code></b></span>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="persoana-select-new"><spring:message code="MODUSER.PERSOANA"/></label>
                            <select data-placeholder="Alege o persoana..." class="chosen-select" id="persoana-select-new">
                            </select>
                        </div>
                        <div class="form-group col-md-8">
                            <label for="newRoluriInput"><spring:message code="MODUSER.ROLURI"/></label>
                            <select multiple data-placeholder="Alege un rol..." class="chosen-select" id="newRoluriInput">
                                <c:forEach items="${listaRoluri}" var="roluri">
                                    <c:choose>
                                        <c:when test="${roluri.idRole eq 3}">
                                            <option value="${roluri.idRole}" label="${roluri.role}" selected>${roluri.role}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${roluri.idRole}" label="${roluri.role}">${roluri.role}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">
                        <span class="fa fa-plus fa-fw">&nbsp;</span><spring:message code="MODUSER.ADDUSER"/></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <span class="fa fa-times fa-fw">&nbsp;</span><spring:message code="DIALOG.CLOSE"/></button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="schimbaparola">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODUSER.CHANGEPASS"/></h4>
            </div>
            <form method="POST" id="adminChangePass" action="${pageContext.request.contextPath}/api/schimbaparola">
                <div class="modal-body">
                    <div class="container-fluid form-horizontal">
                        <div class="form-group col-md-6">
                            <label for="chPasswordInput"><spring:message code="MODUSER.PASSNEW"/></label>
                            <input type="password" id="chPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12"></div>
                        <div class="form-group col-md-6">
                            <label for="chRepeatPasswordInput"><spring:message code="MODUSER.REPETAPAROLA"/></label>
                            <input type="password" id="chRepeatPasswordInput" class="form-control input-sm"/>
                        </div>
                        <div class="col-md-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="chShowPass"/> <spring:message code="MODUSER.ARATAPAROLA"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><spring:message code="MODUSER.CHANGEPASS"/></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE"/></button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="estisiguruser">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><spring:message code="MODUSER.TITLE"/></h4>
            </div>
            <div class="modal-body">
                <h3><spring:message code="USER.ESTISIGURMOD"/> <span id="userNumeMod" style="color: #149bdf;"></span>?</h3>
            </div>
            <div class="modal-footer">
                <button type="submit" id="modusersubmit" class="btn btn-primary"><spring:message code="DIALOG.MOD"/></button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="NU"/></button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
    $("#adminInput").val(UNSELECT);
    $("#statusInput").val(EMPTY);

    function atribuieUserMod() {
        if ($("#idUserSelect").val() <= 0) {
            alert("Alege un utilizator din lista!");
            return;
        }
        if ($("#usernameInput").val() === '' || $("#adminInput").val() <= 0 || $("#statusInput").val() < 0) {
            hideModal();
            alert("Asigurati-va ca ati completat toate campurile!");
            return;
        }

        $("#userNumeMod").text($('#idUserSelect option:selected').text());
        $('#btnModUser').attr('data-target', '#estisiguruser');
    }

    $(document).ready(function () {

        $('#chShowPass').on('click', function (e) {
            var pass = $('#chPasswordInput');
            var rpass = $('#chRepeatPasswordInput');
            if (pass.attr('type') == 'password') {
                pass.attr('type', 'text');
                rpass.attr('type', 'text');
            } else {
                pass.attr('type', 'password');
                rpass.attr('type', 'password');
            }
        });

        $('#modusersubmit').on('click', function () {
            $("#modificauserform").submit();
        });

        $("#adduserform").on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var user = $('#newUsernameInput').val();
            var rol = $('#newRoluriInput').val();
            var persoana = $('#persoana-select-new').val();
            if (user.trim().length == 0 && rol.trim().length == 0) {
                return;
            }
            var roluri = '';
            for (var i = 0; i < rol.length; i++) {
                roluri += '&rol=' + rol[i];
            }
            data = 'username=' + user + '&persoana=' + persoana + roluri;
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: data,
                success: function (response) {
                    if (response === '-1') {
                        hideModal();
                        $("#alert").notify({
                            message: {text: 'Utilizatorul nu a fost adaugat!'},
                            type: 'danger',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: {enabled: true, delay: 15000}
                        }).show();
                        return;
                    }

                    if (response === '-2') {
                        hideModal();
                        $("#alert").notify({
                            message: {text: 'Utilizatorul cu numele ' + user + ' exista deja!'},
                            type: 'warning',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: {enabled: true, delay: 15000}
                        }).show();
                        return;
                    }
                    $('#newUsernameInput').val('');
                    $('#newRoluriInput').val(3);
                    $('#newRoluriInput').trigger('chosen:updated');
                    $('#persoana-select').val(-1);
                    $('#persoana-select').trigger('chosen:updated');
                    $("#utilizatori").click();
                    var respContent = 'Utilizatorul ' + user + ' a fost adaugat!';
                    hideModal();
                    $("#alert").notify({
                        message: {text: respContent},
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: {enabled: true, delay: 15000}
                    }).show();
                },
                error: function (e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });

        $("#modificauserform").on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var user = $('#usernameInput').text();
            var status = $('#statusInput').val();
            var rol = $('#adminInput').val();
            var persoana = $('#persoana-select').val();
            if (user.trim().length == 0 && rol.trim().length == 0) {
                return;
            }
            var roluri = '';
            for (var i = 0; i < rol.length; i++) {
                roluri += '&rol=' + rol[i];
            }
            data = 'username=' + user + '&status=' + status + '&persoana=' + persoana + roluri;
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: data,
                success: function (response) {
                    if (response === '-1') {
                        hideModal();
                        $("#alert").notify({
                            message: {text: 'Utilizatorul nu a fost modificat!'},
                            type: 'danger',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: {enabled: true, delay: 15000}
                        }).show();
                        return;
                    }
                    $('#usernameInput').text('');
                    $('#statusInput').val(-1);
                    $('#statusInput').trigger('chosen:updated');
                    $('#adminInput').val(-1);
                    $('#adminInput').trigger('chosen:updated');
                    $('#persoana-select').val(-1);
                    $('#persoana-select').trigger('chosen:updated');
                    $("#utilizatori").click();
                    var respContent = 'Utilizatorul ' + user + ' a fost modificat!';
                    hideModal();
                    $("#alert").notify({
                        message: {text: respContent},
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: {enabled: true, delay: 15000}
                    }).show();
                },
                error: function (xhr, e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });

        $("#adminChangePass").on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var id = $("#idUserSelect").val();
            var user = document.getElementById(id).getAttribute("data-username");
            var pass = $('#chPasswordInput').val();
            var rpass = $('#chRepeatPasswordInput').val();
            if (pass.trim().length == 0 && rpass.trim().length == 0) {
                return;
            }
            if (pass !== rpass) {
                alert('Parolele nu se potrivesc!');
                return;
            }
            data = 'user=' + user + '&password=' + pass;
            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: data,
                success: function (response) {
                    if (response === '-1') {
                        hideModal();
                        $("#alert").notify({
                            message: {text: 'Parola nu a fost schimbata!'},
                            type: 'danger',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: {enabled: true, delay: 15000}
                        }).show();
                        return;
                    }
                    $('#chPasswordInput').val('');
                    $('#chRepeatPasswordInput').val('');
                    var respContent = 'Parola a fost actualizata!';
                    hideModal();
                    $("#alert").notify({
                        message: {text: respContent},
                        type: 'success',
                        closeable: 'true',
                        transition: 'fade',
                        fadeOut: {enabled: true, delay: 15000}
                    }).show();
                },
                error: function (e) {
                    alert("Eroare la conexiune!" + e);
                }
            });
        });

        $("#idUserSelect").on('change', function (evt, params) {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var id = $("#idUserSelect").val();
            var user = document.getElementById(id);
            var username = user.getAttribute("data-username");

            $("#adminInput").val(EMPTY);
            $("#usernameInput").val(EMPTY);
            $("#statusInput").val(EMPTY);
            $('#btnChPass').attr('data-target', EMPTY);
            if (id != UNSELECT) {
                $("#usernameInput").val(user.getAttribute("data-username"));
                $("#statusInput").val(user.getAttribute("data-status"));
                $("#statusInput").trigger(chosenUpdated);
                $('#persoana-select').val(user.getAttribute("data-persoana"));
                $('#persoana-select').trigger(chosenUpdated);
                $('#btnChPass').attr('data-target', '#schimbaparola');

                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/global/admin/user/getrolesforusername',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    data: 'username=' + username,
                    cache: false,
                    success: function (response) {
                        if (response && response.roles.length == ZERO) {
                            showNotification('Utilizatorul ' + username + ' nu are roluri', DANGER, 15000);
                            return;
                        }
                        $("#adminInput").val(response.roles);
                        $("#adminInput").trigger(chosenUpdated);
                    },
                    error: function (e) {
                        alert("Eroare la conexiune!");
                    }
                });
            }
        });
    });


</script>

