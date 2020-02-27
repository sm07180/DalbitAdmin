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
</style>

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
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 120px;height: 27px"> 신고검색 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px"> ㆍ회원이 신고한 정보를 검색하여 확인 후 처리하는 공간입니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">

                <div class="row col-lg-12 form-inline" style="padding-top: 2px;">
                    <div class="col-lg-6">
                        <%-- 셀렉트 박스 --%>
                        <select class="form-control" name="searchType" id="searchType">
                            <option value="9999" selected="selected">전체▼</option>
                            <option value="1">DJ ID</option>
                            <option value="2">DJ 닉네임</option>
                            <option value="3">방송제목</option>
                        </select>
                        <%-- 검색 --%>
                        <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                        <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                    </div>
                </div>
            </div>

            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active txt_middle" >
                        <a href="#recommendDJ" role="tab" data-toggle="tab" style="height: 40px"> 추천DJ </a>
                    </li>
                    <li>
                        <a href="#popDJ" role="tab" data-toggle="tab" style="height: 40px"> 인기DJ </a>
                    </li>
                    <label class="text_middle" style="font-size: 11px;height: 27px">
                        <p>ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다.</p>
                    </label>
                </ul>
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="recommendList" class="table table-sorting table-hover table-bordered datatable">
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
        dtList_info = new DalbitDataTable($("#recommendList"), dtList_info_data, AdminDataTableSource.recommend);
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
