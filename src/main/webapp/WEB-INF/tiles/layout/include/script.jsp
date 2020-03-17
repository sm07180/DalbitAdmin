<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<script src="https://www.google-analytics.com/analytics.js"></script>
<script src="/template2/assets/js/jquery/jquery-2.1.0.min.js"></script>
<script src="/template2/assets/js/bootstrap/bootstrap.js"></script>
<script src="/template2/assets/js/plugins/modernizr/modernizr.js"></script>
<script src="/template2/assets/js/plugins/bootstrap-tour/bootstrap-tour.custom.js"></script>
<script src="/template2/assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/template2/assets/js/king-common.js"></script>
<script src="/template2/assets/js/deliswitch.js"></script>
<script src="/template2/assets/js/plugins/stat/jquery.easypiechart.min.js"></script>
<script src="/template2/assets/js/plugins/raphael/raphael-2.1.0.min.js"></script>
<script src="/template2/assets/js/plugins/stat/flot/jquery.flot.min.js"></script>
<script src="/template2/assets/js/plugins/stat/flot/jquery.flot.resize.min.js"></script>
<script src="/template2/assets/js/plugins/stat/flot/jquery.flot.time.min.js"></script>
<script src="/template2/assets/js/plugins/stat/flot/jquery.flot.pie.min.js"></script>
<script src="/template2/assets/js/plugins/stat/flot/jquery.flot.tooltip.min.js"></script>
<script src="/template2/assets/js/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="/template2/assets/js/plugins/datatable/jquery.dataTables.js"></script>
<script src="/template2/assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
<script src="/template2/assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
<script src="/template2/assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
<script src="/template2/assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
<script src="/template2/assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="/template2/assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
<script src="/template2/assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
<script src="/template2/assets/js/plugins/jquery-mapael/jquery.mapael.js"></script>
<script src="/template2/assets/js/plugins/raphael/maps/usa_states.js"></script>
<script src="/template2/assets/js/king-chart-stat.js"></script>
<script src="/template2/assets/js/king-table.js"></script>
<script src="/template2/assets/js/king-components.js"></script>
<script src="/template2/assets/js/plugins/moment/moment.js"></script>
<script src="/template2/assets/js/plugins/moment/moment-locale-ko.js"></script>
<script src="/template2/assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="/template2/assets/js/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/template2/assets/js/jquery-ui/jquery-ui-1.10.4.custom.js"></script>
<script src="/template2/assets/js/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script>
<%--<script src="/template2/assets/js/king-form-layouts.js"></script>--%>

<!-- Editor -->
<script src="/template2/assets/js/plugins/summernote/summernote.min.js"></script>
<script src="/template2/assets/js/plugins/summernote/lang/summernote-ko-KR.js"></script>

<script src="/template2/assets/js/plugins/markdown/markdown.js"></script>
<script src="/template2/assets/js/plugins/markdown/to-markdown.js"></script>
<script src="/template2/assets/js/plugins/markdown/bootstrap-markdown.js"></script>
<%--<script src="/template2/assets/js/king-elements.js"></script>--%>

<!-- plugin -->
<script src="/js/lib/bootstrap-datepicker.kr.js"></script>
<script src="/js/lib/bootstrap-datetimepicker.js"></script>

<!-- dataTable -->
<script src="/js/lib/dataTable/buttons.html5-1.5.2.min.js"></script>
<script src="/js/lib/dataTable/dataTables.buttons-v1.5.2.min.js"></script>

<!-- dalbit -->
<script src="/js/lib/jquery.fileDownload-v1.4.5.js"></script>
<script src="/js/lib/handlebars-v4.7.2.min.js"></script>
<%--<script src="/js/lib/moment-v2.24.0.js"></script>--%>
<script src="/js/common.js"></script>
<script src="/js/commonUtil.js"></script>
<script src="/js/helper.js"></script>

<script src="/js/globalEvent.js"></script>
<script src="/js/uiControl.js"></script>

<!-- DataTable Util -->
<script src="/js/dataTablesSource/memberDataTableSource.js"></script>
<script src="/js/dataTablesSource/broadcastDataTableSource.js"></script>
<script src="/js/dataTablesSource/sampleDataTableSource.js"></script>
<script src="/js/dataTablesSource/customer/customerDataTableSource.js"></script>
<script src="/js/dataTablesSource/dataTableSource.js"></script>
<script src="/js/dataTablesSource/menuDataTableSource.js"></script>
<script src="/js/dataTablesSource/content/pushDataTableSource.js"></script>
<script src="/js/dataTablesSource/content/bannerDataTableSource.js"></script>
<script src="/js/dataTablesSource/content/eventDataTableSource.js"></script>
<script src="/js/dataTablesSource/content/noticeDataTableSource.js"></script>
<script src="/js/dataTablesSource/utilDataTableSource.js"></script>
<script src="/js/dataTablesSource/administrate/faqDataTableSource.js"></script>
<script src="/js/dalbitDataTableUtil.js"></script>
<script src="/js/code/commonCode.js"></script>

<script type="text/javascript">
    /*로그 찍기*/
    function dalbitLog(data){
        if(${fn:contains("/local/dev/", cfn:getActiveProfile())}){
            console.log(data);
        }
    }

    var IMAGE_SERVER_URL = '${cfn:getProperty("server.photo.url")}';
</script>