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
            <div class="pull-left ml5 mb15">
                ㆍ 매달 최소 10일, 20시간 이상 방송한 달D입니다. <br/>
                ㆍ 기간 정지 3회 이상 혹은 영구 정지 시 박탈처리 합니다. <br/>
                ㆍ ()안의 내용은 스페셜 DJ 기준입니다. <br/>
            </div>
            <div class="pull-right">
                <button type="button" class="btn btn-primary mb15" id="bt_edit" ><i class="fa fa-floppy-o"></i>적용</button>
            </div>
        </div>
    <div class="widget-content">
        <%--<div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>--%>

        <table id="specialList" class="table table-sorting table-hover table-bordered mt15">
            <thead>
                <tr>
                    <th></th>
                    <th>No</th>
                    <th>방송상태</th>
                    <th>프로필이미지</th>
                    <th>UserID</th>
                    <th>User닉네임</th>
                    <th>보유팬<br/>(1000명 이상)</th>
                    <th>누적 방송시간<br/>(360시간 이상)</th>
                    <th>누적 받은 별<br/>(100,000개 이상)</th>
                    <th>받은 좋아요<br/>(300,000개 이상)</th>
                    <th>최근 3개월 내 방송일<br/>(60일 이상)</th>
                    <th>정지기록<br/>(없음)</th>
                    <th>관리자 등록여부</th>
                    <th>등록자</th>
                    <th style="display:none;">순서</th>
                </tr>
            </thead>
            <tbody id="special_tableBody">
            </tbody>
        </table>

        <%--<div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>--%>

    </div>
</div>
<div id="#imageFullSize"></div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="dalList"></form>
    <form id="sampleDalList"></form>
</div>


<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var specialDjPagingInfo = new PAGING_INFO(0, 1, 99999);

    function init() {
        // var dtList_info;
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
            , searchType : $('#searchType').val()
            , pageStart : specialDjPagingInfo.pageNo
            , pageCnt : specialDjPagingInfo.pageCnt
        };

        util.getAjaxData("special", "/rest/menu/special/dalList", data, fn_dalList_success);
        util.getAjaxData("summary", "/rest/menu/special/summary", null, fn_compareSummary);
    }

    var totalCnt;
    function fn_dalList_success(dst_id, response) {
        var template = $('#tmp_specialList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#special_tableBody').html(html);

        var pagingInfo = response.pagingVo;
        specialDjPagingInfo.totalCnt = pagingInfo.totalCnt;
        totalCnt = specialDjPagingInfo.totalCnt;
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

    var approveDal;
    function fn_compareSummary(dst_id, response) {
        approveDal = response.data.approveDal;
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
            $('#sampleDalList').empty();
        }
    });

    function fn_success_dalDetail(dst_id, response) {

        if(response.data.is_force == 0) {
            var template = $('#tmp_dalList').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);

            $('#dalList').html(html);
            $('#sampleDalList').hide();
            $('#dalList').show();
            ui.scrollIntoView('dalList');
            $('#contents').attr("disabled", "disabled");

        } else if(response.data.is_force == 1) {
            var template = $('#tmp_sampleDalList').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);
            $('#sampleDalList').html(html);
            $('#dalList').hide();
            $('#sampleDalList').show();
            ui.scrollIntoView('sampleDalList');
            $('#sampleDalList').focus();
        }
    }

    $(document).on('click', '#bt_reqCancel, #bt_reqCancel_2', function() {
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
        if(approveDal > totalCnt) {
            alert('순위 변경은 스페셜 DJ 전체목록에서 가능합니다.');
            return false;
        }
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

        util.getAjaxData("updateOrder", "/rest/menu/special/updateOrder", param, fn_updateOrder_success);
    });

    function fn_updateOrder_success(dst_id, response) {
        alert(response.message);
        init();
    }

    function fullSize_background(url) {
        if(common.isEmpty(url)){
            return;
        }

        $("#imageFullSize").html(util.imageFullSize("fullSize_background", url));
        $('#fullSize_background').modal('show');
    }

    function modal_close(){
        $("#fullSize_background").modal('hide');
    }
</script>

<script id="tmp_specialList" type="text/x-handlebars-template">
    {{#each this}}
    <tr class="_noTr" id="row_{{order}}" ondrop="drop(event)" ondragover="allowDrop(event)" draggable="true" ondragstart="drag(event)">
        <td class=" dt-body-center"><input type="checkbox"/></td>
        <td class="_noTd">
            <input type="hidden" name="sortNo" value="{{sortNo}}"/>
        </td>
        <td>{{{renderOnAir onAir}}}</td>
        <td>
            <form method="post" enctype="multipart/form-data">
                <img class="thumbnail" src="{{renderImage image_profile}}" alt="your image" style="width: 100px;height: 100px" onclick="fullSize_background(this.src);"/>
            </form>
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{mem_no}}">{{mem_id}}</a>
            <a href="javascript://" style="display:none;" class="_dalDetail" data-reqidx="{{req_idx}}"></a>
        </td>
        <td>{{mem_nick}}</td>
        <td>{{addComma fanCnt}} 명</td>
        <td>{{timeStamp airTime}}</td>
        <td>{{addComma giftedRuby}} 개</td>
        <td>{{addComma likeCnt}} 개</td>
        <td>{{addComma broadcastCnt}} 일</td>
        <td>{{addComma reportCnt}} 회</td>
        <td>{{{getCommonCodeLabel is_force 'special_isForce'}}}</td>
        <td style="display:none;">{{order}}</td>
        <td>{{op_name}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="13">{{isEmptyData}}</td>
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

<script id="tmp_sampleDalList" type="text/x-handlebars-template">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 달D 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="reqIdx" data-idx="{{req_idx}}"/>
                    <tr>
                        <th>등록일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>관리자 등록 여부</th>
                        <td>
                            {{#equal is_force '0'}}N{{/equal}}
                            {{^equal is_force '0'}}Y{{/equal}}
                        </td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                <button type="button" class="btn btn-danger mb15" id="bt_reqCancel_2">승인취소</button>
            </div>
        </div>
    </div>
</script>