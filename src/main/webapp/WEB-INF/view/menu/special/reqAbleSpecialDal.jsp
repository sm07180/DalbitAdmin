<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- DATA TABLE -->
<div class="widget widget-table">
    <%--<div class="widget-header">--%>
        <%--<h3><i class="fa fa-desktop"></i> 검색결과</h3>--%>
    <%--</div>--%>
        <div class="row col-lg-12 mt15">
            <div class="pull-left ml5">
                ㆍ 스페셜 DJ 신청 가능한 회원 목록입니다.<br />
                ㆍ 신청 완료된 회원은 목록에 노출되지 않습니다.
            </div>
        </div>

        <div class="widget-content">
            <table id="reqAbleSpecialList" class="table table-sorting table-hover table-bordered">
                <thead>
                </thead>
                <tbody id="tableBody">
                </tbody>
            </table>
        </div>

        <div class="widget-footer">
            <span>
                <button type="button" class="btn btn-default btn-sm print-btn pull-right" id="reqAbleExcelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
            </span>
        </div>
</div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="reqDalList"></form>
</div>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal" style="display:none;">레이어팝업오픈버튼</button>
<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel" aria-hidden="true"></div>

<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">


    function initReqAble() {
        reqAbleSpecialList();
    }

    function reqAbleSpecialList() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#reqAbleSpecialList"), dtList_info_data, specialDataTableSource.reqAbleSpecialList, $("#searchForm"));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(20);
        dtList_info.createDataTable();

        ui.checkBoxInit('reqAbleSpecialList');
        //dtList_info.reload();
    }

    function reqGetSummary(){
        /*var data = {
            select_year: $('#select_year').val()
            , select_month: $('#select_month').val()
        };
        util.getAjaxData("summary", "/rest/menu/special/summary", data, fn_reqSummary_success);*/
    }

    function fn_reqSummary_success(dst_id, response){
        var template = $('#tmp_summary').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#reqSummaryTableBody").empty().append(html);
    }

    $(document).on('click', '._reqDalDetail', function() {
       var data = {
           'idx': $(this).data('idx')
       };
       util.getAjaxData("detail", "/rest/menu/special/reqDalDetail", data, fn_success_req_detail_manage);
    });

    $(document).on('click', '#reqAbleSpecialList .dt-body-center input[type="checkbox"]', function() {
       if($(this).prop('checked')) {
           $('#reqAbleSpecialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
           $(this).prop('checked', 'checked');
           $(this).parent().parent().find('._reqDalDetail').click();
       } else {
           $('#reqDalList').empty();
       }
    });

    function fn_success_req_detail_manage(dst_id, response) {

        response.data.select_year = moment(new Date()).format('YYYY');
        response.data.select_month = moment(new Date()).add('1', 'months').format('MM');

        var template = $('#tmp_reqDalList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#reqDalList').html(html);
        ui.scrollIntoView('reqDalList');

        //$('#contents').attr("disabled", "disabled");

        if(response.data.state == 2 || response.data.state == 3) {
            $('select[name=reqSelectYear]').attr("disabled", "disabled");
            $('select[name=reqSelectMonth]').attr("disabled", "disabled");
        }
    }

    $(document).on('click', '#bt_reqOk', function() {
        if(confirm($('select[name=reqSelectMonth]').val() + "월의 스페셜 DJ로 등록하시겠습니까?")) {

            var checkbox = $('#reqAbleSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

            var data = {
                'idx': checkbox.parent().parent().find('._reqDalDetail').data('idx')
                , 'mem_no': checkbox.parent().parent().find('._openMemberPop').data('memno')
                , is_force : 0
                , select_year : $('select[name=reqSelectYear]').val()
                , select_month : $('select[name=reqSelectMonth]').val()
            };
            util.getAjaxData("ok", "/rest/menu/special/reqOk", data, fn_success_ok);
        }
        return false;
    });

    function fn_success_ok(dst_id, response) {
        alert(response.message);
        getList();
        initReq();
    }

    $(document).on('click', '#bt_reqReject', function() {
        if (confirm("승인 거부 하시겠습니까?")) {

            var checkbox = $('#reqAbleSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

            var data = {
                'idx': checkbox.parent().parent().find('._reqDalDetail').data('idx')
                , 'mem_no': checkbox.parent().parent().find('._openMemberPop').data('memno')
            };
            util.getAjaxData("ok", "/rest/menu/special/reqReject", data, fn_success_reject);
        }
        return false;
    });

    function fn_success_reject(dst_id, response) {
        alert(response.message);
        getList();
        reqAbleSpecialList();
    }

    // /*=---------- 엑셀 ----------*/
    $('#reqAbleExcelDownBtn').on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/menu/special/reqAbleDalListExcel", formData);
    });

    //신청관리 추가
    $(document).on('click', '#bt_manage', function() {
        var data = {
            select_year : $("#select_year").val()
            , select_month : $("#select_month").val()
        }
        util.getAjaxData("selectManageInfo", "/rest/menu/special/selectManageInfo", data, fn_success_manageInfo);
    });

    function fn_success_manageInfo(dst_id, response, param){
        response.data.param = param;

        var template = $('#tmp_req_manage').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#detailView").html(html);

        calendarInit();
        showModal();
    }

    function showModal(){
        $("#showModal").click();
    }

    function closeModal(){
        $("#layerCloseBtn").click();
    }

    function calendarInit(){

        $('#req_start_date').datepicker();
        $('#req_end_date').datepicker();
        $('#condition_start_date').datepicker();
        $('#condition_end_date').datepicker();
    }

</script>


<script id="tmp_reqDalList" type="text/x-handlebars-template">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 DJ 신청 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="idx" data-idx="{{idx}}"/>
                    <colgroup>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <th>신청일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>승인일시</th>
                        <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>{{mem_name}}</td>

                        <th>주요방송시간</th>
                        <td>
                            {{broadcast_time1}}<br />
                            {{broadcast_time2}}
                        </td>
                    </tr>
                    <tr>
                        <th>방송소개</th>
                        <td colspan="3" style="height:200px">
                            <textarea type="textarea" class="form-control" id="title" name="title" style="width: 100%; height: 100%" disabled>{{title}}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>내가 스페셜 DJ가 된다면?!</th>
                        <td colspan="3" style="height:200px">
                            <textarea type="textarea" class="form-control" id="contents" name="contents" style="width: 100%; height: 100%" disabled>{{contents}}</textarea>
                        </td>
                    </tr>
                    <colgroup>
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>스페셜DJ 선정 연도</th>
                        <td id="reqSelectYear">{{{getCommonCodeSelect select_year 'special_selectYears' 'Y' 'reqSelectYear'}}}</td>
                        <th>선정 월</th>
                        <td id="reqSelectMonth">{{{getCommonCodeSelect select_month 'special_selectMonths' 'Y' 'reqSelectMonth'}}}</td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                {{^equal state '3'}}<button type="button" class="btn btn-danger btn-sm pull-right mb15" id="bt_reqReject">승인거부</button>{{/equal}}
                {{^equal state '2'}}<button type="button" class="btn btn-success btn-sm pull-right mb15 mr10" id="bt_reqOk" data-idx="{{idx}}" data-memno="{{mem_no}}">승인완료</button>{{/equal}}
            </div>
        </div>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_req_manage">
    <form id="manageForm">
        <input type="hidden" name="idx" value="{{this.specialDjManageInfo.idx}}" />
        <div class="modal-dialog" style="width:600px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="layerCloseBtn">&times;</button>
                    <h4 class="modal-title" id="_layerTitle">스페셜 DJ 신청 관리</h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12 form-inline block _modalLayer">
                        <div class="col-lg-12">
                            <table id="list_info" class="table table-sorting table-hover table-bordered">
                                <tbody id="tableBody">

                                    <tr>
                                        <th>선정기간</th>
                                        <td colspan="3">
                                            {{this.select_year}}년 {{this.select_month}}월
                                            <input type="hidden" name="select_year" id="select_year" value="{{this.param.select_year}}" />
                                            <input type="hidden" name="select_month" id="select_month" value="{{this.param.select_month}}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td colspan="3">
                                            <input type="text" class="form-control" style="width:100%" id="title" name="title" value="{{this.specialDjManageInfo.title}}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>신청 기간</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <div class="input-group date">
                                                    <span class="input-group-addon" id="view-iconStartDate"><i class="fa fa-calendar"></i></span>
                                                    <input type="text" class="form-control" name="req_start_date" id="req_start_date" style="width:100px; background:white;" readonly="" value="{{this.specialDjManageInfo.req_start_date}}" />
                                                </div>
                                                <span> ~ </span>
                                                <div class="input-group date">
                                                    <span class="input-group-addon" id="view-iconEndDate"><i class="fa fa-calendar"></i></span>
                                                    <input type="text" class="form-control" name="req_end_date" id="req_end_date" style="width:100px; background:white;" readonly="" value="{{this.specialDjManageInfo.req_end_date}}" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>데이터 수집 기간</th>
                                        <td colspan="3">
                                            <div class="form-inline">
                                                <div class="input-group date">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="text" class="form-control" name="condition_start_date" id="condition_start_date" style="width:100px; background:white;" readonly="" value="{{this.specialDjManageInfo.condition_start_date}}">
                                                </div>
                                                <span> ~ </span>
                                                <div class="input-group date">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="text" class="form-control" name="condition_end_date" id="condition_end_date" style="width:100px; background:white;" readonly="" value="{{this.specialDjManageInfo.condition_end_date}}">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>자격요건1</th>
                                        <td colspan="3">

                                            <select class="form-control" name="condition_code1">
                                                {{#each this.specialDjCondition}}
                                                    <option value="{{cd}}" {{#equal ../specialDjManageInfo.condition_code1 cd}}selected{{/equal}}>{{cdNm}}</option>
                                                {{/each}}
                                            </select>
                                            <input type="text" class="form-control" id="condition_data1" name="condition_data1" value="{{this.specialDjManageInfo.condition_data1}}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>자격요건2</th>
                                        <td colspan="3">
                                            <select class="form-control" name="condition_code2">
                                                {{#each this.specialDjCondition}}
                                                    <option value="{{cd}}" {{#equal ../specialDjManageInfo.condition_code2 cd}}selected{{/equal}}>{{cdNm}}</option>
                                                {{/each}}
                                            </select>
                                            <input type="text" class="form-control" id="condition_data2" name="condition_data2" value="{{this.specialDjManageInfo.condition_data2}}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>자격요건3</th>
                                        <td colspan="3">
                                            <select class="form-control" name="condition_code3">
                                                {{#each this.specialDjCondition}}
                                                    <option value="{{cd}}" {{#equal ../specialDjManageInfo.condition_code3 cd}}selected{{/equal}}>{{cdNm}}</option>
                                                {{/each}}
                                            </select>
                                            <input type="text" class="form-control" id="condition_data3" name="condition_data3" value="{{this.specialDjManageInfo.condition_data3}}" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>게시여부</th>
                                        <td colspan="3">{{{getCommonCodeRadio this.specialDjManageInfo.is_view 'content_viewOn' null 'is_view'}}}</td>
                                    </tr>

                                    <tr>
                                        <th>플랫폼</th>
                                        <td colspan="3">{{{getCommonCodeRadio this.specialDjManageInfo.platform 'content_platform4' null 'platform'}}}</td>
                                    </tr>

                                    <tr>
                                        <th>pc 이미지</th>
                                        <td colspan="2">
                                            <input type="text" class="form-control" style="width:80%" id="pc_image_url" name="pc_image_url" value="{{this.specialDjManageInfo.pc_image_url}}" />
                                            <button type="button" id="pcPrevBtn">미리보기</button>
                                        </td>
                                        <td id="pcImgPrevTd">
                                            <img src="{{this.specialDjManageInfo.pc_image_url}}" height="70px" class="thumbnail fullSize_background" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>모바일 이미지</th>
                                        <td colspan="2">
                                            <input type="text" class="form-control" style="width:80%" id="mobile_image_url" name="mobile_image_url" value="{{this.specialDjManageInfo.mobile_image_url}}" />
                                            <button type="button" id="mobilePrevBtn">미리보기</button>
                                        </td>
                                        <td id="mobileImgPrevTd">
                                            <img src="{{this.specialDjManageInfo.mobile_image_url}}" height="70px" class="thumbnail fullSize_background"  />
                                        </td>
                                    </tr>

                                    {{#if this.specialDjManageInfo.op_name}}
                                    <tr>
                                        <th>등록자</th>
                                        <td>{{this.specialDjManageInfo.op_name}}</td>
                                        <th>등록일</th>
                                        <td>{{this.specialDjManageInfo.reg_date}}</td>
                                    </tr>
                                    {{/if}}

                                    {{#if this.specialDjManageInfo.last_op_name}}
                                    <tr>
                                        <th>수정자</th>
                                        <td>{{this.specialDjManageInfo.last_op_name}}</td>
                                        <th>수정일</th>
                                        <td>{{this.specialDjManageInfo.last_upd_date}}</td>
                                    </tr>
                                    {{/if}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal"><i class="fa fa-times-circle"></i> 닫기</button>

                    {{#if this.specialDjManageInfo}}
                        <button type="button" class="btn btn-success" id="_updateBtn"><i class="fa fa-times-circle"></i> 수정</button>
                    {{else}}
                        <button type="button" class="btn btn-success" id="_insertBtn"><i class="fa fa-times-circle"></i> 등록</button>
                    {{/if}}
                </div>
            </div>
        </div>
    </form>
</script>