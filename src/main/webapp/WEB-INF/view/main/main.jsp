<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">

            <h3>2020년 03월 20일 종합현황 <span style="font-size:small;">- 숫자를 클릭하면 자세한 사항을 확인 할 수 있습니다.</span></h3>
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-group"></i> Support Tickets</h3> <em>- List of Support Tickets</em>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
                        <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i
                                class="fa fa-chevron-up"></i></a>
                        <a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
                    </div>
                    <div class="widget-header-toolbar">
                        <div class="label label-danger"><i class="fa fa-warning"></i> 2 Critical Messages</div>
                    </div>
                </div>
                <div class="widget-content">
                    <div id="ticket-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <div id="ticket-table_filter" class="dataTables_filter"><label>Search:<input
                                        type="search" class="form-control input-sm" placeholder=""
                                        aria-controls="ticket-table"></label></div>
                            </div>
                        </div>
                        <table id="ticket-table" class="table table-sorting dataTable no-footer" role="grid">
                            <thead>
                            <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="ticket-table" rowspan="1"
                                    colspan="1" aria-sort="ascending"
                                    aria-label="Number: activate to sort column descending" style="width: 140px;">Number
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="ticket-table" rowspan="1" colspan="1"
                                    aria-label="Date: activate to sort column ascending" style="width: 265px;">Date
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="ticket-table" rowspan="1" colspan="1"
                                    aria-label="Category: activate to sort column ascending" style="width: 242px;">
                                    Category
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="ticket-table" rowspan="1" colspan="1"
                                    aria-label="Name: activate to sort column ascending" style="width: 136px;">Name
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="ticket-table" rowspan="1" colspan="1"
                                    aria-label="Title: activate to sort column ascending" style="width: 439px;">Title
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="ticket-table" rowspan="1" colspan="1"
                                    aria-label="Priority: activate to sort column ascending" style="width: 197px;">
                                    Priority
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr role="row" class="odd">
                                <td class="sorting_1"><a href="#">[#18765]</a></td>
                                <td>Nov 21, 2013 15:45</td>
                                <td>Front-End Site</td>
                                <td>Smith</td>
                                <td><a href="#">Product Review Problem</a></td>
                                <td><span class="label label-high">#4 - High</span></td>
                            </tr>
                            <tr role="row" class="even">
                                <td class="sorting_1"><a href="#">[#18766]</a></td>
                                <td>Nov 21, 2013 16:12</td>
                                <td>Technical Support</td>
                                <td>Sean</td>
                                <td><a href="#">Can't Download the Guide Doc</a></td>
                                <td><span class="label label-medium">#5 - Medium</span></td>
                            </tr>
                            <tr role="row" class="odd">
                                <td class="sorting_1"><a href="#">[#18767]</a></td>
                                <td>Nov 21, 2013 16:43</td>
                                <td>General Info</td>
                                <td>Jane Doe</td>
                                <td><a href="#">Regarding Customer Support</a></td>
                                <td><span class="label label-medium">#5 - Medium</span></td>
                            </tr>
                            <tr role="row" class="even">
                                <td class="sorting_1"><a href="#">[#18768]</a></td>
                                <td>Nov 22, 2013 08:24</td>
                                <td>General Info</td>
                                <td>Smith</td>
                                <td><a href="#">Can't Change My Address</a></td>
                                <td><span class="label label-urgent">#3 - Urgent</span></td>
                            </tr>
                            <tr role="row" class="odd">
                                <td class="sorting_1"><a href="#">[#18769]</a></td>
                                <td>Nov 22, 2013 08:30</td>
                                <td>Sales</td>
                                <td>Smith</td>
                                <td><a href="#">Review Tab Malfunction</a></td>
                                <td><span class="label label-low">#6 - Low</span></td>
                            </tr>
                            <tr role="row" class="even">
                                <td class="sorting_1"><a href="#">[#18770]</a></td>
                                <td>Nov 22, 2013 08:47</td>
                                <td>Front-End Site</td>
                                <td>John Doe</td>
                                <td><a href="#">Broken Link</a></td>
                                <td><span class="label label-emergency">#2 - Emergency</span></td>
                            </tr>
                            <tr role="row" class="odd">
                                <td class="sorting_1"><a href="#">[#18771]</a></td>
                                <td>Nov 23, 2013 14:08</td>
                                <td>Sales</td>
                                <td>Jack</td>
                                <td><a href="#">Need Info About My Order Status</a></td>
                                <td><span class="label label-critical">#1 - Critical</span></td>
                            </tr>
                            <tr role="row" class="even">
                                <td class="sorting_1"><a href="#">[#18772]</a></td>
                                <td>Nov 23, 2013 17:45</td>
                                <td>Techincal Support</td>
                                <td>Darren</td>
                                <td><a href="#">Bouncing Email</a></td>
                                <td><span class="label label-critical">#1 - Critical</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="widget">
                <div class="widget-header">
                    <h3><i class="fa fa-bar-chart-o"></i> 방송 건수</h3> <em>- 2020년 03월 20일</em>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" id="tour-focus" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
                        <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                    </div>
                </div>
                <div class="widget-content">
                    <!-- chart tab nav -->
                    <div class="chart-nav">
                        <strong>기간 선택: </strong>
                        <ul id="sales-stat-tab">
                            <li class="active"><a href="#week">일간</a></li>
                            <li class=""><a href="#month">주간</a></li>
                            <li class=""><a href="#year">월간</a></li>
                        </ul>
                    </div>
                    <!-- end chart tab nav -->
                    <!-- chart placeholder-->
                    <div class="chart-content">
                        <div class="demo-flot-chart sales-chart" data-ctype="#week" style="position: relative; padding: 0px;"><canvas class="flot-base" width="1142" height="350" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1142px; height: 350px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 13px; text-align: center;">Sun</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 984px; text-align: center;">Sun</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 151px; text-align: center;">Mon</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 1123px; text-align: center;">Mon</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 291px; text-align: center;">Tue</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 428px; text-align: center;">Wed</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 569px; text-align: center;">Thu</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 710px; text-align: center;">Fri</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 847px; text-align: center;">Sat</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 329px; left: 11px; text-align: right;">0</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 274px; left: 6px; text-align: right;">50</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 220px; left: 0px; text-align: right;">100</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 166px; left: 0px; text-align: right;">150</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 112px; left: 0px; text-align: right;">200</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 58px; left: 0px; text-align: right;">250</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 4px; left: 0px; text-align: right;">300</div></div></div><canvas class="flot-overlay" width="1142" height="350" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1142px; height: 350px;"></canvas><div class="legend"><div style="position: absolute; width: 42px; height: 30px; top: 14px; right: 15px; background-color: transparent; opacity: 0.85;"> </div><table style="position:absolute;top:14px;right:15px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid transparent;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(125,147,154);overflow:hidden"></div></div></td><td class="legendLabel">Visits</td></tr><tr><td class="legendColorBox"><div style="border:1px solid transparent;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(29,146,175);overflow:hidden"></div></div></td><td class="legendLabel">Sales</td></tr></tbody></table></div></div>
                    </div>
                    <!-- end chart placeholder-->
                    <hr class="separator">
                </div>
            </div>
        </div>
    </div>
</div>

</script>