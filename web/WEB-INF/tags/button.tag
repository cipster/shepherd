<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="label" required="true" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="icon" required="false" rtexprvalue="true" %>
<%@ attribute name="target" required="false" rtexprvalue="true" %>
<%@ attribute name="onclick" required="false" rtexprvalue="true" %>
<%@ attribute name="class" required="true" rtexprvalue="true" %>

<button id="${name}" name="${name}" class="btn btn-${class}" data-toggle="modal" data-target="${target}" onclick="${onclick}" style="${style}">
    <span class="fa ${icon} fa-fw">&nbsp;&nbsp;</span>${label}
</button>


