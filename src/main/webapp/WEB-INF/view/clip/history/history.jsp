<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate" style="display: none;"></span>
        <select id="clipSubjectType" name="clipSubjectType" class="form-control pull-left"></select>
        <span id="select_clipOrderByType" name="select_clipOrderByType" class="pull-left ml5"></span>
        <span class="pull-right">
            <div class="pull-left" style="width:30px; height:30px; background-color: #dae3f3; border:1px solid #cccccc;"></div>
            <div class="pull-left pl10 pt5" style="width:105px; height:30px; border:1px solid #cccccc; border-left-width: 0px;">테스트 아이디</div>
        </span>
        <table id="clip_history_list_info" class="table table-sorting table-hover table-bordered">
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


<script type="text/javascript">
    var beforeOrderByType = 0;
    var beforeClipSubjectType = -1;

    $(document).on('change', "#clipSubjectType, #clipOrderByType", function(){
        beforeOrderByType = $("#clipOrderByType").val();
        beforeClipSubjectType = $("#clipSubjectType").val();
        dtList_info.reload(selectCallback_clipHistoty);
    });

    $(function(){

    });

    function initClipHistory(){
        beforeOrderByType = 0;
        beforeClipSubjectType = -1;
        $("#clipOrderByType").val("0");
        $("#clipSubjectType").val("-1");
    }

    function getHistory(){
        $("#select_clipOrderByType").html(util.getCommonCodeSelect(beforeOrderByType, clip_orderByType));
        getClipSubjectTypeCodeDefine();

        initDataTable_clipHistory();
    }

    var dtList_info;
    function initDataTable_clipHistory() {
        //=---------- Main DataTable ----------
        var dtList_info_data = function (data) {
            data.orderByType = $("#clipOrderByType").val();
            data.subjectType = $("#clipSubjectType").val();
        };

        dtList_info = new DalbitDataTable($("#clip_history_list_info"), dtList_info_data, ClipHistoryDataTableSource.list, $("#searchForm"));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable(selectCallback_clipHistoty);

        //---------- Main DataTable ----------=
    };

    function selectCallback_clipHistoty(data){
        // 탭 우측 총 건수 추가
        var text = "<span style='color: black;'>클립 누적등록 수 :</span><span style='color: red; font-weight: bold; '> " +  common.addComma(data.pagingVo.totalCnt) + " 건</span>";
        $("#headerInfo").html(text);
        $("#headerInfo").show();
    }

    function getClipSubjectTypeCodeDefine(){
        var data = {};
        data.type="clip_type";
        data.order = "asc";
        data.is_ues = "1";
        util.getAjaxData("codeList", "/common/codeList", data, fn_ClipSubjectTypeCode_success);

    }
    function fn_ClipSubjectTypeCode_success(dst_id, response){
        var allData = {
            sel: ""
            , type: "clip_type"
            , value: "-1"
            , code: "주제(전체)"
            , order: "0"
            , is_use: "1"
        };
        response.data.unshift(allData);

        var template = $("#tmp_codeDefine").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#clipSubjectType").html(html);

        $("#clipSubjectType").val(beforeClipSubjectType);
    }

</script>


<script id="tmp_codeDefine" type="text/x-handlebars-template">
    <select name="slctType" id="slctType" class="form-control">
        {{#each this as |sub|}}
        <option value="{{sub.value}}">{{sub.code}}</option>
        {{/each}}
    </select>
</script>