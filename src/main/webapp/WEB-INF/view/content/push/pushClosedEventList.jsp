<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <!-- DATA TABLE -->
    <div class="row col-lg-12 form-inline">
        <div class="widget widget-table">
            <div class="widget-content">
                <table id="list_push_info" class="table table-sorting table-hover table-bordered">
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

<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    var tab_id;
    function init_pushClosedEventList(tab_id) {
        initDataTable_pushClosedEventList(tab_id);
        initEvent_pushClosedEventList(tab_id);
    }


    function initEvent_pushClosedEventList(tab_id){
    }


    function initDataTable_pushClosedEventList(tab_id){
        //=---------- 푸시메시지 DataTable ----------
        var source = PushDataTableSource[tab_id];
        var dtList_push_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
        };

        console.log(source)
        dtList_push_info = new DalbitDataTable($("#"+tab_id).find("#list_push_info"), dtList_push_info_data, source);
        dtList_push_info.useCheckBox(true);
        dtList_push_info.useIndex(true);
        dtList_push_info.useInitReload(true);
        dtList_push_info.setEventClick(updataPushInfo,4);
        dtList_push_info.createDataTable();
        //---------- 푸시메시지 DataTable ----------=
    }

    function updataPushInfo() {
        alert("test");
    }

    // 검색
    function getPushInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();
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