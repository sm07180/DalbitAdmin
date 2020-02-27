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

    .p_10 {
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }

    #tableBody tr th {
        display:table-cell;
        vertical-align:middle;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 160px;height: 27px"> 1:1문의/전화문의 검색 </label>
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
                        <div id="searchArea">
                            <%-- 셀렉트 박스 --%>
                            <select class="form-control" name="searchType" id="searchType">
                                <option value="9999" selected="selected">전체 ▼</option>
                                <option value="1">1:1문의</option>
                                <option value="2">전화문의</option>
                            </select>

                            <%-- 셀렉트 박스 --%>
                            <select class="form-control" name="contentsType" id="contentsType">
                                <option value="9999" selected="selected">전체 ▼</option>
                                <option value="1">방송</option>
                                <option value="2">이벤트</option>
                                <option value="3">결제</option>
                                <option value="4">이용제한</option>
                                <option value="5">기타</option>
                            </select>

                            <%-- 셀렉트 박스 --%>
                            <select class="form-control" name="declareType" id="declareType">
                                <option value="9999" selected="selected">전체 ▼</option>
                                <option value="1">질문</option>
                                <option value="2">답변</option>
                                <option value="3">처리자명</option>
                                <option value="4">UserID</option>
                                <option value="5">닉네임</option>
                            </select>

                            <%-- 셀렉트 박스 --%>
                            <select class="form-control" name="stopType" id="stopType">
                                <option value="9999" selected="selected">전체 ▼</option>
                                <option value="1">1일 정지</option>
                                <option value="2">3일 정지</option>
                                <option value="3">7일 정지</option>
                                <option value="4">15일 정지</option>
                                <option value="5">한 달</option>
                            </select>

                            <%-- 검색 --%>
                            <input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요">
                            <button type="submit" class="btn btn-default" id="bt_search">검색</button>

                        </div>
                    </div>

                </div>


            </div>

            <div class="row col-lg-12 form-inline">

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active"><a href="#colored21" role="tab" data-toggle="tab" aria-expanded="true">1:1 문의</a></li>
                    <li class=""><a href="#colored22" role="tab" data-toggle="tab" aria-expanded="false">전화 문의</a></li>
                </ul>
                <div class="widget widget-table">
                    <%--<div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>--%>
                    <div class="widget-content" style="border-top-width:0px;">
                        <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" />
                                </th>
                                <th>No</th>
                                <th>플랫폼구분▼</th>
                                <th>문의구분1▼</th>
                                <th>문의구분2▼</th>
                                <th>문의UserID</th>
                                <th>신고대상<br />UserID</th>
                                <th>신고/문의 제목</th>
                                <th>접수일시<br />/ 처리일시</th>
                                <th>첨부파일</th>
                                <th>처리상태</th>
                                <th>처리자</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">
                                <tr>
                                    <th>
                                        <input type="checkbox" />
                                    </th>
                                    <th>1</th>
                                    <th>PC</th>
                                    <th>1:1문의</th>
                                    <th>방송</th>
                                    <th>id</th>
                                    <th>신고대상id</th>
                                    <th>제목</th>
                                    <th>
                                        <span>20.02.27 14:20:20</span><br/>
                                        / <span>20.02.27 14:20:20</span>
                                    </th>
                                    <th>첨부파일00건</th>
                                    <th>미처리</th>
                                    <th>처리자 ID</th>
                                </tr>
                            </tbody>
                        </table>
                        <span>
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>선택삭제</button>
                                <button class="btn btn-default print-btn pull-right" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div> <%-- #page-wrapper --%>
</div> <%-- #wrapper --%>

<script>
    $(document).ready(function() {
        initDataTableInfo();

        $('input[id="txt_search"]').keydown(function() {    // textBox 처리
            if(event.keyCode == 13) {
                recommendInfo();
            };
        });

        $("#bt_search").click(function() {  // 버튼의 클릭이벤트
            recommendInfo();
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

        console.log(SampleDataTableSource);
        dtList_info = new DalbitDataTable($("#declareList"), dtList_info_data, AdminDataTableSource.recommend);
        // 데이터 테이블 만드는, #어떤 테이블에 들어갈 지, ajax request data, 데이터테이블 소스
        // 데이터테이블 초기값 세팅
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(false);
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
    function recommendInfo() { // 검색
        dtList_info.reload();
    }


    $(function() {
        $(".av nav-tabs nav-tabs-custom-colored active").click(function() {
            $("#" + $(this).data('id')).addClass('on');
        });
    });


</script>
