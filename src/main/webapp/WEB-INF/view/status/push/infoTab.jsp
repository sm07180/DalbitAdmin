<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#total" role="tab" data-toggle="tab" id="tab_total">Push발송현황</a></li>
                    <%--<li><a href="#pushHistory" role="tab" data-toggle="tab" id="tab_pushHistory">Push발송내역</a></li>--%>
                    <li><a href="#notice" role="tab" data-toggle="tab" id="tab_notice">알림설정현황</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>      <!-- Push발송현황 -->
                    <%--<div class="tab-pane fade" id="pushHistory"><jsp:include page="pushHistory.jsp"/></div>    <!-- Push발송내역 -->--%>
                    <div class="tab-pane fade" id="notice"><jsp:include page="notice.jsp"/></div>    <!-- 알림설정현황 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    var tabId = 'tab_total';
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        if(tabId == 'tab_total'){
            $("#slctTypeArea").show();
        }else if(tabId == 'tab_pushHistory'){
        }else if(tabId == 'tab_notice'){
            $("input:radio[name='slctType']:radio[value='1']").prop('checked', true);
            $("#slctTypeArea").hide();
        }
        radioChange();
        $(".searchDate").html($("#onedayDate").val());
        $("#bt_search").click();
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        }
        if(tabId == 'tab_total'){
            getTotal();
        }else if(tabId == 'tab_pushHistory'){
        }else if(tabId == 'tab_notice'){
            getNotice();
        }
    });
</script>