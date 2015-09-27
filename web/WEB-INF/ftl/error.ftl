[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>
        error
    </div>
    [/@sidebar]
    [@content]
    <div></div>
    [/@content]
[/@layout.basic]