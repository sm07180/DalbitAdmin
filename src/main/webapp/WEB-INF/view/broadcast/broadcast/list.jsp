<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .text_middle{
        display:table-cell;
        vertical-align:middle
    }
    .p_10{
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }

</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 80px;height: 27px"> 방송검색 </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;" >
                <div class="col-lg-6 p_10" style="background: #f8efc0">
                    <div class="col-lg-12" >
                        <label style="font-weight: bold">방송 진행/청취 기간</label>
                    </div>
                    <div class="col-lg-12">
                        <form id="date_radio">
                            <label class="radio-inline"><input type="radio" name="radio_date" value="all" checked>전체</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="today">오늘</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="week">1주일</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="month">한달</label>
                        </form>
                    </div>

                    <div class="col-lg-12">
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel">기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-6 form-inline p_10">
                    <div class="col-lg-12 " >
                        <div class="col-lg-12">
                            <label style="font-weight: bold">로그인된 아이콘</label>
                        </div>
                    </div>
                    <div class="row col-lg-12 form-inline" >
                        <div class="col-lg-12">
                            <select class="form-control" id="selectSubject_type">
                                <option value="9999" selected="selected">방송주제</option>
                            </select>
                            <select class="form-control" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">DJ 닉네임</option>
                                <option value="2">DJ ID</option>
                                <option value="3">방송제목</option>
                            </select>

                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 100px;height: 27px"> 검색 결과 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px"> ㆍ방송 제목을 클릭하면 상세정보를 확인할 수 있습니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered datatable">
                            <span>
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                            </span>
                            <span style="float: right;">
                                <label id="list_cnt" class="text_middle well-sm" style="font-size: 12px;height: 27px;background: #bfbfbf">검색 결과 총0건</label>
                            </span>
                            <thead>
                            <tr>
                                <th>방번호</th>
                                <th>DJ ID</th>
                                <th>DJ 닉네임</th>
                                <th>방송주제</th>
                                <th>방송제목</th>
                                <th>방송시작 일시</th>
                                <th>생방상태</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <div class="row col-lg-12 form-inline " style="padding-top: 2px; padding-bottom: 0px;">
                <div class="col-lg-1 no-padding">
                    <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 120px;height: 27px"> 방송 상세정보 </label>
                </div>
                <div class="col-lg-5 no-padding">
                    <label class="text_middle" style="font-size: 11px;height: 27px;"> ㆍ방송상세정보를 수정하고 [수정완료] 버튼으로 변경된 정보를 반영합니다.</label>
                </div>
                <div class="col-lg-6 no-padding">
                    <button type="button" id="bt_edite" class="pull-right btn-xs form-control"  style="border-radius:3px;width: 80px;;height: 24px">수정하기</button>
                </div>
            </div>
            <div class="row col-lg-12 form-inline" style="padding-top: 0px;">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="widget-content row col-lg-12 form-inline">
                <div class="form-horizontal">
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">배경 이미지</label>
                            <div class="col-md-9">
                                <img id="backgroundImg" src="/template2/assets/img/profile-avatar.png" alt="Profile Picture" style="height:100px;">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">방송 주제</label>
                            <div class="col-md-9">
                                <form id="cob_level">
                                    <select class="form-control" id="selectSubject_type_detail">
                                        <option value="9999" selected="selected">선택하세요</option>
                                    </select>
                                </form>
                            </div>
                            <label class="col-md-3">방송 제목</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control col-md-12" id="txt_title" style="width: 100%">
                            </div>
                            <label class="col-md-3">DJ ID</label>
                            <div class="col-md-9">
                                <label id="lb_djID">DaldalE</label>
                            </div>
                            <label class="col-md-3">DJ 닉네임</label>
                            <div class="col-md-9">
                                <label id="lb_djNickname">다달이</label>
                            </div>
                            <label class="col-md-3">DJ 성별</label>
                            <div class="col-md-9">
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">환영 인사말</label>
                            <div class="col-md-9"><textarea type="textarea" class="form-control" id="txt_msgWelcom" style="width: 100%"></textarea></div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">생방상태</label>
                            <div class="col-md-9"><label id="lb_live">다달이</label></div>
                            <label class="col-md-3">방송 시작일</label>
                            <div class="col-md-9"><label id="lb_live_stDate">2020-02-10 13:43:10</label></div>
                            <label class="col-md-3">방송 종료일시</label>
                            <div class="col-md-9"><label id="lb_live_edDate">2020-02-10 13:43:10</label></div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">입장제한</label>
                            <div class="col-md-9">
                                <label class="radio-inline"><input type="radio" name="radio_entry" value="0" checked>전체</label>
                                <label class="radio-inline"><input type="radio" name="radio_entry" value="1">펜만입장</label>
                                <label class="radio-inline"><input type="radio" name="radio_entry" value="2">20세이상</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">방송 진행시간</label>
                            <div class="col-md-9"><label id="lb_time">2:30:40</label></div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">얼리기</label>
                            <div class="col-md-9">
                                <label class="radio-inline"><input type="radio" name="radio_freezing" value="0" checked>얼리기</label>
                                <label class="radio-inline"><input type="radio" name="radio_freezing" value="1">해제</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">최근 정보 수정일시</label>
                            <div class="col-md-9">
                                <label id="lb_editDate">2020-02-10 13:43:10</label>
                                <button type="button" id="bt_editDate" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">방송강제종료</label>
                            <div class="col-md-9">
                                <label class="radio-inline"><input type="radio" name="radio_forcedExit" value="0" checked>유지</label>
                                <label class="radio-inline"><input type="radio" name="radio_forcedExit" value="1">강제종료</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">최근 정보 수정 처리자</label>
                            <div class="col-md-9"><label id="lb_editUser">DaldalE</label></div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">받은 좋아요</label>
                            <div class="col-md-9">
                                <label id="lb_likeCnt">총0건</label>
                                <button type="button" id="bt_likeHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">매니저</label>
                            <div class="col-md-9">
                                <label id="lb_manegerCnt">총0건</label>
                                <button type="button" id="bt_manegerHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">받은 선물</label>
                            <div class="col-md-9">
                                <label id="lb_giftCnt">총0건</label>
                                <button type="button" id="bt_giftHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">게스트 / 게스트 ID</label>
                            <div class="col-md-9">
                                <label class="radio-inline"><input type="radio" name="radio_guest" id="radio_guestOn" value="on" checked>게스트ON</label>
                                <label class="radio-inline"><input type="radio" name="radio_guest" value="off">게스트OFF</label>
                                <button type="button" id="bt_guestHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">받은 사연</label>
                            <div class="col-md-9">
                                <label id="lb_storyCnt">총0건</label>
                                <button type="button" id="bt_storyHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">등록 금지어</label>
                            <div class="col-md-9">
                                <label id="lb_banCnt">총0건</label>
                                <button type="button" id="bt_banHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="col-md-3">청취자</label>
                        <div class="col-md-9">
                            <label id="lb_listenerCnt">총0건</label>
                            <button type="button" id="bt_listenerHistory" class="btn-xs pull-right">세부내역</button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="col-md-3">강제퇴장회원</label>
                        <div class="col-md-9">
                            <label id="lb_forceKickCnt">총0건</label>
                            <button type="button" id="bt_forceKickHistory" class="btn-xs pull-right">세부내역</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-6">
                        <label class="col-md-3">방송 플랫폼</label>
                        <div class="col-md-9">
                            <label id="lb_platform">PC (Crome)</label>
                            <button type="button" id="bt_platformHistory" class="btn-xs pull-right">세부내역</button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="col-md-3">방송방 입장</label>
                        <div class="col-md-9">
                            <button type="button" id="bt_broadcastGo" class="btn-xs">방송방 입장하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline" id="detail">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 100px;height: 27px"> 세부내역 </label>
                <label class="text_middle" id="detail_comments" style="font-size: 11px;height: 27px"></label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail">
                            </thead>
                            <tbody id="tableBody_detail">
                            </tbody>
                        </table>
                        <span>
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>
    $(document).ready(function() {
        init("new");
        var roomNo;
        $('#detail').hide();


        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: 'kr',
            maxDate:0
        }).datepicker("setDate", new Date());

        $('#date_radio').change(function() {
            if($('input[name="radio_date"]:checked').val() == "all"){               // 전체
                                                                                    //$('input:checkbox[id="check_dateSel"]').prop("checked", true);
            }else if($('input[name="radio_date"]:checked').val() == "week"){        //1주일
                $('#txt_startSel').val(moment().add(-7,'d').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }else if($('input[name="radio_date"]:checked').val() == "month"){       // 한달
                // console.log(moment().add(-1,'M').format("YYYY-MM-DD"));
                // $('#txt_startSel').val("123123");
                $('#txt_startSel').val(moment().add(-1,'M').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().add('M').format("YYYY-MM-DD"));
            }else{
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('#check_dateSel').click(function () {       //기간 선택
            if ($('input[id="check_dateSel"]:checked').val() == "on") {
                $('#txt_startSel').attr('disabled', false);
                $('#txt_endSel').attr('disabled', false);
                $('#i_startSel').attr('disabled', false);
                $('#i_endSel').attr('disabled', false);
            } else {
                $('#txt_startSel').attr('disabled', true);
                $('#txt_endSel').attr('disabled', true);
                $('#i_startSel').attr('disabled', true);
                $('#i_endSel').attr('disabled', true);
            }
        });

        $('#date_startSel').change(function(){
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment($('#txt_endSel').val()).format("YYYYMMDD"))){
                $('#txt_startSel').val($('#txt_endSel').val());
            }
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment().format('YYYYMMDD'))){
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getRoomInfo();
            };
        });
        <!-- 버튼 시작 -->
        $('#bt_search').click( function() {                //검색
            getRoomInfo();
        });
        $('#bt_edite').click( function() {                 //   수정하기
            if($('#bt_edite').text() == "수정하기"){
                init("edit");
            }else if($('#bt_edite').text() == "수정완료"){
                init("edit_complet");
            }
        });
        $('#bt_imgChg').click(function() {					//   사진변경
        });
        $('#bt_editDate').click(function() {				//   최근정보수정일시
            getHistoryDetail("editDate","정보수정일시","ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.");
        });
        $('#bt_likeHistory').click(function() {			//   받은 좋아요
            getHistoryDetail("likeHistory","받은 좋아요 정보","ㆍ방송 중인 방송방에서 좋아요를 보낸 회원과 보낸수, 부스터 사용 수 를 확인할 수 있습니다.");
        });
        $('#bt_manegerHistory').click(function() {				//   매니저
            getHistoryDetail("manegerHistory","매니저 정보","ㆍ방송을 진행하는 DJ가 등록한 매니저를 확인하고, 관리할 수 있습니다.");
        });
        $('#bt_giftHistory').click(function() {				//   받은선물
            getHistoryDetail("giftHistory","선물 정보","ㆍ방송 중 방송방 내에서 보내고 받은 선물 내역을 확인할 수 있습니다.");
        });
        $('#bt_guestHistory').click(function() {				//   게스트
            getHistoryDetail("guestHistory","게스트 정보","ㆍ방송 중 게스트 변동사항 및 관리를 할 수 있습니다.");
        });
        $('#bt_storyHistory').click(function() {			//   받은사연
            getHistoryDetail("storyHistory","사연내역","ㆍ방송 중 방송방 내에서 누적된 사연정보를 확인 관리 할 수 있습니다.");
        });
        $('#bt_banHistory').click(function() {					//   등록금지어
            getHistoryDetail("banHistory","금지어 등록 정보","ㆍ운영자와 회원이 직접 100개까지 등록 할 수 있고 관리자가 수정 삭제할 수 있습니다.");
        });
        $('#bt_listenerHistory').click(function() {			//   청취자
            getHistoryDetail("listenerHistory","청취기록","ㆍ회원이 방송을 청취한 기록을 확인할 수 있습니다.");
        });
        $('#bt_forceKickHistory').click(function() {			//   강제퇴장회원
            getHistoryDetail("forceKickHistory","강제 퇴장 정보","ㆍ방송 중 DJ, 매니저로 인해 강제 퇴장된 회원정보를 확인하고, 관리를 할 수 있습니다.");
        });
        $('#bt_platformHistory').click(function() {			//   방송플랫폼
            getHistoryDetail("platformHistory","방송 접속 기록","ㆍ방송 진행 중 접속 기록 및 변동사태를 확인할 수 있습니다.");
        });
        $('#bt_broadcastGo').click(function() {			    //   방송방 입장하기
            // BroadcastGo();
        });
        <!-- 버튼 끝 -->
    });

    function init(tmp){
        // getUserInfo();
        getSubject_type_Data();
        $('#detail').hide();

        if(tmp == "edit"){
            $('#bt_edite').text('수정완료');
            $("textarea[id='txt_msgWelcom']").removeAttr('readonly', true);
            $("input[id='txt_title']").removeAttr('readonly', true);
            $("select[id='selectSubject_type_detail']").removeAttr("disabled", "");
            $("[name='radio_gender']:not(:checked),[name='radio_entry']:not(:checked),[name='radio_freezing']:not(:checked),[name='radio_forcedExit']:not(:checked),[name='radio_guest']:not(:checked)").removeAttr("disabled", "");
        }else if(tmp == "new" || tmp == "edit_complet"){
            $('#bt_edite').text('수정하기');
            $("textarea[id='txt_msgWelcom']").attr('readonly', true);
            $("input[id='txt_title']").attr('readonly', true);
            $("select[id='selectSubject_type_detail']").attr("disabled", "");
            $("[name='radio_gender']:not(:checked),[name='radio_entry']:not(:checked),[name='radio_freezing']:not(:checked),[name='radio_forcedExit']:not(:checked),[name='radio_guest']:not(:checked)").attr("disabled", "");
        }
    }

    function getSubject_type_Data(){
        var obj = new Object();
        obj.type = "subject_type";
        getAjaxData("type", "/rest/broadcast/broadcast/type",obj, fn_code_list_success, fn_fail);
    }
    function getRoomInfo(){                 // 검색
        $('#list_info').DataTable().destroy();
        $("#tableBody").empty();
        var obj = new Object();
        obj.search = $('#txt_search').val();                        // 검색명
        obj.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
        obj.gubun = $("select[name='selectGubun']").val();          // 검색 조건
        obj.value = $("select[id='selectSubject_type']").val();    // 방송주제
        obj.type = "subject_type";
        obj.stDate = $('#txt_startSel').val();                      // 검색일 시작
        obj.edDate = $('#txt_endSel').val();                        // 검색일 끝
        obj.checkDate = $("input:checkbox[id='check_dateSel']").is(":checked");                       // 기간선택 여부

        getAjaxData("broadcastList", "/rest/broadcast/broadcast/list", obj, fn_success, fn_fail);
    }
    function fn_success(dst_id, response){
        dalbitLog(response);
        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $("#tableBody").append(html);
        $('#list_info').DataTable().draw();

        $('#list_cnt').html("검색 결과 총" + response.data.length + "건");
    }
    function fn_code_list_success(dst_id, response){
        dalbitLog(response);

        if(response.data[0].type == "subject_type"){
            var template = $('#subject_type_Select').html();
            var templateScript = Handlebars.compile(template);
            var context = response;
            var html = templateScript(context);
            $("#selectSubject_type").append(html);

            var template = $('#subject_type_Select').html();
            var templateScript = Handlebars.compile(template);
            var context = response;
            var html = templateScript(context);
            $("#selectSubject_type_detail").append(html);
        }
    }
    function info_sel_success(dst_id, response) {
        dalbitLog(response);
        roomNo = response.data.roomNo;

        console.log("response.data.type : " + response.data.type);
        $("#selectSubject_type_detail").val(response.data.type);
        $("#txt_title").val(response.data.title);
        $("#lb_djID").html(response.data.memId);
        $("#lb_djNickname").html(response.data.memNick);
        $("#txt_msgWelcom").val(response.data.msgWelcom);
        $("#lb_live").html(response.data.state);
        $("#lb_live_stDate").html(response.data.liveSt);
        $("#lb_live_edDate").html(response.data.liveEd);
        $("#lb_platform").html(response.data.platform);
        $("#lb_editDate").html(response.data.infoEditDate);
        $("#lb_editUser").html(response.data.infoEditNm);
        $("#lb_likeCnt").html("총"+response.data.goodCnt+"건");
        $("#lb_manegerCnt").html("총"+response.data.manegerCnt+"건");
        $("#lb_giftCnt").html("총"+response.data.giftCnt+"건");
        $("#lb_guestCnt").html("총"+response.data.guestCnt+"건");
        $("#lb_storyCnt").html("총"+response.data.contentsCnt+"건");
        $("#lb_banCnt").html("총"+response.data.banCnt+"건");
        $("#lb_listenerCnt").html("총"+response.data.listenCnt+"건");
        $("#lb_forceKickCnt").html("총"+response.data.forceKickCnt+"건");
        $('input:radio[name=radio_entry]:input[value=' + response.data.typeEntry + ']').prop("checked", true);
        $('input:radio[name=radio_gender]:input[value=' + response.data.memSex + ']').prop("checked", true);
        $('input:radio[name=radio_freezing]:input[value=' + response.data.freezing + ']').prop("checked", true);
        $('input:radio[name=radio_guest]:input[value=' + response.data.guestOn + ']').prop("checked", true);
        $("#radio_guestOn").html("test");
        //$("#backgroundImg").		backgroundImage
        //$("#radio_forcedExit").	forceExit

        $("#tableTop_detail").empty();
        $("#tableBody_detail").empty();
    }
    function getDetail(id){
        var obj = new Object();
        obj.roomNo = id;
        console.log("roomNo : " + id);
        getAjaxData("info", "/rest/broadcast/broadcast/info", obj, info_sel_success, fn_fail);
    }
    function getHistoryDetail(tmp,tmp2,tmp3){     // 상세보기
        $("#tableTop_detail").empty();
        table_col_set(tmp,tmp2,tmp3);
    }
    function table_col_set(id,title,comments) {
        // if ($("#lb_userId").text() == null || $("#lb_userId").text() == "") {
        //     alert("확인 대상 선택 해주십시오");
        //     return;
        // }
        $('#detail').show();
        $("#detail_label").html(title);
        $("#detail_comments").html(comments);
        if (id == "listenerHistory") {
            var data = {header: [
                    {columnNm: "memNo"},
                    {columnNm: "No"},
                    {columnNm: "청취자 ID"},
                    {columnNm: "청취자 닉네임"},
                    {columnNm: "청취 시작 시간"},
                    {columnNm: "정취 종료 시간"},
                    {columnNm: "청취진행시간"},
                    {columnNm: "보낸 좋아요 수"},
                    {columnNm: "보낸 아이템 수"},
                ]};
        } else if (id == "storyHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "사연 보낸 청취자 닉네임"},
                    {columnNm: "사연 보낸 청취자 ID"},
                    {columnNm: "보낸 일시"},
                    {columnNm: "사연 내용"}
                ]};
        }else if (id == "editDate") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "정보 수정일시"},
                    {columnNm: "수정 처리자"},
                ]};
        }else if (id == "likeHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "보낸 User ID"},
                    {columnNm: "보낸 User 닉네임"},
                    {columnNm: "보낸 일시"},
                    {columnNm: "좋아요 보낸 수"},
                    {columnNm: "부스터 보낸 수"},
                ]};
        }else if (id == "manegerHistory") {
            var data = {header: [
                    {columnNm: "key"},
                    {columnNm: "No"},
                    {columnNm: "구분"},
                    {columnNm: "User ID"},
                    {columnNm: "User 닉네임"},
                    {columnNm: "청취 시작 일시"},
                    {columnNm: "임명 시작 일시"},
                    {columnNm: "임명 취소 일시"},
                    {columnNm: "매니저 임명상태"}
                ]};
        }else if (id == "giftHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "구분"},
                    {columnNm: "아이템명"},
                    {columnNm: "보낸/받은 건 수"},
                    {columnNm: "보낸/받은 선물 금액"},
                    {columnNm: "선물 일시"},
                    {columnNm: "User ID"},
                    {columnNm: "User 닉네임"},
                ]};
        }else if (id == "guestHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "구분"},
                    {columnNm: "User ID"},
                    {columnNm: "User 닉네임"},
                    {columnNm: "청취 시작 일시"},
                    {columnNm: "게스트 방송 시작 일시"},
                    {columnNm: "게스트 방송 종료 일시"},
                    {columnNm: "게스트 방송 진행시간"},
                    {columnNm: "게스트 방송 종료하기"},
                ]};
        }else if (id == "banHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "구분"},
                    {columnNm: "User 닉네임"},
                    {columnNm: "청취 시작 일시"},
                    {columnNm: "방송 시작 일시"},
                    {columnNm: "강제 퇴장 일시"},
                    {columnNm: "청취 진행시간"},
                ]};
        }else if (id == "forceKickHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "적용여부"},
                    {columnNm: "금지어"},
                ]};
        }else if (id == "platformHistory") {
            var data = {header: [
                    {columnNm: "No"},
                    {columnNm: "접속 일시"},
                    {columnNm: "OS 환경"},
                    {columnNm: "App Ver"},
                    {columnNm: "Browser"},
                    {columnNm: "Device"},
                    {columnNm: "Mobile Device ID"},
                    {columnNm: "Mobile AD ID"},
                    {columnNm: "IP 주소"},
                ]};
        }
        var template = $('#tmp_list_top_column').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html = templateScript(context);
        $("#tableTop_detail").append(html);
        $('#list_info_detail').DataTable().destroy();
        $("#tableBody_detail").empty();
        var obj = new Object();
        obj.roomNo = roomNo;
        if (id == "listenerHistory") {
            getAjaxData(id, "/rest/broadcast/listen/list", obj, fn_success_detail, fn_fail);
        }else if (id == "storyHistory") {
            getAjaxData(id, "/rest/broadcast/story/list", obj, fn_success_detail, fn_fail);
        }else if (id == "editDate") {
            getAjaxData(id, "/rest/broadcast/edithistory/list", obj, fn_success_detail, fn_fail);
        }else if (id == "likeHistory") {
            getAjaxData(id, "/rest/broadcast/like/list", obj, fn_success_detail, fn_fail);
        }else if (id == "manegerHistory") {
            getAjaxData(id, "/rest/broadcast/maneger/list", obj, fn_success_detail, fn_fail);
        }else if (id == "giftHistory") {
            getAjaxData(id, "/rest/broadcast/gift/list", obj, fn_success_detail, fn_fail);
        }else if (id == "guestHistory") {
            getAjaxData(id, "/rest/broadcast/guest/list", obj, fn_success_detail, fn_fail);
        }else if (id == "banHistory") {
            getAjaxData(id, "/rest/broadcast/ban/list", obj, fn_success_detail, fn_fail);
        }else if (id == "forceKickHistory") {
            getAjaxData(id, "/rest/broadcast/kick/list", obj, fn_success_detail, fn_fail);
        }else if (id == "platformHistory") {
            getAjaxData(id, "/rest/broadcast/platform/list", obj, fn_success_detail, fn_fail);
        }
    }
    function fn_success_detail(dst_id, response) {
        dalbitLog(response);
        var template;
        if(dst_id == "listenerHistory"){
            template = $('#listenerHistory_detail').html();
        }else if(dst_id == "storyHistory"){
            template = $('#storyHistory_detail').html();
        }else if (dst_id == "editDate") {
            template = $('#editDate_detail').html();
        }else if (dst_id == "likeHistory") {
            template = $('#likeHistory_detail').html();
        }else if (dst_id == "manegerHistory") {
            template = $('#manegerHistory_detail').html();
        }else if (dst_id == "giftHistory") {
            template = $('#giftHistory_detail').html();
        }else if (dst_id == "guestHistory") {
            template = $('#guestHistory_detail').html();
        }else if (dst_id == "banHistory") {
            template = $('#banHistory_detail').html();
        }else if (dst_id == "forceKickHistory") {
            template = $('#forceKickHistory_detail').html();
        }else if (dst_id == "platformHistory") {
            template = $('#platformHistory_detail').html();
        }
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody_detail").append(html);
        $('#list_info_detail').DataTable().draw();

    }

    function Maneger(id){
        var memNo = $("#" + id).data('memno');
        var maneger = $("#" + id).data('maneger');

        console.log('매니저 지정하기~ memNo : ' + memNo);
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
        $('#list_info_detail').DataTable().draw();
    }
