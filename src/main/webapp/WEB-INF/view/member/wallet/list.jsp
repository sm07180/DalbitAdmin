<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul class="nav nav-tabs nav-tabs-custom-colored mt5">
    <li class="active" id="li_dal"><a href="#wallet_main_table" role="tab" data-toggle="tab" onclick="memberWalletList('dal');">달</a></li>
    <li  id="li_byeol"><a href="#wallet_main_table" role="tab" data-toggle="tab" onclick="memberWalletList('byeol');">별</a></li>

</ul>
<div class="tab-content no-padding">
    <div class="widget widget-table" id="wallet_main_table">
        <div class="widget-content">
            <label id="walletTitle"></label>
            <span id="table_wallet_summaryArea"></span>
            <table id="wallet_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail">
                </thead>
                <tbody id="tableBody_detail">
                </tbody>
            </table>
            <button class="btn btn-default btn-sm print-btn pull-right mb10" type="button" id="walletExcelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    function memberWalletInit(tmp){
        $("#li_dal").addClass("active");
        $("#li_byeol").removeClass("active");
        memberWalletList('dal');
    }
    var walletList_gubun="dal";
    var walletType = 0;
    var slct_type = 0;
    function memberWalletList(tmp){
        walletType = 0;
        slct_type = 0;
        walletList_gubun = tmp;
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            data.walletType = walletType;
            data.slct_type = slct_type;
        };
        var tmp_summary;
        dtList_info_detail.destroy();
        if(walletList_gubun == "dal" ){
            dtList_info_detail = new DalbitDataTable($("#wallet_info_detail"), dtList_info_detail_data, MemberDataTableSource.walletDalDetail);
            tmp_summary = dal_summary_table;
        }else if(walletList_gubun == "byeol"){
            dtList_info_detail = new DalbitDataTable($("#wallet_info_detail"), dtList_info_detail_data, MemberDataTableSource.walletByeolDetail);
            tmp_summary = byeol_summary_table;
        }
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable(tmp_summary);

        initDataTableTop_select_wallet();
    }

    function byeol_summary_table(json){
        dalbitLog(json);
        var template = $("#byeol_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
        };
        var html = templateScript(data);
        $("#table_wallet_summaryArea").html(html);
    }

    function dal_summary_table(json){
        dalbitLog(json);
        var template = $("#dal_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
        };
        var html = templateScript(data);
        $("#table_wallet_summaryArea").html(html);
    }

    function initDataTableTop_select_wallet(){
        var topTable = "";
        var code;

        if(walletList_gubun == "dal" ){
            topTable = '<span name="search_wallet_top" id="search_wallet_top" onchange="wallet_sel_change()"></span>';
            topTable = topTable + '<span name="search_wallet_dalbyeol_top" id="search_wallet_dalbyeol_top" onchange="wallet_sel_change()"></span>';
            code = mem_wallet_dal_code;
        }else if(walletList_gubun == "byeol"){
            topTable = '<span name="search_wallet_top" id="search_wallet_top" onchange="wallet_sel_change()"></span>';
            topTable = topTable + '<span name="search_wallet_dalbyeol_top" id="search_wallet_dalbyeol_top" onchange="wallet_sel_change()"></span>';
            code = mem_wallet_byeol_code;
        }
        $("#wallet_main_table").find(".top-left").addClass("no-padding").append(topTable);

        $("#search_wallet_top").html(util.getCommonCodeSelect(0, mem_wallet_code));
        $("#search_wallet_dalbyeol_top").html(util.getCommonCodeSelect(0, code));
    }

    function wallet_sel_change(){
        walletType = $("#search_wallet_top").find("#walletType option:selected").val();
        slct_type = $("#search_wallet_dalbyeol_top").find("#slct_type option:selected").val();

        console.log(walletType);
        console.log(slct_type);

        if(walletList_gubun == "dal" ){
            dtList_info_detail.reload(dal_summary_table);
        }else if(walletList_gubun == "byeol"){
            dtList_info_detail.reload(byeol_summary_table);
        }
    }


    /*=============엑셀==================*/
    $('#walletExcelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("mem_no", memNo);
        formData.append("walletType", walletType);
        formData.append("slct_type", slct_type);

        if(walletList_gubun == "dal" ){
            util.excelDownload($(this), "/rest/member/wallet/dal/excel", formData, fn_success_excel, fn_fail_excel)
        }else if(walletList_gubun == "byeol"){
            util.excelDownload($(this), "/rest/member/wallet/byeol/excel", formData, fn_success_excel, fn_fail_excel)
        }
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*==================================*/

</script>


<script id="dal_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <tr>
            <th colspan="7">달</th>
        </tr>
        <tr>
            <th>충전</th>
            <th>받은 선물</th>
            <th>이벤트/리워드 지급</th>
            <th>보낸 선물</th>
            <th>달 교환</th>
            <th>가입 보상</th>
            <th>보유 달</th>
        </tr>
        <td style="padding:8px; color:blue;">{{addComma content.sum_charge_cnt}} 달</td>
        <td style="padding:8px; color:blue;">{{addComma content.sum_input_cnt}} 달</td>
        <td style="padding:8px; color:blue;">{{addComma content.sum_event_cnt}} 달</td>
        <td style="padding:8px; color:red;">{{addComma content.sum_output_cnt}} 달</td>
        <td style="padding:8px; color:blue;">{{addComma content.sum_change_cnt}} 달</td>
        <td style="padding:8px; color:blue;">{{addComma content.start_cnt}} 달</td>
        <td style="padding:8px;">{{addComma content.sum_own_cnt}} 달</td>
    </table>
</script>

<script id="byeol_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <tr>
            <th colspan="6">별</th>
        </tr>
        <tr>
            <th>받은 선물</th>
            <th>이벤트/리워드 지급</th>
            <th>환전</th>
            <th>달 교환</th>
            <th>가입 보상</th>
            <th>보유 별</th>
        </tr>
        <td style="padding:8px; color:blue;">{{addComma content.sum_input_cnt}} 별</td>
        <td style="padding:8px; color:blue;">{{addComma content.sum_event_cnt}} 별</td>
        <td style="padding:8px; color:red;">{{addComma content.sum_exchange_cnt}} 별</td>
        <td style="padding:8px; color:blue;">{{addComma content.sum_change_cnt}} 별</td>
        <td style="padding:8px; color:blue;">{{addComma content.start_cnt}} 별</td>
        <td style="padding:8px;">{{addComma content.sum_own_cnt}} 별</td>
    </table>
</script>
