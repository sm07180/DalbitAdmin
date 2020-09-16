<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Object in_mem_no = request.getParameter("memNo");
%>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid col-lg-12 no-padding">
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <span id="isChoiceDateArea"></span>
                                <span id="slctTypeArea" style="display: none;"></span>
                                <div class="input-group date" id="oneDayDatePicker">
                                    <label for="onedayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                    </label>
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                </div>

                                <div class="input-group date" id="monthDatepicker" style="display:none;">
                                    <label for="monthDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="monthDate" type="text" class="form-control"/>
                                </div>

                                <div class="input-group date" id="yearDatepicker" style="display:none;">
                                    <label for="yearDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="yearDate" type="text" class="form-control"/>
                                </div>

                                <div class="input-group date" id="rangeDatepicker" style="display:none;">
                                    <label for="rangeDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="rangeDate" type="text" class="form-control"/>
                                </div>

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>

                                <div class="control-inline pt5 mr0" id="div_searchArea" style="display: none;">
                                    <span id="search_platform_aria" style="display: none"></span>
                                    <span id="search_aria"></span>
                                    <label><input type="text" class="form-control" id="txt_search" name="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                </div>

                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <div class="input-group" id="div_stepButtonArea">
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>
                                </div>

                                <label class="control-inline fancy-checkbox custom-color-green pl5 pt5">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1">
                                    <span>테스트 아이디 제외</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- tab -->
        <div class="no-padding" id="infoTab">
            <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
                <div class="widget-content">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                        <li class="active"><a href="#all" role="tab" data-toggle="tab" id="tab_all">클립 등록 이력</a></li>
                        <li class="pull-right" ><a id="headerInfo" style="border:1px solid #cccccc; background-color: #ffe699; height: 30px; margin-bottom: 2px; display: table;"></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="all">
                            <!-- 클립관리 > 클립내역관리 > 클립관리 팝업 -->
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
                        </div>      <!-- 클립 관리(전체/오늘) -->
                    </div>
                </div>
            </div>
        </div>
        <!-- //tab -->
    </div>
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript" src="/js/dataTablesSource/clip/clipHistoryDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/clip/clipCodeList.js?${dummyData}"></script>


<script type="text/javascript">
    var memNo = "<%=in_mem_no%>";

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
            data.orderByType = Number($("#clipOrderByType").val());
            data.subjectType = Number(common.isEmpty($("#clipSubjectType").val()) ? "-1" : $("#clipSubjectType").val());
            data.targetMemNo = memNo;
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
        var text = "<span style='color: black;'>클립 누적등록 수 :</span>" +
            "<span style='color: darkblue; font-weight: bold; '> " +  common.addComma(data.pagingVo.totalCnt) + " 건</span>" +
            "<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>" +
            "<span style='color: blue; font-weight: bold; '>남성 : " +  common.addComma(data.summary.manTotalCnt) + " 건, </span>" +
            "<span style='color: red; font-weight: bold; '>여성 : " +  common.addComma(data.summary.femaleTotalCnt) + " 건, </span>" +
            "<span style='color: black; font-weight: bold; '>알수없음 : " +  common.addComma(data.summary.unknownTotalCnt) + " 건</span>";
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



    //숨기기 기능 이베트
    function updateClipHide(clipNo, hide) {
        if(confirm("클립 숨기기를 하는 경우 어드민에서 확인되지만 리스트에서는 본인외 타인에게 확인되지 않습니다. \n\n해당 클립을 숨기기 하시겠습니까?")){
            var data = {
                "castNo" : clipNo
                , "hide" : hide
            }
            util.getAjaxData("isHide", "/rest/clip/history/updateHide", data , fn_ClipUpdateHide_success, fn_fail)
        }
    }

    function fn_ClipUpdateHide_success(dst_id, response){
        alert(response.message);
        $("#bt_search").click();
    }
    function fn_fail(dst_id, response){
        alert(data.message);
        console.log(data, textStatus, jqXHR);
    };

    //클립 삭제 기능 이베트
    function deleteClip(clipNo) {
        if(confirm("해당 클립을 삭제 하시겠습니까?")){
            var data = {
                "castNo" : clipNo
            }
            util.getAjaxData("isHide", "/rest/clip/history/deleteClip", data , fn_ClipDelete_success, fn_fail)
        }
    }

    function fn_ClipDelete_success(dst_id, response){
        alert(response.message);
        $("#bt_search").click();
    }



    // 댓글 목록 리스트
    $(document).on('click', '._selectReply', function() {
        if($(this).data('reply') == 0) {
            alert('해당 클립에는 등록된 댓글이 없습니다.');
        } else if($(this).data('reply') > 0) {
            var data = {
                'castNo' : $(this).data('cast_no')
            };
            util.getAjaxData("selectReply", "/rest/clip/history/reply/list", data, fn_success_selectReply);
        }
    });

    function fn_success_selectReply(dst_id, response) {
        $('#div_reply').empty();
        for(var i=0 ; i<response.data.length; i++){
            var tmp = '<div class="col-md-12 no-padding" style="margin-bottom: 10px;">';
            tmp +=    '<div class="col-md-2">';
            tmp +=      '<form id="profileImg' + i + '" method="post" enctype="multipart/form-data">';
            tmp +=          '<img class="pull-right" id="image_section' + i + '" src="" alt="your image" style="width: 40px;height: 40px"/>';
            tmp +=      '</form>';
            tmp +=     '</div>';
            tmp +=     '<div class="col-md-10">';
            if(response.data[i].status == "2"){
                tmp +=      '<i class="fa fa-lock" style="padding-left: 3px;padding-right: 3px"></i>';
            }
            tmp +=      '<label id="nickName' + i + '"></label>';
            tmp +=      '<label id="userId' + i + '" style="color: #6e696e"></label> - <label id="writeDateFormat' + i + '"></label> <br/>';
            tmp +=      '<lable id="contents' + i + '"></label><br>';
            tmp +=     '</div>';
            tmp +=     '</div>';


            console.log(tmp)
            $('#div_reply').append(tmp);

            $('#nickName' + i).text(response.data[i].memNick);
            $('#userId' + i).text(response.data[i].memNo);
            $('#writeDateFormat' + i).text(response.data[i].writeDate);
            $('#contents' + i).text(response.data[i].contents);
            $('#image_section' + i).prop("src" ,common.profileImage(PHOTO_SERVER_URL,response.data[i].profileImage,memSex));

            $('#clipReplyModal').modal("show");
        }

    }

