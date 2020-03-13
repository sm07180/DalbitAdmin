<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding">
    <label style="height: 30px;"> ㆍ라이브 중인 방송 정보를 확인하고, 부득이한 상황시 방송 컨트롤 할 수 있습니다.</label>
    <button type="button" id="bt_broadcastGo" class="btn btn-default btn-sm pull-right">방송방 입장하기</button>
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
                    <img id="image_section" src="#" alt="your image" style="width: 134px;height: 134px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                    <button type="button" id="bt_img" class="btn btn-default btn-sm pull-right">이미지초기화</button>
                </form>
            </td>
            <tr>
                <th>입장제한</th>
                <td style="text-align: left">
                    <span id="entry"></span>
                    <button type="button" id="bt_entry" class="btn btn-default btn-sm pull-right">변경</button>
                </td>
            </tr>
            <tr>
                <th>얼리기</th>
                <td style="text-align: left">
                    <span id="freezing"></span>
                    <button type="button" id="bt_freezing" class="btn btn-default btn-sm pull-right">변경</button>
                </td>
            </tr>
            <tr>
                <th>방송강제종료</th>
                <td style="text-align: left">
                    <span id="forcedExit"></span>
                    <button type="button" id="bt_forcedExit" class="btn btn-default btn-sm pull-right">변경</button>
                </td>
            </tr>
            <tr>
                <th>방송상태</th>
                <td style="text-align: left">
                    <i class="fa fa-comment"></i><label id="lb_status">방송ON-통화중</label>
                </td>
            </tr>
        </tr>
        <tr>
            <th rowspan="3">환영 인사말</th>
            <td rowspan="3" style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_msgWelcom" style="width: 90%;height: 60px"></textarea>
                <button type="button" id="bt_msgWelcom" class="btn btn-default btn-sm pull-right">삭제</button>
            </td>
            <tr>
                <th>마이크</th>
                <td style="text-align: left"><i class="fa fa-comment"></i><label id="lb_mic">ON</label></td>
            </tr>
            <tr>
                <th>게스트 / 게스트 ID</th>
                <td style="text-align: left"><i class="fa fa-comment"></i><label>yes - </label> <label id="lb_guest">dalbit00</label></td>
            </tr>
        </tr>
        <tr>
            <th>방송 주제</th>
            <td style="text-align: left"><span id="subject_type"></span></td>
            <th>매니저</th>
            <td style="text-align: left"><label id="lb_manegerCnt"></label></td>
        </tr>
        <tr>
            <th>방송 제목</th>
            <td style="text-align: left">
                <input type="text" class="form-control col-md-12" id="txt_title" style="width: 90%;">
                <button type="button" id="bt_title" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
            <th>방송 중 강제퇴장</th>
            <td style="text-align: left"><label id="lb_forceKickCnt"></label></td>
        </tr>
        <tr>
            <th>DJ 회원번호</th>
            <td style="text-align: left"><label id="lb_memNo">123123123123</label></td>
            <th>방송 플랫폼</th>
            <td style="text-align: left"><label id="lb_platform">PC (Crome)</label></td>
        </tr>
        <tr>
            <th>DJ ID</th>
            <td style="text-align: left"><label id="lb_memId">다달이</label></td>
            <th>방송 시작일</th>
            <td style="text-align: left"><label id="lb_live_stDate">2020-02-10 13:43:10</label></td>
        </tr>
        <tr>
            <th>DJ 닉네임</th>
            <td style="text-align: left"><label id="lb_memNick">다달이</label></td>
            <th>방송 종료일시</th>
            <td style="text-align: left"><label id="lb_live_edDate">2020-02-10 13:43:10</label></td>
        </tr>
        <tr>
            <th>성별</th>
            <td style="text-align: left"><span id="gender"></span></td>
            <th>방송 진행시간</th>
            <td style="text-align: left">
                <label id="lb_broadcastTime"></label>
                <button type="button" id="bt_broadcastTime" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        <tr>
            <th rowspan="2">운영자메모</th>
            <td rowspan="1" style="text-align: left">
                <label id="lb_adminMemoCnt"></label>
                <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
            <th>방송 정보 수정일시</th>
            <td style="text-align: left"><label id="lb_editDate"></label></td>
        </tr>
        <tr>
            <td style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 90px"></textarea>
                <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right">변경</button>
            </td>
            <th>방송 정보 수정 처리자</th>
            <td style="text-align: left">
                <label id="lb_editUser"></label>
                <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
    </tbody>
</table>

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
<form id="detailForm" class="hide"></form>

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
        // 버튼 끝
    })

    $("#subject_type").html(getCommonCodeSelect(1, subject_type, "Y"));
    $("#gender").html(getCommonCodeRadio(2, gender, "Y"));
    $("#entry").html(getCommonCodeRadio(-1, entry));
    $("#freezing").html(getCommonCodeRadio(1, freezing));
    $("#forcedExit").html(getCommonCodeRadio(1, forcedExit));

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
        obj.roomNo = tmp;
        getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success, fn_fail);
    }

    function info_sel_success(dst_id, response) {
        dalbitLog(response);
        roomNo = response.data[0].roomNo;

        console.log("response.data.type : " + response.data[0].type);
        $("#selectSubject_type").val(response.data[0].type);
        $("#txt_title").val(response.data[0].title);
        $("#lb_djID").html(response.data[0].memNo + "/" + response.data[0].memId);
        $("#lb_djNickname").html(response.data[0].memNick);
        $("#txt_msgWelcom").val(response.data[0].msgWelcom);
        $("#lb_live").html(response.data[0].state);
        $("#lb_live_stDate").html(response.data[0].liveSt);
        $("#lb_live_edDate").html(response.data[0].liveEd);
        $("#lb_platform").html(response.data[0].platform);
        $("#lb_editDate").html(response.data[0].infoEditDate);
        $("#lb_editUser").html(response.data[0].infoEditNm);
        $("#lb_likeCnt").html("총"+response.data[0].goodCnt+"건");
        $("#lb_manegerCnt").html("총"+response.data[0].manegerCnt+"건");
        $("#lb_giftCnt").html("총"+response.data[0].giftCnt+"건");
        $("#lb_guestCnt").html("총"+response.data[0].guestCnt+"건");
        $("#lb_storyCnt").html("총"+response.data[0].contentsCnt+"건");
        $("#lb_banCnt").html("총"+response.data[0].banCnt+"건");
        $("#lb_listenerCnt").html("총"+response.data[0].listenCnt+"건");
        $("#lb_forceKickCnt").html("총"+response.data[0].forceKickCnt+"건");
        $('input:radio[name=entry]:input[value=' + response.data[0].typeEntry + ']').prop("checked", true);
        $('input:radio[name=gender]:input[value=' + response.data[0].memSex + ']').prop("checked", true);
        $('input:radio[name=freezing]:input[value=' + response.data[0].freezing + ']').prop("checked", true);
        $("#image_section").prop("src", IMAGE_SERVER_URL + response.data[0].backgroundImage);

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
            data.memNo = memNo;
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
<!-- info detail -->
<script id="tmp_detailFrm" type="text/x-handlebars-template">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active" id="detail"><a href="#infoDetail" role="tab" data-toggle="tab" id="tab_infoDetail"></a></li>
        </ul>
        <div class="tab-content" style="padding-top: 0px;">
            <div class="tab-pane fade in active" id="infoDetail">
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
        </div>
    </div>
</script>