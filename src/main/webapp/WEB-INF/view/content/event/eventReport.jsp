<%--<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>--%>

<%--<style>--%>
   <%--.test{--%>
        <%--border-color: black;--%>
        <%--border: 1px solid #DDDDDD;--%>
    <%--}--%>

   <%--.text_center{--%>
       <%--text-align: center;--%>
   <%--}--%>
   <%--.middle{--%>
       <%--display:table-cell;--%>
       <%--vertical-align:middle;--%>
   <%--}--%>
   <%--.lb_style{--%>
       <%--border: 1px solid #DDDDDD;--%>
       <%--background-color: #DCE6F2;--%>
       <%--height: 34px;--%>
   <%--}--%>
<%--</style>--%>

<%--<div id="wrapper">--%>
    <%--<form id="bannerForm"></form>--%>
<%--</div>--%>




<%--<script src="../../../js/lib/jquery.table2excel.js"></script>--%>

<%--<script>--%>
    <%--$(document).ready(function () {--%>
    <%--});--%>


<%--//=------------------------------ Init / Event----------------------------------------------%>
    <%--// Datapicker--%>
    <%--var dataPickerSrc = {--%>
        <%--startDate: moment(),--%>
        <%--endDate: moment(),--%>
        <%--// dateLimit: { days: 60 },--%>
        <%--showDropdowns: true,--%>
        <%--showWeekNumbers: true,--%>
        <%--timePicker: false,--%>
        <%--timePickerIncrement: 1,--%>
        <%--timePicker12Hour: false,--%>
        <%--ranges: {--%>
            <%--'1일': [moment(), moment()],--%>
            <%--// '어제': [moment().subtract('days', 1), moment().subtract('days', 1)],--%>
            <%--'7일': [moment(), moment().add('days', 6)],--%>
            <%--'30일': [moment(), moment().add('days', 29)]--%>
        <%--},--%>
        <%--opens: 'left',--%>
        <%--// buttonClasses: ['btn btn-default'],--%>
        <%--// applyClass: 'btn-small btn-primary',--%>
        <%--// cancelClass: 'btn-small',--%>
        <%--format: 'L',--%>
        <%--separator: ' to ',--%>
        <%--locale: {--%>
            <%--customRangeLabel: '직접선택',--%>
        <%--}--%>
    <%--}--%>

    <%--// 초기 설정--%>
    <%--function initDetail() {--%>
        <%--// 캘린더 기능추가--%>
        <%--$("#banner-startDate, #banner-endDate").daterangepicker( dataPickerSrc,--%>
            <%--function(start, end, t1) {--%>
                <%--console.log(t1);--%>
                <%--$("#banner-input-startDate").val(start.format('YYYY.MM.DD'));--%>
                <%--$("#banner-input-endDate").val(end.format('YYYY.MM.DD'));--%>
            <%--}--%>
        <%--);--%>

        <%--// 캘린더 초기값--%>
        <%--$("#banner-input-startDate").val(moment().format('YYYY.MM.DD'));--%>
        <%--$("#banner-input-endDate").val(moment().format('YYYY.MM.DD'));--%>

        <%--// 시간 Select CSS 적용--%>
        <%--$("#banner-div-startDate").find("#timeHour").attr("class", "select-time");--%>
        <%--$("#banner-div-startDate").find("#timeMinute").attr("class", "select-time");--%>
        <%--$("#banner-div-endDate").find("#timeHour").attr("class", "select-time");--%>
        <%--$("#banner-div-endDate").find("#timeMinute").attr("class", "select-time");--%>
    <%--}--%>

    <%--// 이벤트 적용--%>
    <%--function initEventDetail(tab_id){--%>

        <%--//로그인 타입 선택--%>
        <%--$("input[name='loginType']:radio").change(function () {--%>
            <%--var type = this.value;--%>

            <%--//로그인 사용자일 경우 성별 선택 가능--%>
            <%--if(type == "1"){--%>
                <%--$("input[name='gender']").prop("disabled",false);--%>
            <%--}else{--%>
                <%--$("input[name='gender']").prop("disabled",true);--%>
                <%--$("input[name='gender']:input[value='1']").prop("checked", true);--%>
            <%--}--%>

        <%--});--%>


        <%--//게시여부 선택--%>
        <%--$("input[name='viewOn']:radio").change(function () {--%>
            <%--var type = this.value;--%>

            <%--//지정 일 경우 button 활성화--%>
            <%--if(type == "1"){--%>
                <%--$("input[name='exposureType']").prop("disabled",false);--%>
                <%--$("input[name='exposureType']:input[value='0']").prop("checked", true);--%>
            <%--}else{--%>
                <%--$("input[name='exposureType']").prop("disabled",true);--%>
                <%--$("input[name='exposureType']").removeAttr("checked");--%>
                <%--$("#banner-div-exposure").hide();--%>
            <%--}--%>
        <%--});--%>


        <%--//발송여부 선택--%>
        <%--$("input[name='exposureType']:radio").change(function () {--%>
            <%--var type = this.value;--%>

            <%--//예약 발송 일 경우 날짜 추가--%>
            <%--if(type == "1"){--%>
                <%--$("#banner-div-exposure").show();--%>
            <%--}else{--%>
                <%--$("#banner-div-exposure").hide();--%>
            <%--}--%>
        <%--});--%>


        <%--// 등록 버튼--%>
        <%--$("#insertBtn").on("click", function () {--%>
            <%--if(isValid()){--%>
                <%--//TODO 완료처리 필요--%>
                <%--getBannerDetailData();--%>
            <%--}--%>
        <%--})--%>


        <%--// 수정 버튼--%>
        <%--$("#insertBtn").on("click", function () {--%>
            <%--if(isValid()){--%>
                <%--//TODO 완료처리 필요--%>
                <%--getBannerDetailData();--%>
            <%--}--%>
        <%--})--%>
    <%--}--%>



