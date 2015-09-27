[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>

    </div>
    [/@sidebar]
    [@content]
    <div></div>
    [/@content]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function () {
        $('#reports').addClass('active');
    });
</script>