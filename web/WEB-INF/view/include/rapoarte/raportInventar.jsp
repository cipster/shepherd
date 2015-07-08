<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="well-sm">
    <p>Raport Inventar</p>
    <hr>
</div>

<form id="generate-raport-form" method="post">
    <div class="form-group col-md-6">
        <label for="categorie-raport-select">Genereaz&#259; raport dup&#259; </label>
        <select data-placeholder="Alege o categorie..." class="chosen-select" id="categorie-raport-select">
            <option value="-1"></option>
            <option value="1">Loc</option>
            <option value="2">Persoana</option>
            <option value="3">Categorii</option>
            <option value="4">Toate</option>
        </select>
    </div>
    <br>

    <div id="report-details" class="col-md-10 hidden">
        <div id="report"></div>
        <div class="col-md-4 pull-right">
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-gear">&nbsp;</i> Genereaz&#259; raport</button>
        </div>
        <div class="col-md-4 pull-right">
            <select data-placeholder="Alege un format..." class="chosen-select" id="format-raport-select">
                <option value="1">HTML</option>
                <option value="2">PDF</option>
                <option value="3">XLS</option>
            </select>
        </div>
    </div>
</form>
