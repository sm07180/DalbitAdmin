<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<style>
   .test{
        border-color: black;
        border: 1px solid #DDDDDD;
    }

   .text_center{
       text-align: center;
   }
   .middle{
       display:table-cell;
       vertical-align:middle;
   }
   .lb_style{
       border: 1px solid #DDDDDD;
       background-color: #DCE6F2;
       height: 34px;
   }
</style>

<div id="wrapper">
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                ㆍ <b>*</b> 는 필수 입력사항 입니다. <br>
                ㆍ 발송 상태를 확인하시고 미발송 또는 발송오류 시 해당 정보가 맞는지 확인한 후 수정완료를 하시면 재발송이 가능합니다.
            </div>
            <div class="pull-right">
                <input type="button" value="발송완료" class="btn btn-success btn-sm" id="btn_send" />
            </div>
        </div>
        <div class="row col-md-12">
            <div class="col-md-6 no-padding" style="border: 1px solid #DDDDDD;">
                <div class="col-md-2 no-padding lb_style"><label>No.</label></div>
                <div class="col-md-2 text_center"><span id="pushMsg-no">-</span></div>
                <div class="col-md-2 no-padding lb_style"><label>발송상태</label></div>
                <div class="col-md-6">
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-snedStatus" value="0" checked="true">미발송
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-snedStatus" value="1">발송오류
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-snedStatus" value="2">발송완료
                    </label>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-2 no-padding lb_style"><label>노출 OS구분</label></div>
                <div class="col-md-10">
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-OSType" value="0" checked="true">전체
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-OSType" value="1">모바일 전체
                    </label>
                    <br>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-OSType" value="2">PC
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-OSType" value="3">Android
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-OSType" value="4">IOS
                    </label>
                </div>
            </div>
        </div>

        <div class="row col-md-12">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-2 no-padding lb_style"><label>메세지 제목</label></div>
                    <div class="col-md-10">
                        <input type="text" class="form-control" id="pushMsg-msgTitle" placeholder="title">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 no-padding lb_style"><label>메세지 내용</label></div>
                    <div class="col-md-10">
                        <textarea class="form-control" name="pushMsg-msg" id="pushMsg-msg" rows="5" cols="30" placeholder="Message" style="resize: none"></textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-2 no-padding lb_style"><label>수신대상 선택</label></div>
                    <div class="col-md-10">
                        <div class="row col-md-12">
                            <label class="radio-inline">
                                <input type="radio" name="pushMsg-receiveType" value="0" checked="true">전체
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="pushMsg-receiveType" value="1">남자 회원
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="pushMsg-receiveType" value="2">여자 회원
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="pushMsg-receiveType" value="3">생방송 방
                            </label>
                            <br>
                            <label class="radio-inline">
                                <input type="radio" name="pushMsg-receiveType" value="4">지정 회원
                                <input type="button" value="회원검색" class="btn btn-success btn-xs" id="btn_selectMember" disabled="disabled"/>
                            </label>
                        </div>
                        <div class="row col-md-12" id="div_selectTarget" style="padding-left: 30px; display: none">
                            <p>1. user ID [X]</p>
                            <p>2. user ID [X]</p>
                            <p>3. user ID [X]</p>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-2 no-padding lb_style"><label>메세지 구분</label></div>
                    <div class="col-md-10">
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="0" checked="true">일반 안내
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="1">경고 안내
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="2">탈퇴처리 안내
                        </label>
                        <br>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="3">긴급 공지
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="4">일반 공지
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="5">이벤트 공지
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="pushMsg-msgType" value="6">기타
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col-md-12">
            <div class="col-md-1 no-padding lb_style"><label>배경 색</label></div>
            <div class="col-md-5">
                <span>배경색상 : </span>
                <input type="color" id="pushMsg-backColor">
                <span> [<label id="pushMsg-backColor-RGB"></label>] 또는 </span>
                <input type="file" id="pushMsg-backImg">
            </div>
            <div class="col-md-1 no-padding lb_style"><label>발송여부</label></div>
            <div class="col-md-5">
                <div class="row col-md-12">
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-sendType" value="0" checked="true">즉시발송
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="pushMsg-sendType" value="1">예약발송
                    </label>
                </div>
                <div class="row col-md-12" id="pushMsg-div-sendDate" style="display: none">
                    <div class="col-md-8 no-padding">
                        <div class="col-md-12 input-group date" id="date_birth">
                            <input type="text" class="form-control" id="pushMsg-sendDate"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="col-md-4 no-padding" style="display: flex; align-items: stretch;">
                        <select id="pushMsg-sendHour" class="select-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                        </select>
                        <select id="pushMsg-sendMinute" class="select-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col-md-12">
            <div class="col-md-1 no-padding lb_style"><label>메세지 포함 이미지</label></div>
            <div class="col-md-5">
                <input type="file" id="pushMsg-inputImg">
                <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
            </div>
            <div class="col-md-1 no-padding lb_style"><label>등록/수정일</label></div>
            <div class="col-md-5"><label id="pushMsg-workDate">-</label></div>
        </div>
        <!-- support ticket form -->

    </div>
