<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#eventDetail" role="tab" data-toggle="tab" id="tab_eventDetail">이벤트 정보</a></li>
                    <li><a href="#eventPrize" role="tab" data-toggle="tab" class="disabled" id="tab_eventPrize">경품 관리</a></li>
                    <li><a href="#eventWinnerApplicant" role="tab" data-toggle="tab" class="disabled" id="tab_eventWinnerApplicant">응모자 / 당첨자 관리</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="eventDetail"><jsp:include page="eventDetail.jsp"/></div>
                    <div class="tab-pane fade" id="eventPrize"><jsp:include page="eventPrize.jsp"/></div>
                    <div class="tab-pane fade" id="eventWinnerApplicant"><jsp:include page="eventWinnerApplicant.jsp"/></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
    });

    $('#tablist_con li a').on('change', function() {
       var tab = $(this).prop('id').split("_")[1];
       if(tab == 'eventDetail') {
           initDetail();
       } else if(tab == 'eventPrize') {
           initPrize();
       } else if(tab == 'eventWinnerApplicant') {
           initWinnerApplicant();
       }
    });

    function showTab(data){
        if(data == 0) {
            initDetail_insert();
            $('#tab_eventPrize').hide();
            $('#tab_eventWinnerApplicant').hide();
        } else if (data != 0) {
            initDetail(data);
            $('#tab_eventPrize').show();
            $('#tab_eventWinnerApplicant').show();
            tabClick(data);
        }
        $(".main-content").show();
    }

    // tab 숨기기
    function hideTab() {
        $('#div_eventTabList').each(function() {
            $(this).find('#contentTab').find('.active').removeClass("active");
            $(this).find('.tab-content').find('.active').removeClass("in").removeClass("active");
        });
        $('.main-content').hide();
    }

    function tabClick(idx) {
        $('#tablist_con li a').on('click', function() {
            var tab = $(this).prop('id').split("_")[1];
            if(tab == 'eventPrize') {
                initPrize(idx);
            } else if(tab == 'eventWinnerApplicant') {
                initWinnerApplicant(idx);
            }
        });
    }

</script>