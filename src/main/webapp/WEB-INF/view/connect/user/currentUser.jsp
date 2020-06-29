<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">
        <div class="col-md-12 no-padding">
            <div class="col-md-2" style="padding-top: 7px;width: 200px">
                <label class="control-inline fancy-radio custom-color-green">
                    <input type="radio" value="-1" id="testId-1" name="testId" class="form-control" checked="checked">
                    <span><i></i>전체</span>
                </label>
                <label class="control-inline fancy-radio custom-color-green">
                    <input type="radio" value="0" id="testId-0" name="testId" class="form-control">
                    <span><i></i>Test-ID 제외</span>
                </label>
            </div>
            <div class="col-md-2 no-padding">
                <span name="currentType" id="currentType" onchange="currentType_sel_change()"></span>
            </div>
        </div>

        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                        <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="background-color: #ebccd1; color:red; height: 37.4px;">◈ 성별</th>
                        <th style="background-color: #ffe699">실시간</th>
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
            <div class="col-md-6 no-padding">
                <jsp:include page="total.jsp"/>
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

    //전체 클릭
    $('#testId-1').click( function() {
        $('#testId-1').attr("checked", true);
        $('#testId-0').attr("checked", false);
        dtList_info_detail.reload();
    });

    // Test-ID 제외 클릭
    $('#testId-0').click( function() {
        $('#testId-1').attr("checked", false);
        $('#testId-0').attr("checked", true);
        dtList_info_detail.reload();
    });



    var dtList_info_detail;
    var slctType = 1;
    function getCurrenList(){
        console.log($('input[name="testId"]:checked').val());
        var dtList_data = function (data) {
            data.slctType = slctType;
            data.pageCnt = 20;
            data.searchText = $("#txt_search").val();
            data.inner = $('input[name="testId"]:checked').val();
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