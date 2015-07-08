<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form action="${pageContext.request.contextPath}/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

<a id="scrollUp" href="#top" tabindex="-1" title="Mergi sus" style="position: fixed; z-index: 900; display: none;"></a>

<div class="panel-footer unselectable">
    <span class="copyright">Copyright &copy;&nbsp;&middot;&nbsp;<span class="green">Raindrop Solutions&nbsp;<span id="an-copyright"></span></span>&nbsp;<img src="img/raindrop-logo.png"
                                                                                                                                                             class="raindrop"></span><span
        class="app-title pull-right">Shepherd 0.9.0.5</span>
</div>
