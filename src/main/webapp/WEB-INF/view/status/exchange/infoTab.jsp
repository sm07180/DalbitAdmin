<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#total" role="tab" data-toggle="tab" id="tab_total">총계</a></li>
                    <li><a href="/money/exchange/list" id="tab_exchangeList" title="환전내역으로 이동합니다.">환전내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>      <!-- 총계 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $("#tablist_con li a").on('click', function(){
        var tabId = $(this).prop('id');
        if(tabId == 'tab_total'){
            getTotalList();
        }else if(tabId == 'tab_genderDetail'){
            getGenderList();
        }else if(tabId == 'tab_ageDetail'){
            getAgeList();
        }else if(tabId == 'tab_broadcastDetail'){
            getBroadList();
        }else if(tabId == 'tab_castDetail'){
        }else if(tabId == 'tab_storeEtcDetail') {
        }else if(tabId == 'tab_itemDetail') {
        }else if(tabId == 'tab_buyHistoryDetail') {
        }

        $(".searchDate").html($("#onedayDate").val());
    });

    $("#bt_search").on('click', function(){

        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val());
        }

        $("#tablist_con li.active a").click();
    });
</script>