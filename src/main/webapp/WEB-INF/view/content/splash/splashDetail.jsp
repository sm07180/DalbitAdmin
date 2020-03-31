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
    <form id="splashForm"></form>
</div>



<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        // init_Detail();
        // initEvent_Detail();
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
    function init_Detail() {
        // 캘린더 기능추가
        $("#splash-startDate, #splash-endDate").daterangepicker( dataPickerSrc,
            function(start, end, t1) {
                console.log(t1);
                $("#splash-input-startDate").val(start.format('YYYY.MM.DD'));
                $("#splash-input-endDate").val(end.format('YYYY.MM.DD'));
            }
        );

        // 캘린더 초기값
        $("#splash-input-startDate").val(moment().format('YYYY.MM.DD'));
        $("#splash-input-endDate").val(moment().format('YYYY.MM.DD'));

        // 시간 Select CSS 적용
        $("#splash-div-startDate").find("#timeHour").attr("class", "select-time");
        $("#splash-div-startDate").find("#timeMinute").attr("class", "select-time");
        $("#splash-div-endDate").find("#timeHour").attr("class", "select-time");
        $("#splash-div-endDate").find("#timeMinute").attr("class", "select-time");
    }

    // 이벤트 적용
    function initEvent_Detail(tab_id){

        //게시기간 선택
        $("input[name='exposureType']:radio").change(function () {
            var type = this.value;

            //예약 발송 일 경우 날짜 추가
            if(type == "1"){
                $("#splash-div-exposure").show();
            }else{
                $("#splash-div-exposure").hide();
            }
        });


        // 등록 수정 완료 버튼
        $("#insertBtn").on("click", function () {
            //TODO 완료처리 필요
            getSplashData();
        })

        // 지정회원 - 수신대상
        $("#btn_selectMember").on("click", function () {
            showPopMemberList(choiceMember);
        })
    }





//=------------------------------ Option --------------------------------------------

    // 등록 화면
    function insertSplash() {
        var template = $('#tmp_splashDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#splashForm").html(templateScript);

        console.log(templateScript);

        init_Detail();
        initEvent_Detail();
    }

    // 수정 화면
    function updateSplash(json){
        dalbitLog(json);
        // form 띄우기
        var template = $('#tmp_splashDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = json;
        var html = templateScript(context);
        $("#splashForm").html(html);

        init_Detail();
        initEvent_Detail();

        //TODO 데이터 셋팅 후 이벤트 처리 필요
    }





//=------------------------------ Data Handler ----------------------------------

    // 데이터 가져오기
    function getSplashData(){
        var resultJson ={};

        var formArray = $("#splashForm").serializeArray();
        for (var i = 0; i < formArray.length; i++){
            resultJson[formArray[i]['name']] = formArray[i]['value'];
        }

        //Date 처리이이이~~~
        var sendDateDiv = $("#splash-div-sendDate");
        resultJson['sendDate'] = sendDateDiv.find("#splash-sendDate").val().replace(/[^0-9]/gi, '') + sendDateDiv.find("#timeHour").val() + sendDateDiv.find("#timeMinute").val();

        //지정회원 parsing
        var selectTarget = [];
        if($("input:radio[name=splash-receiveType]:checked").val() == "4"){
            $("#div_selectTarget").find("p").each(function () {
                var id = $(this).prop("id");
                alert(id);

                selectTarget.splash(id);
            })
            resultJson['selectTarget'] = selectTarget;
        }

        dalbitLog(resultJson)
        return resultJson;
    }



    function isValid(){
        return true;
    }


//=------------------------------ Modal ----------------------------------

    // [수신대상 선택 - 지정회원] 회원 추가
    function choiceMember(data){
        var html = '<p id="'+ data.mem_no +'">' + data.mem_no + ' <a onclick="delMember($(this))">[X]</a></p>'

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


</script>






<!-- =------------------ Handlebars ---------------------------------- -->

<script id="tmp_splashDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="splashIdx" value="{{splashIdx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                ㆍ <b>*</b> 는 필수 입력사항 입니다. <br>
                ㆍ 로딩 중인 스플래시 메시지 이미지 또는 내용을 확인하고 , 추가등록 변경할 수 있습니다.
            </div>
            <div class="pull-right">
                {{^splashIdx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/splashIdx}}
                {{#splashIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/splashIdx}}
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
                <td>{{splashIdx}}</td>

                <th>게시상태</th>
                <td colspan="3">{{{getCommonCodeRadio 0 'content_viewOn'}}}</td>

                <th>등록/수정일</th>
                <td colspan="5">{{date}}</td>
            </tr>
            <tr>
                <th>메세지 제목</th>
                <td colspan="5"><input type="text" class="form-control" id="splash-msgTitle" placeholder="관리를 위한 제목을 입력해주세요."></td>

                <th rowspan="2">게시기간</th>
                <td colspan="5" rowspan="2">
                    <div>
                        {{{getCommonCodeRadio 0 'splash_exposureType'}}}
                    </div>
                    <div id="splash-div-exposure" style="display: none;">
                        <div class="input-group date" id="splash-div-startDate">
                            <span class="input-group-addon" id="splash-startDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="startDate" id="splash-input-startDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="splash-div-endDate">
                            <span class="input-group-addon" id="splash-endDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="endDate" id="splash-input-endDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th rowspan="2">메세지 내용</th>
                <td colspan="5" rowspan="2">
                    <div>
                        <textarea class="form-control" name="splash-msg" id="splash-msg" rows="5" cols="30" placeholder="방송 시스템에 적용되는 내용을 작성해주세요." style="resize: none" maxlength="40"></textarea>
                        <span style="color: red">* 메시지 내용은 10자~40자(한글) 입력 가능합니다.</span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>연동 이미지</th>
                <td colspan="5">
                    <div>
                        <input type="file" id="splash-inputImg">
                        <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</script>