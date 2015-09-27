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
    <div class="row">
    <div class="col-md-12">
    <section class="panel tasks-widget">
        <div class="panel-body">
            <div class="task-content">
                <ul id="sortable" class="task-list">
                    <li class="list-primary">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value="1"/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp">Flatlab is Modern Dashboard</span>
                            <span class="badge badge-sm label-success">2 Days</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>

                    <li class="list-danger">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Fully Responsive & Bootstrap 3.0.2 Compatible </span>
                            <span class="badge badge-sm label-danger">Done</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>
                    <li class="list-success">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Daily Standup Meeting </span>
                            <span class="badge badge-sm label-warning">Company</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>
                    <li class="list-warning">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Write well documentation for this theme </span>
                            <span class="badge badge-sm label-primary">3 Days</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>
                    <li class="list-info">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> We have a plan to include more features in future update </span>
                            <span class="badge badge-sm label-info">Tomorrow</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>
                    <li class="list-inverse">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Don't be hesitate to purchase this Dashbord </span>
                            <span class="badge badge-sm label-inverse">Now</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>
                    <li class="list-primary">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Code compile and upload </span>
                            <span class="badge badge-sm label-success">2 Days</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>

                    <li class="list-success">
                        <i class=" fa fa-ellipsis-v"></i>

                        <div class="task-checkbox">
                            <input type="checkbox" class="list-child" value=""/>
                        </div>
                        <div class="task-title">
                            <span class="task-title-sp"> Tell your friends to buy this dashboad </span>
                            <span class="badge badge-sm label-danger">Now</span>

                            <div class="pull-right hidden-phone">
                                <button class="btn btn-success btn-xs fa fa-check"></button>
                                <button class="btn btn-primary btn-xs fa fa-pencil"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
            <div class=" add-task-row">
                <a class="btn btn-success btn-sm pull-left" href="#">Add New Tasks</a>
                <a class="btn btn-default btn-sm pull-right" href="#">See All Tasks</a>
            </div>
        </div>
    [/@content]
[/@layout.basic]
    <script src="/js/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tasks').addClass('active');
            TaskList.initTaskWidget();
        });

        $(function () {
            $("#sortable").sortable();
            $("#sortable").disableSelection();
        });
    </script>