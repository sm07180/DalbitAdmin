<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">

        <div class="col-md-2 no-padding">
            <span name="currentType" id="currentType" onchange="currentType_sel_change()"></span>
        </div>

        <div class="col-md-6 no-padding pull-right">
            <!-- 접속 관련 통계 데이터-->
            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> 현재 접속자 통계 현황</h3>
                </div>
                <div class="widget-content mt10">
                    <%--<button type="button" class="fa fa-refresh" onclick="getLoginLiveInfo();"></button>--%>
                    <colgroup>
                        <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                        <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                    </colgroup>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>실시간</th>
                            <th>전일</th>
                            <th>증감</th>
                            <th>주간</th>
                            <th>전주</th>
                            <th>증감</th>
                            <th>월간</th>
                            <th>전월</th>
                            <th>증감</th>
                        </tr>
                        </thead>
                        <tbody id="loginLiveTableBody"></tbody>
                    </table>
                </div>
            </div>
        </div> <!-- // container-fluid -->
    </div>
    <div class="col-md-12 no-padding">
        <table id="tableList" class="table table-sorting table-hover table-bordered datatable">
            <thead id="tableTop_detail">
            </thead>
            <tbody id="tableBody_detail">
            </tbody>
        </table>
    </div>
    </span>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/code/connect/connectCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    $("#currentType").html(util.getCommonCodeSelect(1, currentType,"Y"));

    $(function(){
        getCurrenList();

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getCurrenList();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getCurrenList();
        });

    });

    var dtList_info_detail;
    var slctType = 1;
    function getCurrenList(){
        var dtList_data = function (data) {
            data.slctType = slctType;
            data.pageCnt = 20;
            data.searchText = $("#txt_search").val();
        };
        dtList_info_detail = new DalbitDataTable($("#tableList"), dtList_data, connectDataTableSource.current);
        dtList_info_detail.setPageLength(20);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();

    }

    function currentType_sel_change(){
        var value = $("select[name='currentType']").val();
        console.log("value : " + value);
        slctType = value;
        dtList_info_detail.reload();
    }

</script>