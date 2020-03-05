
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .middle{
        display:table-cell;
        vertical-align:middle;
    }
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>

<div id="main-header">
    <div id="page-wrapper">
        <%--<div class="container-fluid">--%>
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <div class="col-md-4">
                            <h3 class="title"><i class="fa fa-search"></i>진행기간</h3>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="banner-selectDateType" value="0" checked="true">전체
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="banner-selectDateType" value="1" style="margin-top: 10px;">
                                    <div class="input-group">
                                        <span id="banner-reportrange" class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <%--<span class="range-value"></span><b class="caret"></b>--%>
                                        <input type="text" class="form-control" id="banner-inputReportrange" style="width: 180px;" readonly>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <h3 class="title"><i class="fa fa-search"></i>메세지 검색</h3>
                            <div>
                                <select class="form-control" name="selectGubun">
                                    <option value="9999" selected="selected">전체</option>
                                    <option value="1">배너  제목</option>
                                </select>

                                <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table" id="pushDataTable">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
        <%--</div>--%>

    </div>
</div>
<div class="main-content">
    <!-- TAB -->
    <jsp:include page="bannerTab.jsp"></jsp:include>
    <!-- TAB END -->
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function() {
        initDataTable();
        initEvent();
    });


    var startDate;
    var endDate;
    function initEvent(){
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getPushInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getPushInfo();
        });

        $("#btn_add").on("click", function () { //등록
            initData_pushMsg();
        })

        $("#btn_del").on("click", function () { //삭제
            delPushMsgData();
        })

        $("input[name='banner-selectDateType']:radio").change(function () {
            var type = this.value;

            //지정 일 경우 button 활성화
            if(type == "1"){
                $("#banner-reportrange").prop("disabled",false);
            }else{
                $("#banner-reportrange").prop("disabled",true);
                $("#banner-inputReportrange").val("");
                startDate = "";
                endDate = "";
            }
        });

        $('#banner-reportrange').daterangepicker({
                startDate: moment().subtract('days', 29),
                endDate: moment(),
                dateLimit: { days: 60 },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: false,
                ranges: {
                    '1일': [moment(), moment()],
                    // '어제': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    '7일': [moment().subtract('days', 6), moment()],
                    '30일': [moment().subtract('days', 29), moment()],
                    '이번달': [moment().startOf('month'), moment().endOf('month')],
                    '지난달': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'L',
                separator: ' to ',
                locale: {
                    customRangeLabel: '직접선택',
                }
            },

            function(start, end) {
                console.log("Callback has been called!");
                startDate = start.format('YYYYMMDD');
                endDate = end.format('YYYYMMDD');
                // $('#bannerReportrange span').html(start.format('YYYY.MM.DD') + ' - ' + end.format('YYYY.MM.DD'));
                $('#banner-inputReportrange').val(start.format('YYYY.MM.DD') + ' - ' + end.format('YYYY.MM.DD'));
            }
        );
    }

    function delPushMsgData() {
    var checkDatas = dtList_info.getCheckedData();

    if(checkDatas.length <= 0){
        alert("삭제할 정보를 선택해주세요.");
        return false;
    }
    dalbitLog(checkDatas);
    }


    var dtList_info;
    function initDataTable(){
    //=---------- 푸시메시지 DataTable ----------
    var dtList_info_data = function ( data ) {
        data.search = $('#txt_search').val();                        // 검색명
        data.gubun = $("select[name='selectGubun']").val()
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BannerDataTableSource.bannerList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.setEventClick(updataPushInfo,4);
    dtList_info.createDataTable();
    initDataTableButton();
    //---------- 푸시메시지 DataTable ----------=
    }

    function initDataTableButton() {
    var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_add" />'
    var delBtn = '<input type="button" value="삭제" class="btn btn-danger btn-sm" id="btn_del" />'
    var excellBtn = '<button class="btn btn-default print-btn btn-sm" type="button"><i class="fa fa-print"></i>Excel Print</button>'

    $("#pushDataTable").find(".top-right").append(delBtn);
    $("#pushDataTable").find(".top-right").append(addBtn);

    $("#pushDataTable").find(".footer-right").append(excellBtn);
    }

    function updataPushInfo(data) {
    setData_pushMsg({
        column01: data.rowNum
        ,column02: data.push_col5
        ,column03: data.push_col1
        ,column04: "제목"
        ,column05: "내용"
        ,column06: data.push_col2
        ,column07: ""
        ,column08: "option5"
        ,column09: "#ffffff"
        ,column10: ""
        ,column11: "0"
        ,column12: "2020-03-04"
        ,column13: "00"
        ,column14: "00"
        ,column15: ""
        ,column16: data.push_col6
    })

    $("#tab_pushMsgList").click();
    }

    // 검색
    function getPushInfo(){
    /* 엑셀저장을 위해 조회조건 임시저장 */
            // tmp_search = $('#txt_search').val();
            // tmp_gubun = $("select[name='selectGubun']").val();

            dtList_info.reload();

            /*검색결과 영역이 접혀 있을 시 열기*/
            var toggleIcon = $('#_searchToggleIcon');
            if(toggleIcon.hasClass('fa-chevron-down')){
                toggleIcon.click();
            }
        }

        // /*=---------- 엑셀 ----------*/
        // $('#excelDownBtn').on('click', function(){
        //     var formElement = document.querySelector("form");
        //     var formData = new FormData(formElement);
        //
        //     formData.append("search", tmp_search);
        //     formData.append("date", tmp_date);
        //     formData.append("gubun", tmp_gubun);
        //     formData.append("checkDate", tmp_checkDate);
        //     formData.append("stDate", tmp_stDate);
        //     formData.append("edDate", tmp_edDate);
        //     /*formData.append("test003", "test003");*/
        //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
        // });

        // $("#excelBtn").on("click", function () {
        //     $("#list_info").table2excel({
        //         exclude: ".noExl",
        //         name: "Excel Document Name",
        //         filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
        //         fileext: ".xls",
        //         exclude_img: true,
        //         exclude_links: true,
        //         exclude_inputs: true
        //     });
        // });
        //
        // function fn_success_excel(){
        //     console.log("fn_success_excel");
        // }
        //
        // function fn_fail_excel(){
        //     console.log("fn_fail_excel");
        // }
        /*----------- 엑셀 ---------=*/
</script>