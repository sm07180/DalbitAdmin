<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- DATA TABLE -->
<div class="widget widget-table">
    <%--<div class="widget-header">--%>
        <%--<h3><i class="fa fa-desktop"></i> 검색결과</h3>--%>
    <%--</div>--%>
        <div class="row col-lg-12 mt15">
            <div class="pull-left ml5">
                ㆍ 매달 최소 10일, 20시간 이상 방송한 달D입니다. <br/>
                ㆍ 기간 정지 3회 이상 혹은 영구 정지 시 박탈처리 합니다. <br/>
            </div>

            <!-- summary -->
            <div class="pull-right no-padding">
                <table class="table table-bordered table-summary">
                    <thead>
                    <th>승인 달D</th>
                    <th style="color: #ff0000;">총 신청 달D</th>
                    </thead>
                    <tbody id="reqSummaryTableBody">
                    </tbody>
                </table>
            </div>
            <!-- //summary -->

        </div>

        <div class="widget-content">
            <table id="reqSpecialList" class="table table-sorting table-hover table-bordered">
                <thead>
                </thead>
                <tbody id="tableBody">
                </tbody>
            </table>
        </div>

        <div class="widget-footer">
            <span>
                <button type="button" class="btn btn-default btn-sm print-btn pull-right" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
            </span>
        </div>
</div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="reqDalList"></form>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">


    function initReq() {
        reqGetSummary();
        reqSpecialList();
    }

    function reqSpecialList() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#reqSpecialList"), dtList_info_data, specialDataTableSource.reqSpecialList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        ui.checkBoxInit('reqSpecialList');
        dtList_info.reload();
    }

    function reqGetSummary(){
        var data = {
            select_year: $('#select_year').val()
            , select_month: $('#select_month').val()
        };
        util.getAjaxData("summary", "/rest/menu/special/summary", data, fn_reqSummary_success);
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
       util.getAjaxData("detail", "/rest/menu/special/reqDalDetail", data, fn_success_detail);
    });

    $(document).on('click', '#reqSpecialList .dt-body-center input[type="checkbox"]', function() {
       if($(this).prop('checked')) {
           $('#reqSpecialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
           $(this).prop('checked', 'checked');
           $(this).parent().parent().find('._reqDalDetail').click();
       } else {
           $('#reqDalList').empty();
       }
    });

    function fn_success_detail(dst_id, response) {

        response.data.select_year = moment(new Date()).format('YYYY');
        response.data.select_month = moment(new Date()).format('MM');

        var template = $('#tmp_reqDalList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#reqDalList').html(html);
        ui.scrollIntoView('reqDalList');

        $('#contents').attr("disabled", "disabled");

        if(response.data.state == 2 || response.data.state == 3) {
            $('select[name=reqSelectYear]').attr("disabled", "disabled");
            $('select[name=reqSelectMonth]').attr("disabled", "disabled");
        }
    }

    $(document).on('click', '#bt_reqOk', function() {
        if(confirm($('select[name=reqSelectMonth]').val() + "월의 스페셜 DJ로 등록하시겠습니까?")) {

            var checkbox = $('#reqSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

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

            var checkbox = $('#reqSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

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
        reqSpecialList();
    }

    // /*=---------- 엑셀 ----------*/
    $('#excelDownBtn').on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/menu/special/reqDalListExcel", formData);
    });

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
                        <th>이름</th>
                        <td>{{mem_name}}</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="5">{{title}}</td>
                    </tr>
                    <tr>
                        <th>신청내용</th>
                        <td colspan="5" style="height:300px">
                            <textarea type="textarea" class="form-control" id="contents" name="contents" style="width: 100%; height: 100%">{{contents}}</textarea>
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
                        <td colspan="2" id="reqSelectYear">{{{getCommonCodeSelect select_year 'special_selectYears' 'Y' 'reqSelectYear'}}}</td>
                        <th>선정 월</th>
                        <td colspan="2" id="reqSelectMonth">{{{getCommonCodeSelect select_month 'special_selectMonths' 'Y' 'reqSelectMonth'}}}</td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                {{^equal state '3'}}<button type="button" class="btn btn-danger btn-sm pull-right mb15" id="bt_reqReject">승인거부</button>{{/equal}}
                {{^equal state '2'}}<button type="button" class="btn btn-success btn-sm pull-right mb15 mr10" id="bt_reqOk" data-idx="{{idx}}" data-memno="{{mem_no}}">승인완료</button>{{/equal}}
            </div>
        </div>
    </div>
</script>