</div>



<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        init();
        initEvent_pushMsg();
    });

    // 초기 설정
    function init() {
        // 캘린더 기능추가
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

        var htmlHour = "";
        for(var i=0; i<24; i++){
            if(i.toString().length == 1){
                htmlHour += '<option value="'+ '0' + i +'">'+ '0' + i +'</option>\n'
            }else{
                htmlHour += '<option value="'+ i +'">'+ i +'</option>\n'
            }
        }
        $("#pushMsg-sendHour").append(htmlHour);

        var htmlMinute = "";
        for(var i=0; i<60; i++){
            if(i.toString().length == 1){
                htmlMinute += '<option value="'+ '0' + i +'">'+ '0' + i +'</option>\n'
            }else{
                htmlMinute += '<option value="'+ i +'">'+ i +'</option>\n'
            }
        }
        $("#pushMsg-sendMinute").append(htmlMinute);

        $("#pushMsg-backColor-RGB").text($("#pushMsg-backColor").val());
    }

    // 이벤트 적용
    function initEvent_pushMsg(tab_id){

        //수신대상 선택
        $("input[name='pushMsg-receiveType']:radio").change(function () {
            var type = this.value;

            //지정 일 경우 button 활성화
            if(type == "4"){
                $("#btn_selectMember").prop("disabled",false);
                $("#div_selectTarget").show();
            }else{
                $("#btn_selectMember").prop("disabled",true);
                $("#div_selectTarget").hide();
                $("#div_selectTarget").empty();
            }
        });

        //발송여부 선택
        $("input[name='pushMsg-sendType']:radio").change(function () {
            var type = this.value;

            //예약 발송 일 경우 날짜 추가
            if(type == "1"){
                $("#pushMsg-div-sendDate").show();
            }else{
                $("#pushMsg-div-sendDate").hide();
            }
        });


        // 배경색 변경
        $("#pushMsg-backColor").on("change", function () {
            $("#pushMsg-backColor-RGB").text($(this).val());
        })

        // 등록 수정 완료 버튼
        $("#btn_send").on("click", function () {
            //TODO 완료처리 필요
            getPushMsgData();
        })

        $("#btn_selectMember").on("click", function () {
            showPopMemberList(choiceMember);
        })
    }



    //=------------------ Option --------------------------------------------





    //=------------------ 상세 Data Handler ----------------------------------
    function initData_pushMsg() {
        //No.
        $("#pushMsg-no").text("");
        //발송상태
        $('input:radio[name="pushMsg-snedStatus"][value="0"]').prop('checked', true);
        //OS구분
        $('input:radio[name="pushMsg-OSType"][value="0"]').prop('checked', true);
        //수신대상
        $('input:radio[name="pushMsg-receiveType"][value="0"]').prop('checked', true);
        //수신대상 지정회원일 경우
        $("#div_selectTarget").empty();
        $("#div_selectTarget").hide();

        //발송여부
        $('input:radio[name="pushMsg-msgType"][value="0"]').prop('checked', true);
        $('.input-group.date').datepicker("setDate", new Date());
        $("#pushMsg-sendHour").val("00");
        $("#pushMsg-sendMinute").val("00");
        $("#pushMsg-div-sendDate").hide();

        //메세지 구분
        $('input:radio[name="pushMsg-sendType"][value="0"]').prop('checked', true);

        //메세지 제목
        $("#pushMsg-msgTitle").val("");
        //메세지 내용
        $("#pushMsg-msg").text("");

        //배경 색
        $("#pushMsg-backColor").val("#000000");
        $("#pushMsg-backColor-RGB").text("#000000");
        //배경 이미지
        //??

        //메세지 포함 이미지
        //??

        //등록/수정일
        $("#pushMsg-workDate").text("");
    }


    function setData_pushMsg(json){
        // No.
        var pushMsg_no = json.column01;
        // 발송상태
        var pushMsg_snedStatus = json.column02;
        // OS구분
        var pushMsg_OSType = json.column03;
        // 메세지 제목
        var pushMsg_msgTitle = json.column04;
        // 메세지 내용
        var pushMsg_msg = json.column05;
        // 수신대상
        var pushMsg_receiveType = json.column06;
        // 지정회원 리스트
        var selectTarget = json.column07;
        // 메세지 구분
        var pushMsg_msgType = json.column08;
        // 배경 색(RGB)
        var pushMsg_backColor = json.column09;
        // 배경 이미지(image File Name)
        var pushMsg_backImg = json.column10;
        // 발송구분
        var pushMsg_sendType = json.column11;
        // 예약발송 일자
        var pushMsg_sendDate = json.column12;
        // 예약발송 시간
        var pushMsg_sendHour = json.column13;
        // 예약발송 분
        var pushMsg_sendMinute = json.column14;
        // 메세지 포함 이미지
        var pushMsg_inputImg = json.column15;
        // 등록/수정일
        var pushMsg_workDate = json.column16;

        //No.
        $("#pushMsg-no").text(pushMsg_no);
        //발송상태
        $('input:radio[name="pushMsg-snedStatus"][value='+ pushMsg_snedStatus +']').prop('checked', true);
        //OS구분
        $('input:radio[name="pushMsg-OSType"][value='+ pushMsg_OSType +']').prop('checked', true);
        //수신대상
        $('input:radio[name="pushMsg-receiveType"][value='+ pushMsg_receiveType +']').prop('checked', true);
        //수신대상 지정회원일 경우
        if(pushMsg_receiveType=="4"){
            //TODO 수신대상 그려야 함.
        }

        //발송여부
        $('input:radio[name="pushMsg-msgType"][value='+ pushMsg_msgType +']').prop('checked', true);
        //발송여부 예약발송일 경우 일시 적용
        if(pushMsg_sendType=="1"){
            $("#pushMsg-sendDate").val(pushMsg_sendDate);
            $("#pushMsg-sendHour").val(pushMsg_sendHour);
            $("#pushMsg-sendMinute").val(pushMsg_sendMinute);

            $("#pushMsg-div-sendDate").show();
        }

        //메세지 구분
        $('input:radio[name="pushMsg-sendType"][value='+ pushMsg_sendType +']').prop('checked', true);

        //메세지 제목
        $("#pushMsg-msgTitle").val(pushMsg_msgTitle);  //No.
        //메세지 내용
        $("#pushMsg-msg").text(pushMsg_msg);  //No.

        //배경 색
        $("#pushMsg-backColor").val(pushMsg_backColor);
        $("#pushMsg-backColor-RGB").text(pushMsg_backColor);
        //배경 이미지
        //??

        //메세지 포함 이미지
        //??

        //등록/수정일
        $("#pushMsg-workDate").text(pushMsg_workDate);
    }



    function getPushMsgData(){
        //지정회원 parsing
        var selectTarget = [];
        if($("input:radio[name=pushMsg-receiveType]:checked").val() == "4"){
            $("#div_selectTarget").find("p").each(function () {
                var id = $(this).prop("id");
                alert(id);

                selectTarget.push(id);
            })
        }

        var data = {
            "column01": $("#pushMsg-no").text()
            ,"column02": $("input:radio[name=pushMsg-snedStatus]:checked").val()
            ,"column03": $("input:radio[name=pushMsg-OSType]:checked").val()
            ,"column04": $("#pushMsg-msgTitle").val()
            ,"column05": $("#pushMsg-msg").val()
            ,"column06": $("input:radio[name=pushMsg-receiveType]:checked").val()
            ,"column07": selectTarget
            ,"column08": $("input:radio[name=pushMsg-msgType]:checked").val()
            ,"column09": $("#pushMsg-backColor").val()
            ,"column10": $("#pushMsg-backImg").val()
            ,"column11": $("input:radio[name=pushMsg-sendType]:checked").val()
            ,"column12": $("#pushMsg-sendDate").val()
            ,"column13": $("#pushMsg-sendHour").val()
            ,"column14": $("#pushMsg-sendMinute").val()
            ,"column15": $("#pushMsg-inputImg").val()
            ,"column16": $("#pushMsg-workDate").text()
        }
        dalbitLog(data);
    }





    //=------------------ Modal -회원검색 ----------------------------------
    // [수신대상 선택 - 지정회원] 회원 추가
    function choiceMember(data){
        var html = '<p id="'+ data.memNo +'">' + data.memNo + ' <a onclick="delMember($(this))">[X]</a></p>'

        if($("#div_selectTarget").find("p").length >= 20){
            alert("수신대상자는 최대 20명까지 지정 가능합니다.");
            return false;
        }

        $("#div_selectTarget").append(html);
    }

    // [수신대상 선택 - 지정회원] 회원 삭제
    function delMember(dom) {
        dom.parent("p").remove();
    }

    function updataPushInfo() {
        alert("test");
    }

















    // 검색
    function getPushInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();
    }

    // /*=---------- 엑셀 ----------*/
    // $('#excelDownBtn').on('click', function(){
    //     var formElement = document.querySelector("form");
    //     var formData = new FormData(formElement);
    //
    //     formData.append("search", tmp_search);
    //     formData.append("date", tmp_date);
    //     formData.append("gubun", tmp_gubun);
    //     formData.append("checkDate", tmp_checkDate);
    //     formData.append("stDate", tmp_stDate);
    //     formData.append("edDate", tmp_edDate);
    //     /*formData.append("test003", "test003");*/
    //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    // });

    // $("#excelBtn").on("click", function () {
    //     $("#list_info").table2excel({
    //         exclude: ".noExl",
    //         name: "Excel Document Name",
    //         filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
    //         fileext: ".xls",
    //         exclude_img: true,
    //         exclude_links: true,
    //         exclude_inputs: true
    //     });
    // });
    //
    // function fn_success_excel(){
    //     console.log("fn_success_excel");
    // }
    //
    // function fn_fail_excel(){
    //     console.log("fn_fail_excel");
    // }
    /*----------- 엑셀 ---------=*/
</script>