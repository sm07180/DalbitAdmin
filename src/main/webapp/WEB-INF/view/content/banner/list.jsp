
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <%--<div class="container-fluid">--%>
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <div class="row col-md-12">
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
                            <div class="row col-md-12">
                                <h3 class="title"><i class="fa fa-search"></i>배너검색</h3>
                                <div>
                                    <span id="search_platform_aria"></span>
                                    <span id="search_bannerType_aria"></span>
                                    <span id="search_searchType_aria"></span>

                                    <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table" id="bannerDataTable">
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
<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>

<script>
    $(document).ready(function() {
        init();
        initDataTable();
        initEvent();
    });


    var startDate;
    var endDate;
    function init() {
        //검색조건 불러오기
        $("#search_platform_aria").html(getCommonCodeSelect(-1, platform));
        $("#search_bannerType_aria").html(getCommonCodeSelect(-1, banner_bannerType));
        $("#search_searchType_aria").html(getCommonCodeSelect(-1, banner_searchType));

        // init DatePicker
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
                $('#banner-inputReportrange').attr("startDate", startDate);
                $('#banner-inputReportrange').attr("endDate", endDate);
                $('#banner-inputReportrange').val(start.format('YYYY.MM.DD') + ' - ' + end.format('YYYY.MM.DD'));
            }
        );
    }


    var dtList_info;
    var dtList_statistics_info;
    function initDataTable(){
        //=---------- Main DataTable ----------
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
            data.showTarget = $("select[name='banner-selectShowTarget']").val()
            data.bannerType = $("select[name='banner-selectBannerType']").val()
            data.startDate = $('#banner-inputReportrange').attr("startDated");
            data.endDate = $('#banner-inputReportrange').attr("endDate");
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BannerDataTableSource.list, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.setEventClick(updataInfo,4);
        dtList_info.createDataTable();
        initDataTableButton();
        //---------- Main DataTable ----------=


        //=---------- top-right Sub DataTable ----------
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
            data.showTarget = $("select[name='banner-selectShowTarget']").val()
            data.bannerType = $("select[name='banner-selectBannerType']").val()
            data.startDate = $('#banner-inputReportrange').attr("startDated");
            data.endDate = $('#banner-inputReportrange').attr("endDate");
        };
        dtList_statistics_info = new DalbitDataTable($("#list_statistics_info"), dtList_info_data, BannerDataTableSource.statisticsList);
        dtList_statistics_info.useCheckBox(false);
        dtList_statistics_info.useIndex(false);
        dtList_statistics_info.useOrdering(false);
        dtList_statistics_info.useInitReload(true);
        dtList_statistics_info.onlyTableView();
        dtList_statistics_info.createDataTable();
        //---------- top-right Sub DataTable ----------
    }



    function initDataTableButton() {
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_add" />'
        var delBtn = '<input type="button" value="삭제" class="btn btn-danger btn-sm" id="btn_del" />'
        var excellBtn = '<button class="btn btn-default print-btn btn-sm" type="button"><i class="fa fa-print"></i>Excel Print</button>'

        var subTable = '        <table id="list_statistics_info" class="table table-sorting table-hover table-bordered">\n' +
            '                               <thead>\n' +
            '                               </thead>\n' +
            '                               <tbody id="tableBody">\n' +
            '                               </tbody>\n' +
            '                          </table>';

        $("#bannerDataTable").find(".top-right").append(subTable);

        $("#bannerDataTable").find(".footer-right").append(delBtn);
        $("#bannerDataTable").find(".footer-right").append(addBtn);
        $("#bannerDataTable").find(".footer-right").append(excellBtn);
    }



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
            initData_banner();
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

    }


    // 삭제
    function delPushMsgData() {
        var checkDatas = dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?");

        dalbitLog(checkDatas);
    }


    // 수정
    function updataInfo(data) {
        setData_banner({
            column01: data.rowNum
            ,column02: data.banner_col3
            ,column03: data.banner_col14
            ,column04: "제목"
            ,column05: data.banner_col1
            ,column06: data.banner_col1
            ,column07: data.banner_col1
            ,column08: data.banner_col1
            ,column09: data.banner_col1
            ,column10: data.banner_col2
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