<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <title>Text Editor | KingAdmin - Admin Dashboard</title>
    </div>

    <div class="main-content">
        <!-- DATE PICKER -->
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-edit"></i> Date Picker</h3>
            </div>
            <div class="widget-content clearfix">
                <p>Date Picker</p>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    <input type="text" id="datepicker" class="form-control">
                </div>
                <br/>
                <p>Date Range Picker - <small>time picker can be disabled</small></p>
                <div class="input-group">
                    <input type="text" id="daterange-default" class="form-control">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
                <br/>
                <p>Report Range - <small>useful for report filter</small></p>
                <div id="reportrange" class="pull-right report-range">
                    <i class="fa fa-calendar"></i>
                    <span class="range-value"></span><b class="caret"></b>
                </div>

                <br/>
                <p>DateTime</p>
                <div class='input-group date' id='datetimepicker1'>
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    <input type='text' class="form-control" />
                    <%--<span class="input-group-addon">--%>
                            <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                    <%--</span>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- /main-content -->
</div>

<script>
    $(document).ready(function () {

        //Date Picker
        $('#datepicker').datetimepicker({
            format: 'L'
        })

        //Date Range Picker - time picker can be disabled
        $('#daterange-default').daterangepicker({
            timePicker: true,
            timePickerIncrement: 10,
            // format: 'MM/DD/YYYY h:mm A'
        });

        //Report Range - useful for report filter
        $('#reportrange').daterangepicker({
                startDate: moment().subtract('days', 29),
                endDate: moment(),
                dateLimit: { days: 60 },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: false,
                ranges: {
                    '1일': [moment(), moment()],
                    // '어제': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    '7일': [moment().subtract('days', 6), moment()],
                    '30일': [moment().subtract('days', 29), moment()],
                    '이번달': [moment().startOf('month'), moment().endOf('month')],
                    '지난달': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'L',
                separator: ' to ',
                locale: {
                    customRangeLabel: '직접선택',
                }
            },

            function(start, end) {
                console.log("Callback has been called!");
                $('#reportrange span').html(start.format('YYYY.MM.DD') + ' - ' + end.format('YYYY.MM.DD'));
            }
        );

        // DateTime
        $('#datetimepicker1').datetimepicker();
    })

</script>