<%--//=------------------------------ Option ----------------------------------------------%>

    <%--// 등록 화면--%>
    <%--function insertBannerDetail() {--%>
        <%--var template = $('#tmp_bannerDetailFrm').html();--%>
        <%--var templateScript = Handlebars.compile(template);--%>
        <%--$("#bannerForm").html(templateScript);--%>

        <%--initDetail();--%>
        <%--initEventDetail();--%>
    <%--}--%>


    <%--// 수정 화면--%>
    <%--function updateBannerDetail(json){--%>
        <%--dalbitLog(json);--%>
        <%--// form 띄우기--%>
        <%--var template = $('#tmp_bannerDetailFrm').html();--%>
        <%--var templateScript = Handlebars.compile(template);--%>
        <%--var context = json;--%>
        <%--var html = templateScript(context);--%>
        <%--$("#bannerForm").html(html);--%>

        <%--initDetail();--%>
        <%--initEventDetail();--%>

        <%--//TODO 데이터 셋팅 후 이벤트 처리 필요--%>
        <%--//TODO 수신대상 그려야 함.--%>
    <%--}--%>




<%--//=------------------------------ Data Handler ------------------------------------%>

    <%--// 데이터 가져오기--%>
    <%--function getBannerDetailData(){--%>
        <%--var resultJson ={};--%>

        <%--var formArray = $("#bannerForm").serializeArray();--%>
        <%--for (var i = 0; i < formArray.length; i++){--%>
            <%--resultJson[formArray[i]['name']] = formArray[i]['value'];--%>
        <%--}--%>

        <%--//Date 처리이이이~~~--%>
        <%--var startDiv = $("#banner-div-startDate");--%>
        <%--resultJson['startDate'] = startDiv.find("#banner-input-startDate").val().replace(/[^0-9]/gi, '') + startDiv.find("#timeHour").val() + startDiv.find("#timeMinute").val();--%>
        <%--var endDiv = $("#banner-div-endDate");--%>
        <%--resultJson['endDate'] = endDiv.find("#banner-input-endDate").val().replace(/[^0-9]/gi, '') + startDiv.find("#timeHour").val() + startDiv.find("#timeMinute").val();--%>

        <%--dalbitLog(resultJson)--%>
        <%--return resultJson--%>
    <%--}--%>




    <%--function isValid(){--%>
        <%--return true;--%>
    <%--}--%>


<%--//=------------------------------ Modal ------------------------------------%>



<%--</script>--%>



