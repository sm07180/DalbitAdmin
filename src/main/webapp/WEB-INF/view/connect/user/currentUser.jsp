<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <div class="widget widget-table" id="main_table">
            <div class="widget-content">
                <div class="pull-left" style="margin-top: 8px;margin-bottom: 8px;">
                    <label><input type="text" class="form-control" id="txt_search"></label>
                    <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                </div>
                <div class="pull-right" style="margin-top: 8px;margin-bottom: 8px;">
                    <span name="currentType" id="currentType" onchange="currentType_sel_change()"></span>
                </div>
                <table id="tableList" class="table table-sorting table-hover table-bordered datatable">
                    <thead id="tableTop_detail">
                    </thead>
                    <tbody id="tableBody_detail">
                    </tbody>
                </table>
            </div>
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