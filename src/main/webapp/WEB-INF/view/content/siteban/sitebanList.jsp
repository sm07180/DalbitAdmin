<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div>
    <div class="row col-md-12" style="padding-bottom: 15px">
        <div class="pull-left">
            • 사이트 내 닉네임 , 채팅글 , 팬보드 , 방송 제목 또는 방송 환영글 등에서 사용을 금지하는 금지어 관리 공간입니다.
            <br>
            • 4글자 이상으로 등록해주세요.
        </div>
        <div class="pull-right">
            <%--<button type="button" class="btn btn-default mr-10" id="addBtn"><i class="fa fa-plus-square"></i>등록</button>--%>
            <%--<button type="button" class="btn btn-primary "><i class="fa fa-floppy-o"></i>적용</button>--%>
        </div>
    </div>

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable ui-pg-table">
            <colgroup>
                <col width="70px" />
                <col width="120px"/>
                <col/>
            </colgroup>
            <thead>
            <tr>
                <th>선택</th>
                <th>No</th>
                <th>금지어</th>
            </tr>
            </thead>
            <tbody id="tableBody">

            </tbody>
        </table>

        <div class="btn-toolbar">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" id="deleteBtn"><i class="fa fa-trash-o"></i>선택삭제</button>
            </div>

            <div class="btn-group pull-right" role="group">
                <button type="button" class="btn btn-default mr-10" id="addBtn"><i class="fa fa-plus-square"></i>등록</button>
                <button type="button" class="btn btn-primary" id="insertBtn"><i class="fa fa-floppy-o"></i>적용</button>
            </div>
        </div>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->


<script>
    $(document).ready(function() {
        // util.getAjaxData("list", "/rest/content/siteban/list", "", fn_success, fn_fail);
        fnc_sitebanList.init();
    });

    var fnc_sitebanList = {
        "targetId": "sitebanList",

        init() {
            this.target = $("#" + this.targetId);

            util.getAjaxData("list", "/rest/content/siteban/siteban", "", fnc_sitebanList.fn_success, fnc_sitebanList.fn_fail);

            this.initEvent();
        },

        initEvent() {
            this.target.on('click', '._down', function () {
                var targetTr = $(this).closest('tr');
                var nextTr = targetTr.next();
                targetTr.insertAfter(nextTr);
                fnc_sitebanList.resetNo();
                fnc_sitebanList.btnSet();
            });

            this.target.on('click', '._up', function () {
                var targetTr = $(this).closest('tr');
                var prevTr = targetTr.prev();
                targetTr.insertBefore(prevTr);
                fnc_sitebanList.resetNo();
                fnc_sitebanList.btnSet();
            });

            this.target.find('#deleteBtn').on('click', function () {
                var checked = fnc_sitebanList.target.find('#tableBody').find('._check:checked');

                if (0 == checked.length) {
                    alert("삭제할 방송 주제를 선택해주세요.");
                    return;
                }
                if (confirm('삭제하시겠습니까?')) {
                    var checked = fnc_sitebanList.target.find('#tableBody').find('._check:checked');
                    checked.closest('tr').remove();
                    fnc_sitebanList.resetNo();
                }
            });

            this.target.find("#updateBtn").on('click', function () {
                var checked = fnc_sitebanList.target.find('#tableBody').find('._check:checked');
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

                fnc_sitebanList.target.find('#tableBody').find('._check:checked:eq(0)').closest('tr').find('._cdNm').focus();
            });

            this.target.find("#addBtn").on('click', function () {
                var idx = (fnc_sitebanList.target.find('._noTd').length + 1);
                var newData = {
                    no: idx,
                    cdNm: '<input type=text id="cdNm_' + idx + '" />'
                }

                var template = fnc_sitebanList.target.find('#tmp_list').html();
                var templateScript = Handlebars.compile(template);
                var html = templateScript({data: newData});

                fnc_sitebanList.target.find("#tableBody").append(html);

                fnc_sitebanList.btnSet();

            });

            this.target.find("#insertBtn").on('click', function () {
                // TODO insert 처리 필요

            });
        },

        fn_success(dst_id, response)
        {
            dalbitLog(response);

            var template = fnc_sitebanList.target.find('#tmp_list').html();
            var templateScript = Handlebars.compile(template);
            var html = templateScript(response);

            fnc_sitebanList.target.find("#tableBody").append(html);

            fnc_sitebanList.btnSet();

            fnc_sitebanList.target.find("#list").DataTable({
                sDom: "<'row col-md-12'<'pull-left'i><'pull-right'f>>t",
                ordering: false,
                paging:false,
                bPaginate: true,                                                                // 페이징 처리 여부.
                bLengthChange: true,                                                        //  페이지 표시 건수 변동 기능 사용 여
            });
        },

        fn_fail(data, textStatus, jqXHR) {
            dalbitLog(data, textStatus, jqXHR);
        },



        resetNo() {
            this.target.find('._noTd').each(function (index) {
                $(this).html(index + 1);
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
            var targetIdx = $(ev.target).parent("tr").attr("id").split("_")[1];

            if(parseInt(targetIdx) < parseInt(idx)){
                $(ev.target).parent("tr").before(document.getElementById(data));
            }else{
                $(ev.target).parent("tr").after(document.getElementById(data));
            }

            fnc_sitebanList.resetNo();
            fnc_sitebanList.btnSet();
        }

    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>
            <input type="checkbox" class="form-control _check" />
        </td>
        <td class="_noTd" style="vertical-align:middle">{{index @index no}}</td>
        <td style="vertical-align:middle">
            {{{cdNm}}}
        </td>
    </tr>
    {{/data}}
</script>