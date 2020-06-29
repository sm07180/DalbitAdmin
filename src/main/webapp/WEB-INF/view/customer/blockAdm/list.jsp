<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                            <div>
                                <span id="blockTypeArea"></span>
                                <span id="searchArea"></span>
                                <label><input type="text" class="form-control" id="searchText" name="searchText"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <%--<div class="row col-lg-12">--%>
                <%--<button type="button" class="btn btn-primary pull-right mb15" id="device_block" ><i class="fa fa-search"></i>디바이스 ID 차단</button>--%>
                <%--<button type="button" class="btn btn-primary pull-right mb15 mr15" id="ip_block"><i class="fa fa-search"></i>IP 차단</button>--%>
            <%--</div>--%>

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table no-margin">
                    <div class="widget-content">
                        <table id="blockAdmList" class="table table-sorting table-hover table-bordered">
                            <thead></thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- //DATA TABLE -->

            <div class="row col-lg-12" id="blockDetail"></div>

        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<script src="/js/dataTablesSource/customer/blockAdmDataTableSource.js?${dummyData}"></script>
<script src="/js/code/customer/blockAdmCodeList.js?${dummyData}"></script>

<script type="text/javascript">

    $(function() {
        $('#blockTypeArea').html(util.getCommonCodeSelect(-1, block_blockType));
        $('#searchArea').html(util.getCommonCodeSelect(-1, block_searchType));

        getBlockList();

    });

    $('#bt_search').on('click', function() {
        getBlockList();
    });

    $('input[id="searchText"]').keydown(function() {
        if (event.keyCode === 13) {
            getBlockList();
        }
    });

    var dtList_info;
    function getBlockList() {
        var dtList_info_data = function (data) {
            data.blockType = $('#blockType').val();     // 차단 유형 구분
            data.searchType = $('#searchType').val();   // 검색 유형 구분
            data.searchText = $('#searchText').val();   // 검색어 구분
        };

        dtList_info = new DalbitDataTable($('#blockAdmList'), dtList_info_data, blockAdmDataTableSource.blockAdmList, $('#searchForm'));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        // dtList_info.setPageLength(10);
        dtList_info.createDataTable();

        ui.checkBoxInit('blockAdmList');

        dtList_info.reload();
    }

    $(document).on('click', '#blockAdmList .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')){
            $(this).parent().parent().find('._blockDetail').click();
        } else {
            $("#blockDetail").empty();
        }
    });

    $(document).on('click', '._blockDetail', function() {
       var data = {
           report_idx : $(this).data('reportidx')
       };
       util.getAjaxData('detail', '/rest/customer/blockAdm/detail', data, fn_detail_success);
    });

    function fn_detail_success(dst_id, response){
        var template = $('#tmp_blockDetail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);


        $('#blockDetail').html(html);
    }

    var report = "/member/member/popup/reportPopup?";
    $('#device_block').on('click', function() {
        reportPopup();
    });

    $('#ip_block').on('click', function() {
        reportPopup();
    });

    function reportPopup() {
        console.log(report);
        util.windowOpen(report,"750","885","차단");
    }

</script>

<script type="text/x-handlebars-template" id="tmp_blockDetail">
    <table class="table table-bordered table-dalbit mt15">
        <colgroup>
            <col width="5%" />
            <col width="15%" />
        </colgroup>
        <tbody>
        <tr>
            <th>기타 신고 메시지</th>
            <td id="opMsg" name="opMsg">{{{replaceHtml op_msg}}}</td>
        </tr>
        </tbody>
    </table>
</script>