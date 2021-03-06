<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline mb10">
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                </div>
                <div class="widget-content">
                    <div class="col-md-12 no-padding mt5 mb5">
                        <span class="mb5 mt5">방송 중 운영자 공지/알림/이벤트 안내 메시지등을 발송 할 수 있습니다.</span>
                    </div>
                    <span id="search_platform_aria" onchange="selChange();"></span>
                    <span id="search_sendType_aria" onchange="selChange();"></span>
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
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        fnc_pushList.init();
    });

var fnc_pushList = {};

//=------------------------------ Init / Event--------------------------------------------
    fnc_pushList.targetId= "pushList";

    fnc_pushList.init = function() {
        fnc_pushList.target = $("#" + fnc_pushList.targetId);
        fnc_pushList.targetDataTableId = "list_info_" + fnc_pushList.targetId;
        fnc_pushList.target.find("#list_info").attr("id", fnc_pushList.targetDataTableId);
        fnc_pushList.targetDataTable = fnc_pushList.target.find("#" + fnc_pushList.targetDataTableId);
        this.divDataTable = fnc_pushList.targetDataTable.parent("div");

        this.initDataTable();
        this.initEvent();
    };


    fnc_pushList.dtList_info="";
    fnc_pushList.initDataTable= function() {
        //=---------- Main DataTable ----------
        var dtList_info_data = function (data) {
            data.platform = $("#platform").val();
            data.send_type = $("#send_type").val();
            data.searchText = $("#searchText").val();
        };

        this.dtList_info = new DalbitDataTable(fnc_pushList.targetDataTable, dtList_info_data, PushDataTableSource.pushList, $("#searchForm"));
        this.dtList_info.useCheckBox(true);
        this.dtList_info.useIndex(true);
        this.dtList_info.createDataTable();
        //---------- Main DataTable ----------=

        this.initDataTableButton();
    };


    // DataTable Button
    fnc_pushList.initDataTableButton= function() {
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
        // var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'

        this.divDataTable.find(".footer-left").append(delBtn);
        this.divDataTable.find(".top-right").append(addBtn);
        // this.divDataTable.find(".footer-right").append(excelBtn);
    };



    fnc_pushList.initEvent= function(){
        fnc_pushList.target.find("#btn_insert").on("click", function () { //등록
            fnc_pushList.insertEvent();
        })

        fnc_pushList.target.find("#btn_delete").on("click", function () { //삭제
            fnc_pushList.deleteEvent();
        })

        // Detail 선택 이벤트
        fnc_pushList.target.on('click', '._getNoticeDetail', function(){
            var code = $(this).data('idx');
            var data = fnc_pushList.dtList_info.getDataRow(code);

            fnc_pushList.updateData(data);
        });

        // CheckBox 이벤트
        fnc_pushList.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
            if($(this).prop('checked')){
                $(this).parent().parent().find('._getNoticeDetail').click();
            }
        });
    };


//=------------------------------ Option --------------------------------------------

    // 등록
    fnc_pushList.insertEvent= function() {
        //등록을 위한 데이터 초기화
        initSelectDataInfo();

        $("#tab_pushDetail").click();
        ui.unCheck(fnc_pushList.targetDataTableId);
    };

    // 삭제
    fnc_pushList.deleteEvent= function() {
        var sw = false;
        var alertSw = false;
        var checkDatas = fnc_pushList.dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        dalbitLog(checkDatas);
        if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){
            var push_idxs = "";
            for(var idx=0; idx < checkDatas.length; idx++){
                var dataInfo = checkDatas[idx];
                if(dataInfo.reservationCnt > 0){
                    if(!alertSw){
                        if(confirm("예약발송 건이 있습니다 삭제하시겠습니까?")){
                            sw = true;
                            alertSw = true;
                        }else{
                            return false;
                        }
                    }else{
                        sw = true;
                    }
                }else{
                    sw = true;
                }
                if(sw){
                    if(common.isEmpty(dataInfo.push_idx)){
                        dalbitLog("[delete] Item code does not exist. : ");
                        dalbitLog(dataInfo);
                        continue;
                    }

                    if(dataInfo.status != "0"){
                        alert("삭제 불가능한 상태가 존재합니다.\n해당 상태를 제외하고 삭제를 진행합니다.\n\n * 삭제 가능 상태 : 발송대기");
                        continue;
                    }

                    push_idxs += "," + dataInfo.push_idx;
                    sw = false;
                }
            }
            push_idxs = push_idxs.substring(1);

            var data = new Object();
            data.push_idx = push_idxs;

            util.getAjaxData(fnc_pushList.targetId, "/rest/content/push/delete",data, fnc_pushList.fn_delete_success, fnc_pushList.fn_fail);
        };
    };

    // 수정
    fnc_pushList.updateData= function(data) {
        // 정보전달을 위한 값 셋팅
        setSelectDataInfo("data", data);

        var selectTabId = "pushDetail";
        if(fnc_pushList.target.find("#contentTab").find(".active").length != 0){
            selectTabId = $("#contentTab").find(".active").find("a").prop("id").split("_")[1];
        }
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        // targetFnc.updateDetail();
        $("#tab_" + selectTabId).click();
    };

    // 삭제 성공 시
    fnc_pushList.fn_delete_success= function(dst_id, data, dst_params){
        alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

        // reload
        fnc_pushList.selectMainList();

        //상단 이동
        $('html').animate({scrollTop : 0}, 100);
        $("#"+fnc_pushDetail.formId).empty();
    };


    // Ajax 실패
    fnc_pushList.fn_fail= function(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    };


    // 검색
    fnc_pushList.selectMainList= function(isResetPaging){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        this.dtList_info.reload(null, isResetPaging);

    };

    function selChange(){

        console.log();
        $("#searchForm");

        fnc_pushList.selectMainList();
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