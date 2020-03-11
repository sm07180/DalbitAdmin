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
    <form id="bannerForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        init_Detail();
        initEvent_Detail();
    });

    // 초기 설정
    function init_Detail() {
        // 캘린더 기능추가
        $('.input-group-addon').daterangepicker({
            startDate: moment().subtract('days', 29),
            endDate: moment(),
            dateLimit: { days: 60 },
            showDropdowns: true,
            showWeekNumbers: true,
            timePicker: true,
            timePickerIncrement: 1,
            timePicker12Hour: false,
            ranges: {
                '1일': [moment(), moment()],
                // '어제': [moment().subtract('days', 1), moment().subtract('days', 1)],
                '7일': [moment().subtract('days', 6), moment()],
                '30일': [moment().subtract('days', 29), moment()],
                '이번달': [moment().startOf('month'), moment().endOf('month')],
                '지난달': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
            },
            opens: 'left',
            buttonClasses: ['btn btn-default'],
            applyClass: 'btn-small btn-primary',
            cancelClass: 'btn-small',
            format: 'L',
            separator: ' to ',
            locale: {
                customRangeLabel: '직접선택',
            }
        },
            function(start, end, t1, t2) {
                console.log("Callback has been called!");
                console.log(start)
                console.log(end)
                console.log(t1)
                console.log(t2)
                $('#banner-exposurePeriod').html(start.format('YYYY.MM.DD') + ' - ' + end.format('YYYY.MM.DD'));
            }
        );

        var htmlHour = "";
        for(var i=0; i<24; i++){
            if(i.toString().length == 1){
                htmlHour += '<option value="'+ '0' + i +'">'+ '0' + i +'</option>\n'
            }else{
                htmlHour += '<option value="'+ i +'">'+ i +'</option>\n'
            }
        }
        $("#banner-startHour").append(htmlHour);
        $("#banner-endHour").append(htmlHour);

        var htmlMinute = "";
        for(var i=0; i<60; i++){
            if(i.toString().length == 1){
                htmlMinute += '<option value="'+ '0' + i +'">'+ '0' + i +'</option>\n'
            }else{
                htmlMinute += '<option value="'+ i +'">'+ i +'</option>\n'
            }
        }
        $("#banner-startMinute").append(htmlMinute);
        $("#banner-endMinute").append(htmlMinute);

        // Radio 버튼 추가
        $("#radio_loginType_aria").html(getCommonCodeRadio(-1, banner_loginType));
        $("#radio_gender_aria").html(getCommonCodeRadio(1, gender));
        $("#radio_frequency_aria").html(getCommonCodeRadio(10, banner_frequency));
        $("#radio_viewOn_aria").html(getCommonCodeRadio(1, banner_viewOn));
        $("#radio_bannerType_aria").html(getCommonCodeRadio(1, banner_bannerType_noAll));
    }

    // 이벤트 적용
    function initEvent_Detail(tab_id){

        //수신대상 선택
        $("input[name='banner-publishStatus']:radio").change(function () {
            var type = this.value;

            //지정 일 경우 button 활성화
            if(type == "0"){
                $("input[name='banner-selectExposureType']").prop("disabled",false);
                $("input[name='banner-selectExposureType']:input[value='0']").prop("checked", true);
            }else{
                $("input[name='banner-selectExposureType']").prop("disabled",true);
                $("input[name='banner-selectExposureType']").removeAttr("checked");
                $("#banner-div-exposure").hide();
            }
        });

        //발송여부 선택
        $("input[name='banner-selectExposureType']:radio").change(function () {
            var type = this.value;

            //예약 발송 일 경우 날짜 추가
            if(type == "1"){
                $("#banner-div-exposure").show();
            }else{
                $("#banner-div-exposure").hide();
            }
        });


        // 배경색 변경
        $("#pushMsg-backColor").on("change", function () {
            $("#pushMsg-backColor-RGB").text($(this).val());
        })

        // 등록 수정 완료 버튼
        $("#btn_done").on("click", function () {
            //TODO 완료처리 필요
            getPushMsgData();
        })

        $("#btn_selectMember").on("click", function () {
            showPopMemberList(choiceMember);
        })
    }



    //=------------------ Option --------------------------------------------





    //=------------------ 상세 Data Handler ----------------------------------
    // 데이터 초기화
    function initData_banner() {
        var template = $('#tmp_bannerDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#bannerForm").html(templateScript);

        init_Detail();
        initEvent_Detail();


        //
        // //No.
        // $("#pushMsg-no").text("");
        // //발송상태
        // $('input:radio[name="pushMsg-snedStatus"][value="0"]').prop('checked', true);
        // //OS구분
        // $('input:radio[name="pushMsg-OSType"][value="0"]').prop('checked', true);
        // //수신대상
        // $('input:radio[name="pushMsg-receiveType"][value="0"]').prop('checked', true);
        // //수신대상 지정회원일 경우
        // $("#div_selectTarget").empty();
        // $("#div_selectTarget").hide();
        //
        // //발송여부
        // $('input:radio[name="pushMsg-msgType"][value="0"]').prop('checked', true);
        // $('.input-group.date').datepicker("setDate", new Date());
        // $("#pushMsg-sendHour").val("00");
        // $("#pushMsg-sendMinute").val("00");
        // $("#pushMsg-div-sendDate").hide();
        //
        // //메세지 구분
        // $('input:radio[name="pushMsg-sendType"][value="0"]').prop('checked', true);
        //
        // //메세지 제목
        // $("#pushMsg-msgTitle").val("");
        // //메세지 내용
        // $("#pushMsg-msg").text("");
        //
        // //배경 색
        // $("#pushMsg-backColor").val("#000000");
        // $("#pushMsg-backColor-RGB").text("#000000");
        // //배경 이미지
        // //??
        //
        // //메세지 포함 이미지
        // //??
        //
        // //등록/수정일
        // $("#pushMsg-workDate").text("");
    }

    // 데이터 셋팅 (Json)
    function setData_banner(json){
        //No.
        var banner_no = json.column01;
        //배너제목
        var banner_title = json.column02;
        //등록/수정 처리자
        var banner_manager = json.column03;
        //등록/수정일
        var banner_registDate = json.column04;
        //구분
        var banner_loginType = json.column05;
        //성별
        var banner_genderType = json.column06;
        //노출빈도
        var banner_frequency = json.column07;
        //게시여부
        var banner_publishStatus = json.column08;
        //노출기간
        var banner_selectExposureType = json.column09;
        //배너구분
        var banner_bannerType = json.column10;
        //배너이미지
        var banner_bannerImg = json.column11;
        //썸네일
        var banner_thumbImg = json.column12;

        // var banner_startDate = json.column13;
        // var banner_startHour = json.column14;
        // var banner_startMinute = json.column15;
        // var banner_endDate = json.column16;
        // var banner_endHour = json.column17;
        // var banner_endMinute = json.column18;

        //No.
        $("#banner-no").text(banner_no);
        //배너제목
        $("#banner-title").val(banner_title);
        //등록/수정 처리자
        $("#banner-manager").text(banner_manager);
        //등록/수정일
        $("#banner-registDate").text(banner_registDate);

        //구분
        $('input:radio[name="banner-loginType"][value='+ banner_loginType +']').prop('checked', true);
        //성별
        $('input:radio[name="banner-genderType"][value='+ banner_genderType +']').prop('checked', true);
        //노출빈도
        $('input:radio[name="banner-frequency"][value='+ banner_frequency +']').prop('checked', true);
        //게시여부
        $('input:radio[name="banner-publishStatus"][value='+ banner_publishStatus +']').prop('checked', true);
        //노출기간
        $('input:radio[name="banner-selectExposureType"][value='+ banner_selectExposureType +']').prop('checked', true);



        //배너구분
        $('input:radio[name="banner-bannerType"][value='+ banner_bannerType +']').prop('checked', true);

        //배너이미지
        // $("#banner-bannerImg").val(banner_bannerImg);
        //썸네일
        // $("#banner-thumbImg").val(banner_thumbImg);

        // //수신대상 지정회원일 경우
        // if(pushMsg_receiveType=="4"){
        //     $("#div_selectTarget").show();
        //     $("#btn_selectMember").prop("disabled",false);
        //     //TODO 수신대상 그려야 함.
        //
        // }else{
        //     $("#btn_selectMember").prop("disabled",true);
        //     $("#div_selectTarget").hide();
        //     $("#div_selectTarget").empty();
        // }
        //
        // //발송여부
        // $('input:radio[name="pushMsg-msgType"][value='+ pushMsg_msgType +']').prop('checked', true);
        // //발송여부 예약발송일 경우 일시 적용
        // if(pushMsg_sendType=="1"){
        //     $("#pushMsg-sendDate").val(pushMsg_sendDate);
        //     $("#pushMsg-sendHour").val(pushMsg_sendHour);
        //     $("#pushMsg-sendMinute").val(pushMsg_sendMinute);
        //
        //     $("#pushMsg-div-sendDate").show();
        // }
        //
        // //메세지 구분
        // $('input:radio[name="pushMsg-sendType"][value='+ pushMsg_sendType +']').prop('checked', true);
        //
        // //메세지 제목
        // $("#pushMsg-msgTitle").val(pushMsg_msgTitle);  //No.
        // //메세지 내용
        // $("#pushMsg-msg").text(pushMsg_msg);  //No.
        //
        // //배경 색
        // $("#pushMsg-backColor").val(pushMsg_backColor);
        // $("#pushMsg-backColor-RGB").text(pushMsg_backColor);
        // //배경 이미지
        // //??
        //
        // //메세지 포함 이미지
        // //??
        //
        // //등록/수정일
        // $("#pushMsg-workDate").text(pushMsg_workDate);
    }


    // 데이터 가져오기
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





<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_bannerDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="pushIdx" value="{{pushIdx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 배너를 등록 /수정 관리하는 페이지 입니다.
                <br>
                • 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료 ]버튼을 클릭해야 적용이 완료됩니다.
            </div>
            <div class="pull-right">
                <input type="button" value="등록완료" class="btn btn-success btn-sm" id="btn_done" />
            </div>
        </div>
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th rowspan="2">No</th>
                <td rowspan="2">{{bannerIdx}}</td>

                <th rowspan="2">배너 제목</th>
                <td colspan="6"  rowspan="2"><input type="text" class="form-control" id="banner-title" placeholder="title"></td>

                <th>등록/수정자</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th>등록/수정일시</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th>구분</th>
                <td colspan="2">{{{getCommonCodeRadio -1 'banner_loginType'}}}</td>

                <th>성별</th>
                <td colspan="2">{{{getCommonCodeRadio -1 'gender'}}}</td>

                <th>노출 빈도</th>
                <td colspan="5">{{{getCommonCodeRadio 10 'banner_frequency'}}}</td>
            </tr>
            <tr>
                <th>배너위치</th>
                <td colspan="6">{{{getCommonCodeRadio 1 'banner_bannerType_noAll'}}}</td>

                <th>페이지 전환</th>
                <td colspan="4">{{{getCommonCodeRadio 1 'viewType'}}}</td>
            </tr>
            <tr>
                <th>게시여부</th>
                <td colspan="2">{{{getCommonCodeRadio 1 'banner_viewOn'}}}</td>

                <th>노출 기간</th>
                <td colspan="8">
                    <div class="row col-md-12">
                        <label class="control-inline fancy-radio">
                            <input type="radio" class="form-control" name="banner-selectExposureType" value="0" checked="true"><span><i></i>상시</span>
                        </label>
                        <label class="control-inline fancy-radio">
                            <input type="radio" class="form-control" name="banner-selectExposureType" value="1"><span><i></i>직접선택</span>
                        </label>
                    </div>
                    <div class="row col-md-12" id="banner-div-exposure" style="display: none;">
                        <div class="col-md-5 no-padding">
                            <div class="col-md-6 no-padding">
                                <div class="col-md-12 input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id="banner-startDate" width="100px">
                                </div>
                            </div>
                            <div class="col-md-6 no-padding" style="display: flex; align-items: stretch;">
                                <select id="banner-startHour" class="select-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                                </select>
                                <select id="banner-startMinute" class="selesetData_pushMsgct-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 no-padding">
                            <div class="col-md-6 no-padding">
                                <div class="col-md-12 input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id="banner-endDate" width="100px">
                                </div>
                            </div>
                            <div class="col-md-6 no-padding" style="display: flex; align-items: stretch;">
                                <select id="banner-endHour" class="select-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                                </select>
                                <select id="banner-endMinute" class="select-ticket-type" style="width: 45px; height: 34px; margin-left: 3px;">
                                </select>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="12">배너 이미지</th>
            </tr>
            <tr>
                <th>PC (1618px x 000px)</th>
                <td colspan="5">
                    <input type="file" id="banner-bannerPCImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>

                <th>Mobile (1618px x 000px)</th>
                <td colspan="5">
                    <input type="file" id="banner-bannerMobileImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>
            </tr>
            <tr>
                <td colspan="6">미리보기</td>

                <td colspan="6">미리보기</td>
            </tr>
            <tr>
                <th>PC 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="banner-bannerPCLink" placeholder="배너 클릭 시 이동할 링크"></td>

                <th>Mobile 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="banner-bannerMobileLink" placeholder="배너 클릭 시 이동할 링크"></td>
            </tr>
            <tr>
                <th>썸네일 (공통)</th>
                <td colspan="4">
                    <input type="file" id="banner-thumbImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>
                <td colspan="1">미리보기</td>

                <th>비고</th>
                <td colspan="5">
                    <textarea class="form-control" name="banner-note" id="banner-note" rows="5" cols="30" placeholder="설명 및 메모를 입력해주세요." style="resize: none" maxlength="200"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</script>