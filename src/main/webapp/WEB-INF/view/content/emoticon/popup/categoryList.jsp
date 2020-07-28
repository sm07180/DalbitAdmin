<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div id="div_categoryList">
    <div class="row col-md-12" style="padding-bottom: 15px">
        <div class="pull-left">
        </div>
        <div class="pull-right">
            <button type="button" class="btn btn-default mr-10" id="addBtn"><i class="fa fa-plus-square"></i>추가</button>
            <button type="button" class="btn btn-primary " id="submitBtn" ><i class="fa fa-floppy-o"></i>적용</button>
        </div>
    </div>

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <thead>
            <tr>
                <th>선택</th>
                <th>No</th>
                <th>카테고리</th>
                <th>페이지 수</th>
                <th>순서변경</th>
            </tr>
            </thead>
            <tbody id="tableBody">

            </tbody>
        </table>

        <div class="btn-toolbar">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" id="deleteBtn"><i class="fa fa-trash-o"></i>선택삭제</button>
                <button type="button" class="btn btn-primary" id="updateBtn"><i class="fa fa-pencil"></i>선택수정</button>
            </div>
        </div>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->


<script>
    $(document).ready(function() {
        // util.getAjaxData("list", "/rest/content/theme/list", "", fn_success, fn_fail);
        init();
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
        util.getAjaxData("list", "/rest/content/emoticon/category/list", "", fn_success, fn_fail);

        initEvent();
    };

    function initEvent() {

        $("#div_categoryList").find('#deleteBtn').off('click').on('click', function () {
            var checked = $("#div_categoryList").find('#tableBody').find('._check:checked');

            if (0 == checked.length) {
                alert("삭제할 카테고리를 선택해주세요.");
                return;
            }
            if (confirm('삭제하시겠습니까?')) {
                var checked = $("#div_categoryList").find('#tableBody').find('._check:checked');
                checked.closest('tr').remove();
                resetNo();
            }
        });

        $("#div_categoryList").find("#updateBtn").off('click').on('click', function () {
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

        $("#div_categoryList").find("#addBtn").off('click').on('click', function () {
            var newData = {
                sortNo: $("#div_categoryList").find('._noTd').length + 1,
                cd: createCodeValue(),
                cdNm: '',
                isUse: 0,
                isOn: true,
                readonly: false
            }

            var template = $("#div_categoryList").find('#tmp_list').html();
            var templateScript = Handlebars.compile(template);
            var html = templateScript({data: newData});

            $("#div_categoryList").find("#tableBody").append(html);

            btnSet();
        });

        $("#div_categoryList").find("#submitBtn").off('click').on('click', function () {

            var editData = {
                codeType: "subject_type",
                codeVoArr: JSON.stringify(getArrCodeData())
            }

            util.getAjaxData("list", "/rest/content/emoticon/category/submit", editData, fn_submit_success);

        });

    };


    function fn_success(dst_id, response)
    {
        var template = $("#div_categoryList").find('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript(response);

        $("#div_categoryList").find("#tableBody").html(html);

        btnSet();
    };

    function fn_submit_success(dst_id, response)
    {
        alert(response.message);

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

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr class="_noTr" id="row_{{sortNo}}" ondrop="drop(event)" ondragover="allowDrop(event)" draggable="true" ondragstart="drag(event)">
        <td>
            <input type="checkbox" class="form-control _check" />
        </td>
        <td class="_noTd">
            <input type="hidden" name="sortNo" value="{{sortNo}}"/>
            {{sortNo}}
        </td>
        <td>
            <div class="control-inline onoffswitch">
                <input type="checkbox" name="isUse" class="onoffswitch-checkbox" id="broadcastList_isUse{{sortNo}}" {{#dalbit_if isUse "==" "1"}}checked{{/dalbit_if}}>
                <label class="onoffswitch-label" for="broadcastList_isUse{{sortNo}}">
                    <span class="onoffswitch-inner"></span>
                    <span class="onoffswitch-switch"></span>
                </label>
            </div>
        </td>
        <td>
            <input type="hidden" name="cd" value="{{cd}}"/>
            <input type="text" name="cdNm" value="{{cdNm}}" class="form-control _cdNm" {{#unless isOn}}readonly="true"{{/unless}} />
        </td>
        <td>
            <button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button>
            <button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>
        </td>
    </tr>
    {{/data}}
</script>