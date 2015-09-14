<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <div role="tabpanel" class="jumbotron container">

        <!-- Nav tabs -->
        <ul class="list-group nav nav-pills nav-stacked col-md-3" role="tablist">
            <li role="presentation" class="active"><a class="list-group-item" href="#inventar" aria-controls="inventar" role="tab" data-toggle="tab"><span class="fa fa-cubes fa-fw">&nbsp;</span>
                Inventar</a></li>
            <sec:authorize access="hasAnyRole('ROLE_DEV')">
                <%--<li role="presentation"><a class="list-group-item" href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Profile</a>--%>
                <%--</li>--%>
                <%--<li role="presentation"><a class="list-group-item" href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Messages</a>--%>
                <%--</li>--%>
                <%--<li role="presentation"><a class="list-group-item" href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><span class="fa fa-briefcase fa-fw">&nbsp;</span> Settings</a>--%>
                <%--</li>--%>
            </sec:authorize>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content well col-md-9" style="min-height: 470px!important;">
            <div role="tabpanel" class="tab-pane fade in active" id="inventar">

                <div class="well-sm">
                    <h3>Raport Inventar</h3>
                    <h6 class="small text-muted">Alege unul sau mai multe criterii pentru raport.<br> Daca lasi un camp gol nu se va filtra dupa criteriu si se vor selecta automat toate optiunile</h6>
                    <hr>
                </div>

                <form id="generate-raport-form" target="_blank" action="${pageContext.request.contextPath}/generate-raport/raport-inventar" method="post" novalidate>

                    <div id="raport-inventar">
                        <div class="row">
                            <div class="col-md-7 form-group">
                                <label for="loc-select">Loc</label>
                                <select multiple data-placeholder="Toate sau alege un loc..." class="chosen-select" id="loc-select" name="idLoc" required>
                                    <option></option>
                                    <c:forEach items="${locuri}" var="loc">
                                        <option value="${loc.idLoc}">${loc.denumireLoc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7 form-group">
                                <label for="persoana-select">Persoana</label>
                                <select multiple data-placeholder="Toate sau alege o persoana..." class="chosen-select" id="persoana-select" name="idPersoana" required>
                                    <option></option>
                                    <c:forEach items="${persoane}" var="persoana">
                                        <option value="${persoana.idPersoana}">${persoana.nume}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7 form-group">
                                <label for="cod1-select">Categorie COD 1</label>
                                <select multiple data-placeholder="Toate sau alege o categorie..." class="chosen-select" id="cod1-select" name="cod1" required>
                                    <option></option>
                                    <c:forEach items="${listaCod1}" var="cod1">
                                        <option value="${cod1.cod1}">${cod1.denumire1}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7 form-group">
                                <label for="cod2-select">Categorie COD 2</label>
                                <select multiple data-placeholder="Toate sau alege o categorie..." class="chosen-select" id="cod2-select" name="cod2" required>
                                    <option></option>
                                    <option disabled>Alege mai intai o categorie COD 1</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7 form-group">
                                <label for="order-select">Ordoneaza dupa</label>
                                <select data-placeholder="Alege dupa ce se ordoneaza..." class="chosen-select" id="order-select" name="orderBy" required>
                                    <option></option>
                                    <option value="id_loc">Loc</option>
                                    <option value="nume">Persoana</option>
                                    <option value="cod1">Categorie COD 1</option>
                                    <option value="cod2">Categorie COD 2</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-md-offset-4 form-group">
                        <select data-placeholder="Alege un format..." class="chosen-select" id="format-raport-select" required>
                            <option value="1" selected>HTML</option>
                            <%--<option disabled value="2">PDF</option>--%>
                            <%--<option disabled value="3">XLS</option>--%>
                        </select>
                    </div>

                    <div class="col-md-4 form-group">
                        <input type="submit" class="btn btn-primary btn-sm" value="Genereaz&#259; raport"/>
                    </div>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile">profile.</div>
            <div role="tabpanel" class="tab-pane fade" id="messages">messages.</div>
            <div role="tabpanel" class="tab-pane fade" id="settings">...</div>
        </div>

    </div>
</div>

<div id="alert" class="notifications"></div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-notify.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $('#slashraport').addClass('active');

        $(document).on('change', '#cod1-select', function () {
            var options = [];
            var container = 'cod2-select';
            $.each($(this).find('option:selected'), function (index, value) {
                options.push($(value).val());
            });
            if(options.length == 1) {
                getCod2ByCod1(options[0], container);
            } else if(options.length > 1){
                getCod2ByMultipleCo1(options, container);
            }
        });

        $(document).on('submit', '#generate-raport-form', function (e) {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var idLoc = $("#loc-select").val();
            var idPersoana = $("#persoana-select").val();
            var cod1 = $("#cod1-select").val();
            var cod2 = $("#cod2-select").val();
            var orderBy = $("#order-select").val();

            var data = {
                'idLoc': idLoc, 'idPersoana': idPersoana,
                'cod1': cod1, 'cod2': cod2, 'orderBy': orderBy
            };

            $.ajax({
                type: 'post',
                url: $(this).prop('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (response) {
                    window.location = "/generate-raport/raport-inventar/" + response;
                },
                error: function (err) {
                    showNotification('Eroare la conexiune!', DANGER);
                }
            });
            e.preventDefault();
        });
    });
</script>