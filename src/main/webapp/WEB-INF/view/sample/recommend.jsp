
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
                <div class="row col-lg-12 form-inline">
                    <div class="col-md-12" style="background: #DCE6F2;height: 40px;">
                        <label style="font-weight: bold;color: #000000;">추천/인기DJ검색&nbsp;&nbsp;</label>
                        <select class="form-control" name="selectGubun">
                            <option value="9999" selected="selected">전체</option>
                            <option value="1">User ID</option>
                            <option value="2">User 닉네임</option>
                            <option value="3">방송제목</option>
                        </select>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                    </div>
                </div>
                <!-- TAB START -->
                <div class="row col-lg-12 form-inline " style="padding-top: 2px; padding-bottom: 0px;">
                    <div class="widget-content">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#djList" role="tab" data-toggle="tab" id="tab_recommend">추천DJ</a></li>
                            <li><a href="#djList" role="tab" data-toggle="tab" id="tab_broadDetail">인기DJ</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="djList">
                            <!-- DATA TABLE -->
                            <div class="col-lg-12 no-padding">
                                <div class="widget widget-table">
                                    <div class="widget-content">
                                        <table id="list_info" class="table table-sorting table-hover table-bordered datatable">
                                            <thead id="tableTop">
                                            </thead>
                                            <tbody id="tableBody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- TAB END -->
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script>
    $(document).ready(function() {
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getSearch();
        });
        <!-- 버튼 끝 -->

        <!-- 텝 시작 -->
        $('#tab_recommend').click(function() { getHistoryDetail(this.id); }); 		//   추천DJ
        $('#tab_broadDetail').click(function() { getHistoryDetail(this.id); });		//   인기DJ
        <!-- 텝 끝 -->
    });

    init();

    var memNo = "";
    var dtList_info="";
    function init(){

        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, MenuDataTableSource.recommend);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        // dtList_info.setEventClick(test01,0);
        dtList_info.createDataTable();
    }

    function getSearch(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();
    }


    function getHistoryDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){       // userid 클릭시 _ 없이 호출
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
        var source = MenuDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#list_info"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();
        // tableBody_detail_Set();
    }

    // function test01(t1, t2 ,t3) {
    //     dalbitLog("=-----")
    //     dalbitLog(t1)   //
    //     dalbitLog(t2)
    //     dalbitLog(t3)
    //     dalbitLog(t3.memId);
    //     paging(dtList_info.getDataRow(0).totalCnt, 10, 5, 1);
    //     // console.log(dtList_info.getDataRow(0).totalCnt);
    //     dalbitLog("-----=");
    // }

    function Broad(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("search", tmp_search);
        formData.append("gubun", tmp_gubun);
        excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    $("#excelBtn").on("click", function () {
        $("#list_info").table2excel({
            exclude: ".noExl",
            name: "Excel Document Name",
            filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
            fileext: ".xls",
            exclude_img: true,
            exclude_links: true,
            exclude_inputs: true
        });
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*==================================*/
</script>