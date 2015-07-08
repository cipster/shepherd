<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="cipster">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="icon" href="/img/favico.png">

    <title>Shepherd</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <style>
        input {
            font-size: 13pt !important;
        }

        .list-group-item {
            font-size: 13pt !important;
        }

        select {
            font-size: 12pt !important;
        }
    </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"></jsp:include>

<div class="container">
    <div role="tabpanel" class="jumbotron" style="height: 510px;">

        <!-- Nav tabs -->
        <ul class="list-group nav nav-pills nav-stacked col-md-3" role="tablist">
            <li role="presentation" class="active"><a class="list-group-item" href="#inventar" aria-controls="inventar" role="tab" data-toggle="tab"><span class="fa fa-cubes fa-fw">&nbsp;</span>
                Inventar</a></li>
            <li role="presentation"><a class="list-group-item" href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Profile</a></li>
            <li role="presentation"><a class="list-group-item" href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Messages</a>
            </li>
            <li role="presentation"><a class="list-group-item" href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Settings</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content well col-md-9" style="height: 470px!important;">
            <div role="tabpanel" class="tab-pane fade in active" id="inventar">
                <jsp:include page="include/rapoarte/raportInventar.jsp"></jsp:include>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile">profile.</div>
            <div role="tabpanel" class="tab-pane fade" id="messages">messages.</div>
            <div role="tabpanel" class="tab-pane fade" id="settings">...</div>
        </div>

    </div>
</div>
<div class="hidden">
    <div id="raport-inventar-loc">
        <div class="row">
            <label for="loc-raport-select">Loc</label><select data-placeholder="Alege un loc..." class="chosen-select" id="loc-raport-select">
                <c:forEach items="${locuri}" var="item">
                    <option value="${item.idLoc}">${item.denumireLoc}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div id="raport-inventar-persoana">

    </div>
    <div id="raport-inventar-categorie">

    </div>
    <div id="raport-inventar-general">

    </div>
</div>
<div id="alert" class="notifications"></div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-notify.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $('#slashraport').addClass('active');
        $("#categorie-raport-select").chosen({
            width: "100%",
            disable_search: true,
            allow_single_deselect: true
        });

        $("#format-raport-select").chosen({
            width: "100%",
            disable_search: true,
        });

        $("#categorie-raport-select").on('change', function () {
            var retVal;
            var tipRaport = parseInt($(this).val());
            var raport = $('#report');
            raport.html(EMPTY);
            $('#report-details').removeClass("hidden");
            switch (tipRaport) {
                case -1:
                    $('#report-details').addClass("hidden");
                    break;
                case 1:
                    retVal = $('#raport-inventar-loc').html();
                    break;
                case 2:
                    retVal = '';
                    break;
                case 3:
                    retVal = '';
                    break;
            }
            raport.html(retVal);
        });

        $('#generate-raport-form').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var tipRaport = $("#categorie-raport-select").val();

            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/global/raport/' + tipRaport,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: $(this).serialize(),
                success: function (response) {

                },
                error: function (err) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });
        });
    });
</script>