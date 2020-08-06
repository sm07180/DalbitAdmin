<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- SHOW HIDE COLUMNS DATA TABLE -->

<div class="row col-lg-12 form-inline">
    <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
        <li class="active"><a href="#categoryList" role="tab" data-toggle="tab" id="tab_categoryList">카테고리 관리</a></li>
    </ul>
</div>
<div class="row col-lg-12 form-inline">
    <div class="widget widget-table" id="div_categoryList" style="padding: 10px;">
        <div class="tab-content no-padding">
            <div class="tab-pane fade in active" id="categoryList">
                <div class="row col-md-12">
                    <div class="pull-left">

                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-default btn-sm mr10" name="btn_add"><i class="fa fa-plus-square"></i>추가</button>
                    </div>
                </div>

                <div class="widget-content">
                    <table id="list" class="table table-sorting table-hover table-bordered datatable">
                        <colgroup>
                            <col width="40px"/>
                            <col width="50px" /> <!-- No -->
                            <col width="80px" /> <!-- 카테고리 -->
                            <col width="50px" /> <!-- 이모티콘 수 -->
                            <col width="70px" /> <!-- 순위조정 -->
                        </colgroup>
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>No</th>
                            <th>카테고리</th>
                            <th>이모티콘 수</th>
                            <th>순서변경</th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">

                        </tbody>
                    </table>

                    <div>
                        <div class="pull-left">
                            <button type="button" class="btn btn-danger btn-sm mr-10" id="btn_delete"><i class="fa fa-trash-o"></i>선택 삭제</button>
                            <button type="button" class="btn btn-primary btn-sm" id="btn_update"><i class="fa fa-pencil"></i>선택수정</button>
                        </div>
                        <div class="pull-right">
                            <button type="button" class="btn btn-default btn-sm mr-10" name="btn_add"><i class="fa fa-plus-square"></i>추가</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt10" style="text-align: center">
        <button type="button" class="btn btn-default mr5" onclick="javascript:window.close();" style="height: 40px; width: 100px;">닫기</button>
        <button type="button" class="btn btn-primary" id="btn_category_save" style="height: 40px; width: 100px;">적용</button>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->


