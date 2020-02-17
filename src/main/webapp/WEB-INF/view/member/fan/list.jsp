<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .text_middle{
        display:table-cell;
        vertical-align:middle
    }
    .p_10{
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }
</style>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 80px;height: 27px"> 회원검색 </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;" >
                <div class="col-lg-6 p_10" style="background: #f8efc0">
                    <div class="col-lg-12" >
                        <label style="font-weight: bold">회원가입/탈퇴기간</label>
                    </div>
                    <div class="col-lg-12">
                        <form id="date_radio">
                            <label class="radio-inline"><input type="radio" name="radio_date" value="all" checked>전체</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="today">오늘</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="week">1주일</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="month">한달</label>
                        </form>
                    </div>

                    <div class="col-lg-12">
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel" checked>기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control " id="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-6 form-inline p_10">
                    <div class="col-lg-12 " >
                        <div class="col-lg-12">
                            <label style="font-weight: bold">로그인된 아이콘</label>
                        </div>
                    </div>
                    <div class="row col-lg-12 form-inline" >
                        <div class="col-lg-12">
                            <select class="form-control" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">User ID</option>
                                <option value="2">User 닉네임</option>
                                <option value="3">연락처</option>
                                <option value="4">이름</option>
                            </select>

                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 100px;height: 27px"> 검색 결과 정보 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px"> ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered datatable">
                            <span>
                                <button class="btn btn-default print-btn" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
                            </span>
                            <span style="float: right;">
                                <label id="list_cnt" class="text_middle well-sm" style="font-size: 12px;height: 27px;background: #bfbfbf">검색 결과 총0건</label>
                            </span>
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>회원번호</th>
                                <th>UserID</th>
                                <th>닉네임</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>가입플랫폼</th>
                                <th>접속상태</th>
                                <th>생방상태</th>
                                <th>Fan 자세히 보기</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <div class="row col-lg-12 form-inline" style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 70px;height: 27px"> Fan</label>
                <label class="text_middle" style="font-size: 11px;height: 27px">ㆍ타 회원이 Fan으로 등록하면 해당 회원이 MyStar가 됩니다.<br /> ㆍ나의 Fan 회원리스트를 확인하고 등록/삭제 할 수 있습니다.</label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail">
                            </thead>
                            <tbody id="tableBody_detail">
                            </tbody>
                        </table>
                        <span>
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>
    $(document).ready(function() {
        var tmp_memNo;
        $('#list_info').DataTable();

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: 'kr',
            maxDate:0
        }).datepicker("setDate", new Date());

        $('#date_radio').change(function() {
            if($('input[name="radio_date"]:checked').val() == "all"){               // 전체
                //$('input:checkbox[id="check_dateSel"]').prop("checked", true);
            }else if($('input[name="radio_date"]:checked').val() == "week"){        //1주일
                $('#txt_startSel').val(moment().add(-7,'d').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }else if($('input[name="radio_date"]:checked').val() == "month"){       // 한달
                // console.log(moment().add(-1,'M').format("YYYY-MM-DD"));
                // $('#txt_startSel').val("123123");
                $('#txt_startSel').val(moment().add(-1,'M').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().add('M').format("YYYY-MM-DD"));
            }else{
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('#check_dateSel').click(function () {       //기간 선택
            if ($('input[id="check_dateSel"]:checked').val() == "on") {
                $('#txt_startSel').attr("disabled", false);
                $('#txt_endSel').attr("disabled", false);
                $('#i_startSel').prop("disable", false);
                $('#i_endSel').prop("disabled", false);
            } else {
                $('#txt_startSel').attr("disabled", true);
                $('#txt_endSel').attr("disabled", true);
                $('#i_startSel').prop("disabled", true);
                $('#i_endSel').prop("disabled", true);
            }
        });

        $('#date_startSel').change(function(){
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment($('#txt_endSel').val()).format("YYYYMMDD"))){
                $('#txt_startSel').val($('#txt_endSel').val());
            }
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment().format('YYYYMMDD'))){
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getUserInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
    });
    function getUserInfo(){                 // 검색
        $('#list_info').DataTable().destroy();
        $("#tableBody").empty();
        var obj = new Object();
        obj.search = $('#txt_search').val();                        // 검색명
        obj.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
        obj.gubun = $("select[name='selectGubun']").val();          // 검색 조건
        obj.checkDate = $("input:checkbox[id='check_dateSel']").is(":checked");                       // 기간선택 여부
        obj.stDate = $('#txt_startSel').val();                      // 검색일 시작
        obj.edDate = $('#txt_endSel').val();                        // 검색일 끝

        getAjaxData("memberList", "/rest/member/member/list", obj, fn_success, fn_fail);
    }

    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $("#tableBody").append(html);
        $('#list_info').DataTable().draw();
        $('#list_cnt').html("검색 결과 총" + response.data.length + "건");
    }

    function getMemNo_info(id){
        // var obj = new Object();
        // obj.mem_no = id;
        tmp_memNo = id;
        table_col_set(tmp_memNo,"myStarHistory");
    }
    function detail_broad_click(id){
        table_col_set(tmp_memNo,id);
    }
    function table_col_set(memNo,id){
        $("#tableTop_detail").empty();
        // $("#detail_comments").html(comments);
        var data = {header: [
                {columnNm: "key"},
                {columnNm: "NO"},
                {columnNm: "Fan ID"},
                {columnNm: "Fan 닉네임"},
                {columnNm: "보낸 건 수"},
                {columnNm: "보낸 개 수"},
                {columnNm: "등록 일시"},
                {columnNm: "해제 일시"},
            ]}

        var template = $('#tmp_list_top_column').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html = templateScript(context);
        $("#tableTop_detail").append(html);

        $('#list_info_detail').DataTable().destroy();
        $("#tableBody_detail").empty();
        var obj = new Object();
        obj.mem_no = memNo;
        getAjaxData(id, "/rest/member/fan/list", obj, fn_success_detail, fn_fail);
    }

    function fn_success_detail(dst_id, response) {
        dalbitLog(response);
        var template;
        template = $('#myFanHistory_detail').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody_detail").append(html);
        $('#list_info_detail').DataTable().draw();
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
        $('#list_info_detail').DataTable().draw();
    }

    function Fan(id){
        var tmp = id.split('_');
        var id = tmp[1];
        alert('Fan 해제~ memNo : ' + id);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        /*formData.append("search", "test001");
        formData.append("test003", "test003");*/
        excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    function fn_success_excel(){
        alert("fn_success_excel");
    }

    function fn_fail_excel(){
        alert("fn_fail_excel");
    }
    /*==================================*/
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memNo}}</td>
        <%--<td><a href="javascript://" onclick="javascript:getMemNo_info(this.id);" id="{{memNo}}">{{memId}}</a></td>--%>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{memName}}</td>
        <td>{{memPhone}}</td>
        <td>{{memSlct}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
        <td>
            <a href="javascript://" class="btn btn-xs" onclick="javascript:getMemNo_info(this.id);" id="{{memNo}}">[자세히보기]</a>
            <%--<a a href="javascript://" class="btn btn-xs" id="bt_listenerHistory_detail" aria-expanded="false" ></a>--%>
        </td>
    </tr>
    {{/data}}
</script>
<script id="tmp_list_top_column" type="text/x-handlebars-template">
    <tr>
        {{#header}}
        <th>{{columnNm}}</th>
        {{/header}}
    </tr>
</script>

<script id="myFanHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{memNo}}</td>
        <td>{{index @index}}</td>
        <td><a href="javascript://" onclick="javascript:Fan(this.id);" id="F_{{memNo}}">{{memId}}</a></td>
        <td>{{memNick}}</td>
        <td>{{tmp1}}</td>
        <td>{{tmp2}}</td>
        <td>{{regDate}}</td>
        <td>{{tmp3}}</td>
    </tr>
    {{/data}}
</script>