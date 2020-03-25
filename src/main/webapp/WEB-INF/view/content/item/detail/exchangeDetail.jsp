<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_exchangeDetail.init();
    });


    var fnc_exchangeDetail = {
//=------------------------------ Init / Event--------------------------------------------
        "targetId": "exchangeDetail",
        "formId" : "exchangeDetailForm",

        init() {
            this.target = $("#"+this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_exchangeDetail.insertEventDetail();
            }else{
                console.log(getSelectDataInfo());
                this.dataKey = getSelectDataInfo().dataKey;
                this.data = getSelectDataInfo().data;

                fnc_exchangeDetail.updateEventDetail();
            }

            // this.initDetail();
            // this.initEventDetail();
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
            this.target.find("#event-div-period").find("#iconStartDate, #iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
                    console.log(t1);
                    this.target.find("#event-div-period").find("#startDate").val(start.format('YYYY.MM.DD'));
                    this.target.find("#event-div-period").find("#endDate").val(end.format('YYYY.MM.DD'));
                }
            );
            this.target.find("#event-div-exposure").find("#iconStartDate, #iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
                    console.log(t1);
                    this.target.find("#event-div-exposure").find("#startDate").val(start.format('YYYY.MM.DD'));
                    this.target.find("#event-div-exposure").find("#endDate").val(end.format('YYYY.MM.DD'));
                }
            );

            // 캘린더 초기값
            this.target.find("[name=startDate]").val(moment().format('YYYY.MM.DD'));
            this.target.find("[name=endDate]").val(moment().format('YYYY.MM.DD'));

            // 시간 Select CSS 적용
            this.target.find("[name=timeHour]").attr("class", "select-time");
            this.target.find("[name=timeMinute]").attr("class", "select-time");
        },

        // 이벤트 적용
        initEventDetail(){

            //로그인 타입 선택
            this.target.find("input[name='loginType']:radio").change(function () {
                var type = this.value;

                //로그인 사용자일 경우 성별 선택 가능
                if(type == "1"){
                    this.target.find("input[name='gender']").prop("disabled",false);
                }else{
                    this.target.find("input[name='gender']").prop("disabled",true);
                    this.target.find("input[name='gender']:input[value='1']").prop("checked", true);
                }

            });


            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {
                if(this.isValid()){
                    //TODO 완료처리 필요
                    this.getEventDetailData();
                }
            })


            // 수정 버튼
            this.target.find("#insertBtn").on("click", function () {
                if(this.isValid()){
                    //TODO 완료처리 필요
                    this.getEventDetailData();
                }
            })
        },



