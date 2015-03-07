<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="label" required="false" rtexprvalue="true" %>
<%@ attribute name="placeholder" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="cols" required="true" rtexprvalue="true" %>
<%@ attribute name="rows" required="true" rtexprvalue="true" %>

<div class="form-group">
    <label for="${name}">${label}</label>
    <textarea id="${name}" name="${name}" cols="${cols}"  rows="${rows}" placeholder="${placeholder}" class="form-control" style="${style}"></textarea>
</div>