<script>
    $(document).ready(function() {
        // util.getAjaxData("list", "/rest/content/theme/list", "", fn_success, fn_fail);
        init();
        initEvent();
    });

    $(document).on('click', '._down', function () {
        var targetTr = $(this).closest('tr');
        var nextTr = targetTr.next();
        targetTr.insertAfter(nextTr);
        resetNo();
        btnSet();
    });

    $(document).on('click', '._up', function () {
        var targetTr = $(this).closest('tr');
        var prevTr = targetTr.prev();
        targetTr.insertBefore(prevTr);
        resetNo();
        btnSet();
    });


    function init(){
        util.getAjaxData("list", "/rest/content/emoticon/inssaticon/category/list", "", fn_success, fn_fail);
    };

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

    function initEvent() {

        $("#div_categoryList").find('#btn_delete').off('click').on('click', function () {
            var checked = $("#div_categoryList").find('#tableBody').find('._check:checked');

            if (0 == checked.length) {
                alert("삭제할 카테고리를 선택해주세요.");
                return;
            }
            if (confirm('삭제하시겠습니까?')) {
                var checked = $("#div_categoryList").find('#tableBody').find('._check:checked');
                checked.closest('tr').remove();
                resetNo();
                window.resizeTo(window.outerWidth, $(".container").height()+100);
            }
        });

        $("#div_categoryList").find("#btn_update").off('click').on('click', function () {
            var checked = $("#div_categoryList").find('#tableBody').find('._check:checked');
            if (0 == checked.length) {
                alert("수정할 카테고리를 선택해주세요.");
                return;
            }

            checked.each(function () {
                $(this).closest('tr').find('._cdNm').prop('readonly', false);
                /*if(!isEmpty(input.val())){
                    $("#tableBody").find('._cdNm').prop('readonly', false);
                }*/
            });

            $("#div_categoryList").find('#tableBody').find('._check:checked:eq(0)').closest('tr').find('._cdNm').focus();
        });

        $("#div_categoryList").find("button[name='btn_add']").off('click').on('click', function () {
            var idx = 0;
            $("#div_categoryList").find('#tableBody').find("._check").each(function(){
                idx = $(this).data("idx") > idx ? $(this).data("idx") : idx;
            })

            var newData = {
                idx: Number(idx) + 1,
                sortNo: $("#div_categoryList").find('._noTd').length + 1,
                cd: createCodeValue(),
                cdNm: '',
                isUse: 0,
                isOn: true,
                readonly: false
            }

            var template = $('#tmp_category_list').html();
            var templateScript = Handlebars.compile(template);
            var html = templateScript({data: newData});

            $("#div_categoryList").find("#tableBody").append(html);

            btnSet();
            resetNo();
            window.resizeTo(window.outerWidth, $(".container").height()+100);
        });

        $("#btn_category_save").on('click', function () {
            if (!confirm('적용하시겠습니까?')) {
                return false;
            }

            var sendData = new Array();
            $("#div_categoryList").find("._noTr").each(function(){
                var data = {
                    'idx': $(this).find("._check").data("idx")
                    ,'category_orderNo' : $(this).find("input[name='sortNo']").val()
                    ,'categoryNm' : $(this).find("._cdNm").val()
                }
                sendData.push(JSON.stringify(data));
            });

            var editData = {
                'editData' : sendData.join("|")
            }
            console.log(editData)

            util.getAjaxData("list", "/rest/content/emoticon/inssaticon/category/update", editData, fn_submit_success);
        });

    };


    function fn_success(dst_id, response)
    {
        var template = $('#tmp_category_list').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript(response);

        $("#div_categoryList").find("#tableBody").html(html);

        btnSet();

        window.resizeTo(window.outerWidth, $(".container").height()+100);
    };

    function fn_submit_success(dst_id, response)
    {
        alert(response.message);
        opener.setCategorySelectBox();
        opener.getInssaticonInfo();
        init();
    };

    function resetNo() {
        $("#div_categoryList").find('._noTd').each(function (index) {
            var html = '<input type="hidden" name="sortNo" value="'+(index+1)+'">';
            html += (index+1);
            $(this).html(html);
        });

        $("#div_categoryList").find('._noTr').each(function (index) {
            $(this).attr("id", "row_" + (index + 1));
        });
    };

    function btnSet() {
        $("#div_categoryList").find('.btn._down').prop('disabled', false);
        $("#div_categoryList").find('.btn._down:last').prop('disabled', true);

        $("#div_categoryList").find('.btn._up').prop('disabled', false);
        $("#div_categoryList").find('.btn._up:first').prop('disabled', true);
    };


    function allowDrop(ev) {
        ev.preventDefault();
    };

    function drag(ev) {
        ev.dataTransfer.setData("text", ev.$("#div_categoryList").id);
    };

    function drop(ev) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        var idx = data.split("_")[1];
        var targetIdx = $("#div_categoryList").find(ev.target).parent("tr").attr("id").split("_")[1];

        if(parseInt(targetIdx) < parseInt(idx)){
            $("#div_categoryList").find(ev.target).parent("tr").before($("#div_categoryList").find("#"+data));
        }else{
            $("#div_categoryList").find(ev.target).parent("tr").after($("#div_categoryList").find("#"+data));
        }

        resetNo();
        btnSet();
    };

    // 수정데이터 셋팅
    function getArrCodeData(){
        var arrCode = [];

        $("#div_categoryList").find("#tableBody").find("tr").each(function(){
            var code = {
                cd : $(this).find('[name="cd"]').val(),
                cdNm: $(this).find('[name="cdNm"]').val(),
                sortNo: $(this).find('[name="sortNo"]').val(),
                isUse: $(this).find('[name="isUse"]').is(":checked")? "1" : "0"
            }

            if(!common.isEmpty(code.cdNm)){
                arrCode.push(code);
            }
        });

        console.log(arrCode);
        return arrCode;
    };

    function createCodeValue(){
        var newCodeValue = 0;

        //TODO 나중에 수정 필요 가능성 큼. (코드가 숫자, 99까지밖에 안됨.)
        $("#div_categoryList").find("[name=cd]").each(function(){
            var codeValue = $(this).val();
            if(codeValue != "99" && codeValue > newCodeValue){
                newCodeValue = codeValue;
            }
        });

        return parseInt(newCodeValue) + 1;
    };
</script>

<script id="tmp_category_list" type="text/x-handlebars-template">
    {{#data}}
    <%--<tr class="_noTr" id="row_{{sortNo}}" ondrop="drop(event)" ondragover="allowDrop(event)" draggable="true" ondragstart="drag(event)">--%>
    <tr class="_noTr" id="row_{{sortNo}}" >
        <td>
            <input type="checkbox" class="_check" data-idx="{{idx}}"/>
        </td>
        <td class="_noTd">
            <input type="hidden" name="sortNo" value="{{category_orderNo}}"/>
            {{category_orderNo}}
        </td>
        <td>
            {{#dalbit_if cdNm '!=' ''}}
                <input type="input" class="form-control _cdNm" style="width: 100%;" value="{{categoryNm}}" readonly=true>
            {{else}}
                <input type="input" class="form-control _cdNm" style="width: 100%;" value="">
            {{/dalbit_if}}
        </td>
        <td>
            {{#dalbit_if cdNm '!=' ''}}
                {{pageNo}}
            {{else}}
                0
            {{/dalbit_if}}
        </td>
        <td>
            <button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button>
            <button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>
        </td>
    </tr>
    {{else}}
    <tr>
        <td colspan="5">{{isEmptyData}}</td>
    </tr>
    {{/data}}
</script>