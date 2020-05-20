<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!--종합현황-->
            <h3><span id="dateArea"></span></h3>
            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-bar-chart-o"></i> 숫자를 클릭하면 자세한 사항을 확인 할 수 있습니다.</h3>
                </div>
                <div class="widget-content mt10">
                    <table class="table table-condensed table-dark-header table-bordered">
                        <thead>
                        <tr>
                            <th colspan="5">방송</th>
                            <th colspan="2">회원</th>
                            <%--<th colspan="4">캐스트</th>
                            <th colspan="2">접속</th>--%>
                            <th colspan="2">결제</th>
                        </tr>
                        <tr>
                            <th>건수</th>
                            <th>시간(분)</th>
                            <th>청취자 수</th>
                            <th>선물 건</th>
                            <th>선물금액</th>

                            <th>가입수</th>
                            <th>탈퇴수</th>

                            <%--<th>건수</th>
                            <th>조회수</th>
                            <th>선물 건</th>
                            <th>선물금액</th>

                            <th>방문자수</th>
                            <th>접속자수</th>--%>

                            <th>건수</th>
                            <th>금액(원)</th>
                        </tr>
                        </thead>
                        <tbody id="statTotalTableBody" >
                        </tbody>
                    </table>
                </div>
            </div>
            <!--//종합현황-->

            <!--방송건수 차트-->
            <div class="widget">
                <div class="widget-header">
                    <h3><i class="fa fa-bar-chart-o"></i> 방송 건수</h3>
                    <em>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <span class="_searchDate"></span>
                        <a href="javascript://" class="_nextSearch">[다음]</a>
                    </em>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                    </div>
                </div>
                <div class="widget-content">
                    <!-- chart tab nav -->
                    <div class="chart-nav">
                        <strong>기간 선택: </strong>
                        <ul id="sales-stat-tab">
                            <li class="active"><a href="#day" class="_viewType" data-viewtype="1" id="_day">일간</a></li>
                            <li class=""><a href="#week" class="_viewType" data-viewtype="2" id="_week">주간</a></li>
                            <li class=""><a href="#month" class="_viewType" data-viewtype="3" id="_month">월간</a></li>
                        </ul>
                    </div>
                    <!-- end chart tab nav -->
                    <div class="chart-content">
                        <div id='lineArea'></div>
                        <%--<div class="demo-flot-chart sales-chart" data-ctype="#week" style="position: relative; padding: 0px;"><canvas class="flot-base" width="1142" height="350" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1142px; height: 350px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 13px; text-align: center;">Sun</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 984px; text-align: center;">Sun</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 151px; text-align: center;">Mon</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 1123px; text-align: center;">Mon</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 291px; text-align: center;">Tue</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 428px; text-align: center;">Wed</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 569px; text-align: center;">Thu</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 710px; text-align: center;">Fri</div><div style="position: absolute; max-width: 173px; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 339px; left: 847px; text-align: center;">Sat</div></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 329px; left: 11px; text-align: right;">0</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 274px; left: 6px; text-align: right;">50</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 220px; left: 0px; text-align: right;">100</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 166px; left: 0px; text-align: right;">150</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 112px; left: 0px; text-align: right;">200</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 58px; left: 0px; text-align: right;">250</div><div style="position: absolute; font: 400 10px/11.5px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(85, 85, 85); top: 4px; left: 0px; text-align: right;">300</div></div></div><canvas class="flot-overlay" width="1142" height="350" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 1142px; height: 350px;"></canvas><div class="legend"><div style="position: absolute; width: 42px; height: 30px; top: 14px; right: 15px; background-color: transparent; opacity: 0.85;"> </div><table style="position:absolute;top:14px;right:15px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid transparent;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(125,147,154);overflow:hidden"></div></div></td><td class="legendLabel">Visits</td></tr><tr><td class="legendColorBox"><div style="border:1px solid transparent;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(29,146,175);overflow:hidden"></div></div></td><td class="legendLabel">Sales</td></tr></tbody></table></div></div>--%>
                    </div>
                    <!-- end chart placeholder-->
                    <hr class="separator">
                </div>
            </div>
            <!--//방송건수-->

            <div class="row">
                <div class="col-lg-6">
                    <!-- 방송정보 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 방송정보</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>

                            <div class="btn-group widget-header-toolbar">
                                <a href="http://dalbit.inforex.co.kr/broadcast/live/list" title="상세보기"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>전일대비</th>
                                    <th>주간</th>
                                    <th>전주대비</th>
                                </tr>
                                </thead>
                                <tbody  id="statBroadTableBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //방송정보 -->

                    <!-- 접속정보 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 접속정보</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>

                            <div class="btn-group widget-header-toolbar">
                                <a href="javascript://" title="상세보기" onclick="alert('준비중입니다.'); return false;"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>전일대비</th>
                                    <th>주간</th>
                                    <th>전주대비</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>방문자수</th>
                                    <td>325</td>
                                    <td>200</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                <tr>
                                    <th>평균방문 시간</th>
                                    <td>200분</td>
                                    <td>180분</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                <tr>
                                    <th>접속자수</th>
                                    <td>325</td>
                                    <td>200</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                <tr>
                                    <th>인당 접속횟수</th>
                                    <td>325</td>
                                    <td>200</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                <tr>
                                    <th>평균 접속시간</th>
                                    <td>325</td>
                                    <td>200</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                <tr>
                                    <th>페이지 뷰</th>
                                    <td>325</td>
                                    <td>200</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 24</td>
                                    <td>725</td>
                                    <td class="_down"><i class="fa fa-caret-down"></i> 20</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //접속정보 -->

                    <!-- 회원가입/탈퇴 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 회원가입/탈퇴</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>

                            <div class="btn-group widget-header-toolbar">
                                <a href="http://dalbit.inforex.co.kr/enter/join/info" title="상세보기"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="memberStatTab">
                                <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab" data-function="getMemberJoinStat">회원가입</a></li>
                                <li><a href="#reportDetail" role="tab" data-toggle="tab" data-function="getMemberWithdrawStat">탈퇴</a></li>
                            </ul>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>전일대비</th>
                                    <th>주간</th>
                                    <th>전주대비</th>
                                </tr>
                                </thead>
                                <tbody id="statMemberTableBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //회원가입/탈퇴-->
                </div>

                <%--<div class="col-lg-6">--%>
                    <%--<!-- 캐스트정보 -->--%>
                    <%--<div class="widget widget-table mb10">--%>
                        <%--<div class="widget-header">--%>
                            <%--<h3><i class="fa fa-table"></i> 캐스트정보 [ &#8251; 가 데이터 입니다.]</h3>--%>
                            <%--<div class="btn-group widget-header-toolbar">--%>
                                <%--<a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>--%>
                            <%--</div>--%>

                            <%--<div class="btn-group widget-header-toolbar">--%>
                                <%--<a href="javascript://" title="상세보기"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="widget-content mt10">--%>
                            <%--<table class="table table-bordered">--%>
                                <%--<thead>--%>
                                <%--<tr>--%>
                                    <%--<th></th>--%>
                                    <%--<th>실시간</th>--%>
                                    <%--<th>전일</th>--%>
                                    <%--<th>전일대비</th>--%>
                                    <%--<th>주간</th>--%>
                                    <%--<th>전주대비</th>--%>
                                <%--</tr>--%>
                                <%--</thead>--%>
                                <%--<tbody>--%>
                                <%--<tr>--%>
                                    <%--<th>캐스트 건수</th>--%>
                                    <%--<td>325</td>--%>
                                    <%--<td>200</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<th>캐스트 시간</th>--%>
                                    <%--<td>200분</td>--%>
                                    <%--<td>180분</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<th>DJ</th>--%>
                                    <%--<td>325</td>--%>
                                    <%--<td>200</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<th>조회수</th>--%>
                                    <%--<td>325</td>--%>
                                    <%--<td>200</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<th>선물 건</th>--%>
                                    <%--<td>325</td>--%>
                                    <%--<td>200</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--<tr>--%>
                                    <%--<th>선물 금액</th>--%>
                                    <%--<td>325</td>--%>
                                    <%--<td>200</td>--%>
                                    <%--<td class="_up"><i class="fa fa-caret-up"></i> 24</td>--%>
                                    <%--<td>725</td>--%>
                                    <%--<td class="_down"><i class="fa fa-caret-down"></i> 20</td>--%>
                                <%--</tr>--%>
                                <%--</tbody>--%>
                            <%--</table>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!-- //캐스트정보 -->

                    <!-- 결제/결제취소-->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 결제/결제취소</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>

                            <div class="btn-group widget-header-toolbar">
                                <a href="/payment/pay/list" title="상세보기"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                                <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab" class="_payTab" data-name="pay">결제</a></li>
                                <li><a href="#reportDetail" role="tab" data-toggle="tab" class="_payTab" data-name="cancel">결제취소</a></li>
                            </ul>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>전일대비</th>
                                    <th>주간</th>
                                    <th>전주대비</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="_pay" data-payway="MC" data-type="cnt">
                                    <th rowspan="2">모바일</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="_pay" data-payway="MC" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                <tr class="_pay" data-payway="CN" data-type="cnt">
                                    <th rowspan="2">카드</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="_pay" data-payway="CN" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                <tr class="_pay" data-payway="RA" data-type="cnt">
                                    <th rowspan="2">실시간<br/>계좌이체</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="_pay" data-payway="RA" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                <tr class="_pay" data-payway="VA" data-type="cnt">
                                    <th rowspan="2">가상계좌</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="_pay" data-payway="VA" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                <tr class="_pay" data-payway="inApp" data-type="cnt">
                                    <th rowspan="2">인앱<br/>(Apple)</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="_pay" data-payway="inApp" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                <tr class="success _pay" data-payway="total" data-type="cnt">
                                    <th rowspan="2">합계</th>
                                    <th>건</th>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                    <td>0건</td>
                                </tr>
                                <tr class="success _pay" data-payway="total" data-type="amt">
                                    <th>금액</th>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                    <td>0원</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //결제/결제취소-->

                    <!-- 실시간 인기 아이템 TOP 5 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table">
                            </i> 실시간 인기 아이템 TOP 5
                            </h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="btn-group widget-header-toolbar">
                                <a href="http://dalbit.inforex.co.kr/status/item/info" title="상세보기"><h3><i class="fa fa-search-plus"></i> 상세보기</h3></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th colspan="2"></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>전일대비</th>
                                    <th>주간</th>
                                    <th>전주대비</th>
                                </tr>
                                </thead>
                                <tbody id = "statItemBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //실시간 인기 아이템 TOP 5-->
                </div>
            </div>
        </div>
    </div>
</div>

<script src='/js/lib/plotly-latest.min.js'></script>

<script type="text/javascript">
    var dateTime = new Date();
    var sDisplayDate;
    var eDisplayDate;
    var eDate;
    var term_tmp;
    var day = 0;
    var week = 0;
    var month = 0;

    var chartParam = {
        slctDate : ''
        , slctType : 11
        , liveType : 1
        , viewType : 1
    };

    $(function(){
        init();
    });

    function init(){
        getTotalStat();
        getBroadInfoStat();
        getMemberJoinStat();
        getItemInfoStat();
        getPayInfoStat();

        dateTime = moment(dateTime).format("YYYY.MM.DD");
        var dateTime2 = moment(dateTime).format("YYYY" + "년" + "MM" + "월" + "DD" + "일 종합현황");
        $("#dateArea").html(dateTime2);

        $("._searchDate").html(dateTime);

        apply('current', 'day');
    }

    $(document).on('click', '._prevSearch', function(){
        apply('prev', getViewName());
    });

    $(document).on('click', '._nextSearch', function(){

        var dateArr = dateTime.split('.');
        var eDateArr = eDisplayDate.split('.');

        var dateArrCompare = new Date(dateArr[0], parseInt(dateArr[1])-1, dateArr[2]);
        var eDateArrCompare = new Date(eDateArr[0], parseInt(eDateArr[1])-1, eDateArr[2]);

        if(dateArrCompare <= eDateArrCompare) {
            alert("날짜를 확인해주십시오.");
            return false;
        }
        apply('next', getViewName());
    });

    function getViewName(){
        var viewType = $('#sales-stat-tab li.active a').data('viewtype');
        return (viewType == '1') ? 'day' : (viewType == '2') ? 'week' : 'month';
    }

    function DateUtility(dateUse) { //파라미터 갯수 확인
        if (0 === arguments.length) { //없다.
            dateUse = new Date();
        }
        //복제한 date를 준다.
        function CloneDate() {
            return new Date(dateUse.valueOf())
        }
        //지정된 날짜를 리턴한다.
        this.Today = function () {
            return CloneDate();
        };
        //날짜에서 nDate만큼 더한 날짜를 리턴한다.
        this.Day = function (nDay) {
            var date = CloneDate();
            date.setDate(date.getDate() + nDay);
            return date;
        };
        //날짜에서 nMonth만큼 더한 월을 구한다.
        this.Month = function (nMonth) {
            var date = CloneDate();
            date.setMonth(date.getMonth() + nMonth);
            return date;
        };
        //날짜에서 nMonth만큼 더한 년을 구한다.
        this.Year = function (nYear) {
            var date = CloneDate();
            date.setFullYear(date.getFullYear() + nYear);
            return date;
        };
        //날짜에서 nMonth만큼 더한 월의 1일을 구한다.
        this.Month_First = function (nMonth) {
            var date = this.Month(nMonth);
            return new Date(date.getYear(), date.getMonth(), 1);
        };
        //날짜에서 nMonth만큼 더한 월의 마지막날짜를 구한다.
        this.Month_Last = function (nMonth) {
            var date = this.Month(nMonth);
            return new Date(date.getYear(), date.getMonth() + 1, 0);
        }
    };

    function apply(searchType, dateType) {

        if(dateType == "month"){         //전월

            if(searchType == 'prev'){
                --month;
            }else if(searchType == 'next'){
                ++month;
            }

            sDisplayDate = moment(dateTime).add('months', month).format('YYYY.MM.01');
            eDisplayDate = moment(sDisplayDate).add("months", 1).add('days', -1).format('YYYY.MM.DD');

            $("._searchDate").html(sDisplayDate + " ~ " + eDisplayDate);

        }else if(dateType == "week"){    //전주


            if(searchType == 'prev'){
                --week;
            }else if(searchType == 'next'){
                ++week;
            }

            sDisplayDate = moment(dateTime).add('days', (-moment(dateTime).day())).add('weeks', week).format('YYYY.MM.DD');
            eDisplayDate = moment(sDisplayDate).add('days', 6).format('YYYY.MM.DD');

            $("._searchDate").html(sDisplayDate + " ~ " + eDisplayDate);

        }else if(dateType == "day"){     // 전일

            if(searchType == 'prev'){
                --day;
            }else if(searchType == 'next'){
                ++day;
            }

            sDisplayDate = moment(dateTime).add("days", day-1).format('YYYY.MM.DD');
            eDisplayDate = moment(dateTime).add("days", day).format('YYYY.MM.DD');

            $("._searchDate").html(eDisplayDate);
        }

        chartParam.slctDate = eDisplayDate + ' 23:59:59';
        util.getAjaxData("chart", "/rest/mainStatus/chart/status/info", chartParam, fn_chart_success);

    };

    $(document).on('click', '._cntType', function() {
        chartParam.slctType = $(this).data('slcttype');
        apply('current', getViewName());
    });

    $(document).on('click', '._viewType', function() {
        var day = 0;
        var week = 0;
        var month = 0;

        $("#sales-stat-tab li").removeClass('active');
        $(this).parent('li').addClass('active');

        var viewType = $(this).data('viewtype');
        chartParam.viewType = viewType;
        if(viewType == 1) {
            apply('current', 'day');
        } else if(viewType == 2) {
            apply('current', 'week');
        } else {
            apply('current', 'month');
        }
    });

    function fn_chart_success(dst_id, response, param){
        var detailData = response.data;

        var chartData = getChartData(detailData, param);

        /* 라인차트 [start] */
        var trace = {
            x: chartData.x,
            y: chartData.y,
            mode: 'lines',
            name: eDisplayDate,
            line: {
                dash: 'line',
                width: 4
            }
        };
        var data = [trace];
        var layout = {
            /*height: 400,
            width: 970,*/
            xaxis: {
                range: [0, detailData.length],
                autorange: false
            },
            yaxis: {
                range: [0, chartData.max_y],
                autorange: false
            },
            legend: {
                y: 1,
                y: 1,
                traceorder: 'reversed',
                font: {
                    size: 13
                }
            }
        };
        var config = {
            responsive: true
        }
        Plotly.newPlot('lineArea', data, layout, config);
    }

    function getChartData(detailData, param) {
        console.log(param);
        //x축
        var arrayList_x = [];
        if(param.viewType == 1) {
            for (var i = 0; i < detailData.length; i++) {
                var array = {};

                if (common.isEmpty(detailData[i].hour)) {
                    array = 0;
                } else {
                    array = detailData[i].hour +'시';
                }
                arrayList_x.push(array);
            }
        }
        if(param.viewType == 2) {
            for (var i = 0; i < detailData.length; i++) {
                var array = {};

                if (common.isEmpty(detailData[i].day)) {
                    array = 0;
                } else{
                    array = detailData[i].day;
                }
                var arrayFormat = common.convertToDate(array, 'MM/DD');
                arrayList_x.push(arrayFormat);
            }
        }
        if(param.viewType == 3) {
            dalbitLog(detailData);
            for (var i = 0; i < detailData.length; i++) {
                var array = {};

                if (common.isEmpty(detailData[i].day)) {
                    array = 0;
                } else{
                    array = detailData[i].day;
                }

                var arrayFormat = common.convertToDate(array, 'MM/DD');
                arrayList_x.push(arrayFormat);
            }
        }

        //y축
        var arrayList_y = [];
        var max_y = 10;  //최대값
        for(var i=0 ; i<detailData.length; i++) {
            var array = {};

            if(param.slctType == 11) {
                array = detailData[i].createCnt;
            } else if(param.slctType == 12) {
                array = detailData[i].broadcastingTime;
            } else if(param.slctType == 13) {
                array = detailData[i].listenerCnt;
            } else if(param.slctType == 14) {
                array = detailData[i].giftCnt;
            } else if(param.slctType == 15) {
                array = detailData[i].giftAmount;
            } else if(param.slctType == 21) {
                array = detailData[i].joinCnt;
            } else {
                array = detailData[i].withdrawalCnt;
            }
            arrayList_y.push(array);
            if(max_y < array){
                max_y = array + 10;
            }
        }
        var resultData = {
            x : arrayList_x
            , y : arrayList_y
            , max_y : max_y
        };

        dalbitLog(resultData);

        return resultData;
    }

    function getTotalStat(){
        util.getAjaxData("total", "/rest/mainStatus/total/status/list", null, fn_statTotal_success);
    }
    function fn_statTotal_success(dst_id, response){
        var template = $('#tmp_statTotal').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);

        $("#statTotalTableBody").empty().append(html);
    }

    $('#memberStatTab li a').on('click', function(){
       var functionName = $(this).data('function');
       eval(functionName)();
    });

    function getMemberJoinStat(){
        util.getAjaxData("joinInfo", "/rest/mainStatus/join/status/list", null, fn_statMember_success);
    }

    function getMemberWithdrawStat(){
        util.getAjaxData("withdrawInfo", "/rest/mainStatus/join/status/withdraw", null, fn_statMember_success);
    }

    function fn_statMember_success(dst_id, response){
        var template = $('#tmp_statMember').html();
        var templateScript = Handlebars.compile(template);
        var context = dst_id == 'joinInfo' ? response.data.joinStatus : response.data.withdrawStatus;
        var html=templateScript(context);

        $("#statMemberTableBody").empty().append(html);
    }

    function getBroadInfoStat(){
        util.getAjaxData("broadInfo", "/rest/mainStatus/broad/status/info", null, fn_statBroad_success);
    }

    function fn_statBroad_success(dst_id, response){
        var template = $('#tmp_statBroad').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);

        $("#statBroadTableBody").empty().append(html);
    }

    function getItemInfoStat() {
        util.getAjaxData("itemInfo", "/rest/mainStatus/item/status/info", null, fn_itemTop_success);
    }

    function fn_itemTop_success(dst_id, response) {
        var template = $('#tmp_statItem').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);

        $('#statItemBody').empty().append(html);
    }

    $('._payTab').on('click', function(){
        var me = $(this);
        var tabName = me.data('name');
        if(tabName == 'pay'){
            getPayInfoStat();
        }else{
            getPayCancelInfoStat();
        }
    });

    function getPayDate(){
        var dateFormat = 'YYYY-MM-DD';
        var today = moment(new Date()).format(dateFormat);
        var thisWeekStartDay = moment(today).add('days', (-moment(today).day())).format(dateFormat);
        var prevWeekStartDay = moment(thisWeekStartDay).add('weeks', -1).format(dateFormat);

        return data = {
            today : today
            , yesterday : moment(today).add('days', -1).format(dateFormat)
            , thisWeekStartDay : thisWeekStartDay
            , thisWeekEndDay : moment(thisWeekStartDay).add('days', 6).format(dateFormat)
            , prevWeekStartDay : prevWeekStartDay
            , prevWeekEndDay : moment(prevWeekStartDay).add('days', 6).format(dateFormat)
        }
    }

    function getPayInfoStat(){
        util.getAjaxData("itemInfo", "/rest/mainStatus/pay/status/info", getPayDate(), fn_pay_success);
    }

    function getPayCancelInfoStat(){
        util.getAjaxData("itemInfo", "/rest/mainStatus/payCancel/status/info", getPayDate(), fn_pay_success);
    }

    function fn_pay_success(dst_id, response){

        var todayTotalCnt = 0;
        var todayTotalAmt = 0;
        //실시간
        response.data.todayList.forEach(function(info){
            $('._pay[data-payway='+info.pay_way+'][data-type="cnt"] td:eq(0)').html(common.addComma(info.pay_cnt) + '건');
            $('._pay[data-payway='+info.pay_way+'][data-type="amt"] td:eq(0)').html(common.addComma(info.pay_amt) + '원');

            todayTotalCnt += info.pay_cnt;
            todayTotalAmt += info.pay_amt;
        });

        $('._pay[data-payway="total"][data-type="cnt"] td:eq(0)').html(common.addComma(todayTotalCnt) + '건');
        $('._pay[data-payway="total"][data-type="amt"] td:eq(0)').html(common.addComma(todayTotalAmt) + '원');
        $('._pay_total_cnt').html(todayTotalCnt + '건');
        $('._pay_total_amt').html(common.addComma(todayTotalAmt) + '원');


        var yesterdayTotalCnt = 0;
        var yesterdayTotalAmt = 0;
        //전일
        response.data.yesterdayList.forEach(function(info){
            $('._pay[data-payway='+info.pay_way+'][data-type="cnt"] td:eq(1)').html(common.addComma(info.pay_cnt) + '건');
            $('._pay[data-payway='+info.pay_way+'][data-type="amt"] td:eq(1)').html(common.addComma(info.pay_amt) + '원');

            yesterdayTotalCnt += info.pay_cnt;
            yesterdayTotalAmt += info.pay_amt;
        });

        $('._pay[data-payway="total"][data-type="cnt"] td:eq(1)').html(common.addComma(yesterdayTotalCnt) + '건');
        $('._pay[data-payway="total"][data-type="amt"] td:eq(1)').html(common.addComma(yesterdayTotalAmt) + '원');


        var dayTotalCnt = 0;
        var dayTotalAmt = 0;
        //전일대비
        response.data.todayList.forEach(function(todayInfo){
            response.data.yesterdayList.forEach(function(yesterdayInfo){
                if(todayInfo.pay_way == yesterdayInfo.pay_way){
                    var cnt = todayInfo.pay_cnt - yesterdayInfo.pay_cnt;
                    var cnt_target = $('._pay[data-payway='+todayInfo.pay_way+'][data-type="cnt"] td:eq(2)');
                    setPayUpdown(cnt_target, cnt, false);

                    var amt_target = $('._pay[data-payway='+todayInfo.pay_way+'][data-type="amt"] td:eq(2)');
                    var amt = todayInfo.pay_amt - yesterdayInfo.pay_amt;
                    setPayUpdown(amt_target, amt, true);

                    dayTotalCnt += cnt;
                    dayTotalAmt += amt;
                }
            });
        });

        setPayUpdown($('._pay[data-payway="total"][data-type="cnt"] td:eq(2)'), dayTotalCnt, false);
        setPayUpdown($('._pay[data-payway="total"][data-type="amt"] td:eq(2)'), dayTotalAmt, true);


        var thisWeekTotalCnt = 0;
        var thisWeekTotalAmt = 0;
        //주간
        response.data.thisWeekList.forEach(function(info){
            $('._pay[data-payway='+info.pay_way+'][data-type="cnt"] td:eq(3)').html(common.addComma(info.pay_cnt) + '건');
            $('._pay[data-payway='+info.pay_way+'][data-type="amt"] td:eq(3)').html(common.addComma(info.pay_amt) + '원');

            thisWeekTotalCnt += info.pay_cnt;
            thisWeekTotalAmt += info.pay_amt;
        });

        $('._pay[data-payway="total"][data-type="cnt"] td:eq(3)').html(common.addComma(yesterdayTotalCnt) + '건');
        $('._pay[data-payway="total"][data-type="amt"] td:eq(3)').html(common.addComma(yesterdayTotalAmt) + '원');

        var weekTotalCnt = 0;
        var weekTotalAmt = 0;
        //전주대비
        response.data.thisWeekList.forEach(function(thisWeekInfo){
            response.data.prevWeekList.forEach(function(prevWeekInfo){
                if(thisWeekInfo.pay_way == prevWeekInfo.pay_way){
                    var cnt = thisWeekInfo.pay_cnt - prevWeekInfo.pay_cnt;
                    var cnt_target = $('._pay[data-payway='+thisWeekInfo.pay_way+'][data-type="cnt"] td:eq(4)');
                    setPayUpdown(cnt_target, cnt, false);

                    var amt = thisWeekInfo.pay_amt - prevWeekInfo.pay_amt;
                    var amt_target = $('._pay[data-payway='+thisWeekInfo.pay_way+'][data-type="amt"] td:eq(4)');
                    setPayUpdown(amt_target, amt, true);

                    weekTotalCnt += cnt;
                    weekTotalAmt += amt;
                }
            });
        });

        setPayUpdown($('._pay[data-payway="total"][data-type="cnt"] td:eq(4)'), weekTotalCnt, false);
        setPayUpdown($('._pay[data-payway="total"][data-type="amt"] td:eq(4)'), weekTotalAmt, true);
    }

    function setPayUpdown(element, value, isAmt){
        element.removeClass('_up, _down');

        var icon = '';
        if(0 < value){
            element.addClass('_up');
            icon = '<i class="fa fa-caret-up"></i> ';
        }else if(value < 0){
            element.addClass('_down');
            icon = '<i class="fa fa-caret-down"></i> ';
        }
        element.html(icon + common.addComma(value) + (isAmt ? '원' : '건'));
    }
