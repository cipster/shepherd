[#ftl]
[#include "../formMacros.ftl"]

<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#general-client" role="tab" data-toggle="tab">[@spring.message "GENERAL"/]</a></li>
        <li><a href="#address-client" role="tab" data-toggle="tab">[@spring.message "ADDRESS"/]</a></li>
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="general-client" role="tabpanel">
        [@modalContainer]
            [@input "addClient-form-nume" "numeClient" "MODAL.CLIENT.NUME" "MODAL.CLIENT.NUME.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-website" "website" "MODAL.CLIENT.WEBSITE" "MODAL.CLIENT.WEBSITE.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-email" "email" "MODAL.CLIENT.EMAIL" "MODAL.CLIENT.EMAIL.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-telefon" "telefon" "MODAL.CLIENT.TELEFON" "MODAL.CLIENT.TELEFON.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-fax" "fax" "MODAL.CLIENT.FAX" "MODAL.CLIENT.FAX.PLACEHOLDER" "" "7"/]
            [@selectBox "addClient-form-industrie" "idIndustrie" "MODAL.CLIENT.INDUSTRIE" "MODAL.CLIENT.INDUSTRIE.PLACEHOLDER" "SEARCH.NO_RESULTS" "7"]
                [#list listaIndustrie?keys as key]
                    <option id="${key}" value="${key}">${listaIndustrie[key]}</option>
                [/#list]
            [/@selectBox]
        [/@modalContainer]
        </div>
        <div class="tab-pane fade" id="address-client" role="tabpanel">
        [@modalContainer ]
            [@input "addClient-form-adresa" "adresa" "MODAL.CLIENT.ADRESA" "MODAL.CLIENT.ADRESA.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-oras" "oras" "MODAL.CLIENT.ORAS" "MODAL.CLIENT.ORAS.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-judet" "judet" "MODAL.CLIENT.JUDET" "MODAL.CLIENT.JUDET.PLACEHOLDER" "" "7"/]
            [@input "addClient-form-cod-postal" "codPostal" "MODAL.CLIENT.CODPOSTAL" "MODAL.CLIENT.CODPOSTAL.PLACEHOLDER" "" "7"/]
            [@selectBox "addClient-form-tara" "idTara" "MODAL.CLIENT.TARI" "MODAL.CLIENT.TARI.PLACEHOLDER" "SEARCH.NO_RESULTS" "7"]
                [#list listaTari?keys as key]
                    <option id="${key}" value="${key}">${listaTari[key]}</option>
                [/#list]
            [/@selectBox]
        [/@modalContainer]
        </div>
    </div>
</div>