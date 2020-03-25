
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


<!-- modal -->
<div class="modal fade" id="eventReportModal" tabindex="-1" role="dialog" aria-labelledby="eventReportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="_layerTitle">Modal title</h4>
            </div>
            <div class="modal-body">
                <p id="_layerBody">Modal dialog content...</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> 닫기</button>
            </div>
        </div>
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

            /** 선택된 데이터 정보 조회  */
            if(!common.isEmpty(getSelectDataInfo())){
                alert("[ERROR] SelectDataInfo 전달 실패!")
                console.log(getSelectDataInfo());
                this.dataKey = getSelectDataInfo().dataKey;
                this.data = getSelectDataInfo().data;
            }

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
            this.dtList_info.setPageLength(-1);
            this.dtList_info.createDataTable(this.initSummary);

            this.initDataTableButton();
            //---------- Main DataTable ----------=
        },


        initSummary(json) {
            //전체 선택 체크박스 비활성화
            $("#list_info_" + fnc_eventReport.targetId +"-select-all").hide();

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



        "choiceIdx" : 1,
        initEvent(){
            this.target.find("#btn_insert").on("click", function () { //등록
                fnc_eventReport.insertEvent();
            })

            this.target.find("#btn_delete").on("click", function () { //삭제
                fnc_eventReport.deleteEvent();
            })

            this.target.find("#btn_winner").on("click", function () { //선택당첨
                fnc_eventReport.winnerEvent();
            })



            this.targetDataTable.children('tbody').on('change', 'input[type="checkbox"]', function () {
                var idx = fnc_eventReport.targetDataTable.children('tbody').find('input[type="checkbox"]').index(this);
                if (this.checked) {
                    $(this).parent("td").parent("tr").find("td:eq(2)").text("선정");
                    $(this).parent("td").parent("tr").find("td:eq(3)").text(fnc_eventReport.choiceIdx);
                    fnc_eventReport.targetDataTable.DataTable().row(idx).data().choiceNum = fnc_eventReport.choiceIdx;
                    fnc_eventReport.choiceIdx++;
                }else{
                    var oriNum = $(this).parent("td").parent("tr").find("td:eq(3)").text();
                    $(this).parent("td").parent("tr").find("td:eq(2)").text("");
                    $(this).parent("td").parent("tr").find("td:eq(3)").text("");
                    delete fnc_eventReport.targetDataTable.DataTable().row(idx).data().choiceNum;
                    fnc_eventReport.choiceIdx--;

                    fnc_eventReport.targetDataTable.children('tbody').find('input[type="checkbox"]').each(function(){
                        if(this.checked){
                            var num = $(this).parent("td").parent("tr").find("td:eq(3)").text();
                            if(num > oriNum){
                                $(this).parent("td").parent("tr").find("td:eq(3)").text(num - 1);
                            }
                        }
                    });
                }
            })
        },


//=------------------------------ Option --------------------------------------------

        // 등록
        insertEvent() {
            fnc_eventReport.insertEventDetail();

            $("#tab_eventReport").click();
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


        // 수정 화면
        updateEventDetail(json){
            if(common.isEmpty(getSelectDataInfo())){
                alert("[ERROR] SelectDataInfo 전달 실패!")
                console.log("[ERROR] SelectDataInfo 전달 실패! =-----")
                console.log(getSelectDataInfo());
                console.log("[ERROR] SelectDataInfo 전달 실패! -----=")
                return false;
            }

            var dataKey = getSelectDataInfo().dataKey;
            var data = getSelectDataInfo().data;

            this.initDataTable();
            this.initEvent();

            //TODO 데이터 셋팅 후 이벤트 처리 필요
            //TODO 수신대상 그려야 함.
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

        //당첨자 지정선택
        winnerEvent() {
            var checkDatas = fnc_eventReport.dtList_info.getCheckedData();

            if(checkDatas.length <= 0){
                alert("삭제할 정보를 선택해주세요.");
                return false;
            }

            console.log(checkDatas);
        },

        //응모횟수 모달 데이터 셋팅
        setModalData(idx){
            var data = fnc_eventReport.dtList_info.getDataRow(idx)

            console.log(data);
            fnc_eventReport.target.find("#_layerTitle").html('제목이에요');
            fnc_eventReport.target.find("#_layerBody").html(JSON.stringify(data));
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