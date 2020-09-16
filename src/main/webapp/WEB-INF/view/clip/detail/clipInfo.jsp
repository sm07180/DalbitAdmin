<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<!-- 클립상세정보 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <!-- detail -->
        <form id="memberInfoFrm"></form>

        <!-- detail -->
        <form id="member_detailFrm" class="hide"></form>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script>
    function getClipDetailInfo(){
        var data = new Object();
        data.cast_no = clipNo;

        util.getAjaxData("clipDetailInfo", "/rest/clip/history/info", data, fn_detailInfo_select_success);
    }

    var clipInfoData = "";

    function fn_detailInfo_select_success(dst_id, response, dst_params) {
        dalbitLog(response);
        clipInfoData = response.data;

        var template = $('#tmp_memberInfoFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#memberInfoFrm").html(html);

        getClipSubjectTypeCodeDefine();

        initWithdrawalUI();
    }

    // 탈퇴회원 UI 초기화
    function initWithdrawalUI(){
        if(clipInfoData.isWithdrawal == 0){
            return;
        }

        // 탈퇴회원 버튼 숨기기
        $("#memberInfoFrm").find("button").each(function(){
            if($(this).prop("id").startsWith("bt_edit")){
                $(this).hide();
            }
        })

    }

// ============================================================== 버튼 이벤트
    // 버튼 이벤트 처리
    $("#memberInfoFrm").on("click", "button", function(){
        var eventId = $(this).prop("id");
        // alert(eventId)

        if(eventId == "bt_edit_nick"){ // 닉네임 초기화
            if(confirm("닉네임을 초기화 하시겠습니까?")){
                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 2;
                data.nickName = clipInfoData.cast_userId;
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        // 클립 이미지 초기화
        if(eventId == "bt_edit_clipImg"){
            if(confirm("클립 이미지를 초기화 하시겠습니까?")){
                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 1;
                data.backgroundImage = "/clip_3/clipbg_200910_0.jpg";
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        // 클립 제목 초기화
        if(eventId == "bt_edit_title"){
            if(confirm("클립 제목을 초기화 하시겠습니까?")){
                var nick = clipInfoData.cast_nickName;

                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 6;
                data.title = nick.length > 11 ? nick.substr(0, 8) + "..." : nick + "님의 클립입니다.";
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        // 클립 경고/정지 처리
        if(eventId == "bt_edit_report"){
            var report = "/member/member/popup/reportPopup?"
                + "memNo=" + encodeURIComponent(clipInfoData.cast_mem_no)
                + "&memId=" + encodeURIComponent(clipInfoData.cast_userId)
                + "&memNick=" + encodeURIComponent(common.replaceHtml(clipInfoData.cast_nickName))
                + "&memSex=" + encodeURIComponent(clipInfoData.cast_memSex)
                + "&deviceUuid=" + clipInfoData.cast_deviceUuid
                + "&ip=" + clipInfoData.cast_ip;

            console.log(report);
            util.windowOpen(report,"750","910","경고/정지");
        }

        // 클립 숨기기 처리
        if(eventId == "bt_edit_hide"){
            var hideType = $(this).data("hide") == 0 ? 1 : 0;

            if(confirm("클립 " + ((hideType === 1) ? "숨기기" : "숨기기 해제") + "를 진행 하시겠습니까?")){
                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 5;
                data.hide = hideType;
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        // 클립 삭제 처리
        if(eventId == "bt_edit_state"){
            if(confirm("클립 삭제 하시겠습니까?")){
                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 4;
                data.state = 5;
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        //공개 비공개 여부 수정
        if(eventId == "bt_edit_view"){
            if(confirm("공개 여부를 수정 하시겠습니까?")){
                var openType = $(this).data("opentype");

                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 3;
                data.openType = openType === 1 ? 0 : 1;
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        //클립 주제 변경
        if(eventId == "bt_edit_subject"){
            if($("#clipSubjectType").val() == clipInfoData.subjectType){
                alert("동일한 클립 주제입니다.");
                return false;
            }

            if(confirm("클립 주제를 수정 하시겠습니까?")){
                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 7;
                data.subjectType = $("#clipSubjectType").val();
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        //운영자 인증 여부
        if(eventId == "bt_edit_opCheck"){
            if(confirm("운영자 관리 여부를 수정 하시겠습니까?")){
                var confirmData = $(this).data("confirm");

                var data = Object();
                data.cast_no = clipNo;
                data.editSlct = 8;
                data.confirm = confirmData === 1 ? 0 : 1;
                data.sendNoti = 0;

                editClipDetailData(data);
            }
        }

        if(eventId == "bt_insert_memo"){    // 운영자 메모 등록
            if(common.isEmpty($("#txt_adminMemo").val())){
                alert("운영자 메모를 입력하여 주세요.");
                return false;
            }

            var data = Object();
            data.cast_no = clipNo;
            data.notiMemo = $("#txt_adminMemo").val();

            addMemo(data);
        }

        if(eventId == "bt_detail_opName"){      // 수정 내역
            getAdminMemoList("bt_editHistory", "정보수정내역");
        }

        if(eventId == "bt_detail_memo"){      // 운영자 메모 디테일
            getAdminMemoList("bt_adminMemoList", "운영자메모");
        }


    });


// ==============================================================

    //클립 수정
    function editClipDetailData(data){
        util.getAjaxData("clipDetailInfoEdit", "/rest/clip/history/info/edit", data, fn_detailInfo_Edit_success);
    }

    function fn_detailInfo_Edit_success(dst_id, response, dst_params) {
        console.log(response);
        getClipDetailInfo();
        alert(response.message);
    }

    //운영자 메모
    function addMemo(data){
        util.getAjaxData("clipDetailInfoEdit", "/rest/clip/history/info/addmemo", data, fn_detailInfo_addMemo_success);
    }

    function fn_detailInfo_addMemo_success(dst_id, response, dst_params) {
        console.log(response);
        getAdminMemoList("bt_adminMemoList", "운영자메모");
        alert(response.message);

    }

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

    // 운영자 메모
    function getAdminMemoList(tmp,tmp1) {     // 상세보기
        var template = $('#tmp_member_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#member_detailFrm").html(templateScript);

        $('#tab_memberInfoDetail').text(tmp1);           //텝 이름 변경
        $('#member_detailFrm').addClass("show");
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }

        var source = ClipDetailDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            if(tmp == "editHistory"){
                data.cast_no = clipNo;
            }else{
                data.mem_no = clipNo;
            }
        };
        dtMemoList = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtMemoList.useCheckBox(true);
        dtMemoList.useIndex(true);
        dtMemoList.createDataTable();

        var scrollPosition = $("#tab_infoDetail").offset();
        util.scrollPostion(scrollPosition.top);

        var adminMemoDel = '<input type="button" value="삭제" class="btn btn-danger btn-sm" id="btn_adminMemoDel" style="margin-right: 3px;"/>';
        $("#memberInfoDetail").find(".footer-left").append(adminMemoDel);
        adminMemoDelInit();
    }

    function adminMemoDelInit(){
        $("#btn_adminMemoDel").on("click", function () { //운영자 메모 삭제
            adminMemoDel();
        });
    }

    function adminMemoDel(){
        if(dtMemoList.getCheckedData().length <= 0){
            alert("삭제할 메모를 선택해 주세요.");
            return;
        }
        var data = {};
        data.mem_no = clipNo;
        data.delList =  dtMemoList.getCheckedData();
        console.log(data);
        util.getAjaxData("adminMemoDel", "/rest/member/member/admin/memoDel",data, adminMemoDel_success);
    }

    function adminMemoDel_success(dst_id, response) {
        getAdminMemoList("bt_adminMemoList", "운영자메모");
        alert(response.message);
    }


    // 주제 공통 코드 조회
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

        $("#clipSubjectType").val(clipInfoData.subjectType);
    }

    function getMemNo_info_reload(memNo){
        getClipDetailInfo();
    }

</script>



<script id="tmp_memberInfoFrm" type="text/x-handlebars-template">

    <table class="table table-bordered table-dalbit borderBlack" style="margin-bottom: 0px;">
        <colgroup>
            <col width="12%"/>
            <col width="6%"/>
            <col width="6%"/>
            <col width="6%"/>
            <col width="6%"/>
            <col width="12%"/>
            <col width="12%"/>
            <col width="12%"/>
            <col width="12%"/>
            <col width="12%"/>
        </colgroup>
        <tbody>
        <tr>
            <th rowspan="4" colspan="1">
                클립 이미지
                <br><button type="button" id="bt_edit_clipImg" class="btn btn-default btn-sm no-margin" style="margin-left: 10px" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button>
            </th>
            <td rowspan="4" colspan="4" style="text-align: -webkit-center">
                <img id="image_section" class="thumbnail fullSize_background no-padding no-margin" src="{{viewImage backgroundImage}}" alt="your image" style="width: 150px;height: 150px" />
            </td>
        </tr>
        <tr>
            <th colspan="1">클립 상태</th>
            <td colspan="2" style="text-align: left; border-right-color:white;border-right-width:0px;">
                {{{getCommonCodeLabel state 'clip_stateType'}}}<br>
                {{#dalbit_if hide '==' 1}} 숨기기 중 ({{hideOpName}}) {{/dalbit_if}}
            </td>
            <td colspan="2">
                {{#dalbit_if state '==' 1}}
                    <button type="button" id="bt_edit_report" class="btn btn-default btn-sm pull-right">경고/정지</button>
                    <button type="button" id="bt_edit_state" class="btn btn-danger btn-sm pull-right mr15">삭제</button>
                    {{#dalbit_if hide '==' 1}}<button type="button" id="bt_edit_hide" class="btn btn-info btn-sm pull-right mr5" data-hide="{{hide}}">숨기기해제</button>{{/dalbit_if}}
                    {{#dalbit_if hide '==' 0}}<button type="button" id="bt_edit_hide" class="btn btn-danger btn-sm pull-right mr5" data-hide="{{hide}}">숨기기</button>{{/dalbit_if}}
                {{/dalbit_if}}
            </td>
        </tr>
        <tr>
            <th colspan="1">클립 제목</th>
            <td colspan="3" style="text-align: left; border-right-color:white;border-right-width:0px;">
                {{replaceHtml title}}
            </td>
            <td colspan="1">
                <button type="button" id="bt_edit_title" class="btn btn-default btn-sm no-margin pull-right" style="margin-left: 10px" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button>
            </td>
        </tr>
        <tr>
            <th colspan="1">클립 주제</th>
            <td colspan="3" style="text-align: left; border-right-color:white;border-right-width:0px; ">
                <select id="clipSubjectType" name="clipSubjectType" class="form-control pull-left"></select>
            </td>
            <td colspan="1">
                <button type="button" id="bt_edit_subject" class="btn btn-default btn-sm no-margin pull-right" style="margin-left: 10px" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
            </td>
        </tr>
        <tr>
            <th colspan="1">회원번호</th>
            <td colspan="4" style="text-align: left">
                <a href="javascript://" class="_openMemberPop" data-memno="{{cast_mem_no}}">{{cast_mem_no}}</a>
            </td>
            <th colspan="1">클립 등록일</th>
            <td colspan="4" style="text-align: left">{{startDate}}</td>
        </tr>
        <tr>
            <th colspan="1">회원 닉네임</th>
            <td colspan="3" style="text-align: left;border-right-color:white;border-right-width:0px;">
                {{cast_nickName}}
            </td>
            <td colspan="1">
                <button type="button" id="bt_edit_nick" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}" data-userId="{{userId}}">초기화</button>
            </td>
            <th colspan="1">클립 파일명</th>
            <td colspan="2" style="text-align: left; word-break:break-all">
                {{fileName}}
            </td>
            <th colspan="1">플랫폼</th>
            <td colspan="1" style="border-right-color:white;border-right-width:0px;">
                {{{getCommonCodeLabel osType 'clip_platformType'}}}
            </td>
        </tr>
        <tr>
            <th colspan="1">성별(나이)</th>
            <td colspan="4" style="text-align: left">{{{sexIcon cast_memSex cast_birth_year}}}</td>
            <th colspan="1">클립 용량</th>
            <td colspan="4" style="text-align: left">
                {{fileSize}}
            </td>
        </tr>
        <tr>
            <th colspan="1" rowspan="2">공개여부</th>
            <td colspan="4" rowspan="2" style="text-align: left;border-left-color:white;border-left-width:0px;">
                {{{getCommonCodeLabel openType 'clip_typeOpen_clipDetail'}}}
                <button type="button" id="bt_edit_view" class="btn btn-default btn-sm pull-right" data-openType="{{openType}}">
                    {{#dalbit_if openType '==' 0}} 공개 {{/dalbit_if}}
                    {{#dalbit_if openType '==' 1}} 비공개 {{/dalbit_if}}
                </button>
            </td>
            <th>좋아요 수</th>
            <th>선물 수</th>
            <th>선물 별 수</th>
            <th>청취 수</th>
            <th>댓글 수</th>
        </tr>
        <tr>
            <td style="text-align:center"><a href="javascript:$('#tab_good').click();">{{addComma goodCnt}} 건</a></td>
            <td style="text-align:center"><a href="javascript:$('#tab_gift').click();">{{addComma giftCnt}} 건</a></td>
            <td style="text-align:center"><a href="javascript:$('#tab_gift').click();">{{addComma giftedByeol}} 건</a></td>
            <td style="text-align:center"><a href="javascript:$('#tab_listen').click();">{{addComma playCnt}} 건</a></td>
            <td style="text-align:center"><a href="javascript:$('#tab_reply').click();">{{addComma boardCnt}} 건</a></td>
        </tr>
        <tr>
            <th colspan="1">클립재생</th>
            <td colspan="4">
                <a class="_openClipPlayerPop" id="play_{{castNo}}" data-clipNo="{{castNo}}" data-clipPath="{{filePath}}" href="javascript:;" >[ <i class="fa fa-play"></i> 듣기]</a> {{playTime}}
            </td>

            <th colspan="1">운영자 관리 여부</th>
            <td colspan="2" style="text-align: left">
                {{{getCommonCodeLabel confirm 'clip_confirmType'}}}
                <button type="button" id="bt_edit_opCheck" class="btn btn-default btn-sm pull-right" data-confirm="{{confirm}}">
                    {{#dalbit_if confirm '==' 0}} 인증 {{/dalbit_if}}
                    {{#dalbit_if confirm '==' 1}} 미인증 {{/dalbit_if}}
                </button>
            </td>
            <th colspan="1">인증 관리자</th>
            <td colspan="1" style="text-align: left">
                {{confirmOpName}}
            </td>
        </tr>
        <tr>
            <th colspan="2">클립정보 수정 처리자</th>
            <td colspan="7" style="text-align: left;border-right-color:white;border-right-width:0px;">
                {{lastOpName}}
            </td>
            <td colspan="1">
                <button type="button" id="bt_detail_opName" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}" data-userId="{{userId}}">자세히</button>
            </td>
        </tr>
        <tr>
            <th colspan="2" rowspan="2">
                <span class="pull-left pl10">
                운영자 메모<br>
                (등록: {{opMemoCnt}} 건)
                </span>
                <button type="button" id="bt_detail_memo" class="btn btn-default btn-sm pull-right">상세</button>
            </th>
            <td colspan="8" rowspan="2" style="text-align: left;">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 76px"></textarea>
                <button type="button" id="bt_insert_memo" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">등록</button>
            </td>
        </tr>
        </tbody>
    </table>
</script>


<!-- info detail -->
<script id="tmp_member_detailFrm" type="text/x-handlebars-template">
    <div class="widget-content mt5">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tab_infoDetail">
            <li class="active" id="detail1"><a href="#memberInfoDetail" role="tab" data-toggle="tab" id="tab_memberInfoDetail"></a></li>
            <li class="hide" id="detail2"><a href="#memberInfoDetail2" role="tab" data-toggle="tab" id="tab_memberInfoDetail2"></a></li>
        </ul>
        <div class="tab-content" style="padding-top: 0px;">
            <div class="tab-pane fade in active" id="memberInfoDetail">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="info_detail" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail">
                            </thead>
                            <tbody id="tableBody_detail">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="memberInfoDetail2">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="info_detail2" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail2">
                            </thead>
                            <tbody id="tableBody_detail2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>