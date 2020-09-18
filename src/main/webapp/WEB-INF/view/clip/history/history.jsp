<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 클립관리 > 클립내역관리 > 클립관리(전체/오늘) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate" style="display: none;"></span>
        <span id="select_clipTypeOpen" name="select_clipTypeOpen" class="pull-left ml5"></span>
        <span id="select_clipConfirmType" name="select_clipConfirmType" class="pull-left ml5"></span>
        <span id="select_clipStateType" name="select_clipStateType" class="pull-left ml5"></span>
        <select id="clipSubjectType" name="clipSubjectType" class="form-control pull-left ml5"></select>
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
    var beforeClipTypeOpen = 0;
    var beforeClipConfirmType = 0;
    var beforeClipStateType = 0;
    var beforeOrderByType = 0;
    var beforeClipSubjectType = -1;

    $(document).on('change', "#clipSubjectType, #clipOrderByType, #searchTypeOpen, #searchConfirm, #searchState", function(){
        beforeClipTypeOpen = $("#searchTypeOpen").val();
        beforeClipConfirmType = $("#searchConfirm").val();
        beforeClipStateType = $("#searchState").val();
        beforeOrderByType = $("#clipOrderByType").val();
        beforeClipSubjectType = $("#clipSubjectType").val();
        dtList_info.reload(selectCallback_clipHistoty, false);
    });

    $(function(){

    });

    function initClipHistory(){
        beforeClipTypeOpen = -1;
        beforeClipConfirmType = -1;
        beforeClipStateType = -1;
        beforeOrderByType = 0;
        beforeClipSubjectType = -1;
        $("#searchTypeOpen").val("-1");
        $("#searchConfirm").val("-1");
        $("#searchState").val("-1");
        $("#clipOrderByType").val("0");
        $("#clipSubjectType").val("-1");
    }

    function getHistory(){
        $("#select_clipTypeOpen").html(util.getCommonCodeSelect(beforeClipTypeOpen, clip_typeOpen_select));
        $("#select_clipConfirmType").html(util.getCommonCodeSelect(beforeClipConfirmType, clip_confirmType_select));
        $("#select_clipStateType").html(util.getCommonCodeSelect(beforeClipStateType, clip_stateType_select));
        $("#select_clipOrderByType").html(util.getCommonCodeSelect(beforeOrderByType, clip_orderByType));
        getClipSubjectTypeCodeDefine();

        initDataTable_clipHistory();
    }

    var dtList_info;
    function initDataTable_clipHistory() {
        //=---------- Main DataTable ----------
        var dtList_info_data = function (data) {
            data.searchTypeOpen = Number($("#searchTypeOpen").val());
            data.searchConfirm = Number($("#searchConfirm").val());
            data.searchState = Number($("#searchState").val());
            data.orderByType = Number($("#clipOrderByType").val());
            data.subjectType = Number(common.isEmpty($("#clipSubjectType").val()) ? "-1" : $("#clipSubjectType").val());
        };

        dtList_info = new DalbitDataTable($("#clip_history_list_info"), dtList_info_data, ClipHistoryDataTableSource.list, $("#searchForm"));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.usePageLenght(50);
        dtList_info.createDataTable(selectCallback_clipHistoty);

        //---------- Main DataTable ----------=
    };

    function selectCallback_clipHistoty(data){
        // 탭 우측 총 건수 추가
        var template = $("#tmp_headerInfo_clipHistory").html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html = templateScript(context);

        $("#headerInfo").html(html);
        $("#headerInfo").show();
        ui.paintColor();

        $(".top-right").css("padding", "0px");
        $("#clip_history_list_info_length").css("margin", "0px");
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
        var hideType = hide == 0 ? 1 : 0;
        if(confirm("클립 숨기기를 하는 경우 어드민에서 확인되지만 리스트에서는 본인외 타인에게 확인되지 않습니다. \n\n해당 클립을 "+ ((hideType === 1) ? "숨기기" : "숨기기 해제") +" 하시겠습니까?")){
            var data = Object();
            data.cast_no = clipNo;
            data.editSlct = 5;
            data.hide = hideType;
            data.sendNoti = 0;

            editClipDetailData(data);
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
        console.log(clipNo)
        if(confirm("해당 클립을 삭제 하시겠습니까?")){
            var data = new Object();
            data.cast_no = clipNo;

            util.getAjaxData("clipDetailInfo", "/rest/clip/history/info", data, fn_detailInfo_select_success);
        }
    }

    var clipInfoData = "";
    function fn_detailInfo_select_success(dst_id, response, dst_params) {
        dalbitLog(response);
        clipInfoData = response.data;
        openClipReportPopup();
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
                'targetClipNo' : $(this).data('cast_no')
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


    //클립 운영자 인증 요청
    function editClipConfirm(clipNo, confirmData){
        if(confirm("운영자 관리 여부를 수정 하시겠습니까?")) {
            var data = Object();
            data.cast_no = clipNo;
            data.editSlct = 8;
            data.confirm = confirmData === 1 ? 0 : 1;
            data.sendNoti = 0;

            editClipDetailData(data);
        }
    }

    //클립 수정
    var isAlertShow = true;
    function editClipDetailData(data, isAlert){
        isAlertShow = true;
        if(!common.isEmpty(isAlert)){
            isAlertShow = isAlert
        }

        util.getAjaxData("clipDetailInfoEdit", "/rest/clip/history/info/edit", data, fn_detailInfo_Edit_success);
    }

    function fn_detailInfo_Edit_success(dst_id, response, dst_params) {
        console.log(response);
        dtList_info.reload(selectCallback_clipHistoty, false);
        if(isAlertShow){alert(response.message)};
    }

    //클립 신고 팝업 오픈
    function openClipReportPopup(){
        var report = "/member/member/popup/reportPopup?"
            + "memNo=" + encodeURIComponent(clipInfoData.cast_mem_no)
            + "&memId=" + encodeURIComponent(clipInfoData.cast_userId)
            + "&memNick=" + encodeURIComponent(common.replaceHtml(clipInfoData.cast_nickName))
            + "&memSex=" + encodeURIComponent(clipInfoData.cast_memSex)
            + "&deviceUuid=" + clipInfoData.cast_deviceUuid
            + "&ip=" + clipInfoData.cast_ip;

        util.windowOpen(report,"750","910","clipReport");
    }

    // 클립 신고 팝업 완료 콜백 함수
    function getMemNo_info_reload(memNo){
        if(!common.isEmpty(clipInfoData)){
            var data = Object();
            data.cast_no = clipInfoData.castNo;
            data.editSlct = 4;
            data.state = 5;
            data.sendNoti = 0;

            editClipDetailData(data, false);
        }
        dtList_info.reload(selectCallback_clipHistoty, false);
    }

</script>


<script id="tmp_codeDefine" type="text/x-handlebars-template">
    <select name="slctType" id="slctType" class="form-control">
        {{#each this as |sub|}}
        <option value="{{sub.value}}">{{sub.code}}</option>
        {{/each}}
    </select>
</script>

<script type="text/x-handlebars-template" id="tmp_headerInfo_clipHistory">
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="16%"/><col width="16%"/><col width="16%"/>
                <col width="16%"/><col width="16%"/><col width="16%"/>
            </colgroup>
            <thead>
            <tr>
                <th colspan="6" class="_bgColor _fontColor" data-bgcolor="black" data-fontcolor="white">전체 클립 등록/삭제 수 : {{addComma pagingVo.totalCnt 'N'}} 건 ( {{addComma summary.delTotalCnt 'N'}} 건 )</th>
            </tr>
            <tr>
                <th colspan="2" class="_bgColor" data-bgcolor="#dae3f3">남성</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#fbe5d6">여성</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#FFF2CC">알수없음</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f2f2f2">등록</th>
                <th class="_bgColor" data-bgcolor="#f2f2f2">삭제</th>
                <th class="_bgColor" data-bgcolor="#f2f2f2">등록</th>
                <th class="_bgColor" data-bgcolor="#f2f2f2">삭제</th>
                <th class="_bgColor" data-bgcolor="#f2f2f2">등록</th>
                <th class="_bgColor" data-bgcolor="#f2f2f2">삭제</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{{addComma summary.manTotalCnt 'N'}} 건</td>
                <td>{{addComma summary.delManTotalCnt 'N'}} 건</td>
                <td>{{addComma summary.femaleTotalCnt 'N'}} 건</td>
                <td>{{addComma summary.delFemaleTotalCnt 'N'}} 건</td>
                <td>{{addComma summary.unknownTotalCnt 'N'}} 건</td>
                <td>{{addComma summary.delUnknownTotalCnt 'N'}} 건</td>
            </tr>
            </tbody>
        </table>
</script>