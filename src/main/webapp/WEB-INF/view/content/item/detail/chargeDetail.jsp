<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_chargeDetail.init();
    });


    var fnc_chargeDetail = {
//=------------------------------ Init / Event / UI--------------------------------------------
        "targetId": "chargeDetail",
        "formId" : "chargeDetailForm",

        init() {
            this.target = $("#"+this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_chargeDetail.insertEventDetail();
            }else{
                console.log(getSelectDataInfo());

                var data = new Object();
                data.item_code = getSelectDataInfo().data.item_code;

                util.getAjaxData(fnc_chargeDetail.targetId, "/rest/content/item/charge/detail",data, fnc_chargeDetail.fn_detail_success, fnc_chargeDetail.fn_fail);
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
                    this.target.find("#event-div-period").find("#startDate").val(start.format('YYYY.MM.DD'));
                    this.target.find("#event-div-period").find("#endDate").val(end.format('YYYY.MM.DD'));
                }
            );
            this.target.find("#event-div-exposure").find("#iconStartDate, #iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
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
                var data = fnc_chargeDetail.getDetailData();

                if(!fnc_chargeDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("insert", "/rest/content/item/charge/insert", data, fnc_chargeDetail.fn_insert_success, fnc_chargeDetail.fn_fail);
            })


            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                var data = fnc_chargeDetail.getDetailData();

                if(!fnc_chargeDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("upldate", "/rest/content/item/charge/update", data, fnc_chargeDetail.fn_update_success, fnc_chargeDetail.fn_fail);
            })
        },


        //수정 데이터 조회 후 UI 처리
        initUpdateUI(){
            var detailData = getSelectDataInfo().detailData;

            console.log(detailData);

            //platform
            var platformCode = detailData.platform.split("");
            for(var i = 0; i < platformCode.length; i++){
                if(platformCode[i] == "1"){
                    fnc_chargeDetail.target.find("#platform"+(i+1)).attr("checked", true);
                }
            }


            //item_type
            var item_typeCode = detailData.item_type.split("");
            for(var i = 0; i < item_typeCode.length; i++){
                if(item_typeCode[i] == "1"){
                    fnc_chargeDetail.target.find("#item_type"+(i+1)).attr("checked", true);
                }
            }


        },


        // 등록 화면
        insertEventDetail() {
            var template = $('#tmp_chargeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#"+this.formId).html(templateScript);

            this.initDetail();
            this.initEventDetail();
        },


        // 수정 화면
        updateEventDetail(){
            var detailData = getSelectDataInfo().detailData;
            detailData.rowNum = getSelectDataInfo().data.rowNum;
            dalbitLog(detailData);


            // form 띄우기
            var template = $('#tmp_chargeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = detailData;
            var html = templateScript(context);
            fnc_chargeDetail.target.find("#"+ fnc_chargeDetail.formId).html(html);

            fnc_chargeDetail.initDetail();
            fnc_chargeDetail.initEventDetail();
            fnc_chargeDetail.initUpdateUI();
        },

//=------------------------------ Option --------------------------------------------

        // 상세 목록 조회 성공 시
        fn_detail_success(dst_id, data, dst_params){
            setSelectDataInfo("detailData", data.data);

            fnc_chargeDetail.updateEventDetail();
        },


        // 등록 성공 시
        fn_insert_success(dst_id, data, dst_params){
            alert(data.message);

            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_chargeDetail.formId).empty();
        },


        // 수정 성공 시
        fn_update_success(dst_id, data, dst_params){
            alert(data.message);

            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_chargeDetail.formId).empty();
        },


        // Ajax 실패
        fn_fail(data, textStatus, jqXHR){
            alert(data.message);

            console.log(data, textStatus, jqXHR);
        },


