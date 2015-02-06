<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3><spring:message code="MODUSER.TITLE" /></h3>

<form:form method="post" id="modificaUser" action="/modificaUser" commandName="user">

    <div class="col-md-12"><br/></div>
    <div class="col-md-6">
        <span><spring:message code="MODUSER.ALEGE" /></span>
        <select id="idUserSelect" data-placeholder="Alege un utilizator..." class="chosen-select">
            <c:forEach items="${listaUsers}" var="users">
                <option id="${users.username}" data-username="${users.username}"
                        data-password="${users.password}" data-status="${users.enabled}"
                        value="${users.username}" label="${users.username}"> ${users.username}

                </option>
            </c:forEach>
        </select>
    </div>
    <div class="col-md-6">
        <span><spring:message code="MODUSER.STATUS" /></span>
        <select path="enabled" id="statusInput" data-placeholder="Alege starea utilizatorului" class="chosen-select" required="true">
            <option value="1"><spring:message code="MODUSER.ACTIVE" /></option>
            <option value="0"><spring:message code="MODUSER.INACTIVE" /></option>
        </select>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="col-md-6">

        <span><spring:message code="USER" /></span>
        <span path="username" id="usernameInput" class="form-control col-md-12"></span>
    </div>
    <div class="col-md-6">
        <span><spring:message code="MODUSER.ROLURI" /></span>
        <select multiple data-placeholder="Alege un rol..."  class="chosen-select" id="adminInput">
            <c:forEach items="${listaRoluri}" var="roluri">
                <option value="${roluri.idRole}" label="${roluri.role}">${roluri.role}</option>
            </c:forEach>
        </select>
    </div>

    <div class="col-md-12"><br/></div>
    <div class="col-md-6">
        <span><spring:message code="MODUSER.PAROLA" /></span>
        <sform:input path="password" id="passwordInput" cssClass="form-control input-sm" required="true"/>
    </div>
    <div class="col-md-6">
        <span><spring:message code="MODUSER.REPETAPAROLA" /></span>
        <input id="passwordInput" class="form-control input-sm" required="true"/>
    </div>

    <div class="col-md-12"><br/></div>


    <div class="col-md-12"><br/></div>


    <div class="col-md-12"><br/></div>
    <div class="col-md-12">
        <button type="submit" class="btn btn-primary" id="btnModUser">
            <spring:message code="MODUSER.MODUSER" />
        </button>
        <button type="button" class="btn btn-primary" id="btnAddUser" data-toggle="modal" data-target="#userNou">
            <spring:message code="MODUSER.ADDUSER" />
        </button>
    </div>
</form:form>
<form:form method="POST" action="/adaugaUser" commandName="user">
    <div class="modal fade" id="userNou">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title"><spring:message code="MODUSER.ADDUSER" /></h4>
                </div>
                <div class="modal-body">
                    <div class="col-md-12"><br/></div>
                    <div class="input-group">
                        <div class="hidden">
                            <span><spring:message code="MODUSER.STATUS" /></span>
                            <sform:label path="enabled" id="newStatusInput" cssClass="form-control input-sm" value="1"/>
                        </div>
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <span><spring:message code="USER" /></span>
                            <sform:input path="username" id="newUsernameInput" class="form-control col-md-12"
                                         required="true"/>
                        </div>

                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <span><spring:message code="PASSWORD" /></span>
                            <input  id="newPasswordInput" class="form-control input-sm"
                                         required="true"/>
                        </div>
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-6">
                            <label><spring:message code="MODUSER.REPETAPAROLA" /></label>
                            <input id="newRepeatPasswordInput"
                                   class="form-control input-sm" required="true"/>
                        </div>
                        <div class="col-md-12"><br/></div>
                        <div class="col-md-12"><br/></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="<spring:message code="MODUSER.ADDUSER" />"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="DIALOG.CLOSE" /></button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</form:form>

<form:form method="POST" action="/stergeUser" commandName="user">
    <div class="modal fade" id="userNou">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Sterge Utilizatori</h4>
            </div>
            <div class="modal-body">
                <div class="col-md-12"><br/></div>
                <div class="input-group">

                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Adauga Utilizator"/>

                    <button type="button" class="btn btn-default" data-dismiss="modal">Inchide</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</form:form>

<script type="text/javascript">
    $("#adminInput").val([]);
    $("#statusInput").val("");
    $(document).ready(function(){
        $("#idUserSelect").on('change', function (evt, params) {
            var id = $("#idUserSelect").val();
            var user = document.getElementById(id);
            if (id != 0) {
                $("#usernameInput").text(user.getAttribute("data-username"));
                $("#passwordInput").val(user.getAttribute("data-password"));
                $("#statusInput").val(user.getAttribute("data-status"));
            } else {
                $("#usernameInput").text("");
                $("#passwordInput").val("");
                $("#statusInput").val("");
            }

            var username = user.getAttribute("data-username");

            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/projAdmin/getrole',
                data: 'username=' + username,
                async: true,
                cache: false,

                success: function (response) {
                    if (response == "error") {
                        $("#alert").notify({
                            message: { text: 'Utilizatorul nu are roluri' },
                            type: 'danger',
                            closeable: 'true',
                            transition: 'fade',
                            fadeOut: { enabled: true, delay: 15000 }
                        }).show();
                        return;
                    }
                    var uploadResponse = JSON.parse(response);
                    var roles = new Array();
                    var roleArr = uploadResponse.role.split('=');

                    for (var i=0 ;i < roleArr.length; i++) {
                        if(roleArr[i] !== 'undefined' && roleArr[i] != "" && roleArr[i].length > -1) {
                            if (roleArr[i] == 'ROLE_ADMIN') {
                                roles[2] = 2;
                            } else if (roleArr[i] == 'ROLE_USER') {
                                roles[0] = 1;
                            } else if (roleArr[i] == 'ROLE_DOWNLOAD') {
                                roles[1] = 3;
                            }
                        }
                    }
                    $("#adminInput").val(roles);
                    $("#adminInput").trigger("chosen:updated");
                    $("#statusInput").trigger("chosen:updated");
                },
                error: function (e) {
                    alert("Eroare la conexiune!");
                }
            });
        });
    });


</script>

