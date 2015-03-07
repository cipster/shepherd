<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="label" required="false" rtexprvalue="true" %>
<%@ attribute name="placeholder" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="multiple" required="false"  rtexprvalue="true" %>

<div class="form-group">
    <label for="${name}">${label}</label>
    <select id="${name}" name="${name}" ${multiple} data-placeholder="${placeholder}" class="chosen-select" style="${style}">

    </select>
</div>
