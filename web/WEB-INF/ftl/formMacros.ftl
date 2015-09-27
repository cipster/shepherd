[#ftl]

[#macro header text subtext="" h="3"]
<div class="page-header">
    <h${h}>${text}</h${h}>
    [#if subtext?has_content ]
        <h${h}>
            <small>${subtext}</small>
        </h${h}>
    [/#if]
</div>
[/#macro]

[#macro modalContainer]
<div class="container container-modal">
    [#nested]
</div>
[/#macro]

[#macro elementWithLink target label size="6"]
<div class="form-group col-md-${size}">
    [#nested]
    <a data-toggle="modal" data-target="#${target}" class="small form-link">[@spring.message label /]</a>
</div>
[/#macro]

[#macro selectBox id name label placeholder="SELECT.PLACEHOLDER" noResultsText="SEARCH.NO_RESULTS" size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label /]</label>
    <select data-placeholder="[@spring.message placeholder /]" data-no_results_text="[@spring.message noResultsText/]"
            class="chosen-select" id="${id}" name="${name}" title="[@spring.message label /]" required="true">
        <option></option>
        [#nested]
    </select>

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro embedableSelectBox id name label placeholder="SELECT.PLACEHOLDER" noResultsText="SEARCH.NO_RESULTS"]
<label for="${id}">[@spring.message label /]</label>
<select data-placeholder="[@spring.message placeholder /]" data-no_results_text="[@spring.message noResultsText/]"
        class="chosen-select" id="${id}" name="${name}" title="[@spring.message label /]" required="true">
    <option></option>
    [#nested]
</select>

<div id="${name}-error" class="help-block"></div>
[/#macro]

[#macro selectBoxMulti id name label placeholder="SELECT.MULTI.PLACEHOLDER" noResultsText="SEARCH.NO_RESULTS" size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label /]</label>
    <select data-placeholder="[@spring.message placeholder /]" multiple data-no_results_text="[@spring.message noResultsText/]"
            class="chosen-select" id="${id}" name="${name}" title="[@spring.message label /]" required="true">
        <option></option>
        [#nested]
    </select>

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro input id name label placeholder value="" size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label/]</label>
    <input type="text" class="form-control input-sm" id="${id}" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]" value="${value}" required="true">

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro emailInput id name label placeholder value="" size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label/]</label>
    <input type="email" class="form-control input-sm" id="${id}" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]" value="${value}" required="true">

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro datepicker id name label placeholder size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label/]</label>

    <div class="input-group date">
        <input type="text" class="form-control input-sm date-picker" id="${id}" name="${name}" placeholder="[@spring.message placeholder /]" title="[@spring.message label /]"
               data-date-format="yyyy-mm-dd" required>
        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
    </div>


    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro textarea id name label placeholder size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label/]</label>
    <textarea class="form-control" id="${id}" rows="4" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]" required="true"></textarea>

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro password id name label placeholder size="3"]
<div class="form-group col-md-${size}">
    <label for="${id}">[@spring.message label/]</label>
    <input type="password" class="form-control input-sm" id="${id}" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]" required="true">

    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro checkbox id name label placeholder value="" size="3"]
<div class="form-group col-md-${size}">
    <div class="checkbox">
        <label><input type="checkbox" id="${id}" name="${name}" title="[@spring.message label /]" required="true"> [@spring.message label/]</label>
    </div>
    <div id="${name}-error" class="help-block"></div>
</div>
[/#macro]

[#macro buttonSubmit name label type="primary" icon="cog"]
<button type="submit" id="${name}-submit" name="${name}" title="[@spring.message label /]" class="btn btn-${type}"><i class="fa fa-${icon}"></i>&nbsp;&nbsp;[@spring.message label /]</button>
[/#macro]

[#macro button name label type="primary" icon="thumb-tack"]
<button type="button" id="${name}" name="${name}" title="[@spring.message label /]" class="btn btn-${type}"><i class="fa fa-${icon}"></i>&nbsp;&nbsp;[@spring.message label /]</button>
[/#macro]

[#macro buttonCloseModal name label type="default" icon="times"]
<button type="button" id="${name}-close" name="${name}" title="[@spring.message label /]" class="btn btn-${type}" data-dismiss="modal"><i
        class="fa fa-${icon}"></i>&nbsp;&nbsp;[@spring.message label /]
</button>
[/#macro]

[#macro buttonOpenModal name label modal type="success" icon="plus-square-o"]
<div class="sidebar-button col-md-7">
    <button type="button" id="${name}-open" name="${name}" title="[@spring.message label /]" class="btn btn-${type} full-width" data-toggle="modal" data-target="#${modal}">
        <i class="fa fa-${icon}"></i>&nbsp;&nbsp;[@spring.message label /]
    </button>
</div>
[/#macro]

[#macro listItemOpenModal name label modal icon]
<a id="${name}-open" name="${name}" title="[@spring.message label /]" data-toggle="modal" data-target="#${modal}" class="list-group-item">
    <i class="fa fa-fw fa-${icon}"></i>&nbsp;&nbsp;[@spring.message label /]
</a>
[/#macro]

[#macro form name action method="post" enctype="application/x-www-form-urlencoded" size="3"]
<div class="col-md-${size}">
    <form id="${name}" name="${name}" action="${action}" method="${method}" role="form" enctype="${enctype}" autocomplete="off">
        [#nested]
    </form>
</div>
[/#macro]

[#macro infobox name text additionalClass=""]
<div class="well-sm infobox ${additionalClass}">
    <span class="fa fa-info-circle"></span>
    <span class="small text-justify">[@spring.message text /]</span>
</div>
[/#macro]

[#macro modalForm name title action submitLabel icon]
<div id="${name}" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">[@spring.message "MODAL.CLOSEDIALOG"/]</span></button>
                <h4 class="modal-title"><span class="fa fa-${icon}">&nbsp;</span>[@spring.message title /]</h4>
            </div>
            <form id="${name}-form" action="${action}">
                <div class="modal-body">
                    [#nested]
                </div>
                <div class="modal-footer">
                    [@buttonSubmit name submitLabel "primary" "plus-square-o" /]
                    [@buttonCloseModal name "MODAL.CLOSEDIALOG"/]
                </div>
            </form>
        </div>
    </div>
</div>
[/#macro]

[#macro largeModalForm name title action submitLabel icon]
<div id="${name}" class="modal fade">
    <div class="modal-dialog modal-mlg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">[@spring.message "MODAL.CLOSEDIALOG"/]</span></button>
                <h4 class="modal-title"><span class="fa fa-${icon}">&nbsp;</span>[@spring.message title /]</h4>
            </div>
            <form id="${name}-form" action="${action}">
                <div class="modal-body">
                    [#nested]
                </div>
                <div class="modal-footer">
                    [@buttonSubmit name submitLabel "primary" "plus-square-o" /]
                    [@buttonCloseModal name "MODAL.CLOSEDIALOG"/]
                </div>
            </form>
        </div>
    </div>
</div>
[/#macro]

[#macro modalLink target label]
<div>
    <a data-toggle="modal" data-target="#${target}" class="small">[@spring.message label /]</a>
</div>
[/#macro]

[#macro rowBreak]
<div class="col-md-12"></div>
[/#macro]

[#macro ajaxDataTable id]
<table id="${id}" class="table dataTable table-responsive table-hover" width="100%">
    <thead>
    <tr class="text-table-head">
        <th></th>
        [#nested]
    </tr>
    </thead>
</table>
[/#macro]

[#macro searchbox id dataTableId]
<div class="search-box">
    <div class="input-group">
        <span class="input-group-addon" id="search-${id}-addon"><i class="fa fa-search"></i></span>
        <input id="${id}" type="text" class="form-control" placeholder="[@spring.message "SEARCH"/]" aria-describedby="search-${id}-addon">
    </div>
</div>

[/#macro]

[#macro pictureUpload fileName label size="4"]
<div class="col-md-${size} small-dropzone text-center">
    <label class="image-label">[@spring.message label /]</label>

    <div class="image_preview"><img class="previewing" src="/img/noimageplaceholder.png"/></div>
    <div id="selectImage">
        <input type="file" data-filename-placement="inside" id="${fileName}" name="${fileName}">

        <div class="image-message"></div>
    </div>
</div>
[/#macro]