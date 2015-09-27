[#ftl]
[#macro sidebar]
<div class="col-xs-6 col-sm-2 col-md-2 col-lg-2 sidebar sidebar-left sidebar-animate sidebar-md-show panel-collapse collapse">
    [#nested]
</div>
[/#macro]

[#macro content]
<div class="col-xs-6 col-sm-10 col-md-10 col-lg-10 col-md-offset-2 content">
    [#nested]
</div>
[/#macro]

[#macro dashboard]
<div class="content">
    [#nested]
</div>
[/#macro]

