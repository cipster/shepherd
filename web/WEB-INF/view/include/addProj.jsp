<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3><spring:message code="ADDPROJ.CLIENTTITLE" /></h3>

<form id="addClient" method="post">
    <div class="input-group col-md-12">
        <div class="col-md-12">
            <input id="clientInput" required="true" class="form-control input-sm"/>
        </div>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="col-md-12">
        <button type="button" class="btn btn-primary col-md-2" id="btnAddClient" onclick="addClientAxajCall();">
            <spring:message code="ADDPROJ.ADDCLIENT" />
        </button>
        <div id="newClientAdded">
        </div>
    </div>
</form>

<div class="col-md-12"><br/></div>

<h3><spring:message code="ADDPROJ.ADDPROJ" /></h3>

<form id="createProj" method="post">
    <div class="input-group col-md-12">
        <div class="col-md-6">
            <span><spring:message code="FORM.NR" /></span>
            <input type="text" id="nrProiect" required="true" class="form-control input-sm"/>
        </div>
        <div class="col-md-6">
            <span><spring:message code="FORM.AN" /></span>
            <select id="anInput" class="form-control input-sm" required="true">
                <option value="0" ><spring:message code="FORM.SELECT" /></option>
                <c:forEach var="ani" begin="2008" end="2030">
                    <option value="${ani}" label="${ani}"></option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-12"><br/></div>
        <div class="col-md-12">
            <span><spring:message code="FORM.NUME" /></span>
            <input type="text" id="numeProiect" required="true" class="form-control input-sm"/>
        </div>
        <div class="col-md-12"><br/></div>
        <div class="col-md-12">
            <span><spring:message code="FORM.CLIENT" /></span>
            <select id="idClient" class="form-control input-sm">
                <option value="0" ><spring:message code="FORM.SELECT" /></option>
                <c:forEach items="${listaClienti}" var="clnt">
                    <option value="${clnt.idClient}" label="${clnt.client}"></option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-12"><br/></div>
        <div class="col-md-12">
            <button type="button" class="btn btn-primary col-md-2" id="btnAdd" onclick="addProjAxajCall();">
                <spring:message code="ADDPROJ.BUTTONADD" />
            </button>
            <div id="newProjAdded">
            </div>
        </div>
    </div>
</form>
<script src="/js/jquery.min.js"></script>
<script type="application/javascript">

    function addProjAxajCall() {
        var dataReq = 'nrProiect=' + $('#nrProiect').val() + "&an=" + $('#anInput').val() + "&numeProiect=" + $('#numeProiect').val() + "&idClient=" + $("#idClient").val() + "'";
        if ($("#nrProiect").val() == "" || $("#anInput").val() == 0 || $("#numeProiect").val() == "" || $("#idClient").val() == 0) {

            alert("Asigurati-va ca ati completat toate campurile!");
            return;
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/createProj',
            data: 'nrProiect=' + $("#nrProiect").val() + "&an=" + $("#anInput").val() + "&numeProiect=" + $("#numeProiect").val() + "&idClient=" + $("#idClient").val(),
            cache: false,

            success: function (response) {

                $("#newProjAdded").html("");
                $('#nrProiect').val("");
                $('#anInput').val("0");
                $('#numeProiect').val("");
                $("#idClient").val("0");

                var respContent = "";
                var project = JSON.parse(response)
                respContent += "<label class='label-success'>Proiectul ";
                respContent += project.nrProiect + " / ";
                respContent += project.numeProiect +
                        " a fost creat!</label>";

                $("#newProjAdded").html(respContent);
                $("#newProjAdded").css('display', 'block');
                $("#newProjAdded").fadeOut(6000);
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

    function addClientAxajCall() {
        var dataReq = 'client=' + $('#clientInput').val();
        if ($("#clientInput").val() == 0) {

            alert("Asigurati-va ca ati completat campul!");
            return;
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/adaugaClient',
            data: 'client=' + $('#clientInput').val(),
            cache: false,

            success: function (response) {

                var respContent = "";
                $("#newClientAdded").html("");
                if (response === 'undefined' || response === "") {
                    respContent = "<label class='label-danger'>Clientul exista deja!</label>";
                } else {
                    $('#clientInput').val("");
                    var client = JSON.parse(response)
                    respContent += "<label class='label-success'>Clientul ";
                    respContent += client.client + " a fost creat!</label>";
                }
                $("#newClientAdded").html(respContent);
                $("#newClientAdded").css('display', 'block');
                $("#newClientAdded").fadeOut(6000);
            },
            error: function (e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }
    ;

</script>