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
    <form id="eventForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
    });

//=------------------------------ Init / Event--------------------------------------------
    // Datapicker
    var dataPickerSrc = {
        startDate: moment(),
        endDate: moment(),
        // dateLimit: { days: 60 },
        showDropdowns: true,
        showWeekNumbers: true,
        timePicker: false,
        timePickerIncrement: 1,
        timePicker12Hour: false,
        ranges: {
            '1일': [moment(), moment()],
            // '어제': [moment().subtract('days', 1), moment().subtract('days', 1)],
            '7일': [moment(), moment().add('days', 6)],
            '30일': [moment(), moment().add('days', 29)]
        },
        opens: 'left',
        // buttonClasses: ['btn btn-default'],
        // applyClass: 'btn-small btn-primary',
        // cancelClass: 'btn-small',
        format: 'L',
        separator: ' to ',
        locale: {
            customRangeLabel: '직접선택',
        }
    }

    // 초기 설정
    function initDetail() {
        // 캘린더 기능추가
        $("#event-div-period").find("#iconStartDate, #iconEndDate").daterangepicker( dataPickerSrc,
            function(start, end, t1) {
                console.log(t1);
                $("#event-div-period").find("#startDate").val(start.format('YYYY.MM.DD'));
                $("#event-div-period").find("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
        $("#event-div-exposure").find("#iconStartDate, #iconEndDate").daterangepicker( dataPickerSrc,
            function(start, end, t1) {
                console.log(t1);
                $("#event-div-exposure").find("#startDate").val(start.format('YYYY.MM.DD'));
                $("#event-div-exposure").find("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );

        // 캘린더 초기값
        $("[name=startDate]").val(moment().format('YYYY.MM.DD'));
        $("[name=endDate]").val(moment().format('YYYY.MM.DD'));

        // 시간 Select CSS 적용
        $("[name=timeHour]").attr("class", "select-time");
        $("[name=timeMinute]").attr("class", "select-time");
    }

    // 이벤트 적용
    function initEventDetail(tab_id){

        //로그인 타입 선택
        $("input[name='loginType']:radio").change(function () {
            var type = this.value;

            //로그인 사용자일 경우 성별 선택 가능
            if(type == "1"){
                $("input[name='gender']").prop("disabled",false);
            }else{
                $("input[name='gender']").prop("disabled",true);
                $("input[name='gender']:input[value='1']").prop("checked", true);
            }

        });


        // 등록 버튼
        $("#insertBtn").on("click", function () {
            if(isValid()){
                //TODO 완료처리 필요
                getEventDetailData();
            }
        })


        // 수정 버튼
        $("#insertBtn").on("click", function () {
            if(isValid()){
                //TODO 완료처리 필요
                getEventDetailData();
            }
        })
    }



//=------------------------------ Option --------------------------------------------

    // 등록 화면
    function insertEventDetail() {
        var template = $('#tmp_eventDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#eventForm").html(templateScript);

        initDetail();
        initEventDetail();
    }


    // 수정 화면
    function updateEventDetail(json){
        dalbitLog(json);
        // form 띄우기
        var template = $('#tmp_eventDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = json;
        var html = templateScript(context);
        $("#eventForm").html(html);

        initDetail();
        initEventDetail();

        //TODO 데이터 셋팅 후 이벤트 처리 필요
        //TODO 수신대상 그려야 함.
    }




//=------------------------------ Data Handler ----------------------------------

    // 데이터 가져오기
    function getEventDetailData(){
        var resultJson ={};

        var formArray = $("#eventForm").serializeArray();
        for (var i = 0; i < formArray.length; i++){
            resultJson[formArray[i]['name']] = formArray[i]['value'];
        }

        //Date 처리이이이~~~
        var periodStartDiv = $("#event-div-period").find("#event-div-startDate");
        resultJson['periodStartDate'] = periodStartDiv.find("#startDate").val().replace(/[^0-9]/gi, '') + periodStartDiv.find("#timeHour").val() + periodStartDiv.find("#timeMinute").val();
        var periodEndDiv = $("#event-div-period").find("#event-div-endDate");
        resultJson['periodEndDate'] = periodEndDiv.find("#endDate").val().replace(/[^0-9]/gi, '') + periodStartDiv.find("#timeHour").val() + periodStartDiv.find("#timeMinute").val();

        var exposureStartDiv = $("#event-div-exposure").find("#event-div-startDate");
        resultJson['exposureStartDate'] = exposureStartDiv.find("#startDate").val().replace(/[^0-9]/gi, '') + exposureStartDiv.find("#timeHour").val() + exposureStartDiv.find("#timeMinute").val();
        var exposureEndDiv = $("#event-div-exposure").find("#event-div-endDate");
        resultJson['exposureEndDate'] = exposureEndDiv.find("#endDate").val().replace(/[^0-9]/gi, '') + exposureStartDiv.find("#timeHour").val() + exposureStartDiv.find("#timeMinute").val();

        dalbitLog(resultJson)
        return resultJson
    }


    function isValid(){
        return true;
    }


//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_eventDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="eventIdx" value="{{eventIdx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 이벤트를 등록 /수정 관리하는 페이지 입니다.
                <br>
                • 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료 ]버튼을 클릭해야 적용이 완료됩니다.
            </div>
            <div class="pull-right">
                {{^eventIdx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/eventIdx}}
                {{#eventIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/eventIdx}}
            </div>
        </div>
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th>No</th>
                <td>{{eventIdx}}</td>

                <th>이벤트 제목</th>
                <td colspan="6"><input type="text" class="form-control" id="event-title" name="eventTitle" placeholder="프로모션 제목을 입력하세요."></td>

                <th>등록/수정자</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th>진행여부</th>
                <td colspan="8"></td>

                <th>등록/수정일시</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th>기간</th>
                <td colspan="5">
                    <div class="form-inline" id="event-div-period">
                        <div class="input-group date" id="event-div-startDate">
                            <span class="input-group-addon" id="iconStartDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="startDate" id="startDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="event-div-endDate">
                            <span class="input-group-addon" id="iconEndDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="endDate" id="endDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                    </div>
                </td>

                <th>노출</th>
                <td colspan="5">
                    <div class="form-inline" id="event-div-exposure">
                        <div class="input-group date" id="event-div-startDate">
                            <span class="input-group-addon" id="iconStartDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="startDate" id="startDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="event-div-endDate">
                            <span class="input-group-addon" id="iconEndDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="endDate" id="endDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>구분</th>
                <td colspan="2">{{{getCommonCodeRadio -1 'banner_loginType'}}}</td>

                <th>성별</th>
                <td colspan="2">{{{getCommonCodeRadio 1 'gender'}}}</td>

                <th>페이지 전환</th>
                <td colspan="2">{{{getCommonCodeRadio 1 'viewType'}}}</td>

                <th>게시여부</th>
                <td colspan="2">{{{getCommonCodeRadio 1 'banner_viewOn'}}}</td>
            </tr>
            <tr>
                <th colspan="12">배너 이미지</th>
            </tr>
            <tr>
                <th>PC (1618px x 000px)</th>
                <td colspan="5">
                    <input type="file" id="event-eventPCImg" name="eventPCImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>

                <th>Mobile (1618px x 000px)</th>
                <td colspan="5">
                    <input type="file" id="event-eventMobileImg" name="eventMobileImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>
            </tr>
            <tr>
                <td colspan="6">미리보기</td>

                <td colspan="6">미리보기</td>
            </tr>
            <tr>
                <th>PC 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="event-eventPCLink"  name="eventPCLink" placeholder="배너 클릭 시 이동할 링크"></td>

                <th>Mobile 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="event-eventMobileLink" name="eventMobileLink" placeholder="배너 클릭 시 이동할 링크"></td>
            </tr>
            <tr>
                <th>썸네일 (공통)</th>
                <td colspan="4">
                    <input type="file" id="event-thumbImg">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </td>
                <td colspan="1">미리보기</td>

                <th>비고</th>
                <td colspan="5">
                    <textarea class="form-control" name="event-note" id="event-note" rows="5" cols="30" placeholder="설명 및 메모를 입력해주세요." style="resize: none" maxlength="200"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</script>