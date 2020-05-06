<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 시스템장애 > 장애내역 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <div class="pull-right" style="margin-top: 8px;margin-bottom: 8px;">
            <button type="button" id="insertBtn" class="btn btn-default">등록</button>
        </div>
        <table id="tableList" class="table table-bordered">
            <thead id="tableTop_detail">
            </thead>
            <tbody id="tableBody_detail">
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>
</div>

<script type="text/javascript">

    $(function() {
       getErrorList();
    });

    // 나중에 데이터테이블 사용하실 것 같아서 임의로 넣어두겠습니다..!
    function getErrorList() {
        var dtList_data = function(data) {

        };
        dtList_info_detail = new DalbitDataTable($("#tableList"), dtList_data, connectDataTableSource.current);
        dtList_info_detail.useCheckBox(true);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
    }

</script>

<%--<script id="tmp_tableList" type="text/x-handlebars-template">--%>
    <div id="wrapper">
        <div id="page-wrapper">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <button type="button" class="btn btn-default print-btn pull-right" id="insertSucBtn">등록완료</button>
            </ul>

            <table class="table table-bordered table-dalbit">
                <colgroup>
                    <col width="5%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="5%" />
                </colgroup>
                <tbody>
                <tr>
                    <th>No</th>
                    <td></td>

                    <th>장애유형</th>
                    <td></td>

                    <th>장애일시</th>
                    <td></td>
                </tr>
                <tr>
                    <th colspan="2">장애 페이지 URL</th>
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <th colspan="2">플랫폼</th>
                    <td colspan="2"></td>

                    <th>조치여부</th>
                    <td></td>
                </tr>
                <tr>
                    <th colspan="2">조치일시</th>
                    <td colspan="2"></td>

                    <th>처리자</th>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div> <!-- page-wrapper end -->
    </div> <!-- wrapper end -->
<%--</script>--%>