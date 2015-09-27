[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl" /]
[#include "formMacros.ftl" /]
[@layout.basic]
    [@dashboard]
    <div class="rain-container">
        <div class="dashboard-jumbotron">
            <div class="col-md-4">
                <div class="dashboard-panel">
                    <!--user info table start-->
                    <div class="dashboard-panel-body">
                        <a href="#" class="dashboard-thumb">
                            <img src="/img/photos/user1.png" alt="">
                        </a>

                        <div class="dashboard-thumb-details">
                            <h1><a href="#">Anjelina Joli</a></h1>

                            <p>Senior Architect</p>
                        </div>
                    </div>
                    <table class="table table-hover dashboard-task">
                        <tbody>
                        <tr>
                            <td>
                                <i class=" fa fa-tasks"></i>
                            </td>
                            <td>New Task Issued</td>
                            <td class="table-badge"><span class="badge">02</span></td>
                        </tr>
                        <tr>
                            <td>
                                <i class="fa fa-exclamation-triangle"></i>
                            </td>
                            <td>Task Pending</td>
                            <td class="table-badge"><span class="badge">14</span></td>
                        </tr>
                        <tr>
                            <td>
                                <i class="fa fa-envelope"></i>
                            </td>
                            <td>Inbox</td>
                            <td class="table-badge"><span class="badge">45</span></td>
                        </tr>
                        <tr>
                            <td>
                                <i class=" fa fa-bell-o"></i>
                            </td>
                            <td>New Notification</td>
                            <td class="table-badge"><span class="badge">09</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <!--user info table end-->
                </div>
            </div>
            <div class="col-md-8">
                <div class="dashboard-panel">
                    <div class="dashboard-panel-body progress-panel">
                        <div class="dashboard-thumb-details">
                            <h1>[@spring.message "WORK.PROGRESS"/]</h1>
                        </div>
                    </div>
                    <table class="table table-hover dashboard-task">
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>
                                Target Sell
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
                                        75%
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>
                                Product Delivery
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="43" aria-valuemin="0" aria-valuemax="100" style="width: 43%;">
                                        43%
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>
                                Payment Collection
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width: 67%;">
                                        67%
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>
                                Work Progress
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
                                        30%
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>
                                Delivery Pending
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%;">
                                        15%
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--work progress end-->
        </div>
    </div>
    [/@dashboard]
[/@layout.basic]

<script type="text/javascript" src="/js/static/dashboard.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#dashboard').addClass('active');
    });
</script>