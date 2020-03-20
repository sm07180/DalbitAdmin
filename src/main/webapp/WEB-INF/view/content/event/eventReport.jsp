
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table" id="eventReportDataTable">
                <div class="widget-content">
                    <table id="list_info" class="table table-sorting table-hover table-bordered">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>

<script>
    $(document).ready(function() {
        fnc_eventReport.init();
    });

    var fnc_eventReport = {

//=------------------------------ Init / Event--------------------------------------------
        "targetId": "eventReport",

        init() {
            this.target = $("#"+this.targetId);
            this.targetDataTableId = "list_info_"+this.targetId;
            this.target.find("#list_info").attr("id", this.targetDataTableId);
            this.targetDataTable = this.target.find("#"+this.targetDataTableId);
            this.divDataTable = this.targetDataTable.parent("div");

            this.initDataTable();
            this.initEvent();
            // this.getEventReportSubData();
        },


        "dtList_info":"",
        "dtList_statistics_info":"",
        initDataTable(){
            //=---------- Main DataTable ----------
            var dtList_info_data = function ( data ) {
                data.search = $('#txt_search').val();                        // 검색명
                data.gubun = $("select[name='selectGubun']").val()
                data.showTarget = $("select[name='banner-selectShowTarget']").val()
                data.bannerType = $("select[name='banner-selectBannerType']").val()
                data.startDate = $('#banner-inputReportrange').attr("startDated");
                data.endDate = $('#banner-inputReportrange').attr("endDate");
            };
            this.dtList_info = new DalbitDataTable(this.targetDataTable, dtList_info_data, EventDataTableSource.report);
            this.dtList_info.useCheckBox(true);
            this.dtList_info.useIndex(true);
            this.dtList_info.setEventClick(this.updateBanner,4);
            this.dtList_info.useInitReload(true);
            this.dtList_info.createDataTable(this.initSummary);

            this.initDataTableButton();
            //---------- Main DataTable ----------=
        },


        initSummary(json) {
            var template = $('#tmp_eventReportStatisticsFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = json.summary;
            var html=templateScript(context);

            fnc_eventReport.divDataTable = fnc_eventReport.targetDataTable.parent("div");

            fnc_eventReport.divDataTable.find(".top-right").append(html);
        },


        // DataTable Button
        initDataTableButton() {
            var winnerBtn = '<input type="button" value="선택당첨" class="btn btn-success btn-sm" id="btn_winner" style="margin-left: 3px;"/>'
            var insertNoticeBtn = '<input type="button" value="바로 공지하기" class="btn btn-success btn-sm" id="btn_insertNotice" style="margin-left: 3px;"/>'
            var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Print</button>'


            this.divDataTable = this.targetDataTable.parent("div");

            this.divDataTable.find(".footer-left").append(winnerBtn);
            this.divDataTable.find(".footer-left").append(insertNoticeBtn);
            this.divDataTable.find(".footer-right").append(excelBtn);
        },



        initEvent(){
            this.target.find("#btn_insert").on("click", function () { //등록
                fnc_eventReport.insertEvent();
            })

            this.target.find("#btn_delete").on("click", function () { //삭제
                fnc_eventReport.deleteEvent();
            })
        },


//=------------------------------ Option --------------------------------------------

        // 등록
        insertEvent() {
            fnc_eventDetail.insertEventDetail();

            $("#tab_eventDetail").click();
        },

        // 삭제
        deleteEvent() {
            var checkDatas = dtList_info.getCheckedData();

            if(checkDatas.length <= 0){
                alert("삭제할 정보를 선택해주세요.");
                return false;
            }

            if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){
                //TODO 삭제 로직 추가아아앙
            };

            dalbitLog(checkDatas);
        },

        // 수정
        updateBanner(data) {
            fnc_eventDetail.updateEventDetail({
                eventIdx: data.rowNum
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

            $("#tab_eventDetail").click();
        },


        //우측 상단 통계 조회
        getEventReportSubData() {
            util.getAjaxData("getEventReportSubData", "/rest/content/event/reportstatistics", "", this.fn_statistics_success);
        },


        fn_statistics_success(dst_id, data){
            dalbitLog(dst_id);
            dalbitLog(data)

            var template = $('#tmp_eventReportStatisticsFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = data;
            var html=templateScript(context);
            console.log(fnc_eventReport.divDataTable.html());
            console.log(fnc_eventReport.divDataTable.find(".top-right").html())

            fnc_eventReport.divDataTable.find(".top-right").append(html);
        },


        // 검색
        selectEventList(){
            /* 엑셀저장을 위해 조회조건 임시저장 */
            // tmp_search = $('#txt_search').val();
            // tmp_gubun = $("select[name='selectGubun']").val();

            this.dtList_info.reload();
        },

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
    }
</script>




<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_eventReportStatisticsFrm" type="text/x-handlebars-template">

    {{#each this}}
    <table class="table table-bordered table-dalbit text-center" style="width:400px;">
        <colgroup>
            <col width="16%" />
            <col width="16%" />
            <col width="16%" />
            <col width="16%" />
            <col width="16%" />
            <col width="16%" />
        </colgroup>
        <tbody>
            <tr class="align-middle">
                <th colspan="2">총 응모자</th>
                <th colspan="2" rowspan="2">중복 응모</th>
                <th colspan="2">당첨자</th>
            </tr>
            <tr>
                <th>남</th>
                <th>여</th>
                <th>남</th>
                <th>여</th>
            </tr>
            <tr>
                <td style="text-align:center;">{{event_col1}}명</td>
                <td style="text-align:center;">{{event_col2}}명</td>
                <td style="text-align:center;" colspan="2">{{event_col3}}건</td>
                <td style="text-align:center;">{{event_col5}}명</td>
                <td style="text-align:center;">{{event_col7}}명</td>
            </tr>
        </tbody>
    </table>
    {{/each}}
</script>