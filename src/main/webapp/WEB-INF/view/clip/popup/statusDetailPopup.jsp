<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget-table mb10">
    <div class="col-md-12" style="background-color: #fbe5d6;padding:7px;margin-top: 8px">
        <span class="font-bold" id="sp_type" style="color: #7792c9;"></span><span class="font-bold">&nbsp;상세내역</span>
    </div>
    <div class="col-md-12 no-padding mt5">
        <span class="pull-right">
            <p name="headerInfo" style="padding:5px; border:1px solid #cccccc; background-color: #ffe699; height: 30px; margin-bottom: 2px; display: table;"></p>
        </span>
    </div>
    <div class="widget-content mt10">
        <table class="table table-bordered" id="list">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript" src="/js/dataTablesSource/clip/clipStatusDetailPopupDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/clip/clipCodeList.js?${dummyData}"></script>

<script type="text/javascript">
    var dtList_info;

    var type = '${param.type}';
    var subjectName = '${param.subjectname}';
    var summaryHeader = "";

    getDalList();
    function getDalList() {

        var searchTypeOpen = common.isEmpty('${param.searchtypeopen}') ? -1 : '${param.searchtypeopen}';
        var searchConfirm = common.isEmpty('${param.searchconfirm}') ? -1 : '${param.searchconfirm}';
        var searchState = common.isEmpty('${param.searchstate}') ? -1 : '${param.searchstate}';
        var searchSex = common.isEmpty('${param.searchsex}') ? '' : '${param.searchsex}';
        var orderByType = common.isEmpty('${param.orderbytype}') ? 0 : '${param.orderbytype}';
        var subjectType = common.isEmpty('${param.subjecttype}') ? -1 : '${param.subjecttype}';
        var searchOsType = common.isEmpty('${param.searchostype}') ? -1 : '${param.searchostype}';
        var searchAgeType = common.isEmpty('${param.searchagetype}') ? -1 : '${param.searchagetype}';
        var searchGroupBy = common.isEmpty('${param.searchgroupby}') ? -1 : '${param.searchgroupby}';
        var isChoiceDate = 2;
        var slctType = common.isEmpty('${param.slcttype}') ? 0 : '${param.slcttype}';

        var startDate = '${param.sdate}';
        if(slctType == 0){
            startDate = startDate + (common.isEmpty('${param.stime}') ? " 00:00:00" : " " + ('${param.stime}'.length < 2 ? "0" + '${param.stime}' : '${param.stime}')  + ":00:00");
        }else if(slctType == 1){
            startDate = (common.isEmpty('${param.sday}') ? startDate + " 00:00:00" : startDate.substr(0, 8) + ('${param.sday}'.length < 2 ? "0" + '${param.sday}' : '${param.sday}')  + " 00:00:00");
        }else if(slctType == 2){
            startDate = (common.isEmpty('${param.smonth}') ? startDate + " 00:00:00" : startDate.substr(0, 5) + ('${param.smonth}'.length < 2 ? "0" + '${param.smonth}' : '${param.smonth}')  + ".01 00:00:00");
        }else if(slctType == 3){
            startDate = startDate + " 00:00:00";
        }

        var endDate = startDate;

        //      data-type="1-1	성별 등록
        //      data-type="1-2	성별 삭제
        // data-type="2		성별 등록자
        //      data-type="3		선물
        //      data-type="4-1	연령대별 등록
        //      data-type="4-2	연령대별 삭제
        //      data-type="5-1	주제별 등록
        //      data-type="5-2	주제별 삭제
        //      data-type="6		주제별 청취자
        //      data-type="7-1	플랫폼별 등록
        //      data-type="7-2	플랫폼별 삭제
        //      data-type="8		플랫폼별 청취자

        if(type == "1-1"){
            $("#sp_type").text("성별>등록");
            searchState = -1;
        }else if(type == "1-2"){
            $("#sp_type").text("성별>삭제");
            searchState = 3;
        }else if(type == "2"){
            $("#sp_type").text("성별>등록자");
            searchState = -1;
        }else if(type == "3"){
            $("#sp_type").text("선물 별>선물 건/선물 달");
        }else if(type == "4-1"){
            $("#sp_type").text("연령대별>등록(" + util.getCommonCodeText(searchAgeType, clip_age) + ")");
            searchState = -1;
        }else if(type == "4-2"){
            $("#sp_type").text("연령대별>삭제(" + util.getCommonCodeText(searchAgeType, clip_age) + ")");
            searchState = 3;
        }else if(type == "5-1"){
            $("#sp_type").text("주제 별>등록(" + subjectName + ")");
            searchState = -1;
        }else if(type == "5-2"){
            $("#sp_type").text("주제 별>삭제(" + subjectName + ")");
            searchState = 3;
        }else if(type == "6"){
            $("#sp_type").text("주제 별>청취자(" + subjectName + ")");
        }else if(type == "7-1"){
            $("#sp_type").text("플랫폼 별>등록(" + util.getCommonCodeText(searchOsType, clip_platform) + ")");
            searchState = -1;
        }else if(type == "7-2"){
            $("#sp_type").text("플랫폼 별>삭제(" + util.getCommonCodeText(searchOsType, clip_platform) + ")");
            searchState = 3;
        }else if(type == "8"){
            $("#sp_type").text("플랫폼 별>청취자(" + util.getCommonCodeText(searchOsType, clip_platform) + ")");
        }


        var dtList_info_data = function(data) {
            data.startDate = startDate;
            data.endDate = endDate;
            data.searchTypeOpen = searchTypeOpen;
            data.searchConfirm = searchConfirm;
            data.searchState = searchState;
            data.searchSex = searchSex;
            data.searchOsType = searchOsType;
            data.searchAgeType = searchAgeType;
            data.searchGroupBy = searchGroupBy;
            data.orderByType = orderByType;
            data.subjectType = subjectType;
            data.isChoiceDate = isChoiceDate;
            data.slctType = slctType;

            console.log(data)
        };

        if(type.startsWith("1-") || type.startsWith("4-") || type.startsWith("5-") || type.startsWith("7-")){
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, ClipStatusDetailPopupDataTableSource.clipList);
        }else if(type == "2"){
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, ClipStatusDetailPopupDataTableSource.clipRegList);
        }else if(type == "3"){
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, ClipStatusDetailPopupDataTableSource.giftList);
        }else if(type == "6" || type == "8"){
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, ClipStatusDetailPopupDataTableSource.playList);
        }
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable(selectCallback_clipStatusDetailPopup);
    }


    function selectCallback_clipStatusDetailPopup(data){
        // 탭 우측 총 건수 추가

        if(type.endsWith("-1")){
            var text = "<span style='color: black;'>총 등록 건 (공개/비공개) :</span>" +
                "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.pagingVo.totalCnt) + " 건</span>" +
                " (<span font-weight: bold; '>" +  common.addComma(Number(data.pagingVo.totalCnt) - Number(data.summary.totalHideCnt)) + " 건 / </span>" +
                "<span font-weight: bold; '> " +  common.addComma(data.summary.totalHideCnt) + " 건</span>)";
        }else if(type.endsWith("-2")){
            var text = "<span style='color: black;'>총 삭제 건 (본인/운영자) :</span>" +
                "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.summary.delTotalCnt) + " 건</span>" +
                " (<span font-weight: bold; '>" +  common.addComma(data.summary.delMyselfTotalCnt) + " 건 / </span>" +
                "<span font-weight: bold; '> " +  common.addComma(data.summary.delAdminTotalCnt) + " 건</span>)";
        }else if(type == "2"){
            var text = "<span style='color: black;'>총 등록자 수 (남성/여성/알수없음) :</span>" +
                "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.summary.totalCnt) + " 명</span>" +
                " (<span style='color: blue; font-weight: bold; '>" +  common.addComma(data.summary.manCnt) + " 명</span> / " +
                "<span style='color: red; font-weight: bold; '> " +  common.addComma(data.summary.femaleCnt) + " 명</span> / " +
                "<span style='color: black; font-weight: bold; '> " +  common.addComma(data.summary.unknownCnt) + " 명</span>)";
        }else if(type == "3"){
            var text = "<span style='color: black;'>총 선물 수 :</span>" +
            "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.summary.giftTotalCnt) + " 건</span><br>" +
            "<span style='color: black;'>총 선물 달 :</span>" +
            "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.summary.dalTotalCnt) + " 달</span><br>";
        }else if(type == "6" || type == "8"){
            var text = "<span style='color: black;'>총 청취자 수 (남성/여성/알수없음) :</span>" +
                "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.summary.totalCnt) + " 명</span>" +
                " (<span style='color: blue; font-weight: bold; '>" +  common.addComma(data.summary.manTotalCnt) + " 명</span> / " +
                "<span style='color: red; font-weight: bold; '> " +  common.addComma(data.summary.femaleTotalCnt) + " 명</span> / " +
                "<span style='color: black; font-weight: bold; '> " +  common.addComma(data.summary.unknownTotalCnt) + " 명</span>)";
        }

        console.log(text)
        $("p[name=headerInfo]").html(text);
        $("p[name=headerInfo]").show();
    }

</script>


