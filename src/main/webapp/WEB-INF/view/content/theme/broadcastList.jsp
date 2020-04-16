<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div>
    <div class="row col-md-12" style="padding-bottom: 15px">
        <div class="pull-left">
            ㆍ 방송 주제를 등록 수정 삭제 관리를 할 수 있습니다.
        </div>
        <div class="pull-right">
            <button type="button" class="btn btn-default mr-10" id="addBtn"><i class="fa fa-plus-square"></i>등록</button>
            <button type="button" class="btn btn-primary " id="submitBtn" ><i class="fa fa-floppy-o"></i>적용</button>
        </div>
    </div>

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <thead>
            <tr>
                <th>선택</th>
                <th>No</th>
                <th>순서변경</th>
                <th>적용상태</th>
                <th>방송주제</th>
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

            <%--<div class="btn-group pull-right" role="group">--%>
                <%--<button type="button" class="btn btn-default mr-10" id="addBtn"><i class="fa fa-plus-square"></i>등록</button>--%>
                <%--<button type="button" class="btn btn-primary "><i class="fa fa-floppy-o"></i>적용</button>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->


<script>
    $(document).ready(function() {
        // util.getAjaxData("list", "/rest/content/theme/list", "", fn_success, fn_fail);
        fnc_broadcastList.init();
    });

    var fnc_broadcastList = {
        "targetId": "broadcastList",

        init() {
            this.target = $("#" + this.targetId);

            util.getAjaxData("list", "/rest/content/theme/broadcast/list", "", fnc_broadcastList.fn_success, fnc_broadcastList.fn_fail);

            this.initEvent();
        },

        initEvent() {
            this.target.off('click').on('click', '._down', function () {
                var targetTr = $(this).closest('tr');
                var nextTr = targetTr.next();
                targetTr.insertAfter(nextTr);
                fnc_broadcastList.resetNo();
                fnc_broadcastList.btnSet();
            });

            this.target.off('click').on('click', '._up', function () {
                var targetTr = $(this).closest('tr');
                var prevTr = targetTr.prev();
                targetTr.insertBefore(prevTr);
                fnc_broadcastList.resetNo();
                fnc_broadcastList.btnSet();
            });

            this.target.find('#deleteBtn').off('click').on('click', function () {
                var checked = fnc_broadcastList.target.find('#tableBody').find('._check:checked');

                if (0 == checked.length) {
                    alert("삭제할 방송 주제를 선택해주세요.");
                    return;
                }
                if (confirm('삭제하시겠습니까?')) {
                    var checked = fnc_broadcastList.target.find('#tableBody').find('._check:checked');
                    checked.closest('tr').remove();
                    fnc_broadcastList.resetNo();
                }
            });

            this.target.find("#updateBtn").off('click').on('click', function () {
                var checked = fnc_broadcastList.target.find('#tableBody').find('._check:checked');
                if (0 == checked.length) {
                    alert("수정할 방송 주제를 선택해주세요.");
                    return;
                }

                checked.each(function () {
                    $(this).closest('tr').find('._cdNm').prop('readonly', false);
                    /*if(!isEmpty(input.val())){
                        $("#tableBody").find('._cdNm').prop('readonly', false);
                    }*/
                });

                fnc_broadcastList.target.find('#tableBody').find('._check:checked:eq(0)').closest('tr').find('._cdNm').focus();
            });

            this.target.find("#addBtn").off('click').on('click', function () {
                var newData = {
                    sortNo: fnc_broadcastList.target.find('._noTd').length + 1,
                    cd: fnc_broadcastList.createCodeValue(),
                    cdNm: '',
                    isUse: 0,
                    isOn: true,
                    readonly: false
                }

                var template = fnc_broadcastList.target.find('#tmp_list').html();
                var templateScript = Handlebars.compile(template);
                var html = templateScript({data: newData});

                fnc_broadcastList.target.find("#tableBody").append(html);

                fnc_broadcastList.btnSet();
            });

            this.target.find("#submitBtn").off('click').on('click', function () {

                var editData = {
                    codeType: "subject_type",
                    codeVoArr: JSON.stringify(fnc_broadcastList.getArrCodeData())
                }

                util.getAjaxData("list", "/rest/content/theme/broadcast/submit", editData, fnc_broadcastList.fn_submit_success, fnc_broadcastList.fn_fail);

            });

        },


        fn_success(dst_id, response)
        {
            dalbitLog(response);

            var template = fnc_broadcastList.target.find('#tmp_list').html();
            var templateScript = Handlebars.compile(template);
            var html = templateScript(response);

            fnc_broadcastList.target.find("#tableBody").html(html);

            fnc_broadcastList.btnSet();
        },

        fn_submit_success(dst_id, response)
        {
            dalbitLog(response);

            alert(response.message);

            fnc_broadcastList.init();
        },

        fn_fail(data, textStatus, jqXHR) {
            dalbitLog(data, textStatus, jqXHR);
        },



        resetNo() {
            this.target.find('._noTd').each(function (index) {
                var html = '<input type="hidden" name="sortNo" value="'+(index+1)+'">';
                html += (index+1);
                $(this).html(html);
            });

            this.target.find('._noTr').each(function (index) {
                $(this).attr("id", "row_" + (index + 1));
            });
        },

        btnSet() {
            this.target.find('.btn._down').prop('disabled', false);
            this.target.find('.btn._down:last').prop('disabled', true);

            this.target.find('.btn._up').prop('disabled', false);
            this.target.find('.btn._up:first').prop('disabled', true);
        },


        allowDrop(ev) {
            ev.preventDefault();
        },

        drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
        },

        drop(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            var idx = data.split("_")[1];
            var targetIdx = fnc_broadcastList.target.find(ev.target).parent("tr").attr("id").split("_")[1];

            if(parseInt(targetIdx) < parseInt(idx)){
                fnc_broadcastList.target.find(ev.target).parent("tr").before(fnc_broadcastList.target.find("#"+data));
            }else{
                fnc_broadcastList.target.find(ev.target).parent("tr").after(fnc_broadcastList.target.find("#"+data));
            }


            fnc_broadcastList.resetNo();
            fnc_broadcastList.btnSet();
        },

        // 수정데이터 셋팅
        getArrCodeData(){
            var arrCode = [];

            fnc_broadcastList.target.find("#tableBody").find("tr").each(function(){
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
        },

        createCodeValue(){
            var newCodeValue = 0;

            //TODO 나중에 수정 필요 가능성 큼. (코드가 숫자, 99까지밖에 안됨.)
            fnc_broadcastList.target.find("[name=cd]").each(function(){
                var codeValue = $(this).val();
                if(codeValue != "99" && codeValue > newCodeValue){
                    newCodeValue = codeValue;
                }
            });

            return parseInt(newCodeValue) + 1;
        }
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr class="_noTr" id="row_{{sortNo}}" ondrop="fnc_broadcastList.drop(event)" ondragover="fnc_broadcastList.allowDrop(event)" draggable="true" ondragstart="fnc_broadcastList.drag(event)">
        <td>
            <input type="checkbox" class="form-control _check" />
        </td>
        <td class="_noTd">
            <input type="hidden" name="sortNo" value="{{sortNo}}"/>
            {{sortNo}}
        </td>
        <td>
            <button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button>
            <button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>
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
    </tr>
    {{/data}}
</script>