</script>
<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{roomNo}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{type}}</td>
        <td><a href="javascript://" onclick="javascript:getDetail(this.id);" id="{{roomNo}}">{{title}}</a></td>
        <td>{{start_date}}</td>
        <td>{{Live}}</td>
    </tr>
    {{/data}}
</script>

<script id="subject_type_Select" type="text/x-handlebars-template">
    {{#data}}
    <option value="{{value}}">{{code}}</option>
    {{/data}}
</script>
<script id="tmp_list_top_column" type="text/x-handlebars-template">
    <tr>
        {{#header}}
        <th>{{columnNm}}</th>
        {{/header}}
    </tr>
</script>
<script id="listenerHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{memNo}}</td>
        <td>{{index @index}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{listenStDate}}</td>
        <td>{{listenEdDate}}</td>
        <td>{{listenTime}}</td>
        <td>{{likeCnt}}</td>
        <td>{{itemCnt}}</td>
        <%--<td><a href="javascript://" class="btn btn-xs" onclick="javascript:Broad(this.id);" id="datalistener_{{memNo}}" data-memNo="{{memNo}}">{{maneger}}</a></td>--%>
    </tr>
    {{/data}}
</script>
<script id="storyHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memNick}}</td>
        <td>{{memId}}</td>
        <td>{{writeDate}}</td>
        <td>{{story}}</td>
    </tr>
    {{/data}}
</script>
<script id="likeHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{lastUpdDate}}</td>
        <td>{{goodCnt}}</td>
        <td>{{boostCnt}}</td>
    </tr>
    {{/data}}
</script>
<script id="manegerHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{memNo}}</td>
        <td>{{index @index}}</td>
        <td>{{auth}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{listenStDate}}</td>
        <td>{{manegerAddDate}}</td>
        <td>{{manegerDelDate}}</td>
        <td><a href="javascript://"  onclick="javascript:Maneger(this.id);" id="datamaneger_{{memNo}}" data-memno="{{memNo}}" data-maneger="{{maneger}}">{{maneger}}</a></td>
    </tr>
    {{/data}}
</script>