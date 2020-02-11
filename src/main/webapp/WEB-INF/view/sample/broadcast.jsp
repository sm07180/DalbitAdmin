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
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 80px;height: 27px"> 회원검색 </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;" >
                <div class="col-lg-6 p_10" style="background: #f8efc0">
                    <div class="col-lg-12" >
                        <label style="font-weight: bold">공지등록 기간</label>
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
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel" checked>기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
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
                            <thead>
                            <tr>
                                <th>방번호</th>
                                <th>DJ ID</th>
                                <th>DJ 닉네임</th>
                                <th>방송주제</th>
                                <th>방송제목</th>
                                <th>방송시작 일시</th>
                                <th>생방상태</th>
                                <th>자세히보기</th>
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
                <div class="col-lg-4 no-padding">
                    <label class="text_middle" style="font-size: 11px;height: 27px;"> ㆍ방송상세정보를 수정하고 [수정완료] 버튼으로 변경된 정보를 반영합니다.</label>
                </div>
                <div class="col-lg-7 no-padding">
                    <button type="button" id="bt_edite" class="pull-right btn-xs form-control"  style="border-radius:3px;width: 80px;;height: 24px">수정하기</button>
                </div>
            </div>
            <div class="row col-lg-12 form-inline" style="padding-top: 0px;">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="widget-content">
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
                                        <option value="9999" selected="selected">방송주제</option>
                                    </select>
                                </form>
                            </div>
                            <label class="col-md-3">방송 제목</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control col-md-12" id="txt_title" value="">
                            </div>
                            <label class="col-md-3">DJ ID</label>
                            <div class="col-md-9">
                                <div class="col-md-3"><label id="lb_djID">DaldalE</label></div>
                            </div>
                            <label class="col-md-3">DJ 닉네임</label>
                            <div class="col-md-9">
                                <div class="col-md-3"><label id="lb_djNickname">다달이</label></div>
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
                            <div class="col-md-9"><textarea type="textarea" class="form-control" id="txt_msgWelcom"></textarea></div>
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
                            <label class="col-md-3">방송 플랫폼 정보</label>
                            <div class="col-md-9"><label id="lb_platform">PC</label></div>
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
                               <label id="lb_menagerCnt">총0건</label>
                               <button type="button" id="bt_menagerHistory" class="btn-xs pull-right">세부내역</button>
                           </div>
                       </div>
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
                               <label id="lb_guestCnt">총0건</label>
                               <button type="button" id="bt_guestHistory" class="btn-xs pull-right">세부내역</button>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <label class="col-md-3">받은 사연</label>
                           <div class="col-md-9">
                               <label id="lb_contentsCnt">총0건</label>
                               <button type="button" id="bt_contentsHistory" class="btn-xs pull-right">세부내역</button>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <label class="col-md-3">등록 금지어</label>
                           <div class="col-md-9">
                               <label id="lb_banCnt">총0건</label>
                               <button type="button" id="bt_banHistory" class="btn-xs pull-right">세부내역</button>
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
                </div>
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 100px;height: 27px"> 세부내역 </label>
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
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="/template/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/template/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/template/js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/template/js/dataTables/jquery.dataTables.min.js"></script>
<script src="/template/js/dataTables/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/template/js/startmin.js"></script>
<script src="/js/lib/handlebars-v4.7.2.js"></script>
<script src="/js/common.js"></script>


<!-- Datepicker -->
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="/js/lib/bootstrap-datepicker.min.js"></script>
<script src="/js/lib/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->

<script>
    $(document).ready(function() {
        // getAjaxData("memberList", "/rest/member/member/list", "", fn_success, fn_fail);
        // getUserInfo();
        getSubject_type_Data();

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
                getUserInfo();
            };
        });

        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
        $('#bt_edite').click( function() {                //    수정하기
        });
        $('#bt_imgChg').click(function() {					//   사진변경
        });
    });


    function getSubject_type_Data(){
        var obj = new Object();
        obj.type = "subject_type";
        getAjaxData("type", "/rest/broadcast/broadcast/type",obj, fn_code_list_success, fn_fail);
    }

    function getUserInfo(){                 // 검색
        $("#list_info tr:not(:first)").remove();
        var obj = new Object();

        obj.search = $('#txt_search').val();                        // 검색명
        obj.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
        obj.gubun = $("select[name='selectGubun']").val();          // 검색 조건
        obj.value = $("select[id='selectSubject_type']").val();    // 방송주제
        obj.type = "subject_type";
        obj.stDate = $('#txt_startSel').val();                      // 검색일 시작
        obj.edDate = $('#txt_endSel').val();                        // 검색일 끝

        getAjaxData("broadcastList", "/rest/broadcast/broadcast/list", obj, fn_success, fn_fail);

    }

    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#list').DataTable({
            retrieve: true,
            paging: true,
            searching: true,
        });
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
        $("#lb_menagerCnt").html("총"+response.data.menagerCnt+"건");
        $("#lb_giftCnt").html("총"+response.data.giftCnt+"건");
        $("#lb_guestCnt").html("총"+response.data.guestCnt+"건");
        $("#lb_contentsCnt").html("총"+response.data.contentsCnt+"건");
        $("#lb_banCnt").html("총"+response.data.banCnt+"건");
        $("#lb_listenerCnt").html("총"+response.data.listenCnt+"건");
        $("#lb_forceKickCnt").html("총"+response.data.forceKickCnt+"건");

        //$("#backgroundImg").		backgroundImage
        //$("#radio_entry").		typeEntry
        //$("#radio_forcedExit").	forceExit
        //$("#radio_freezing").		freezing
        //$("#radio_gender").		memSex

    }

    function getDetail(id){
        var obj = new Object();
        obj.roomNo = id;
        console.log("roomNo : " + id);
        getAjaxData("info", "/rest/broadcast/broadcast/info", obj, info_sel_success, fn_fail);
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{roomNo}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{type}}</td>
        <td><a href="avascript://" onclick="javascript:getDetail(this.id);" id="{{roomNo}}">{{title}}</a></td>
        <td>{{start_date}}</td>
        <td>{{Live}}</td>
        <td>
            <button type="button" class="btn btn-indigo btn-sm m-0">자세히보기</button>
        </td>
    </tr>
    {{/data}}
</script>

<script id="subject_type_Select" type="text/x-handlebars-template">
    {{#data}}
        <option value="{{value}}">{{code}}</option>
    {{/data}}
</script>