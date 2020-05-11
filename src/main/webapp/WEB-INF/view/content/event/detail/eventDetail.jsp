<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div>
    <form id="eventForm"></form>
</div>

<div id="eventDetail_fullSize"></div>

<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_eventDetail.init();
    });

    var fnc_eventDetail = {
//=------------------------------ Init / Event--------------------------------------------
        "targetId": "eventDetail",

        init() {
            this.target = $("#"+this.targetId);

            if(common.isEmpty(getSelectDataInfo())){
                fnc_eventDetail.insertEventDetail();
            }else{
                console.log(getSelectDataInfo());
                this.dataKey = getSelectDataInfo().dataKey;
                this.data = getSelectDataInfo().data;

                fnc_eventDetail.updateEventDetail();
            }

            // this.initDetail();
            // this.initDetailEvent();
        },

        // Datapicker
        "dataPickerSrc" : {
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
        },

        // 초기 설정
        initDetail() {

            // 캘린더 기능추가
            $("#event-div-period").find("#iconStartDate, #iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
                    console.log(t1);
                    $("#event-div-period").find("#startDate").val(start.format('YYYY.MM.DD'));
                    $("#event-div-period").find("#endDate").val(end.format('YYYY.MM.DD'));
                }
            );
            $("#view-event-div-exposure").find("#view-iconStartDate, #view-iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
                    console.log(t1);
                    $("#view-event-div-exposure").find("#view-startDate").val(start.format('YYYY.MM.DD'));
                    $("#view-event-div-exposure").find("#view-endDate").val(end.format('YYYY.MM.DD'));
                }
            );

            // 캘린더 초기값
            $("#event-div-period").find("[name=startDate]").val(moment().format('YYYY.MM.DD'));
            $("#event-div-period").find("[name=endDate]").val(moment().format('YYYY.MM.DD'));
            $("#view-event-div-exposure").find("[name=view-startDate]").val(moment().format('YYYY.MM.DD'));
            $("#view-event-div-exposure").find("[name=view-endDate]").val(moment().format('YYYY.MM.DD'));

            // 시간 Select CSS 적용
            $("#event-div-period").find("[name=timeHour]").attr("class", "select-time");
            $("#event-div-period").find("[name=timeMinute]").attr("class", "select-time");
            $("#view-event-div-exposure").find("[name=timeHour]").attr("class", "select-time");
            $("#view-event-div-exposure").find("[name=timeMinute]").attr("class", "select-time");
        },

        // 이벤트 적용
        initEventDetail(){

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

            //OS 구분
            $("input[name='platform']").change(function () {
                console.log("1111");
                if ($(this).val() == "-1") {
                    if ($(this).is(":checked")) {
                        $("input[name='platform']").each(function () {
                            this.checked = true;
                        });
                    } else {
                        $("input[name='platform']").each(function () {
                            this.checked = false;
                        });
                    }
                } else {
                    if ($(this).is(":checked")) {
                        var cntTotal = $("input[name='platform']").length;
                        var cntChecked = $("input[name='platform']:checked").length;
                        if ((cntTotal) == (cntChecked + 1)) {
                            $("input[name='platform'][value='-1']").prop("checked", true);
                        }
                    } else {
                        $("input[name='platform'][value='-1']").prop("checked", false);
                    }
                }
            });

            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {

                console.log("@@@@@@@@@@@@@@@@@@@@");

                var data = fnc_eventDetail.getEventDetailData();
                data.idx = 1;
                if(!fnc_eventDetail.isValid(data)){
                    return false;
                }
                if(confirm("등록 하시겠습니까?")){
                    util.getAjaxData("eventInsert", "/rest/content/event/eventInsert",data, fnc_eventDetail.event_fn_success, fnc_eventDetail.event_fn_fail);
                }else{
                    return false;
                }
            });

            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                var data = fnc_eventDetail.getEventDetailData();
                if(!fnc_eventDetail.isValid(data)) {
                    return false;
                }
                if(confirm("수정 하시겠습니까?")){
                    util.getAjaxData("eventUpdate", "/rest/content/event/eventUpdate",data, fnc_eventDetail.event_fn_success, fnc_eventDetail.event_fn_fail);
                }else {
                    return false;
                }
            });
        },