</script>


<script type="text/x-handlebars-template" id="tmp_statTotal">
    <tr>
        <td><a href="javascript://" class="_cntType" data-slcttype="11">{{addComma broadcast_create_Cnt}}건</a></td>
        <td><a href="javascript://" class="_cntType" data-slcttype="12">{{addComma broadcast_air_Time}}분</a></td>
        <td><a href="javascript://" class="_cntType" data-slcttype="13">{{addComma broadcast_listener_Cnt}}건</a></td>
        <td><a href="javascript://" class="_cntType" data-slcttype="14">{{addComma broadcast_gift_Cnt}}건</a></td>
        <td><a href="javascript://" class="_cntType" data-slcttype="15">{{addComma broadcast_gift_Amount}}원</a></td>

        <td><a href="javascript://" class="_cntType" data-slcttype="21">{{addComma member_join_Cnt}}건</a></td>
        <td><a href="javascript://" class="_cntType" data-slcttype="31">{{addComma member_withdraw_Cnt}}건</a></td>

        <!--<td><a href="javascript://"></a></td>
        <td><a href="javascript://"></a></td>
        <td><a href="javascript://"></a></td>
        <td><a href="javascript://"></a></td>

        <td><a href="javascript://"></a></td>
        <td><a href="javascript://"></a></td>-->

        <td><a href="javascript://" class="_pay_total_cnt"></a></td>
        <td><a href="javascript://" class="_pay_total_amt"></a></td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_statMember">
    <tr>
        <th rowspan="4">성별</th>
        <th>남</th>
        <td>{{addComma m_now_Cnt}}</td>
        <td>{{addComma m_yes_Cnt}}</td>
        <td class="{{upAndDownClass m_now_inc_cnt}}"><i class="fa {{upAndDownIcon m_now_inc_cnt}}"></i> {{addComma m_now_inc_cnt}}</td>
        <td>{{addComma m_week_cnt}}</td>
        <td class="{{upAndDownClass m_week_inc_cnt}}"><i class="fa {{upAndDownIcon m_week_inc_cnt}}"></i> {{addComma m_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th>여</th>
        <td>{{addComma f_now_Cnt}}</td>
        <td>{{addComma f_yes_Cnt}}</td>
        <td class="{{upAndDownClass f_now_inc_cnt}}"><i class="fa {{upAndDownIcon f_now_inc_cnt}}"></i> {{addComma f_now_inc_cnt}}</td>
        <td>{{addComma f_week_cnt}}</td>
        <td class="{{upAndDownClass f_week_inc_cnt}}"><i class="fa {{upAndDownIcon f_week_inc_cnt}}"></i> {{addComma f_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th>알수없음</th>
        <td>{{addComma n_now_Cnt}}</td>
        <td>{{addComma n_yes_Cnt}}</td>
        <td class="{{upAndDownClass n_now_inc_cnt}}"><i class="fa {{upAndDownIcon n_now_inc_cnt}}"></i> {{addComma n_now_inc_cnt}}</td>
        <td>{{addComma n_week_cnt}}</td>
        <td class="{{upAndDownClass n_week_inc_cnt}}"><i class="fa {{upAndDownIcon n_week_inc_cnt}}"></i> {{addComma n_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th>총계</th>
        <td>{{addComma t_now_Cnt}}</td>
        <td>{{addComma t_yes_Cnt}}</td>
        <td class="{{upAndDownClass t_now_inc_cnt}}"><i class="fa {{upAndDownIcon t_now_inc_cnt}}"></i> {{addComma t_now_inc_cnt}}</td>
        <td>{{addComma t_week_cnt}}</td>
        <td class="{{upAndDownClass t_week_inc_cnt}}"><i class="fa {{upAndDownIcon t_week_inc_cnt}}"></i> {{addComma t_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th rowspan="6">연령별</th>
        <th>10대</th>
        <td>{{addComma now_10_Cnt}}</td>
        <td>{{addComma yes_10_Cnt}}</td>
        <td class="{{upAndDownClass now_10_inc_cnt}}"><i class="fa {{upAndDownIcon now_10_inc_cnt}}"></i> {{addComma now_10_inc_cnt}}</td>
        <td>{{addComma week_10_cnt}}</td>
        <td class="{{upAndDownClass week_10_inc_cnt}}"><i class="fa {{upAndDownIcon week_10_inc_cnt}}"></i> {{addComma week_10_inc_cnt}}</td>
    </tr>
    <tr>
        <th>20대</th>
        <td>{{addComma now_20_Cnt}}</td>
        <td>{{addComma yes_20_Cnt}}</td>
        <td class="{{upAndDownClass now_20_inc_cnt}}"><i class="fa {{upAndDownIcon now_20_inc_cnt}}"></i> {{addComma now_20_inc_cnt}}</td>
        <td>{{addComma week_20_cnt}}</td>
        <td class="{{upAndDownClass week_20_inc_cnt}}"><i class="fa {{upAndDownIcon week_20_inc_cnt}}"></i> {{addComma week_20_inc_cnt}}</td>
    </tr>
    <tr>
        <th>30대</th>
        <td>{{addComma now_30_Cnt}}</td>
        <td>{{addComma yes_30_Cnt}}</td>
        <td class="{{upAndDownClass now_30_inc_cnt}}"><i class="fa {{upAndDownIcon now_30_inc_cnt}}"></i> {{addComma now_30_inc_cnt}}</td>
        <td>{{addComma week_30_cnt}}</td>
        <td class="{{upAndDownClass week_30_inc_cnt}}"><i class="fa {{upAndDownIcon week_30_inc_cnt}}"></i> {{addComma week_30_inc_cnt}}</td>
    </tr>
    <tr>
        <th>40대</th>
        <td>{{addComma now_40_Cnt}}</td>
        <td>{{addComma yes_40_Cnt}}</td>
        <td class="{{upAndDownClass now_40_inc_cnt}}"><i class="fa {{upAndDownIcon now_40_inc_cnt}}"></i> {{addComma now_40_inc_cnt}}</td>
        <td>{{addComma week_40_cnt}}</td>
        <td class="{{upAndDownClass week_40_inc_cnt}}"><i class="fa {{upAndDownIcon week_40_inc_cnt}}"></i> {{addComma week_40_inc_cnt}}</td>
    </tr>
    <tr>
        <th>50대</th>
        <td>{{addComma now_50_Cnt}}</td>
        <td>{{addComma yes_50_Cnt}}</td>
        <td class="{{upAndDownClass now_50_inc_cnt}}"><i class="fa {{upAndDownIcon now_50_inc_cnt}}"></i> {{addComma now_50_inc_cnt}}</td>
        <td>{{addComma week_50_cnt}}</td>
        <td class="{{upAndDownClass week_50_inc_cnt}}"><i class="fa {{upAndDownIcon week_50_inc_cnt}}"></i> {{addComma week_50_inc_cnt}}</td>
    </tr>
    <tr>
        <th>60대 이상</th>
        <td>{{addComma now_60_Cnt}}</td>
        <td>{{addComma yes_60_Cnt}}</td>
        <td class="{{upAndDownClass now_60_inc_cnt}}"><i class="fa {{upAndDownIcon now_60_inc_cnt}}"></i> {{addComma now_60_inc_cnt}}</td>
        <td>{{addComma week_60_cnt}}</td>
        <td class="{{upAndDownClass week_60_inc_cnt}}"><i class="fa {{upAndDownIcon week_60_inc_cnt}}"></i> {{addComma week_60_inc_cnt}}</td>
    </tr>

    <tr class="success">
        <th colspan="2">합계</th>
        <td>{{addComma t_now_Cnt}}</td>
        <td>{{addComma t_yes_Cnt}}</td>
        <td class="{{upAndDownClass t_now_inc_cnt}}"><i class="fa {{upAndDownIcon t_now_inc_cnt}}"></i> {{addComma t_now_inc_cnt}}</td>
        <td>{{addComma t_week_cnt}}</td>
        <td class="{{upAndDownClass t_week_inc_cnt}}"><i class="fa {{upAndDownIcon t_week_inc_cnt}}"></i> {{addComma t_week_inc_cnt}}</td>
    </tr>
</script>



<script type="text/x-handlebars-template" id="tmp_statBroad">
    <tr>
        <th>방송 개설</th>
        <td>{{addComma create_now_cnt}}</td>
        <td>{{addComma create_yes_cnt}}</td>
        <td class="{{upAndDownClass create_now_inc_cnt}}"><i class="fa {{upAndDownIcon create_now_inc_cnt}}"></i> {{addComma create_now_inc_cnt}}</td>
        <td>{{addComma create_week_cnt}}</td>
        <td class="{{upAndDownClass create_week_inc_cnt}}"><i class="fa {{upAndDownIcon create_week_inc_cnt}}"></i> {{addComma create_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th>방송 시간</th>
        <td>{{addComma broadcast_now_time}}</td>
        <td>{{addComma broadcast_yes_time}}</td>
        <td class="{{upAndDownClass broadcast_now_inc_time}}"><i class="fa {{upAndDownIcon broadcast_now_inc_time}}"></i> {{addComma broadcast_now_inc_time}}</td>
        <td>{{addComma broadcast_week_time}}</td>
        <td class="{{upAndDownClass broadcast_week_inc_time}}"><i class="fa {{upAndDownIcon broadcast_week_inc_time}}"></i> {{addComma broadcast_week_inc_time}}</td>
    </tr>

    <!--<tr>
        <th>DJ</th>
        <td></td>
        <td></td>
        <td class="{{upAndDownClass 0}}"><i class="fa {{upAndDownIcon 0}}"></i> </td>
        <td></td>
        <td class="{{upAndDownClass 0}}"><i class="fa {{upAndDownIcon 0}}"></i> </td>
    </tr>-->

    <tr>
        <th>청취자</th>
        <td>{{addComma listener_now_cnt}}</td>
        <td>{{addComma listener_yes_cnt}}</td>
        <td class="{{upAndDownClass listener_now_inc_cnt}}"><i class="fa {{upAndDownIcon listener_now_inc_cnt}}"></i> {{addComma listener_now_inc_cnt}}</td>
        <td>{{addComma listener_week_cnt}}</td>
        <td class="{{upAndDownClass listener_week_inc_cnt}}"><i class="fa {{upAndDownIcon listener_week_inc_cnt}}"></i> {{addComma listener_week_inc_cnt}}</td>
    </tr>

    <tr>
        <th>선물 건</th>
        <td>{{addComma gift_now_cnt}}</td>
        <td>{{addComma gift_yes_cnt}}</td>
        <td class="{{upAndDownClass gift_now_inc_cnt}}"><i class="fa {{upAndDownIcon gift_now_inc_cnt}}"></i> {{addComma gift_now_inc_cnt}}</td>
        <td>{{addComma gift_week_cnt}}</td>
        <td class="{{upAndDownClass gift_week_inc_cnt}}"><i class="fa {{upAndDownIcon gift_week_inc_cnt}}"></i> {{addComma gift_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>선물 금액</th>
        <td>{{addComma gift_now_amt}}</td>
        <td>{{addComma gift_yes_amt}}</td>
        <td class="{{upAndDownClass gift_now_inc_amt}}"><i class="fa {{upAndDownIcon gift_now_inc_amt}}"></i> {{addComma gift_now_inc_amt}}</td>
        <td>{{addComma gift_week_amt}}</td>
        <td class="{{upAndDownClass gift_week_inc_amt}}"><i class="fa {{upAndDownIcon gift_week_inc_amt}}"></i> {{addComma gift_week_inc_amt}}</td>
    </tr>
    <!--<tr>
        <th>게스트</th>
        <td></td>
        <td></td>
        <td class="{{upAndDownClass 0}}"><i class="fa {{upAndDownIcon 0}}"></i></td>
        <td></td>
        <td class="{{upAndDownClass 0}}"><i class="fa {{upAndDownIcon 0}}"></i></td>
    </tr>-->
</script>

<script type="text/x-handlebars-template" id="tmp_statItem">
    {{#each this}}
    <tr>
        <th rowspan="2">{{item_name}}<br />{{item_code}}</th>
        <th>건</th>
        <td>{{addComma nowItemCnt}}</td>
        <td>{{addComma yesItemCnt}}</td>
        <td class="{{upAndDownClass incnyItemCnt}}"><i class="fa {{upAndDownIcon incnyItemCnt}}"></i>{{addComma incnyItemCnt}}</td>
        <td>{{addComma weekItemCnt}}</td>
        <td class="{{upAndDownClass incwbItemCnt}}"><i class="fa {{upAndDownIcon incwbItemCnt}}"></i>{{addComma incwbItemCnt}}</td>
    </tr>
    <tr>
        <th>금액</th>
        <td>{{addComma nowItemAmt}}</td>
        <td>{{addComma yesItemAmt}}</td>
        <td class="{{upAndDownClass incnyItemAmt}}"><i class="fa {{upAndDownIcon incnyItemAmt}}"></i>{{addComma incnyItemAmt}}</td>
        <td>{{addComma weekItemAmt}}</td>
        <td class="{{upAndDownClass incnwbItemAmt}}"><i class="fa {{upAndDownIcon incnwbItemAmt}}"></i>{{addComma incwbItemAmt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="7">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>