
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table">
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
        fnc_eventList.init();
    });
    var event_idx;
    var fnc_eventList = {

    //=------------------------------ Init / Event--------------------------------------------
        "targetId": "eventList",

        init() {
            this.target = $("#"+this.targetId);
            this.targetDataTableId = "list_info_"+this.targetId;
            this.target.find("#list_info").attr("id", this.targetDataTableId);
            this.targetDataTable = this.target.find("#"+this.targetDataTableId);
            this.divDataTable = this.targetDataTable.parent("div");

            this.initDataTable();
            this.initEvent();
        },

        "dtList_info":"",
        initDataTable(){
            //=---------- Main DataTable ----------
            var dtList_info_data = function ( data ) {
                data.search = $('#txt_search').val();                        // 검색명
                data.search_event = $("select[name='search_event']").val()
                data.state = 0;
            };
            this.dtList_info = new DalbitDataTable(this.targetDataTable, dtList_info_data, EventDataTableSource.event);
            this.dtList_info.useCheckBox(true);
            this.dtList_info.useIndex(true);
            this.dtList_info.createDataTable();
            this.initDataTableButton();
            //---------- Main DataTable ----------=
        },

        // DataTable Button
        initDataTableButton() {
            var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
            var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
            var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'

            this.divDataTable.find(".footer-left").append(delBtn);
            this.divDataTable.find(".top-right").append(addBtn);
            this.divDataTable.find(".footer-right").append(excelBtn);
        },

        initEvent(){
            this.target.find("#btn_insert").on("click", function () { //등록
                fnc_eventList.insertEvent();
            });

            this.target.find("#btn_delete").on("click", function () { //삭제
                fnc_eventList.deleteEvent();
            });

            // CheckBox 이벤트
            this.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
                if($(this).prop('checked')){
                    $(this).parent().parent().find('.getEventDetail').click();
                }
            });
        },


    //=------------------------------ Option --------------------------------------------

        // 등록
        insertEvent() {
            $('#div_eventTabList').removeClass("hide");
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


        getEventDetail_info(index){
            $('#div_eventTabList').removeClass("hide");
            var data = this.dtList_info.getDataRow(index);
            fnc_eventDetail.updateEventDetail(data);
            event_idx = data.idx;
        },

        // 검색
        selectMainList(isResetPaging){
            this.dtList_info.reload(null, isResetPaging);
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