//=------------------------------ Data Handler ----------------------------------

        // 데이터 가져오기
        getDetailData(){
            var resultJson ={};

            var formArray = this.target.find("#" + this.formId).serializeArray();
            for (var i = 0; i < formArray.length; i++){
                resultJson[formArray[i]['name']] = formArray[i]['value'];
            }

            //platform
            var platformCnt = fnc_chargeDetail.target.find("input[name=platform]").length;
            var platform = "";
            for(var i = 0; i < platformCnt; i++){
                if(fnc_chargeDetail.target.find("#platform"+(i+1)).is(":checked")){
                    platform += "1";
                }else{
                    platform += "0";
                }
            }
            resultJson['platform'] = platform;

            //item_type
            var item_typeCnt = fnc_chargeDetail.target.find("input[name=item_type]").length;
            var item_type = "";
            for(var i = 0; i < item_typeCnt; i++){
                if(fnc_chargeDetail.target.find("#item_type"+(i+1)).is(":checked")){
                    item_type += "1";
                }else{
                    item_type += "0";
                }
            }
            resultJson['item_type'] = item_type;

            //discount_rate
            var discount_rate = fnc_chargeDetail.target.find("input[name=discount_rate]:checked");
            if(discount_rate.val() == "-1"){
                resultJson['discount_rate'] = fnc_chargeDetail.target.find("#inputDiscountEtc").val();
            }


            //item_price_ios TODO 알아봐야함...
            resultJson['item_price_ios'] = 0;

            dalbitLog(resultJson);
            return resultJson;
        },


        isValid(data){
            if(common.isEmpty(data.item_code)){
                alert("아이템 코드를 입력하여 주시기 바랍니다.");
                fnc_chargeDetail.target.find("input[name=item_code]").focus();
                return false;
            }

            if(common.isEmpty(data.item_name)){
                alert("아이템 명을 입력하여 주시기 바랍니다.");
                fnc_chargeDetail.target.find("input[name=item_name]").focus();
                return false;
            }

            if(common.isEmpty(data.dal)){
                alert("지급 수량(달)을 입력하여 주시기 바랍니다.");
                fnc_chargeDetail.target.find("input[name=dal]").focus();
                return false;
            }

            if(common.isEmpty(data.item_price)){
                alert("아이템 가격을 입력하여 주시기 바랍니다.");
                fnc_chargeDetail.target.find("input[name=item_price]").focus();
                return false;
            }

            if(common.isEmpty(data.discount_rate) || (data.discount_rate < 0 || data.discount_rate > 100)){
                alert("아이템 할인율을 확인하여 주시기 바랍니다.");
                fnc_chargeDetail.target.find("input[name=discount_rate]").focus();
                return false;
            }

            return true;
        },

    }
//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_chargeDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="item_code" value="{{item_code}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 스토어 페이지에서 구매 또는 선물할 수 있는 아이템을 등록 및 관리하는 페이지입니다
                <br>
                • 각 서비스 내 적용사항만 입력하세요.
            </div>
            <div class="pull-right">
                {{^item_code}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/item_code}}
                {{#item_code}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/item_code}}
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
                    <td rowspan="2">{{rowNum}}</td>

                    <th rowspan="2">플랫폼</th>
                    <td colspan="2" rowspan="2">{{{getCommonCodeHorizontalCheck -1 'content_platform2' 'Y' 'platform'}}}</td>

                    <th rowspan="2">아이템 코드</th>
                    <td colspan="3" rowspan="2">
                        <input type="text" class="form-control" id="charge-item_code" name="item_code" placeholder="아이템코드를 입력하여 주시기 바랍니다." value="{{item_code}}">
                    </td>

                    <th>등록/수정자</th>
                    <td colspan="2">{{opName}}</td>
                </tr>
                <tr>
                    <th>등록/수정일시</th>
                    <td colspan="2">{{lastUpdDate}}</td>
                </tr>
                <tr>
                    <th>아이템명</th>
                    <td colspan="3">
                        <input type="text" class="form-control" id="charge-item_name" name="item_name" placeholder="아이템명을 입력하여 주시기 바랍니다." value="{{item_name}}">
                    </td>

                    <th>지급 수량 (달)</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="charge-dal" name="dal" placeholder="지급될 달 수량." value="{{dal}}" style="width: 70%;">
                            <span>(달)</span>
                        </div>
                    </td>

                    <th>가격</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="charge-item_price" name="item_price" placeholder="아이템 구매 가격." value="{{item_price}}" style="width: 70%;">
                            <span>(원)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td colspan="11">{{{getCommonCodeRadio discount_rate 'item_discount'}}}</td>
                </tr>
                    <th>타입</th>
                    <td colspan="5">{{{getCommonCodeHorizontalCheck item_type 'item_itemType'}}}</td>

                    <th>게시여부</th>
                    <td colspan="2">{{{getCommonCodeRadio view_yn 'content_viewOn' 'N' 'view_yn'}}}</td>

                    <th>메인노출</th>
                    <td colspan="2">{{{getCommonCodeRadio main_yn 'content_viewOn' 'N' 'main_yn'}}}</td>
                </tr>
                <tr>
                    <th>아이템 이미지</th>
                    <td colspan="5">
                        <input type="text" id="charge-item_image" name="item_image" style="width:70%" value="{{item_image}}" >
                        <input type="button" value="미리보기" onclick="getImg('item_image')">
                    </td>

                    <th>썸네일 (공통)</th>
                    <td colspan="4">
                        <input type="text" id="charge-item_thumbnail" name="item_thumbnail" style="width:70%" value="{{item_thumbnail}}" >
                        <input type="button" value="미리보기" onclick="getImg('item_thumbnail')">
                    </td>
                    <td colspan="1">
                        <!--미리보기-->
                        <img id="item_thumbnailViewer" style="width:70px; height:70px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <!--미리보기-->
                        <img id="item_imageViewer" style="max-width:360px; max-height:450px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                    </td>

                    <th>상품상세 설명</th>
                    <td colspan="5">
                        <textarea class="form-control" name="desc" id="charge-desc" rows="5" cols="30" placeholder="아이템 상세 내용을 입력하여 주시기 바랍니다." style="resize: none" maxlength="200">{{desc}}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</script>