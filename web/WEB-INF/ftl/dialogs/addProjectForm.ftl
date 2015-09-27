[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#general-project" role="tab" data-toggle="tab">[@spring.message "GENERAL"/]</a></li>
        <li><a href="#company-project" role="tab" data-toggle="tab">[@spring.message "COMPANY"/]</a></li>
        <li><a href="#category-project" role="tab" data-toggle="tab">[@spring.message "CATEGORY"/]</a></li>
        <li><a href="#dates-project" role="tab" data-toggle="tab">[@spring.message "DATES"/]</a></li>
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="general-project" role="tabpanel">
        [@modalContainer]
            [@input "addProject-form-nume" "numeProiect" "MODAL.PROJECTNAME" "MODAL.NAME" "" "6"/]
            [@selectBox "addProject-form-status" "statusProiect" "MODAL.PROJECTSTATUS" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS" "6" ]
                [#list listaStatus?keys as key]
                    <option id="${key}" value="${key}">${listaStatus[key]}</option>
                [/#list]
            [/@selectBox]
            [@textarea "addProject-form-descriere" "descriere" "MODAL.DESCRIPTION" "DESCRIPTION.PLACEHOLDER" "12"/]
        [/@modalContainer]
        </div>
        <div class="tab-pane fade" id="company-project" role="tabpanel">
        [@modalContainer ]
                [@elementWithLink "modal-addClient" "MODAL.ADDCLIENT" "6"]
            [@embedableSelectBox "addProject-form-client" "idClient" "CLIENT" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
            [/@embedableSelectBox]
        [/@elementWithLink]
                [@infobox "client-info" "INFOBOX.ADDCLIENT"/]
            [/@modalContainer]
        </div>
        <div class="tab-pane fade" id="category-project" role="tabpanel">
        [@modalContainer ]
                [@elementWithLink "modal-addCategory" "MODAL.ADDCATEGORY" "6"]
            [@embedableSelectBox "addProject-form-category" "categorieProiect" "CATEGORY" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
            [/@embedableSelectBox]
        [/@elementWithLink]
                [@infobox "client-info" "INFOBOX.ADDCATEGORY"/]
            [/@modalContainer]
        </div>
        <div class="tab-pane fade" id="dates-project" role="tabpanel">
        [@modalContainer ]
                [@datepicker "addProject-form-start-date" "dataStart" "STARTDATE" "DATE.PLACEHOLDER" "6" /]
                [@rowBreak/]
                [@datepicker "addProject-form-end-date" "dataEndEstimativa" "ENDDATE" "DATE.PLACEHOLDER" "6" /]
                [@infobox "client-info" "INFOBOX.ADDDATE"/]
            [/@modalContainer]
        </div>
    </div>
</div>