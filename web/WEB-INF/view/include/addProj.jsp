<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h3><spring:message code="ADDPROJ.ADDPROJ" /></h3>

<form id="createProj" method="post">
    <div class="input-group col-md-12">
        <div class="col-md-6">
            <span><spring:message code="FORM.NR" /></span>
            <input type="text" id="nrProiect" required="true" class="form-control input-sm"/>
        </div>
        <div class="col-md-6">
            <span><spring:message code="FORM.AN" /></span>
            <select id="anInput" data-placeholder="Alege un an..." class="chosen-select">
                <c:forEach var="ani" begin="2008" end="2030">
                    <c:set var="ancurent"  value="<%=Calendar.getInstance().get(Calendar.YEAR)%>"></c:set>
                    <c:choose>
                        <c:when test="${ani eq ancurent}">
                            <option value="${ani}" label="${ani}" selected>${ani}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${ani}" label="${ani}">${ani}</option>
                        </c:otherwise>
                    </c:choose>
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
            <select id="idClient" data-placeholder="Alege un client..." class="chosen-select">

            </select>
        </div>
        <div class="col-md-12"><br/></div>
        <div class="col-md-12">
            <button type="button" class="btn btn-success col-md-2" id="btnAdd" onclick="addProjAxajCall();">
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
        if ($("#nrProiect").val() === '' || $("#anInput").val() <= 0 || $("#numeProiect").val() === '' || $("#idClient").val() <= 0) {

            alert("Asigurati-va ca ati completat toate campurile!");
            return;
        }
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/projAdmin/createProj',
            data: 'nrProiect=' + $("#nrProiect").val() + "&an=" + $("#anInput").val() + "&numeProiect=" + $("#numeProiect").val() + "&idClient=" + $("#idClient").val(),
            cache: false,

            success: function (response) {
                if(response && response == '-1'){
                    alert('Eroare la salvare!');
                    return;
                }

                $("#newProjAdded").html("");
                $('#nrProiect').val("");
                $('#anInput').val("0");
                $('#numeProiect').val("");
                $("#idClient").val(-1);
                $("#idClient").trigger('chosen:updated');

                var respContent = "";
                var project = JSON.parse(response);
                respContent += "<label class='label-success'>Proiectul ";
                respContent += project.nrProiect + " / ";
                respContent += project.numeProiect +
                " a fost creat!</label>";

                $("#newProjAdded").html(respContent);
                $("#newProjAdded").css('display', 'block');
                $("#newProjAdded").fadeOut(6000);
            },
            error: function (xhr, e) {
                alert("Eroare la conexiune!" + e);
            }
        });
    }

</script>