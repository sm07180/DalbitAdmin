<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_bannerDetail.init();
    });


    var fnc_bannerDetail = {
//=------------------------------ Init / Event / UI--------------------------------------------
        "targetId": "bannerDetail",
        "formId" : "bannerDetailForm",

        init() {
            this.target = $("#" + this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_bannerDetail.insertDetail();
            }else{
                console.log(getSelectDataInfo());

                var data = new Object();
                data.banner_idx = getSelectDataInfo().data.banner_idx;

                util.getAjaxData(fnc_bannerDetail.targetId, "/rest/content/banner/detail",data, fnc_bannerDetail.fn_detail_success, fnc_bannerDetail.fn_fail);
            }

            // this.initDetail();
            // this.initDetailEvent();
        },


        // Datapicker
        "dataPickerSrc": {
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
        initDetail()
        {
            // 캘린더 기능추가
            this.target.find("#banner-startDate, #banner-endDate").daterangepicker(this.dataPickerSrc,
                function (start, end, t1) {
                    console.log(t1);
                    fnc_bannerDetail.target.find("#banner-input-startDate").val(start.format('YYYY.MM.DD'));
                    fnc_bannerDetail.target.find("#banner-input-endDate").val(end.format('YYYY.MM.DD'));
                }
            );

            // 캘린더 초기값
            this.target.find("#banner-input-startDate").val(moment().format('YYYY.MM.DD'));
            this.target.find("#banner-input-endDate").val(moment().format('YYYY.MM.DD'));

            // 시간 Select CSS 적용
            this.target.find("#banner-div-startDate").find("#timeHour").attr("class", "select-time");
            this.target.find("#banner-div-startDate").find("#timeMinute").attr("class", "select-time");
            this.target.find("#banner-div-endDate").find("#timeHour").attr("class", "select-time");
            this.target.find("#banner-div-endDate").find("#timeMinute").attr("class", "select-time");
        },

        // 이벤트 적용
        initDetailEvent(){

            //로그인 타입 선택
            this.target.find("input[name='view_type']:radio").change(function () {
                var type = this.value;

                //로그인 사용자일 경우 성별 선택 가능
                if (type == "1") {
                    fnc_bannerDetail.target.find("input[name='sex']").prop("disabled", false);
                } else {
                    fnc_bannerDetail.target.find("input[name='sex']").prop("disabled", true);
                    fnc_bannerDetail.target.find("input[name='sex']:input[value='0']").prop("checked", true);
                }

            });


            //노출 기간
            this.target.find("input[name='term_type']:radio").change(function () {
                var type = this.value;

                if (type == "1") {  //예약발송
                    fnc_bannerDetail.target.find("#banner-div-exposure").show();
                } else {    //상시
                    fnc_bannerDetail.target.find("#banner-div-exposure").hide();
                }
            });


            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {
                var data = fnc_bannerDetail.getDetailData();

                if(!fnc_bannerDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("insert", "/rest/content/banner/insert", data, fnc_bannerDetail.fn_insert_success, fnc_bannerDetail.fn_fail);
            })


            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                var data = fnc_bannerDetail.getDetailData();

                if(!fnc_bannerDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("upldate", "/rest/content/banner/update", data, fnc_bannerDetail.fn_update_success, fnc_bannerDetail.fn_fail);
            })
        },


        //수정 데이터 조회 후 UI 처리
        initUpdateUI(){
            var detailData = getSelectDataInfo().detailData;
            console.log(detailData);

            if(detailData.term_type == "1"){
                fnc_bannerDetail.target.find("#banner-div-exposure").show();

                var sDate = moment(detailData.start_datetime);
                var eDate = moment(detailData.end_datetime);

                // 캘린더 초기값
                fnc_bannerDetail.target.find("#banner-input-startDate").val(sDate.format('YYYY.MM.DD'));
                fnc_bannerDetail.target.find("#banner-input-endDate").val(eDate.format('YYYY.MM.DD'));

                // 시간 Select CSS 적용
                fnc_bannerDetail.target.find("#banner-div-startDate").find("#timeHour").val(sDate.hour().toString().length == 1?("0"+sDate.hour()):sDate.hour());
                fnc_bannerDetail.target.find("#banner-div-startDate").find("#timeMinute").val(sDate.minute().toString().length == 1?("0"+sDate.minute()):sDate.minute());
                fnc_bannerDetail.target.find("#banner-div-endDate").find("#timeHour").val(eDate.hour().toString().length == 1?("0"+eDate.hour()):eDate.hour());
                fnc_bannerDetail.target.find("#banner-div-endDate").find("#timeMinute").val(eDate.minute().toString().length == 1?("0"+eDate.minute()):eDate.minute());
            }

        },


        // 등록 화면
        insertDetail() {
            var template = $('#tmp_bannerDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#"+this.formId).html(templateScript);

            this.initDetail();
            this.initDetailEvent();
        },


        // 수정 화면
        updateDetail(){
            var detailData = getSelectDataInfo().detailData;
            detailData.rowNum = getSelectDataInfo().data.rowNum;
            dalbitLog(detailData);


            // form 띄우기
            var template = $('#tmp_bannerDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = detailData;
            var html = templateScript(context);
            fnc_bannerDetail.target.find("#"+ fnc_bannerDetail.formId).html(html);

            fnc_bannerDetail.initDetail();
            fnc_bannerDetail.initDetailEvent();
            fnc_bannerDetail.initUpdateUI();
        },

//=------------------------------ Option --------------------------------------------

        // 상세 목록 조회 성공 시
        fn_detail_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            setSelectDataInfo("detailData", data.data);

            fnc_bannerDetail.updateDetail();
        },


        // 등록 성공 시
        fn_insert_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_bannerList.selectMainList();

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_bannerDetail.formId).empty();
        },


        // 수정 성공 시
        fn_update_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_bannerList.selectMainList();

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_bannerDetail.formId).empty();
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

            //예약발송 일경우 Date 처리
            if(this.target.find("input[name='term_type']:radio:checked").val() == "1"){
                var startDiv = fnc_bannerDetail.target.find("#banner-div-startDate");
                resultJson['start_datetime'] = startDiv.find("#banner-input-startDate").val().replace(/[^0-9]/gi, '') + startDiv.find("#timeHour").val() + startDiv.find("#timeMinute").val();
                var endDiv = fnc_bannerDetail.target.find("#banner-div-endDate");
                resultJson['end_datetime'] = endDiv.find("#banner-input-endDate").val().replace(/[^0-9]/gi, '') + endDiv.find("#timeHour").val() + endDiv.find("#timeMinute").val();
            }else{
                resultJson['start_datetime'] = "";
                resultJson['end_datetime'] = "";
            }


            dalbitLog(resultJson)
            return resultJson
        },


        isValid(data){
            return true;
        },

    }
