<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#total" role="tab" data-toggle="tab" id="tab_payTotal">총계</a></li>
                <li><a href="#member" role="tab" data-toggle="tab" id="tab_payAge">결제 회원별</a></li>
                <li><a href="#way" role="tab" data-toggle="tab" id="tab_payWay">결제 수단별</a></li>
                <li><a href="#product" role="tab" data-toggle="tab" id="tab_payCode">결제 상품별</a></li>
                <li><a href="#history" role="tab" data-toggle="tab" id="tab_payHistory">결제 내역</a></li>
                <li><a href="#cancel" role="tab" data-toggle="tab" id="tab_payCancel">결제 취소</a></li>
                <li><a href="#try" role="tab" data-toggle="tab" id="tab_payTry">결제 성공/시도</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>              <!-- 총계 -->
                <div class="tab-pane fade" id="member"><jsp:include page="age.jsp"/></div>            <!-- 결제 회원별 -->
                <div class="tab-pane fade" id="way"><jsp:include page="way.jsp"/></div>                  <!-- 결제 수단별 -->
                <div class="tab-pane fade" id="product"><jsp:include page="code.jsp"/></div>          <!-- 결제 상품별 -->
                <div class="tab-pane fade" id="history"><jsp:include page="history.jsp"/></div>          <!-- 결제 내역 -->
                <div class="tab-pane fade" id="cancel"><jsp:include page="cancel.jsp"/></div>            <!-- 결제 취소 -->
                <div class="tab-pane fade" id="try"><jsp:include page="try.jsp"/></div>            <!-- 결제 취소 -->
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $("#tablist_con li a").on('click', function(){
        var tabId = $(this).prop('id');
        if(tabId == 'tab_payTotal'){
            getPayTotalList();
        }else if(tabId == 'tab_payAge'){
            getPayAgeList();
        }else if(tabId == 'tab_payWay'){
            getPayWayList();
        }else if(tabId == 'tab_payCode'){
            getPayCodeList();
        }else if(tabId == 'tab_payHistory'){
            getPayHistoryList();
        }else if(tabId == 'tab_payCancel'){
            getPayCancelList();
        }else if(tabId == 'tab_payTry'){
            getPayTryList();
        }
        $(".searchDate").html($("#onedayDate").val());
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        }

        getStatPayInfo();
        $("#tablist_con li.active a").click();
    });
</script>