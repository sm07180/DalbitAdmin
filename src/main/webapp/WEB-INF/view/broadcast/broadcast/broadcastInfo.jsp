<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .lable_height{
        height: 34px;
    }

</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <label style="height: 30px;"> ㆍ라이브 중인 방송 정보를 확인하고, 부득이한 상황시 방송 컨트롤 할 수 있습니다.</label>
            <button type="button" id="bt_broadcastGo" class="btn-xs">방송방 입장하기</button>
        </div>
        <div class="widget-content row col-lg-12 form-inline">
            <div class="form-horizontal">
                <div class="col-md-12 no-padding">
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding"><label class="control-label">배경 이미지</label></div>
                        <div class="col-md-9 no-padding">
                            <form id="profileImg" method="post" enctype="multipart/form-data">
                                <img id="image_section" src="#" alt="your image" style="width: 134px;height: 134px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                                <button type="button" id="bt_img" class="btn pull-right btn-info">이미지초기화</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding"><label>입장제한</label></div>
                        <div class="col-md-9 no-padding">
                            <label class="radio-inline"><input type="radio" name="radio_entry" value="0" checked>전체</label>
                            <label class="radio-inline"><input type="radio" name="radio_entry" value="1">펜만입장</label>
                            <label class="radio-inline"><input type="radio" name="radio_entry" value="2">20세이상</label>
                            <button type="button" id="bt_entry" class="btn pull-right btn-info">변경</button>
                        </div>
                        <div class="col-md-3 no-padding"><label>얼리기</label></div>
                        <div class="col-md-9 no-padding">
                            <label class="radio-inline"><input type="radio" name="radio_freezing" value="0" checked>얼리기</label>
                            <label class="radio-inline"><input type="radio" name="radio_freezing" value="1">해제</label>
                            <button type="button" id="bt_freezing" class="btn pull-right btn-info">변경</button>
                        </div>
                        <div class="col-md-3 no-padding"><label>방송강제종료</label></div>
                        <div class="col-md-9 no-padding">
                            <label class="radio-inline"><input type="radio" name="radio_forcedExit" value="0" checked>유지</label>
                            <label class="radio-inline"><input type="radio" name="radio_forcedExit" value="1">강제종료</label>
                            <button type="button" id="bt_forcedExit" class="btn pull-right btn-info">변경</button>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>방송상태</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <i class="fa fa-comment"></i><label id="lb_status">방송ON-통화중</label>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 no-padding">
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding"><label>환영 인사말</label></div>
                        <div class="col-md-9 no-padding" style="height: 68px">
                            <textarea type="textarea" class="form-control" id="txt_msgWelcom" style="height: 68px"></textarea>
                            <button type="button" id="bt_msgWelcom" class="btn pull-right btn-info">삭제</button>
                        </div>
                    </div>
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding lable_height"><label>마이크</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <i class="fa fa-comment"></i><label id="lb_mic">ON</label>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>게스트 / 게스트 ID</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <i class="fa fa-comment"></i><label>yes - </label> <label id="lb_guest">dalbit00</label>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 no-padding">
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding lable_height"><label>방송 주제</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <form id="cob_level">
                                <select class="form-control" id="selectSubject_type">
                                    <option value="9999" selected="selected">선택하세요</option>
                                </select>
                            </form>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 제목</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <input type="text" class="form-control col-md-12" id="txt_title">
                            <button type="button" id="bt_title" class="btn pull-right btn-info">변경</button>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>DJ 회원번호</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <label id="lb_memNo">123123123123</label>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>DJ ID</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <label id="lb_memId">123123123123/다달이</label>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>DJ 닉네임</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <label id="lb_memNick">다달이</label>
                        </div>
                        <div class="col-md-3 no-padding lable_height"><label>DJ 성별</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                            <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                        </div>
                    </div>
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding lable_height"><label>매니저</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_manegerCnt">총0건</label></div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 중 강제퇴장</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_forceKickCnt">총0건</label></div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 플랫폼</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_platform">PC (Crome)</label></div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 시작일</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_live_stDate">2020-02-10 13:43:10</label></div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 종료일시</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_live_edDate">2020-02-10 13:43:10</label></div>
                        <div class="col-md-3 no-padding lable_height"><label>방송 진행시간</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_time">2:30:40</label></div>
                    </div>
                </div>

                <div class="col-md-12 no-padding">
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding" style="height: 142px;"><label>운영자 메모</label></div>
                        <div class="col-md-9 no-padding">
                            <label id="lb_adminMemoCnt">등록 : 0건</label>
                            <button type="button" id="bt_adminMemoList" class="btn pull-right btn-info">자세히</button>
                        </div>
                        <div class="col-md-9 no-padding">
                            <textarea type="textarea" class="form-control" id="txt_adminMemo" style="height: 110px"></textarea>
                            <button type="button" id="bt_adminMemo" class="btn pull-right btn-info">등록</button>
                        </div>
                    </div>
                    <div class="col-md-6 no-padding">
                        <div class="col-md-3 no-padding lable_height"><label>최근 정보 수정일시</label></div>
                        <div class="col-md-9 no-padding lable_height">
                            <div class="col-md-10 no-padding"><label id="lb_editDate">2020-02-10 13:43:10</label></div>
                            <div class="col-md-2"><button type="button" id="bt_editDate" class="btn pull-right btn-info">자세히</button></div>
                        </div>
                        <div class="col-md-3 no-padding lable_height" style="height: 68px;"><label>최근 정보 수정 처리자</label></div>
                        <div class="col-md-9 no-padding lable_height"><label id="lb_editUser">DaldalE</label></div>
                    </div>
                </div>
            </div>
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
        <form id="detailForm" class="hide"></form>
    </div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
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

    var roomNo;
    var backImgDel;

    var obj = new Object();
    obj.type = "subject_type";
    getAjaxData("type", "/rest/broadcast/broadcast/type",obj, fn_code_list_success, fn_fail);

    function fn_code_list_success(dst_id, response){
        dalbitLog(response);

        if(response.data[0].type == "subject_type"){
            var template = $('#subject_type_Select').html();
            var templateScript = Handlebars.compile(template);
            var context = response;
            var html = templateScript(context);
            $("#selectSubject_type").append(html);
        }
    }
    function aa (){
        console.log("@@");
    }
    function getBroadCast_info(index){
        console.log("@@");
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.roomNo = data.roomNo;
        getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success, fn_fail);
    }

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
        $('input:radio[name=radio_entry]:input[value=' + response.data[0].typeEntry + ']').prop("checked", true);
        $('input:radio[name=radio_gender]:input[value=' + response.data[0].memSex + ']').prop("checked", true);
        $('input:radio[name=radio_freezing]:input[value=' + response.data[0].freezing + ']').prop("checked", true);
        $('input:radio[name=radio_guest]:input[value=' + response.data[0].guestOn + ']').prop("checked", true);
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
<script id="subject_type_Select" type="text/x-handlebars-template">
    {{#data}}
    <option value="{{value}}">{{code}}</option>
    {{/data}}
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