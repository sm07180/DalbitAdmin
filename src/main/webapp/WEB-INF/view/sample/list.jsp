<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Tables</h1>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        DataTables Advanced Tables
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>Rendering engine</th>
                                    <th>Browser</th>
                                    <th>Platform(s)</th>
                                    <th>Engine version</th>
                                    <th>CSS grade</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->


<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/sample/list", "", fn_success, fn_fail);
    });


    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        console.log(html);
        $("#tableBody").append(html);

        $('#dataTables-example').DataTable({
            responsive: true
        });
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{renderingEngine}}</td>
        <td>{{browser}}</td>
        <td>{{platform}}</td>
        <td class="center">{{version}}</td>
        <td class="center">{{grade}}</td>
    </tr>
    {{/data}}
</script>--%>

<div class="content">
    <div class="main-header">
        <h2>Dynamic Table</h2>
        <em>tables with lot of features and interactivity</em>
    </div>

    <div class="main-content">
        <!-- SHOW HIDE COLUMNS DATA TABLE -->
        <div class="widget widget-table">
            <div class="widget-header">
                <h3><i class="fa fa-table"></i> Drap/Drop and Show/Hide Column</h3> <em> - <a href="http://datatables.net/" target="_blank">jQuery Data Table</a> enable to show/hide and drap-drop column</em>
            </div>
            <div class="widget-content">
                <div class="alert alert-info fade in">
                    <button class="close" data-dismiss="alert">&times;</button>
                    <i class="fa fa-info-circle"></i> Try to show/hide column visibility and drag the column to another position to reorder table columns.
                </div>
                <table id="datatable-column-interactive" class="table table-sorting table-hover table-bordered datatable">
                    <thead>
                    <tr>
                        <th>Browser</th>
                        <th>Operating System</th>
                        <th>Visits</th>
                        <th>New Visits</th>
                        <th>Bounce Rate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Chrome</td>
                        <td>Macintosh</td>
                        <td>360</td>
                        <td>82.78%</td>
                        <td>87.77%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>Windows</td>
                        <td>582</td>
                        <td>87.24%</td>
                        <td>90.12%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>Linux</td>
                        <td>172</td>
                        <td>45.21%</td>
                        <td>48.81%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>iOS</td>
                        <td>86</td>
                        <td>35.23%</td>
                        <td>44.21%</td>
                    </tr>
                    <tr>
                        <td>Firefox</td>
                        <td>Windows</td>
                        <td>280</td>
                        <td>63.12%</td>
                        <td>89.34%</td>
                    </tr>
                    <tr>
                        <td>Firefox</td>
                        <td>Android</td>
                        <td>236</td>
                        <td>58.02%</td>
                        <td>76.19%</td>
                    </tr>
                    <tr>
                        <td>Internet Explorer</td>
                        <td>Windows</td>
                        <td>145</td>
                        <td>45.23%</td>
                        <td>94.65%</td>
                    </tr>
                    <tr>
                        <td>Opera</td>
                        <td>Windows</td>
                        <td>328</td>
                        <td>67.12%</td>
                        <td>78.34%</td>
                    </tr>
                    <tr>
                        <td>Opera</td>
                        <td>Macintosh</td>
                        <td>22</td>
                        <td>87.21%</td>
                        <td>79.81%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>iOS</td>
                        <td>45</td>
                        <td>23.21%</td>
                        <td>34.67%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>Linux</td>
                        <td>142</td>
                        <td>46.61%</td>
                        <td>49.72%</td>
                    </tr>
                    <tr>
                        <td>Chrome</td>
                        <td>iOS</td>
                        <td>96</td>
                        <td>45.43%</td>
                        <td>46.11%</td>
                    </tr>
                    <tr>
                        <td>Firefox</td>
                        <td>Windows</td>
                        <td>235</td>
                        <td>23.42%</td>
                        <td>77.44%</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END SHOW HIDE COLUMNS DATA TABLE -->
    </div>
    <!-- /main-content -->
</div>