//=------------------------------ Option --------------------------------------------

        // 등록 화면
        insertEventDetail() {
            console.log(this)
            var template = $('#tmp_exchangeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#"+this.formId).html(templateScript);

            console.log(this.target.find("#"+this.formId))
            console.log(templateScript)

            this.initDetail();
            this.initEventDetail();
        },


        // 수정 화면
        updateEventDetail(json){
            if(common.isEmpty(getSelectDataInfo())){
                alert("[ERROR] SelectDataInfo 전달 실패!")
                console.log("[ERROR] SelectDataInfo 전달 실패! =-----")
                console.log(getSelectDataInfo());
                console.log("[ERROR] SelectDataInfo 전달 실패! -----=")
                return false;
            }

            var dataKey = getSelectDataInfo().dataKey;
            var data = getSelectDataInfo().data;


            dalbitLog(data);
            // form 띄우기
            var template = $('#tmp_exchangeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = data;
            var html = templateScript(context);
            this.target.find("#"+ this.formId).html(html);

            this.initDetail();
            this.initEventDetail();

            //TODO 데이터 셋팅 후 이벤트 처리 필요
            //TODO 수신대상 그려야 함.
        },




//=------------------------------ Data Handler ----------------------------------

        // 데이터 가져오기
        getEventDetailData(){
            var resultJson ={};

            var formArray = this.target.find("#" + this.formId).serializeArray();
            for (var i = 0; i < formArray.length; i++){
                resultJson[formArray[i]['name']] = formArray[i]['value'];
            }

            //Date 처리이이이~~~
            var periodStartDiv = this.target.find("#event-div-period").find("#event-div-startDate");
            resultJson['periodStartDate'] = periodStartDiv.find("#startDate").val().replace(/[^0-9]/gi, '') + periodStartDiv.find("#timeHour").val() + periodStartDiv.find("#timeMinute").val();
            var periodEndDiv = this.target.find("#event-div-period").find("#event-div-endDate");
            resultJson['periodEndDate'] = periodEndDiv.find("#endDate").val().replace(/[^0-9]/gi, '') + periodStartDiv.find("#timeHour").val() + periodStartDiv.find("#timeMinute").val();

            var exposureStartDiv = this.target.find("#event-div-exposure").find("#event-div-startDate");
            resultJson['exposureStartDate'] = exposureStartDiv.find("#startDate").val().replace(/[^0-9]/gi, '') + exposureStartDiv.find("#timeHour").val() + exposureStartDiv.find("#timeMinute").val();
            var exposureEndDiv = this.target.find("#event-div-exposure").find("#event-div-endDate");
            resultJson['exposureEndDate'] = exposureEndDiv.find("#endDate").val().replace(/[^0-9]/gi, '') + exposureStartDiv.find("#timeHour").val() + exposureStartDiv.find("#timeMinute").val();

            dalbitLog(resultJson)
            return resultJson
        },


        isValid(){
            return true;
        }

    }
//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_exchangeDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="exchangeIdx" value="{{exchangeIdx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 별을 달로 교환하는 아이템을 등록 및 관리하는 페이지입니다.
                <br>
                • 각 서비스 내 적용사항만 입력하세요.
            </div>
            <div class="pull-right">
                {{^exchangeIdx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/exchangeIdx}}
                {{#exchangeIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/exchangeIdx}}
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
                    <th rowspan="2">No</th>
                    <td rowspan="2">{{exchangeIdx}}</td>

                    <th rowspan="2">플랫폼</th>
                    <td colspan="2" rowspan="2">{{{getCommonCodeCheck -1 'content_platform3' 'Y'}}}</td>

                    <th rowspan="2">아이템 코드</th>
                    <td colspan="3" rowspan="2"></td>

                    <th>등록/수정자</th>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th>등록/수정일시</th>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th>아이템명</th>
                    <td colspan="3">
                        <input type="text" class="form-control" id="exchange-itemNm" name="exchangeItemNm" placeholder="아이템명을 입력하여 주시기 바랍니다." value="{{column02}}">
                    </td>

                    <th>지급 수량 (달)</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="exchange-paymentQuantity" name="exchangePaymentQuantity" placeholder="지급될 달 수량." value="{{column02}}" style="width: 70%;">
                            <span>(달)</span>
                        </div>
                    </td>

                    <th>가격</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="exchange-price" name="exchangePrice" placeholder="아이템 구매 별 수량." value="{{column02}}" style="width:70%;"/>
                            <span>(별)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td colspan="3">{{{getCommonCodeRadio -1 'item_discount'}}}</td>

                    <th>타입</th>
                    <td colspan="3">{{{getCommonCodeCheck 1 'item_itemType'}}}</td>

                    <th>게시여부</th>
                    <td colspan="3">{{{getCommonCodeRadio 1 'content_viewOn'}}}</td>
                </tr>
                <tr>
                    <th>아이템 이미지 URL</th>
                    <td colspan="5">
                        <input type="text" id="exchange-itemImg" name="exchangeItemImg" style="width:70%">
                        <input type="button" value="미리보기" onclick="getImg('exchangeItemImg')">
                    </td>

                    <th>썸네일 (공통)</th>
                    <td colspan="4">
                        <input type="text" id="exchange-thumbImg" name="exchangeThumbImg" style="width:70%">
                        <input type="button" value="미리보기" onclick="getImg('exchangeThumbImg')">
                    </td>
                    <td colspan="1">
                        <!--미리보기-->
                        <img id="exchangeThumbImgViewer" style="width:70px; height:70px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <!--미리보기-->
                        <img id="exchangeItemImgViewer" style="max-width:360px; max-height:450px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                    </td>

                    <th>상품상세 설명</th>
                    <td colspan="5">
                        <textarea class="form-control" name="exchangeNote" id="exchange-note" rows="5" cols="30" placeholder="아이템 상세 내용을 입력하여 주시기 바랍니다." style="resize: none" maxlength="200"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</script>