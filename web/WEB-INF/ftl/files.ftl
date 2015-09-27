[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl"/]
[@layout.basic]
    [@sidebar]
    <div class="panel tree-wrapper">
        <div class="panel-heading">

        </div>
        <div class="panel-body">
            <div id="FlatTree4" class="tree tree-solid-line">
                <div class="tree-folder" style="display:none;">
                    <div class="tree-folder-header">
                        <i class="fa fa-folder"></i>

                        <div class="tree-folder-name"></div>
                    </div>
                    <div class="tree-folder-content"></div>
                    <div class="tree-loader" style="display:none"></div>
                </div>
                <div class="tree-item" style="display:none;">
                    <i class="tree-dot"></i>

                    <div class="tree-item-name"></div>
                </div>
            </div>
        </div>
    </div>
    [/@sidebar]
    [@content]
    <div></div>
    <form action="/file-upload"
          class="dropzone"
          id="file-dropzone"></form>
    [/@content]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function () {
        $('#files').addClass('active');
        TreeView.init();
    });
</script>