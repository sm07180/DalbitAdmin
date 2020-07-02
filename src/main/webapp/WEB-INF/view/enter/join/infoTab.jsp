<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#total" role="tab" data-toggle="tab" id="tab_total">총계</a></li>
                    <li><a href="#gender" role="tab" data-toggle="tab" id="tab_gender">성별</a></li>
                    <li><a href="#platGender" role="tab" data-toggle="tab" id="tab_platformGender">플랫폼(성별)</a></li>
                    <li><a href="#platAge" role="tab" data-toggle="tab" id="tab_platformAge">플랫폼(연령별)</a></li>
                    <li><a href="#memberQuit" role="tab" data-toggle="tab" id="tab_withdraw">회원 탈퇴</a></li>
                    <li><a href="/member/join/list" id="tab_joMemberAllDetail" title="회원검색으로 이동합니다.">가입/탈퇴회원 리스트</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>       <!-- 총계 -->
                    <div class="tab-pane fade" id="gender"><jsp:include page="gender.jsp"/></div>               <!-- 성별 -->
                    <div class="tab-pane fade" id="platGender"><jsp:include page="platform_gender.jsp"/></div>  <!-- 플랫폼(성별) -->
                    <div class="tab-pane fade" id="platAge"><jsp:include page="platform_age.jsp"/></div>        <!-- 플랫폼(연령별) -->
                    <div class="tab-pane fade" id="memberQuit"><jsp:include page="member_withdraw.jsp"/></div>      <!-- 회원 탈퇴 -->
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
       }else if(tabId == 'tab_gender'){
           getGenderList();
       }else if(tabId == 'tab_platformGender'){
           getPlatformGenderList();
       }else if(tabId == 'tab_platformAge'){
           getPlatformAgeList();
       }else if(tabId == 'tab_withdraw'){
           getWithdrawList();
       }

        $(".searchDate").html($("#onedayDate").val());
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val()+ " (" + toDay + ")");
        }

        $("#tablist_con li.active a").click();
    });
</script>