//=------------------------------ Option --------------------------------------------
        // 등록 화면
        insertEventDetail() {
            var template = $('#tmp_eventDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#eventForm").html(templateScript);

            this.initDetail();
            this.initEventDetail();
        },


        // 수정 화면
        updateEventDetail(data){
            dalbitLog(data);
            // form 띄우기

            var template = $('#tmp_eventDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = data;
            var html = templateScript(context);
            $("#eventForm").html(html);
            this.initDetail();
            this.initEventDetail();

            var sDate = moment(data.start_datetime);
            var eDate = moment(data.end_datetime);
            var sViewDate = moment(data.view_start_datetime);
            var eViewDate = moment(data.view_end_datetime);

            // 캘린더
            this.target.find("#startDate").val(sDate.format('YYYY.MM.DD'));
            this.target.find("#endDate").val(eDate.format('YYYY.MM.DD'));
            this.target.find("#view-startDate").val(sViewDate.format('YYYY.MM.DD'));
            this.target.find("#view-endDate").val(eViewDate.format('YYYY.MM.DD'));

            // 시간 Select CSS 적용
            this.target.find("#event-div-startDate").find("#timeHour").val(common.lpad(sDate.hour() ,2,"0"));
            this.target.find("#event-div-startDate").find("#timeMinute").val(common.lpad(sDate.minute() ,2,"0"));
            this.target.find("#event-div-endDate").find("#timeHour").val(common.lpad(eDate.hour() ,2,"0"));
            this.target.find("#event-div-endDate").find("#timeMinute").val(common.lpad(eDate.minute() ,2,"0"));
            this.target.find("#view-event-div-startDate").find("#timeHour").val(common.lpad(sViewDate.hour() ,2,"0"));
            this.target.find("#view-event-div-startDate").find("#timeMinute").val(common.lpad(sViewDate.minute() ,2,"0"));
            this.target.find("#view-event-div-endDate").find("#timeHour").val(common.lpad(eViewDate.hour() ,2,"0"));
            this.target.find("#view-event-div-endDate").find("#timeMinute").val(common.lpad(eViewDate.minute() ,2,"0"));

            var arrPlatform = data.platform.split("");
            if(data.platform == "111"){
                $("input[name='platform']").each(function () {
                    this.checked = true;
                });
            }else{
                $("input[name='platform'][value='-1']").prop("checked", false);
                $("input[name='platform'][value='1']").prop("checked", false);
                $("input[name='platform'][value='2']").prop("checked", false);
                $("input[name='platform'][value='3']").prop("checked", false);
                if(arrPlatform[0] == "1")
                    $("input[name='platform'][value='1']").prop("checked", true);
                if(arrPlatform[1] == "1")
                    $("input[name='platform'][value='2']").prop("checked", true);
                if(arrPlatform[2] == "1")
                    $("input[name='platform'][value='3']").prop("checked", true);
            }
        },

//=------------------------------ Data Handler ----------------------------------
        // 데이터 세팅
        getEventDetailData(){
            var resultJson ={};

            var formArray = this.target.find("#eventForm").serializeArray();
            for (var i = 0; i < formArray.length; i++){
                resultJson[formArray[i]['name']] = formArray[i]['value'];
            }

            //Date 처리이이이~~~
            var periodStartDiv = this.target.find("#event-div-startDate");
            resultJson['start_datetime'] = periodStartDiv.find("#startDate").val().replace(/[^0-9]/gi, '') + periodStartDiv.find("#timeHour").val() + periodStartDiv.find("#timeMinute").val() + "00";
            var periodEndDiv = this.target.find("#event-div-endDate");
            resultJson['end_datetime'] = periodEndDiv.find("#endDate").val().replace(/[^0-9]/gi, '') + periodEndDiv.find("#timeHour").val() + periodEndDiv.find("#timeMinute").val() + "00";

            var view_periodStartDiv = this.target.find("#view-event-div-startDate");
            resultJson['view_start_datetime'] = view_periodStartDiv.find("#view-startDate").val().replace(/[^0-9]/gi, '') + view_periodStartDiv.find("#timeHour").val() + view_periodStartDiv.find("#timeMinute").val() + "00";
            var view_periodEndDiv = this.target.find("#view-event-div-endDate");
            resultJson['view_end_datetime'] = view_periodEndDiv.find("#view-endDate").val().replace(/[^0-9]/gi, '') + view_periodEndDiv.find("#timeHour").val() + view_periodEndDiv.find("#timeMinute").val() + "00";

            //platform
            if(fnc_eventDetail.target.find("#platform-1").is(":checked")){
                resultJson['platform'] = "111";
            }else{
                var platform ="";
                if($("input[name='platform'][value='1']").is(":checked")) platform += "1";
                else platform += "0";
                if($("input[name='platform'][value='2']").is(":checked")) platform += "1";
                else platform += "0";
                if($("input[name='platform'][value='3']").is(":checked")) platform += "1";
                else platform += "0";

                resultJson['platform'] = platform;
            }

            dalbitLog(resultJson);
            return resultJson;
        },


        isValid(data){
            if(common.isEmpty(data.loginType)){
                alert("구분을 선택해주세요.");
                return false;
            }
            if (common.isEmpty(data.platform) || data.platform == "000") {
                alert("노출 OS 구분을 선택하여 주시기 바랍니다.");
                return false;
            }
            if (common.isEmpty(data.event_title)) {
                alert("이벤트 제목을 입력하여 주시기 바랍니다.");
                return false;
            }
            if (common.isEmpty(data.pc_img_url) || common.isEmpty(data.mobile_img_url)) {
                alert("PC이미지 또는 모바일 이미지를 입력해 주세요.");
                return false;
            }
            if (common.isEmpty(data.pc_link_url) || common.isEmpty(data.mobile_link_url)) {
                alert("PC링크 또는 모바일 링크를 입력해 주세요.");
                return false;
            }
            if (common.isEmpty(data.thumb_img_url)) {
                alert("썸네일 이미지를 입력해 주세요.");
                return false;
            }
            //
            // var date = new Date();
            // var timestamp = date.getFullYear() +common.lpad(date.getMonth() + 1 ,2,"0") + common.lpad(date.getDate(),2,"0") +common.lpad(date.getHours(),2,"0") + common.lpad(date.getMinutes(),2,"0") + common.lpad(date.getSeconds(),2,"0");
            // var toDate = Number(timestamp);
            // if(toDate > Number(data.periodStartDate) || toDate > Number(data.periodEndDate) ||  toDate > Number(data.view_periodStartDate) || toDate > Number(data.view_periodEndDate)){
            //     alert("이벤트 기간 또는 노출 기간이 현제시간보다.");
            //     return false;
            // }

            return true;
        },

        // 등록 완료
        event_fn_success(dst_id, response){
            if(response.result == "fail"){
                alert(response.message);
                return false;
            }
            alert("성공");
            getEventInfo();
        },

        event_fn_fail(dst_id, response){
            console.log("에러!!!");
        },
    }

    function eventDetail_fullSize(url) {     // 이미지 full size
        $("#eventDetail_fullSize").html(util.imageFullSize("eventDetailFullSize",url));
        $('#eventDetailFullSize').modal('show');
    }
    mouseOver();
    function mouseOver(){
        var xOffset = 10;
        var yOffset = 30;

        $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버
            $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' /></p>"); //이미지
            $("#preview")
                .css("top",(e.pageY - xOffset) + "px")
                .css("left",(e.pageX + yOffset) + "px")
                .fadeIn("fast");
        });
        $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동
            $("#preview")
                .css("top",(e.pageY - xOffset) + "px")
                .css("left",(e.pageX + yOffset) + "px");
        });
        $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃
            $("#preview").remove();
        });
    }
