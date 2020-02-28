<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center {
        text-align: center;
    }
    .text_middle {
        display:table-cell;
        vertical-align:middle
    }
    .button_right{
        float: right;
        white-space:nowrap;
    }
    .nav.nav-tabs-custom-colored > li.active > a, .nav.nav-tabs-custom-colored > li.active > a:hover, .nav.nav-tabs-custom-colored > li.active > a:focus {
        background-color: #3e3e3e;
        color: #fff;
        cursor: pointer;
    }
    .p_10 {
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
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 120px;height: 27px"> 신고검색 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px"> ㆍ회원이 신고한 정보를 검색하여 확인 후 처리하는 공간입니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">

                <div class="row col-lg-12 form-inline" style="padding-top: 2px;">

                    <%-- 기간 선택 --%>
                    <div class="col-lg-6 p_10" style="background: #f8efc0">
                        <div class="col-lg-12">
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="all" value="all" checked>
                                <span><i></i>전체</span>
                            </label>
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="oneday" value="oneday">
                                <span><i></i>1일</span>
                            </label>
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="week" value="week">
                                <span><i></i>일주일</span>
                            </label>
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="month" value="month">
                                <span><i></i>한 달</span>
                            </label>
                        </div>

                        <div class="col-lg-12">
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="date" value="date">
                                <span><i></i>기간 선택</span>
                            </label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control " id="txt_startSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                        </div>
                        </div>
                    </div>


                    <%-- 셀렉박스, 검색 --%>
                    <div class="col-lg-6 p_10">
                        <div class="row">
                            <%-- 셀렉트 박스 --%>
                            <div class="col-lg-2">
                                <select class="form-control" name="declareType" id="declareType">
                                    <option value="9999" selected="selected">전체▼</option>
                                    <option value="1">방송</option>
                                    <option value="2">이벤트</option>
                                    <option value="3">결제</option>
                                    <option value="4">이용제한</option>
                                    <option value="5">기타</option>
                                </select>
                            </div>
                            <%-- 셀렉트 박스 --%>
                            <div class="col-lg-2">
                                <select class="form-control" name="searchType" id="searchType">
                                    <option value="9999" selected="selected">전체▼</option>
                                    <option value="1">질문</option>
                                    <option value="2">답변</option>
                                    <option value="3">처리자명</option>
                                    <option value="4">UserID</option>
                                    <option value="5">닉네임</option>
                                </select>
                            </div>
                            <%-- 셀렉트 박스 --%>
                            <div class="col-lg-2">
                                <select class="form-control" name="stopType" id="stopType">
                                    <option value="9999" selected="selected">전체▼</option>
                                    <option value="1">1일 정지</option>
                                    <option value="2">3일 정지</option>
                                    <option value="3">7일 정지</option>
                                    <option value="4">15일 정지</option>
                                    <option value="5">한 달</option>
                                </select>
                            </div>

                            <%-- 검색 --%>
                            <div class="col-lg-6">
                                <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>

                </div>


            </div>

            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 120px;height: 27px"> 신고 내역 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px">
                    <p>ㆍ최근 신고내역이 상단에 누적된 정보입니다. 확인하시고 신중한 처리바랍니다.</p>
                </label>
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="declareList" class="table table-sorting table-hover table-bordered datatable">
                            <thead>

                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>

                        <span>
                            <button class="btn btn-default" type="button">선택삭제</button>
                        </span>
                        <span class="button_right">
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                        </span>
                    </div>
                </div> <!-- #DATA TABLE -->
            </div>
        </div> <%-- #container-fluid --%>
    </div> <%-- #page-wrapper --%>
</div> <%-- #wrapper --%>

<script>
    $(document).ready(function() {
        initDataTableInfo();

       $('input[id="txt_search"]').keydown(function() {    // textBox 처리
            if(event.keyCode == 13) {
                declareInfo();
            };
        });

        $("#bt_search").click(function() {  // 버튼의 클릭이벤트
            declareInfo();
        });

    });

    /** Data Table **/
    var dtList_info;
    function initDataTableInfo() {
        var dtList_info_data = function ( data ) {
            /* parameter */
            data.search = $('#txt_search').val()
            data.searchType=$("select[name='searchType']").val()
        };

        console.log(customerDataTableSource);
        dtList_info = new DalbitDataTable($("#declareList"), dtList_info_data, customerDataTableSource.DeclareList);
        // 데이터 테이블 만드는, #어떤 테이블에 들어갈 지, ajax request data, 데이터테이블 소스
        // 데이터테이블 초기값 세팅
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        // dtList_info.setEventClick(test01);
        // row click event, (function명)
        // dtList_info.setEventClick(test02, [2,3]);
        // 2,3 번째 열만 해당되고 다른 열들은 무시함
        dtList_info.createDataTable();
        // 테이블이 화면에 만들어져서 찍히는 순간
    }

    /* function onChange(obj) {
         var type=obj.value;
         alert(type);
     }
 */

    function declareInfo() {
        dtList_info.reload();
    }


    $(function() {
        $(".av nav-tabs nav-tabs-custom-colored active").click(function() {
            $("#" + $(this).data('id')).addClass('on');
        });
    });


</script>
