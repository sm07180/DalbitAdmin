<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!--종합현황-->
            <h3>2020년 03월 20일 종합현황</h3>
            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-bar-chart-o"></i> 숫자를 클릭하면 자세한 사항을 확인 할 수 있습니다.</h3>
                </div>
                <div class="widget-content mt10">
                    <table class="table table-condensed table-dark-header table-bordered">
                        <thead>
                            <tr>
                                <th colspan="5">방송</th>
                                <th colspan="4">캐스트</th>
                                <th colspan="2">접속</th>
                                <th colspan="2">결제</th>
                            </tr>
                            <tr>
                                <th>건수</th>
                                <th>시간(분)</th>
                                <th>청취자 수</th>
                                <th>선물 건</th>
                                <th>선물금액</th>

                                <th>건수</th>
                                <th>조회수</th>
                                <th>선물 건</th>
                                <th>선물금액</th>

                                <th>방문자수</th>
                                <th>접속자수</th>

                                <th>건수</th>
                                <th>금액(원)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="javascript://">20</a></td>
                                <td><a href="javascript://">20,000</a></td>
                                <td><a href="javascript://">323</a></td>
                                <td><a href="javascript://">14</a></td>
                                <td><a href="javascript://">34,000</a></td>

                                <td><a href="javascript://">50</a></td>
                                <td><a href="javascript://">2,112</a></td>
                                <td><a href="javascript://">512</a></td>
                                <td><a href="javascript://">23,000</a></td>

                                <td><a href="javascript://">20,000</a></td>
                                <td><a href="javascript://">22,222</a></td>

                                <td><a href="javascript://">600</a></td>
                                <td><a href="javascript://">124,342,242</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--//종합현황-->

            <!--방송건수-->
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
            <!--//방송건수-->

            <div class="row">
                <!-- 방송정보 -->
                <div class="col-md-6">

                </div>
                <!-- //방송정보 -->
                <div class="col-md-6">

                </div>
            </div>
        </div>
    </div>
</div>

</script>