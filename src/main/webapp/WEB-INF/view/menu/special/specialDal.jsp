<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- DATA TABLE -->
<div class="widget widget-table">
    <%--<div class="widget-header">--%>
        <%--<h3><i class="fa fa-desktop"></i> 검색결과</h3>--%>
        <%--<div class="btn-group widget-header-toolbar">--%>
            <%--<a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">--%>
                <%--<i class="fa fa-chevron-up" id="_searchToggleIcon"></i>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
        <div class="row col-md-12 mt15">
            <div class="pull-left ml5">
                ㆍ 매달 최소 10일, 20시간 이상 방송한 달D입니다. <br/>
                ㆍ 기간 정지 3회 이상 혹은 영구 정지 시 박탈처리 합니다.
            </div>
            <div class="pull-right">
                <button type="button" class="btn btn-primary mr5" id="bt_edit" ><i class="fa fa-floppy-o"></i>적용</button>
            </div>
        </div>
    <div class="widget-content">
        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>

        <table id="specialList" class="table table-sorting table-hover table-bordered mt15">
            <thead>
                <tr>
                    <th></th>
                    <th>No</th>
                    <th>회원번호</th>
                    <th>등록일</th>
                    <th>관리자 등록여부</th>
                    <th style="display:none;">순서</th>
                    <th>등록자</th>
                </tr>
            </thead>
            <tbody id="special_tableBody">
            </tbody>
        </table>

        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>

    </div>
</div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="dalList"></form>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var specialDjPagingInfo = new PAGING_INFO(0, 1, 99999);

    var dtList_info;
    function init() {
        // var dtList_info_data = function(data) {
        // };
        // dtList_info = new DalbitDataTable($("#specialList"), dtList_info_data, specialDataTableSource.specialList, $("#searchForm"));
        // dtList_info.useCheckBox(true);
        // dtList_info.useIndex(false);
        // dtList_info.createDataTable();
        //
        ui.checkBoxInit('specialList');
        $("#specialList-select-all").remove();
        var data = {
            txt_search : $('#txt_search').val()
            , searchType : $('#searchArea').val()
            , pageStart : specialDjPagingInfo.pageNo
            , pageCnt : specialDjPagingInfo.pageCnt
        };

        util.getAjaxData("special", "/rest/menu/special/dalList", data, fn_dalList_success);

    }

    function fn_dalList_success(dst_id, response) {
        var template = $('#tmp_specialList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#special_tableBody').html(html);

        var pagingInfo = response.pagingVo;
        specialDjPagingInfo.totalCnt = pagingInfo.totalCnt;
        console.log(specialDjPagingInfo);
        util.renderPagingNavigation('list_info_paginate_top', specialDjPagingInfo);
        util.renderPagingNavigation('list_info_paginate', specialDjPagingInfo);

        if(response.data.length == 0) {
            $("#list_info_paginate").hide();
            $("#list_info_paginate_top").hide();
        } else {
            $("#list_info_paginate").show();
            $("#list_info_paginate_top").show();
        }

        // drag and drop, No setting
        resetNo();

    }

    function handlebarsPaging(targetId, pagingInfo){
        specialDjPagingInfo = pagingInfo;
        init();
    }

    $(document).on('click', '._dalDetail', function() {

        var me = $(this);

        var obj = {
            req_idx : me.data('reqidx')
            , mem_no : me.parent().find('._openMemberPop').data('memno')
        };
        util.getAjaxData("detail", "/rest/menu/special/dalDetail", obj, fn_success_dalDetail);
    });

    $(document).on('click', '#specialList .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')) {
            $('#specialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
            $(this).prop('checked', 'checked');
            $(this).parent().parent().find('._dalDetail').click();
        } else {
            $('#dalList').empty();
        }
    });

    function fn_success_dalDetail(dst_id, response) {
        var template = $('#tmp_dalList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#dalList').html(html);

        $('#contents').attr("disabled", "disabled");
    }

    $(document).on('click', '#bt_reqCancel', function() {
        if(confirm("승인 취소 하시겠습니까?")) {
           var checkbox = $('#specialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');
           var data = {
               'req_idx' : checkbox.parent().parent().find('._dalDetail').data('reqidx')
               , 'mem_no' : checkbox.parent().parent().find('._openMemberPop').data('memno')
           };
            dalbitLog(data);
            util.getAjaxData("cancel", "/rest/menu/special/reqCancel", data, fn_success_cancel);
        }
        return false;
    });

    function fn_success_cancel(dst_id, response) {
        alert(response.message);
        getList();
    }

    function allowDrop(event) {
        event.preventDefault();
    }

    function drag(event) {
        event.dataTransfer.setData("text", event.target.id);
    }

    function drop(event) {
        event.preventDefault();

        var data = event.dataTransfer.getData("text");
        var idx = data.split("_")[1];
        var targetIdx = $('#specialList').find(event.target).parent("tr").attr("id").split("_")[1];

        if(parseInt(targetIdx) < parseInt(idx)){
            $('#specialList').find(event.target).parent("tr").before($('#specialList').find("#"+data));
        }else{
            $('#specialList').find(event.target).parent("tr").after($('#specialList').find("#"+data));
        }

        resetNo();
    }

    function resetNo(){
        $('#specialList').find('._noTd').each(function (index) {
            var html = '<input type="hidden" name="sortNo" value="'+(index+1)+'">';
            html += (index+1);
            $(this).html(html);
        });

        $('#specialList').find('._noTr').each(function (index) {
            $(this).attr("id", "row_" + (index + 1));
        });
    }

    $('#bt_edit').on('click', function() {
        var orderDataArr = new Array();
        $('._noTr').each(function(i) {
            var mem_no = $(this).find('._openMemberPop').data('memno');
            var order = i + 1;
            var data = {
                mem_no : mem_no
                , order : order
            };
            orderDataArr.push(data);
        });

        var param = {
            orderJsonData : JSON.stringify(orderDataArr)
        };

        dalbitLog(param);
        util.getAjaxData("updateOrder", "/rest/menu/special/updateOrder", param, fn_updateOrder_success);
    });

    function fn_updateOrder_success(dst_id, response) {
        alert(response.message);
        init();
    }

</script>

<script id="tmp_specialList" type="text/x-handlebars-template">
    {{#each this}}
    <tr class="_noTr" id="row_{{order}}" ondrop="drop(event)" ondragover="allowDrop(event)" draggable="true" ondragstart="drag(event)">
        <td class=" dt-body-center"><input type="checkbox"/></td>
        <td class="_noTd">
            <input type="hidden" name="sortNo" value="{{sortNo}}"/>
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{mem_no}}">{{mem_no}}</a>
            <a href="javascript://" style="display:none;" class="_dalDetail" data-reqidx="{{req_idx}}"></a>
        </td>
        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
        <td>{{{getCommonCodeLabel is_force 'special_isForce'}}}</td>
        <td style="display:none;">{{order}}</td>
        <td>{{op_name}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="6">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>

<script id="tmp_dalList" type="text/x-handlebars-template">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 달D 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="reqIdx" data-idx="{{req_idx}}"/>
                    <tr>
                        <th>신청일시</th>
                        <td>{{convertToDate request_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>승인일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>관리자 등록 여부</th>
                        <td>
                            {{#equal is_force '0'}}N{{/equal}}
                            {{^equal is_force '0'}}Y{{/equal}}
                        </td>
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
                </table>
                <!-- 승인완료 승인거부-->
                <button type="button" class="btn btn-danger mb15" id="bt_reqCancel">승인취소</button>
            </div>
        </div>
    </div>
</script>