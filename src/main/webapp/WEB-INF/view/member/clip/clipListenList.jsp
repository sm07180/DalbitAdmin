<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 클립관리 > 클립내역관리 > 클립청취 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate" style="display: none;"></span>
        <span class="pull-right">
            <div class="pull-left" style="width:30px; height:30px; background-color: #dae3f3; border:1px solid #cccccc;"></div>
            <div class="pull-left pl10 pt5" style="width:105px; height:30px; border:1px solid #cccccc; border-left-width: 0px;">테스트 아이디</div>
        </span>
        <table id="clip_history_listen_list_info" class="table table-sorting table-hover table-bordered">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/dataTablesSource/clip/clipHistoryDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/clip/clipCodeList.js?${dummyData}"></script>

<script type="text/javascript">
    $(function(){

    });

    function getHistory_clipListenList(tmp){
        getClipSubjectTypeCodeDefine();

        initDataTable_clipHistoryListen(tmp);
    }

    var dtList_info;
    function initDataTable_clipHistoryListen(tmp) {
        if(common.isEmpty(memNo)){
            return;
        }

        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = ClipHistoryDataTableSource.listenList;

        //=---------- Main DataTable ----------
        var dtList_info_detail_data = function (data) {
            data.targetMemNo = memNo;
        };

        dtList_info_detail = new DalbitDataTable($("#clip_history_listen_list_info"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable(selectCallback_clipHistotyListen);

        //---------- Main DataTable ----------=
    };

    function selectCallback_clipHistotyListen(data){
        // 탭 우측 총 건수 추가
        var text = "<span style='color: black;'>클립 청취 수 :</span>" +
            "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.pagingVo.totalCnt) + " 건</span>" +
            "<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>" +
            "<span style='color: blue; font-weight: bold; '>남성 : " +  common.addComma(data.summary.manTotalCnt) + " 건, </span>" +
            "<span style='color: red; font-weight: bold; '>여성 : " +  common.addComma(data.summary.femaleTotalCnt) + " 건, </span>" +
            "<span style='color: black; font-weight: bold; '>알수없음 : " +  common.addComma(data.summary.unknownTotalCnt) + " 건</span>";

        $("#headerInfo").html(text);
        $("#headerInfo").show();
    }

</script>


<script id="tmp_codeDefine" type="text/x-handlebars-template">
    <select name="slctType" id="slctType" class="form-control">
        {{#each this as |sub|}}
        <option value="{{sub.value}}">{{sub.code}}</option>
        {{/each}}
    </select>
</script>