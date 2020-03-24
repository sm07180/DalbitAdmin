<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <form id="detailFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <img id="image_full_size" src="#" alt="your image" style="max-width: 1000px;max-height: 1000px;">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $(document).ready(function() {
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getSearch();
            };
        });
        $('input[id="txt_broad"]').keydown(function() {
            if (event.keyCode === 13) {
                getSearch();
            };
        });
        // 버튼 시작
        $('#bt_img').click(function() {                     // 배경이미지 초기화
            bt_click(this.id);
        });
        $('#bt_entry').click(function() {                   // 입장제한
            bt_click(this.id);
        });
        $('#bt_freezing').click(function() {                // 얼리기 변경
            bt_click(this.id);
        });
        $('#bt_forcedExit').click(function() {              // 방 강제종료
            bt_click(this.id);
        });
        $('#bt_msgWelcom').click(function() {               // 환영메시지 변경
            bt_click(this.id);
        });
        $('#bt_title').click(function() {                   // 방송제목 변경
            bt_click(this.id);
        });
        $('#bt_adminMemo').click(function() {               // 운영자메모 변경
            bt_click(this.id);
        });

        $('#bt_adminMemoList').click(function() {          // 운영자메모 자세히보기
            getInfoDetail(this.id,"운영자 메모");
        });
        $('#bt_editDate').click(function() {               // 정보수정내역
            getInfoDetail(this.id,"정보수정내역");
        });

        $('#bt_editHistory').click(function() {
        });

        // 버튼 끝
    })

    $("#subjectType").html(util.getCommonCodeSelect(1, subject_type, "Y"));
    $("#dj_memSex").html(util.getCommonCodeRadio(2, gender, "Y"));
    $("#entryType").html(util.getCommonCodeRadio(-1, entry));
    $("#freezeMsg").html(util.getCommonCodeRadio(1, freezing));
    $("#forcedQuit").html(util.getCommonCodeRadio(1, forcedExit));

    function getBroadCast_info_popup(tmp,state){
        if(state == "4" || state == "5"){
            $('#bt_broadcastGo').hide();
            $('#bt_img').hide();
            $('#bt_entry').hide();
            $('#bt_freezing').hide();
            $('#bt_forcedExit').hide();
            $('#bt_msgWelcom').hide();
            $('#bt_title').hide();
        }
        var obj = new Object();
        obj.room_no = tmp;
        util.getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success, fn_fail);
    }
    var room_no;            // 팝업에서 사용하기 위해 여기에 선언
    function info_sel_success(dst_id, response) {
        var template = $('#tmp_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#detailFrm").html(html);

        // 상단 목록 클릭시 detail 재 조회
        $("#tablist_con").find('.active').find('a').click();
    }
    function fullSize(url) {     // 이미지 full size
        console.log("url : " + url);
        $("#image_full_size").prop("src", url);
    }

    function getInfoDetail(tmp,tmp1) {
        console.log("tmp : "  + tmp + " / tmp1 : " + tmp1);
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        $("#detailForm").addClass("show");
        var template = $('#tmp_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#detailForm").html(templateScript);

        $('#tab_infoDetail').text(tmp1);           //텝 이름 변경
        var source = BroadcastDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.changeReload(null,null,source,null);
    }

    function bt_click(tmp) {
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }


</script>

<script id="tmp_detailFrm" type="text/x-handlebars-template">
    <div class="col-lg-12 no-padding">
        <label style="height: 30px;"> ㆍ라이브 중인 방송 정보를 확인하고, 부득이한 상황시 방송 컨트롤 할 수 있습니다.</label>
        {{#equal broadcastState 'ON'}}<button type="button" id="bt_broadcastGo" class="btn btn-default btn-sm pull-right">방송방 입장하기</button>{{/equal}}
    </div>
    <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
        <colgroup>
            <col width="10%"/><col width="40%"/><col width="10%"/><col width="40%"/>
        </colgroup>
        <tbody>
        <tr>
            <th rowspan="5">배경 이미지</th>
            <td rowspan="5">
                <form id="profileImg" method="post" enctype="multipart/form-data">
                    <img id="image_section" src="{{renderImage backgroundImage}}" alt="your image" style="width: 134px;height: 134px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                </form>
                <button type="button" id="bt_img" class="btn btn-default btn-sm pull-right">이미지초기화</button>
            </td>
        <tr>
            <th>입장제한</th>
            <td style="text-align: left">
                {{{getCommonCodeRadio entryType 'entry'}}}
                <button type="button" id="bt_entry" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
        </tr>
        <tr>
            <th>얼리기</th>
            <td style="text-align: left">
                {{{getCommonCodeRadio freezeMsg 'freezing'}}}
                <button type="button" id="bt_freezing" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
        </tr>
        <tr>
            <th>방송강제종료</th>
            <td style="text-align: left">
                {{{getCommonCodeRadio forcedQuit 'forcedExit'}}}
                <button type="button" id="bt_forcedExit" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
        </tr>
        <tr>
            <th>방송상태</th>
            <td style="text-align: left">
                <i class="fa fa-comment"></i>{{broadcastState}}
            </td>
        </tr>
        </tr>
        <tr>
            <th rowspan="3">환영 인사말</th>
            <td rowspan="3" style="text-align: left">
                <textarea type="textarea" class="form-control" id="welcomeMsg" style="width: 90%;height: 40px">{{welcomeMsg}}</textarea>
                <button type="button" id="bt_msgWelcom" class="btn btn-default btn-sm pull-right">삭제</button>
            </td>
        <tr>
            <th>마이크</th>
            <td style="text-align: left"><i class="fa fa-comment"></i>{{micState}}</td>
        </tr>
        <tr>
            <th>게스트 / 게스트 ID</th>
            <td style="text-align: left"><i class="fa fa-comment"></i>
                {{guestState}} / {{guest_userId}}
            </td>
        </tr>
        </tr>
        <tr>
            <th>방송 주제</th>
            <td style="text-align: left">{{{getCommonCodeSelect subjectType 'subject_type'}}}</td>
            <th>매니저</th>
            <td style="text-align: left">{{managerCnt}}</td>
        </tr>
        <tr>
            <th>방송 제목</th>
            <td style="text-align: left">
                <input type="text" class="form-control col-md-12" id="title" style="width: 90%;" value="{{title}}">
                <button type="button" id="bt_title" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
            <th>방송 중 강제퇴장</th>
            <td style="text-align: left">{{forcedLeaveCnt}}</td>
        </tr>
        <tr>
            <th>DJ 회원번호</th>
            <td style="text-align: left">{{dj_mem_no}}</td>
            <th>방송 플랫폼</th>
            <td style="text-align: left">{{osType}}</td>
        </tr>
        <tr>
            <th>DJ ID</th>
            <td style="text-align: left">{{dj_userId}}</td>
            <th>방송 시작일</th>
            <td style="text-align: left">{{startDate}}</td>
        </tr>
        <tr>
            <th>DJ 닉네임</th>
            <td style="text-align: left">{{dj_nickName}}</td>
            <th>방송 종료일시</th>
            <td style="text-align: left">{{endDate}}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td style="text-align: left">{{dj_memSex}}</td>
            <th>방송 진행시간</th>
            <td style="text-align: left">
                {{airTime}}
                <button type="button" id="bt_broadcastTime" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        <tr>
            <th rowspan="2">운영자메모</th>
            <td rowspan="1" style="text-align: left">
                {{opMemoCnt}}
                <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
            <th>방송 정보 수정일시</th>
            <td style="text-align: left">{{lastOpDate}}</td>
        </tr>
        <tr>
            <td style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 90px"></textarea>
                <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
            <th>방송 정보 수정 처리자</th>
            <td style="text-align: left">
                {{lastOpName}}
                <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        </tbody>
    </table>
</script>