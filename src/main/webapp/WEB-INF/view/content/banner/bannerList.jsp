
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
        fnc_bannerList.init();
    });

var fnc_bannerList = {

//=------------------------------ Init / Event--------------------------------------------
    "targetId": "bannerList",

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
    "dtList_statistics_info":"",
    initDataTable() {
        //=---------- Main DataTable ----------
        var dtList_info_data = function (data) {
        };

        this.dtList_info = new DalbitDataTable(this.targetDataTable, dtList_info_data, BannerDataTableSource.list, $("#searchForm"));
        this.dtList_info.useCheckBox(true);
        this.dtList_info.useIndex(true);
        this.dtList_info.createDataTable(this.initSummary);

        //---------- Main DataTable ----------=

        fnc_bannerList.initDataTableButton();
    },


    initSummary(json) {
        //------------- 우측 상단 통계 -----------------------------------
        var template = $('#tmp_bannerListStatisticsFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = json.summary;
        var html=templateScript(context);

        fnc_bannerList.divDataTable = fnc_bannerList.targetDataTable.parent("div");
        fnc_bannerList.target.find("#div_summary").remove();
        fnc_bannerList.divDataTable.find(".top-right").prepend(html);
    },


    // DataTable Button
    initDataTableButton() {
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
        var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'

        this.divDataTable.find(".footer-left").append(delBtn);
        this.divDataTable.find(".footer-right").append(addBtn);
        this.divDataTable.find(".footer-right").append(excelBtn);
    },



    initEvent(){
        this.target.find("#btn_insert").on("click", function () { //등록
            fnc_bannerList.insertEvent();
        })

        this.target.find("#btn_delete").on("click", function () { //삭제
            fnc_bannerList.deleteEvent();
        })

        // Detail 선택 이벤트
        this.target.on('click', '._getNoticeDetail', function(){
            var code = $(this).data('idx');
            var data = fnc_bannerList.dtList_info.getDataRow(code);

            fnc_bannerList.updateData(data);
        });

        // CheckBox 이벤트
        this.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
            if($(this).prop('checked')){
                $(this).parent().parent().find('._getNoticeDetail').click();
            }
        });
    },


//=------------------------------ Option --------------------------------------------

    // 등록
    insertEvent() {
        //등록을 위한 데이터 초기화
        initSelectDataInfo();

        $("#tab_bannerDetail").click();
        ui.unCheck(this.targetDataTableId);
    },

    // 삭제
    deleteEvent() {
        var checkDatas = fnc_bannerList.dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        dalbitLog(checkDatas);
        if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){

            var itemCodes = "";
            for(var idx=0; idx < checkDatas.length; idx++){
                var dataInfo = checkDatas[idx];
                if(common.isEmpty(dataInfo.banner_idx)){
                    dalbitLog("[delete] Item code does not exist. : ");
                    dalbitLog(dataInfo);
                    continue;
                }

                itemCodes += "," + dataInfo.banner_idx;
            }
            itemCodes = itemCodes.substring(1);

            var data = new Object();
            data.banner_idx = itemCodes;

            util.getAjaxData(fnc_bannerList.targetId, "/rest/content/banner/delete",data, fnc_bannerList.fn_delete_success, fnc_bannerList.fn_fail);
        };
    },

    // 수정
    updateData(data) {
        // 정보전달을 위한 값 셋팅
        setSelectDataInfo("data", data);

        var selectTabId = "bannerDetail";
        if(fnc_bannerList.target.find("#contentTab").find(".active").length != 0){
            selectTabId = $("#contentTab").find(".active").find("a").prop("id").split("_")[1];
        }
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        // targetFnc.updateDetail();
        $("#tab_" + selectTabId).click();
    },

    // 삭제 성공 시
    fn_delete_success(dst_id, data, dst_params){
        alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

        // reload
        fnc_bannerList.selectMainList();

        //상단 이동
        $('html').animate({scrollTop : 0}, 100);
        $("#"+fnc_bannerDetail.formId).empty();
    },


    // Ajax 실패
    fn_fail(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    },


    // 검색
    selectMainList(isResetPaging){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        // Summary를 위한 재생성
        this.dtList_info.reload(this.initSummary, isResetPaging);

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
<script id="tmp_bannerListStatisticsFrm" type="text/x-handlebars-template">

    <div id="div_summary" style="float:left">
        <table class="table table-sorting table-hover table-bordered dataTable no-footer" style="width:400px;">
            <colgroup>
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th colspan="3">ON 배너</th>
                <th colspan="3">ON 배너 클릭</th>
                <th colspan="3">남</th>
                <th colspan="3">여</th>
            </tr>
            <tr>
                <td style="text-align:center;" colspan="3">{{banner_col1}}건</td>
                <td style="text-align:center;" colspan="3">{{banner_col1}}건 ({{banner_col1}}%)</td>
                <td style="text-align:center;" colspan="3">{{banner_col1}}명</td>
                <td style="text-align:center;" colspan="3">{{banner_col1}}명</td>
            </tr>
            </tbody>
        </table>
    </div>
</script>