//=------------------------------ Modal ----------------------------------

</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_eventDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="idx" value="{{idx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 이벤트를 등록 /수정 관리하는 페이지 입니다.
                <br>
                • 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료 ]버튼을 클릭해야 적용이 완료됩니다.
            </div>
            <div class="pull-right">
                {{^idx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/idx}}
                {{#idx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/idx}}
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
                <td>{{idx}}</td>

                <th>이벤트 제목</th>
                <td colspan="6"><input type="text" class="form-control" id="event_title" name="event_title" placeholder="프로모션 제목을 입력하세요." value="{{event_title}}"></td>

                <th>등록/수정자</th>
                <td colspan="2">{{op_name}} / {{last_op_name}}</td>
            </tr>
            <tr>
                <th>진행여부</th>
                <td colspan="1">{{state}}</td>
                <th>노출 OS구분</th>
                <td colspan="3">
                    <div id="div_platform">
                        <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform-1" value="-1" checked="true"><span>전체</span> </label>
                        <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform0" value="1" checked="true"><span>PC</span></label>
                        <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform1" value="2" checked="true"><span>Android</span></label>
                        <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform2" value="3" checked="true"><span>IOS</span></label>
                    </div>
                </td>

                <th>등록/수정일시</th>
                <td colspan="5">{{regDateFormat}} / {{lastUpdDateFormat}}</td>
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
                    <div class="form-inline" id="view-event-div-exposure">
                        <div class="input-group date" id="view-event-div-startDate">
                            <span class="input-group-addon" id="view-iconStartDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="view-startDate" id="view-startDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="view-event-div-endDate">
                            <span class="input-group-addon" id="view-iconEndDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="view-endDate" id="view-endDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>구분</th>
                <td colspan="2">{{{getCommonCodeRadio event_slct 'banner_loginType'}}}</td>

                <th>성별</th>
                <td colspan="2">{{{getCommonCodeRadio 1 'gender'}}}</td>

                <th>페이지 전환</th>
                <td colspan="2">{{{getCommonCodeRadio is_pop 'viewType'}}}</td>

                <th>게시여부</th>
                <td colspan="2">{{{getCommonCodeRadio is_view 'content_viewOn'}}}</td>
            </tr>
            <tr>
                <th colspan="12">배너 이미지</th>
            </tr>
            <tr>
                <th>PC (1618px x 000px)</th>
                <td colspan="5">
                    <input type="text" class="_trim" id="event-eventPCImg" name="pc_img_url" style="width:70%" value="{{pc_img_url}}">
                    <input type="button" value="미리보기" onclick="getImg('pc_img_url')">
                </td>

                <th>Mobile (1618px x 000px)</th>
                <td colspan="5">
                    <input type="text" class="_trim" id="event-eventMobileImg" name="mobile_img_url" style="width:70%" value="{{mobile_img_url}}">
                    <input type="button" value="미리보기" onclick="getImg('mobile_img_url')">
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <!--미리보기-->
                    <img id="pc_img_urlViewer" class="thumbnail" style="max-width:360px; max-height:450px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>

                <td colspan="6">
                    <!--미리보기-->
                    <img id="mobile_img_urlViewer" class="thumbnail" style="max-width:360px; max-height:450px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>
            </tr>
            <tr>
                <th>PC 링크</th>
                <td colspan="5"><input type="text" class="form-control _trim" id="event-eventPCLink"  name="pc_link_url" placeholder="배너 클릭 시 이동할 링크" value="{{pc_link_url}}"></td>

                <th>Mobile 링크</th>
                <td colspan="5"><input type="text" class="form-control _trim" id="event-eventMobileLink" name="mobile_link_url" placeholder="배너 클릭 시 이동할 링크" value="{{mobile_link_url}}"></td>
            </tr>
            <tr>
                <th>썸네일 (공통)</th>
                <td colspan="4">
                    <input type="text" class="_trim" id="event-thumbImg" name="thumb_img_url" style="width:70%" value="{{thumb_img_url}}">
                    <input type="button" value="미리보기" onclick="getImg('thumb_img_url')">
                </td>
                <td colspan="1">
                    <!--미리보기-->
                    <img id="thumb_img_urlViewer" class="thumbnail" style="width:70px; height:70px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>

                <th>비고</th>
                <td colspan="5">
                    <textarea class="form-control" name="desc" id="desc" rows="5" cols="30" placeholder="설명 및 메모를 입력해주세요." style="resize: none" maxlength="200">{{desc}}</textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</script>