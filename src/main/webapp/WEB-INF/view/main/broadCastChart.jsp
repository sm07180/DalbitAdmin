<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--방송건수 차트-->
<div class="widget row">
    <!-- end chart tab nav -->
    <div class="col-md-6 no-padding">
        <div id='broadcastGenderChart'></div>
    </div>
    <div class="col-md-6 no-padding">
        <div id='broadcastAgeChart'></div>
    </div>
    <!-- end chart placeholder-->
    <hr class="separator">
</div>

<script type="text/javascript">

    function fn_broadcastDj_success(dst_id, response, param){
        var detailData = response.data.totalInfo;
        var chartData = getLoginTotalChart(detailData, param);

        var json = {
            values: chartData.sumGender,
            labels: ['남', '여', '알수없음'],
            type: 'pie'
        }
        var data = [json];
        var layout = { title: '', };
        Plotly.newPlot('broadcastGenderChart', data, layout);

        var json = {
            values: chartData.sumAge,
            labels: ['10대', '20대', '30대', '40대', '50대', '60대'],
            type: 'pie'
        }
        var data = [json];
        var layout = { title: '', };
        Plotly.newPlot('broadcastAgeChart', data, layout);
    }

    function getLoginTotalChart(detailData, param) {
        //x축
        var sumGender = [detailData.sum_maleCnt, detailData.sum_femaleCnt, detailData.sum_noneCnt];
        var sumAge = [detailData.sum_dj10Cnt, detailData.sum_dj20Cnt, detailData.sum_dj30Cnt, detailData.sum_dj40Cnt, detailData.sum_dj50Cnt, detailData.sum_dj60Cnt];
        var resultData = { sumGender : sumGender,sumAge : sumAge };
        return resultData;
    }

</script>