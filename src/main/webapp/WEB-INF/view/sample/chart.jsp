<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>차트 샘플</h2>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="main-content">
                <div class="widget">
                    <div class="widget-header">
                        <h3><i class="fa fa-truck"></i> 파이차트</h3> <em>- Visits based on source of traffic</em>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
                            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            <a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <div id='pieArea'></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="main-content">
                <div class="widget">
                    <div class="widget-header">
                        <h3><i class="fa fa-truck"></i> 라인차트</h3> <em>- Visits based on source of traffic</em>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
                            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            <a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <div id='lineArea'></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
<script type="text/javascript">

    /* 파이차트 [start] */
    var json = {
        values: [57.7, 42.3],
        labels: ['안드로이드', '아이폰'],
        type: 'pie'
    }

    var data = [json];

    var layout = {
        title: '앱다운로드 현황',
        height: 400,
        width: 500
    };

    Plotly.newPlot('pieArea', data, layout);
    /* 파이차트 [end] */


    /* 라인차트 [start] */
    var trace1 = {
        x: [1, 2, 3, 4, 5],
        y: [1, 3, 2, 3, 1],
        mode: 'lines',
        name: 'PC웹',
        line: {
            dash: 'solid',
            width: 4
        }
    };

    var trace2 = {
        x: [1, 2, 3, 4, 5],
        y: [6, 8, 7, 8, 6],
        mode: 'lines',
        name: '모바일웹',
        line: {
            dash: 'dashdot',
            width: 4
        }
    };

    var trace3 = {
        x: [1, 2, 3, 4, 5],
        y: [11, 13, 12, 13, 11],
        mode: 'lines',
        name: '안드로이드',
        line: {
            dash: 'solid',
            width: 4
        }
    };

    var trace4 = {
        x: [1, 2, 3, 4, 5],
        y: [16, 18, 17, 18, 16],
        mode: 'lines',
        name: '아이폰',
        line: {
            dash: 'dot',
            width: 4
        }
    };

    var data = [trace1, trace2, trace3, trace4];

    var layout = {
        title: '방문자수(2020년 2월 12일)',
        height: 400,
        width: 500,
        xaxis: {
            range: [0.75, 5.25],
            autorange: false
        },
        yaxis: {
            range: [0, 18.5],
            autorange: false
        },
        legend: {
            y: 0.5,
            traceorder: 'reversed',
            font: {
                size: 16
            }
        }
    };

    Plotly.newPlot('lineArea', data, layout);
    /* 라인차트 [end] */
</script>
