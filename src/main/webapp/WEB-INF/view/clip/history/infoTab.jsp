<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#all" role="tab" data-toggle="tab" id="tab_all">전체 클립</a></li>
                    <li><a href="#all" role="tab" data-toggle="tab" id="tab_today">일자별 클립</a></li>
                    <li><a href="#member" role="tab" data-toggle="tab" id="tab_member">회원별 클립</a></li>
                    <li><a href="#listen" role="tab" data-toggle="tab" id="tab_listen">클립 청취내역</a></li>
                    <li><a href="#gift" role="tab" data-toggle="tab" id="tab_gift">클립 선물내역</a></li>
                    <li><a href="#remove" role="tab" data-toggle="tab" id="tab_remove">클립 삭제내역</a></li>

                    <li class="pull-right" ><a id="headerInfo" style="border:1px solid #cccccc; background-color: #ffe699; height: 30px; margin-bottom: 2px; display: table;"></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="all"><jsp:include page="history.jsp"/></div>      <!-- 클립 관리(전체/오늘) -->
                    <%--<div class="tab-pane fade" id="today"><jsp:include page="history.jsp"/></div>      <!-- 클립 관리 -->--%>
                    <div class="tab-pane fade" id="member"><jsp:include page="member.jsp"/></div>      <!-- 클립 관리(회원별) -->
                    <div class="tab-pane fade" id="listen"><jsp:include page="listen.jsp"/></div>    <!-- 클립 청취 -->
                    <div class="tab-pane fade" id="gift"><jsp:include page="gift.jsp"/></div>    <!-- 클립 선물 -->
                    <div class="tab-pane fade" id="remove"><jsp:include page="remove.jsp"/></div>    <!-- 클립 삭제 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
    <!-- 팬보드 댓글 보기 -->
    <div class="modal fade" id="clipReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content">
                <div class="modal-header no-padding">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body" style="display: table">
                    <div class="col-md-12 no-padding" id="div_reply">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    var tabId = 'tab_all';

    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');

        if(tabId == 'headerInfo'){
            return;
        }

        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType));
        $("#txt_search").val("");
        $("#headerInfo").html("");
        $("#headerInfo").hide();

        if(tabId == 'tab_all'){         //클립 관리 (전체)
            $("input:radio[name='slctType']:radio[value='-1']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            $("#div_searchArea").show();
            $(".date").hide();
            $("#div_stepButtonArea").hide();

            initClipHistory();
        }else if(tabId == 'tab_today'){     //클립 관리 (오늘)
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true); // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
            initClipHistory();
        }else if(tabId == 'tab_member'){    // 클립 관리 (회원)
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_member_searchType))
            $("input:radio[name='slctType']:radio[value='-1']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            $("#div_searchArea").hide();
        }else if(tabId == 'tab_listen'){    // 클립 청취
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_listen_searchType));
            $("input:radio[name='slctType']:radio[value='3']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").show();
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
        }else if(tabId == 'tab_gift'){
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_gift_searchType));
            $("input:radio[name='slctType']:radio[value='1']").prop('checked', true);
            $("#slctTypeArea").hide();
            $("#div_searchArea").hide();
        }else if(tabId == 'tab_remove'){
            $("input:radio[name='slctType']:radio[value='3']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").show();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
        }
        radioChange();
        $(".searchDate").html($("#onedayDate").val());
        $("#bt_search").click();
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        }
        if(tabId == 'tab_all'){
            getHistory();
        }else if(tabId == 'tab_today'){
            getHistory();
        }else if(tabId == 'tab_member'){
            getHistoryMember();
        }else if(tabId == 'tab_listen'){
            getHistoryListen();
        }else if(tabId == 'tab_gift'){
            getHistoryGift();
        }else if(tabId == 'tab_remove'){
            getHistoryRemove();
        }
    });

</script>