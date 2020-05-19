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

<script>
    $(document).ready(function() {
        fnc_messageList.init();
    });

var fnc_messageList = {

//=------------------------------ Init / Event--------------------------------------------
    "targetId": "messageList",

    init() {
        this.target = $("#" + this.targetId);
        this.targetDataTableId = "list_info_" + this.targetId;
        this.target.find("#list_info").attr("id", this.targetDataTableId);
        this.targetDataTable = this.target.find("#" + this.targetDataTableId);
        this.divDataTable = this.targetDataTable.parent("div");

        this.initDataTable();
        this.initEvent();
    },


    "dtList_info":"",
    initDataTable() {
        //=---------- Main DataTable ----------
        var dtList_info_data = function (data) {
        };

        this.dtList_info = new DalbitDataTable(this.targetDataTable, dtList_info_data, MessageDataTableSource.messageList, $("#searchForm"));
        this.dtList_info.useCheckBox(true);
        this.dtList_info.useIndex(true);
        this.dtList_info.createDataTable();
        //---------- Main DataTable ----------=

        this.initDataTableButton();
    },


    // DataTable Button
    initDataTableButton() {
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'

        this.divDataTable.find(".footer-left").append(delBtn);
        this.divDataTable.find(".top-right").append(addBtn);
    },



    initEvent(){
        this.target.find("#btn_insert").on("click", function () { //등록
            fnc_messageList.insertEvent();
        })

        this.target.find("#btn_delete").on("click", function () { //삭제
            fnc_messageList.deleteEvent();
        })

        // Detail 선택 이벤트
        this.target.on('click', '._getDetail', function(){
            var code = $(this).data('idx');
            var data = fnc_messageList.dtList_info.getDataRow(code);

            fnc_messageList.updateData(data);
        });

        // CheckBox 이벤트
        this.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
            if($(this).prop('checked')){
                $(this).parent().parent().find('._getDetail').click();
            }
        });
    },


//=------------------------------ Option --------------------------------------------

    // 등록
    insertEvent() {
        //등록을 위한 데이터 초기화
        initSelectDataInfo();

        $("#tab_messageDetail").click();
        ui.unCheck(this.targetDataTableId);
    },

    // 삭제
    deleteEvent() {
        var checkDatas = fnc_messageList.dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        dalbitLog(checkDatas);
        if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){

            var message_idxs = "";
            for(var idx=0; idx < checkDatas.length; idx++){
                var dataInfo = checkDatas[idx];
                if(common.isEmpty(dataInfo.message_idx)){
                    dalbitLog("[delete] Item code does not exist. : ");
                    dalbitLog(dataInfo);
                    continue;
                }

                if(dataInfo.status != "0"){
                    alert("삭제 불가능한 상태가 존재합니다.\n해당 상태를 제외하고 삭제를 진행합니다.\n\n * 삭제 가능 상태 : 발송대기");
                    continue;
                }

                message_idxs += "," + dataInfo.message_idx;
            }
            message_idxs = message_idxs.substring(1);

            var data = new Object();
            data.message_idx = message_idxs;

            util.getAjaxData(fnc_messageList.targetId, "/rest/content/message/delete",data, fnc_messageList.fn_delete_success, fnc_messageList.fn_fail);
        };
    },

    // 수정
    updateData(data) {
        // 정보전달을 위한 값 셋팅
        setSelectDataInfo("data", data);

        var selectTabId = "messageDetail";
        if(fnc_messageList.target.find("#contentTab").find(".active").length != 0){
            selectTabId = $("#contentTab").find(".active").find("a").prop("id").split("_")[1];
        }
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        // targetFnc.updateDetail();
        $("#tab_" + selectTabId).click();
    },

    // Ajax 실패
    fn_fail(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    },


    // 검색
    selectMainList(isResetPaging){
        this.dtList_info.reload(null, isResetPaging);
    },

}
</script>