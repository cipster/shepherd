[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
<div class="cover-container">

    <div class="inner cover">
        <h3 class="cover-heading">[@spring.message "ACCESS.HI" /] ${username} </h3>

        <p class="lead">[@spring.message "ACCESS.NORIGHT" /]</p>

        <p class="lead">
            <a href="/main" class="btn btn-large btn-info"><i class="fa fa-home"></i> [@spring.message "ERROR.HOME" /]</a>
        </p>
    </div>
</div>
[/@layout.basic]