</script>


<script id="tmp_codeDefine" type="text/x-handlebars-template">
    <select name="slctType" id="slctType" class="form-control">
        {{#each this as |sub|}}
        <option value="{{sub.value}}">{{sub.code}}</option>
        {{/each}}
    </select>
</script>




<!-- 탭 -->
<script>
    var tabId = 'tab_all';

    /** 텝 클릭 이벤트 */
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');

        if(tabId == 'headerInfo'){
            return;
        }

        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType));
        $("#txt_search").val("");
        $("#headerInfo").html("");
        $("#headerInfo").hide();

        if(tabId == 'tab_all'){         //클립 관리 (전체)
            $("input:radio[name='slctType']:radio[value='-1']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            $("#div_searchArea").show();
            $(".date").hide();
            $("#div_stepButtonArea").hide();

            initClipHistory();
        }
        radioChange();
        $(".searchDate").html($("#onedayDate").val());
        $("#bt_search").click();
    });

    /** 조회 이벤트 */
    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        }
        if(tabId == 'tab_all'){
            getHistory();
        }
    });
</script>


<!-- 검색조건 -->
<script>
    // <script type="text/javascript">
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(function(){
        $("#isChoiceDateArea").append(util.getCommonCodeRadio(-1, clip_isChoiceDate));
        $("#slctTypeArea").append(util.getCommonCodeRadio(-1, clip_slctType));
        // $("#slctTypeArea").find("input:radio[name='slctType'][value='3']").parent().attr('style', 'display:none !important');

        $("#search_platform_aria").html(util.getCommonCodeSelect(-1, clip_platform));
        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType));

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                $("#bt_search").click();
            };
        });

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

        $('#monthDate').datepicker({
            minViewMode: 'months',
            format: 'yyyy.mm',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });

        $("#monthDate").on('change', function () {
            var monthLastDate = new Date($("#monthDate").val().substr(0,4),$("#monthDate").val().substr(5,6),-1);
            $("#startDate").val($("#monthDate").val() + '.01');
            $("#endDate").val($("#monthDate").val() + "." +  (monthLastDate.getDate() + 1));
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        });

        $('#yearDate').datepicker({
            minViewMode: 'years',
            format: 'yyyy',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });
        $("#yearDate").on('change', function () {
            $("#startDate").val($("#yearDate").val() + '.01.01');
            $("#endDate").val($("#yearDate").val() + ".12.31");
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        });

        // setRangeDatepicker(moment().format("YYYY.MM.01"), moment())
        setRangeDatepicker(moment(), moment())

        $("#tab_all").click();

    });

    function setRangeDatepicker(startDate, endDate){
        $('#rangeDate').daterangepicker({
            startDate: startDate,
            endDate: endDate
        }, function(startDate,endDate){
            $("#startDate").val(moment(startDate).format("YYYY.MM.DD"));
            $("#endDate").val(moment(endDate).format("YYYY.MM.DD"));
            $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            $("#bt_search").click();
        });
    }

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }
    function setRangeDate(displayDate, startDate, endDate){
        $("#startDate").val(startDate);
        $("#endDate").val(endDate);
        $("#onedayDate").val(startDate);
        $("#monthDate").val(startDate.substr(0,7));
        $("#yearDate").val(startDate.substr(0,4));
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        radioChange();
        $("#bt_search").click();
    });

    $(document).on('change', 'input[name="isChoiceDate"]', function(){
        var type = $(this).val();

        if(type == -1){ // 전체
            $(".date").hide();
        }else{
            radioChange();
        }

        $("#bt_search").click();
    });

    $(document).on('click', '#search_testId', function(){
        $("#bt_search").click();
    });



    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        if(tabId == 'tab_total'){
            toDay = week[moment(new Date()).day()];
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
            setTimeDate(dateTime);
        }else if(tabId == 'tab_history'){
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
            setTimeDate(dateTime);
        }else if(tabId == 'tab_notice'){
            $("input:radio[name='slctType']:radio[value='1']").prop('checked', true);
        }
        radioChange();
        $("#bt_search").click();
    });

    function radioChange(){
        if($('input[name="isChoiceDate"]:checked').val() == -1){
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#rangeDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
            return;
        }

        if($('input[name="slctType"]:checked').val() == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#rangeDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
        }else{
            if($('input[name="slctType"]:checked').val() == 1){
                // 일별 -----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").show();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#monthDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#monthDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
            }else if($('input[name="slctType"]:checked').val() == 3){
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").show();

                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#rangeDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
                setRangeDatepicker($("#startDate").val(), $("#endDate").val());

                var rangeDate = $("#rangeDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                }

                $("._searchDate").html($("#startDate").val() + ' - ' + $("#endDate").val());
            }else{
                // 월별 ----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").show();

                var yearDate = new Date();
                $("#startDate").val(yearDate.getFullYear() + '.01.01');
                $("#endDate").val(yearDate.getFullYear() + ".12.31");
                $("#yearDate").val(yearDate.getFullYear());
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
            }
        }
    }

    function searchDate(dateType){
        if($('input[name="slctType"]:checked').val() == 0){ //시간별 , 일간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD') + " (" + toDay + ")");
                $("#onedayDate").val(moment(new Date()).format('YYYY.MM.DD'));
            }else if(dateType == 'prev'){
                setDay(-1);
            }else{
                setDay(1);
            }
        }else if($('input[name="slctType"]:checked').val() == 1){ // 월간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
                $("#monthDate").val(moment(new Date()).format('YYYY.MM'));
            }else if(dateType == 'prev'){
                setMonth(-1);
            }else if(dateType == 'next'){
                setMonth(1);
            }
        }else if($('input[name="slctType"]:checked').val() == 2){ // 연간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#yearDate").val(moment(new Date()).format('YYYY'));
            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }else if($('input[name="slctType"]:checked').val() == 3){ // PUSH 발송 이력 달력
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD') + " (" + toDay + ")");
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            }else if(dateType == 'prev'){
                setRangeDay(-1);
            }else if(dateType == 'next'){
                setRangeDay(1);
            }
        }
        $("#bt_search").click();
    }

    function setDay(days){
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());
        $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        $("#onedayDate").val($("#startDate").val());
    }

    function setMonth(months){
        $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
        $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        $("#monthDate").val(moment($("#startDate").val()).format('YYYY.MM'));
    }

    function setYear(years){
        $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
        $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        $("#yearDate").val(moment($("#startDate").val()).format('YYYY'));
    }

    function setRangeDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));

        setRangeDatepicker($("#startDate").val(), $("#endDate").val())

        $("._searchDate").html($("#startDate").val() + ' - ' + $("#endDate").val());
        $("#rangeDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
    }



</script>