<%--<!-- =------------------ Handlebars ---------------------------------- -->--%>
<%--<script id="tmp_bannerDetailFrm" type="text/x-handlebars-template">--%>
    <%--<input type="hidden" name="bannerIdx" value="{{bannerIdx}}" />--%>
    <%--<div class="row col-lg-12">--%>
        <%--<div class="row col-md-12" style="padding-bottom: 15px">--%>
            <%--<div class="pull-left">--%>
                <%--• 배너를 등록/수정 관리하는 페이지 입니다.--%>
                <%--<br>--%>
                <%--• 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료]버튼을 클릭해야 사이트 내 적용이 완료됩니다.--%>
                <%--<br>--%>
                <%--• 게시여부>비적용시에도 [등록 완료]가 된 경우 비적용 상태로 리스트에 추가됩니다.--%>
            <%--</div>--%>
            <%--<div class="pull-right">--%>
                <%--{{^bannerIdx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/bannerIdx}}--%>
                <%--{{#bannerIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/bannerIdx}}--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<table class="table table-bordered table-dalbit">--%>
            <%--<colgroup>--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
                <%--<col width="8%" />--%>
            <%--</colgroup>--%>
            <%--<tbody>--%>
            <%--<tr class="align-middle">--%>
                <%--<th rowspan="2">No</th>--%>
                <%--<td rowspan="2">{{bannerIdx}}</td>--%>

                <%--<th rowspan="2">배너 제목</th>--%>
                <%--<td colspan="6"  rowspan="2"><input type="text" class="form-control" id="banner-title" name="bannerTitle" placeholder="프로모션 제목을 입력하세요."></td>--%>

                <%--<th>등록/수정자</th>--%>
                <%--<td colspan="2"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>등록/수정일시</th>--%>
                <%--<td colspan="2"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>구분</th>--%>
                <%--<td colspan="2">{{{getCommonCodeRadio -1 'banner_loginType'}}}</td>--%>

                <%--<th>성별</th>--%>
                <%--<td colspan="2">{{{getCommonCodeRadio 1 'gender'}}}</td>--%>

                <%--<th>페이지 전환</th>--%>
                <%--<td colspan="2">{{{getCommonCodeRadio 1 'viewType'}}}</td>--%>

                <%--<th>게시여부</th>--%>
                <%--<td colspan="2">{{{getCommonCodeRadio 1 'banner_viewOn'}}}</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>노출 빈도</th>--%>
                <%--<td colspan="5">{{{getCommonCodeRadio 10 'banner_frequency'}}}</td>--%>

                <%--<th>배너위치</th>--%>
                <%--<td colspan="5">{{{getCommonCodeRadio 1 'banner_bannerType_noAll'}}}</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>노출 기간</th>--%>
                <%--<td colspan="11">--%>
                    <%--<div>--%>
                        <%--{{{getCommonCodeRadio 0 'banner_exposureType'}}}--%>
                    <%--</div>--%>
                    <%--<div class="form-inline" id="banner-div-exposure" style="display: none;">--%>
                        <%--<div class="input-group date" id="banner-div-startDate">--%>
                            <%--<span class="input-group-addon" id="banner-startDate"><i class="fa fa-calendar"></i></span>--%>
                            <%--<input type="text" class="form-control" name="startDate" id="banner-input-startDate" style="width:100px; background:white;" readonly>--%>
                            <%--{{{getCommonCodeSelect 00 'timeHour'}}}--%>
                            <%--<span> : </span>--%>
                            <%--{{{getCommonCodeSelect 00 'timeMinute'}}}--%>
                        <%--</div>--%>
                        <%--<span> ~ </span>--%>
                        <%--<div class="input-group date" id="banner-div-endDate">--%>
                            <%--<span class="input-group-addon" id="banner-endDate"><i class="fa fa-calendar"></i></span>--%>
                            <%--<input type="text" class="form-control" name="endDate" id="banner-input-endDate" style="width:100px; background:white;" readonly>--%>
                            <%--{{{getCommonCodeSelect 00 'timeHour'}}}--%>
                            <%--<span> : </span>--%>
                            <%--{{{getCommonCodeSelect 00 'timeMinute'}}}--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th colspan="12">배너 이미지</th>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>PC (1618px x 000px)</th>--%>
                <%--<td colspan="5">--%>
                    <%--<input type="file" id="banner-bannerPCImg" name="bannerPCImg">--%>
                    <%--<p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>--%>
                <%--</td>--%>

                <%--<th>Mobile (1618px x 000px)</th>--%>
                <%--<td colspan="5">--%>
                    <%--<input type="file" id="banner-bannerMobileImg" name="bannerMobileImg">--%>
                    <%--<p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td colspan="6">미리보기</td>--%>

                <%--<td colspan="6">미리보기</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>PC 링크</th>--%>
                <%--<td colspan="5"><input type="text" class="form-control" id="banner-bannerPCLink"  name="bannerPCLink" placeholder="배너 클릭 시 이동할 링크"></td>--%>

                <%--<th>Mobile 링크</th>--%>
                <%--<td colspan="5"><input type="text" class="form-control" id="banner-bannerMobileLink" name="bannerMobileLink" placeholder="배너 클릭 시 이동할 링크"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>썸네일 (공통)</th>--%>
                <%--<td colspan="4">--%>
                    <%--<input type="file" id="banner-thumbImg">--%>
                    <%--<p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>--%>
                <%--</td>--%>
                <%--<td colspan="1">미리보기</td>--%>

                <%--<th>비고</th>--%>
                <%--<td colspan="5">--%>
                    <%--<textarea class="form-control" name="banner-note" id="banner-note" rows="5" cols="30" placeholder="설명 및 메모를 입력해주세요." style="resize: none" maxlength="200"></textarea>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>
<%--</script>--%>