//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_bannerDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="banner_idx" value="{{banner_idx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 배너를 등록/수정 관리하는 페이지 입니다.
                <br>
                • 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료]버튼을 클릭해야 사이트 내 적용이 완료됩니다.
                <br>
                • 게시여부>비적용시에도 [등록 완료]가 된 경우 비적용 상태로 리스트에 추가됩니다.
            </div>
            <div class="pull-right">
                {{^banner_idx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/banner_idx}}
                {{#banner_idx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/banner_idx}}
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

                <th rowspan="2">배너 제목</th>
                <td colspan="6"  rowspan="2"><input type="text" class="form-control" id="banner-title" name="title" placeholder="배너 제목을 입력하세요." value="{{title}}"></td>

                <th>등록/수정자</th>
                <td colspan="2">{{opName}}</td>
            </tr>
            <tr>
                <th>등록/수정일시</th>
                <td colspan="2">{{lastUpdDate}}</td>
            </tr>
            <tr>
                <th>플랫폼</th>
                <td colspan="2">{{{getCommonCodeRadio platform 'content_platform4'}}}</td>

                <th>구분</th>
                <td colspan="2">{{{getCommonCodeRadio view_type 'banner_loginType' 'N' 'view_type'}}}</td>

                <th>성별</th>
                <td colspan="2">{{{getCommonCodeRadio sex 'gender2' 'N' 'sex'}}}</td>

                <th>페이지 전환</th>
                <td colspan="2">{{{getCommonCodeRadio is_pop 'viewType' 'N' 'is_pop'}}}</td>
            </tr>
            <tr>
                <th>노출 빈도</th>
                <td colspan="5">{{{getCommonCodeRadio frequency_rate 'banner_frequency' 'N' 'frequency_rate'}}}</td>

                <th>배너위치</th>
                <td colspan="5">{{{getCommonCodeRadio position 'banner_bannerType' 'Y' 'position'}}}</td>
            </tr>
            <tr>
                <th>게시여부</th>
                <td colspan="2">{{{getCommonCodeRadio is_view 'content_viewOn' 'N' 'is_view'}}}</td>

                <th>노출 기간</th>
                <td colspan="8">
                    <div>
                        {{{getCommonCodeRadio term_type 'banner_exposureType' 'N' 'term_type'}}}
                    </div>
                    <div class="form-inline" id="banner-div-exposure" style="display: none;">
                        <div class="input-group date" id="banner-div-startDate">
                            <span class="input-group-addon" id="banner-startDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="startDate" id="banner-input-startDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="banner-div-endDate">
                            <span class="input-group-addon" id="banner-endDate"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="endDate" id="banner-input-endDate" style="width:100px; background:white;" readonly>
                            {{{getCommonCodeSelect 00 'timeHour'}}}
                            <span> : </span>
                            {{{getCommonCodeSelect 00 'timeMinute'}}}
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
                    <input type="text" id="banner-pc_img_url" name="pc_img_url" style="width:70%" value="{{pc_img_url}}" >
                    <input type="button" value="미리보기" onclick="getImg('banner-pc_img_url')">
                </td>

                <th>Mobile (1618px x 000px)</th>
                <td colspan="5">
                    <input type="text" id="banner-mobile_img_url" name="mobile_img_url" style="width:70%" value="{{mobile_img_url}}" >
                    <input type="button" value="미리보기" onclick="getImg('banner-mobile_img_url')">
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <!--미리보기-->
                    <a href="javascript:;"><img id="banner-pc_img_urlViewer" style="width:100%; height:100%;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                </td>

                <td colspan="6">
                    <!--미리보기-->
                    <a href="javascript:;"><img id="banner-mobile_img_urlViewer" style="width:100%; height:100%;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                </td>
            </tr>
            <tr>
                <th>PC 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="banner-pc_link_url"  name="pc_link_url" placeholder="배너 클릭 시 이동할 링크" value="{{pc_link_url}}"></td>

                <th>Mobile 링크</th>
                <td colspan="5"><input type="text" class="form-control" id="banner-mobile_link_url" name="mobile_link_url" placeholder="배너 클릭 시 이동할 링크" value="{{mobile_link_url}}"></td>
            </tr>
            <tr>
                <th>썸네일 (공통)</th>
                <td colspan="4">
                    <input type="text" id="banner-thumb_img_url" name="thumb_img_url" style="width:70%" value="{{thumb_img_url}}" >
                    <input type="button" value="미리보기" onclick="getImg('banner-thumb_img_url')">
                </td>
                <td colspan="1">
                    <!--미리보기-->
                    <a href="javascript:;"><img id="banner-thumb_img_urlViewer" style="width:70px; height:70px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                </td>

                <th>비고</th>
                <td colspan="5">
                    <textarea class="form-control" d="banner-desc" name="desc" irows="5" cols="30" placeholder="설명 및 메모를 입력해주세요." style="resize: none" maxlength="200" >{{desc}}</textarea>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</script>