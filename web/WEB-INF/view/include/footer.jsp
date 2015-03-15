<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form action="${pageContext.request.contextPath}/logout" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>

<a id="scrollUp" href="#top" style="position: fixed; z-index: 900; display: none;"></a>

<div class="panel-footer">
    <p>&copy; fieldcover 2014 <a href="#"></a> &middot; <a href="#">Shepherd</a></p>
</div>
