[#ftl]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#include "../formMacros.ftl"]
[#macro basic]
    [#include "header.ftl"/]
<div id="sb-site">
    [#nested]
</div>
    [#include "footer.ftl"/]
    [#include "rightSidebar.ftl"/]
    [@modalForm "modal-userProfile" "MODAL.USERPROFILE" "/app/secure/profile/" "SAVE.CHANGES" "user"]
        [#include "../dialogs/profileForm.ftl"]
    [/@modalForm]
</body>
</html>

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap.file-input.js"></script>
<script src="/js/bootstrap-modalmanager.js"></script>
<script src="/js/bootstrap-modal.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/dataTables.min.js"></script>
<script src="/js/dataTables-bootstrap.js"></script>
<script src="/js/dataTables-tools.js"></script>
<script src="/js/toastr.js"></script>
<script src="/js/dropzone.js"></script>
<script src="/js/tasks.js"></script>
<script src="/js/tree.js"></script>
<script src="/js/tree.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/additional-methods.min.js"></script>
<script src="/js/popover.js"></script>
<script src="/js/slidebars.js"></script>
<script src="/js/chart.min.js"></script>
<script src="/js/raindrop.js"></script>
[/#macro]
