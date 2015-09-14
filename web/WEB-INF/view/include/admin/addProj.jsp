<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="container">
    <div class="page-header">
        <h2><spring:message code="ADDPROJ.ADDPROJ"/></h2>
    </div>
    <div class="form-group col-md-6">
        <label for="nrProiect"><spring:message code="FORM.NR"/></label>
        <input type="text" id="nrProiect" required="true" class="form-control input-sm"/>
    </div>
    <div class="form-group col-md-6">
        <label for="anInput"><spring:message code="FORM.AN"/></label>
        <select id="anInput" data-placeholder="Alege un an..." class="chosen-select">
            <c:forEach var="ani" begin="2008" end="2030">
                <c:set var="ancurent" value="<%=Calendar.getInstance().get(Calendar.YEAR)%>"> </c:set>
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
    <div class="form-group col-md-12">
        <label for="numeProiect"><spring:message code="FORM.NUME"/></label>
        <input type="text" id="numeProiect" required="true" class="form-control input-sm"/>
    </div>
    <div class="form-group col-md-12">
        <label for="idClient"><spring:message code="FORM.CLIENT"/></label>
        <select id="idClient" data-placeholder="Alege un client..." class="chosen-select">

        </select>
    </div>
    <div class="col-md-12"><br/></div>
    <div class="form-group">
        <div class="col-sm-10">
            <button type="button" class="btn btn-success" id="btnAdd" onclick="addProject();">
                <span class="fa fa-plus">&nbsp;</span><spring:message code="ADDPROJ.BUTTONADD"/>
            </button>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script type="application/javascript">

    function addProject() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var nrProiect = $("#nrProiect").val();
        var anInput = $("#anInput").val();
        var numeProiect = $("#numeProiect").val();
        var idClient = $("#idClient").val();

        if (nrProiect === '' || anInput <= 0 || numeProiect === '' || idClient <= 0) {
            showNotification('Asigurati-va ca ati completat toate campurile!', DANGER);
            return;
        }
        var data = {
            "nrProiect": nrProiect,
            "an": anInput,
            "numeProiect": numeProiect,
            "idClient": idClient
        };
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/global/admin/project/addproject',
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
                $('#nrProiect').val(EMPTY);
                $('#anInput').val(new Date().getYear());
                $('#anInput').trigger(chosenUpdated);
                $('#numeProiect').val(EMPTY);
                chosenUnselect('#idClient');
                showNotification(response.message);
            },
            error: function (xhr, e) {
                showNotification('Eroare la conexiune!', DANGER);
            }
        });
    }

</script>