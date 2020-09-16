<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#clipInfo" role="tab" data-toggle="tab" id="tab_clipInfo">상세정보</a></li>
                    <li><a href="#listen" role="tab" data-toggle="tab" id="tab_listen">청취자 내역</a></li>
                    <li><a href="#good" role="tab" data-toggle="tab" id="tab_good">좋아요 내역</a></li>
                    <li><a href="#gift" role="tab" data-toggle="tab" id="tab_gift">선물 내역</a></li>
                    <li><a href="#reply" role="tab" data-toggle="tab" id="tab_reply">댓글 내역</a></li>
                </ul>

                <!-- < 검색조건 event는  -->
                <div class="container-fluid col-lg-12 no-padding" id="divSearchArea" style="display: none;">
                    <form id="searchForm">
                        <div class="col-lg-12 form-inline no-padding">
                            <div class="widget widget-table searchBoxArea mt5 mb5">
                                <div class="widget-header searchBoxRow">
                                    <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                                    <div>
                                        <span id="isChoiceDateArea"></span>
                                        <span id="slctTypeArea" style="display: none;"></span>
                                        <div class="input-group date" id="oneDayDatePicker">
                                            <label for="onedayDate" class="input-group-addon">
                                                <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                            </label>
                                            <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                        </div>

                                        <div class="input-group date" id="monthDatepicker" style="display:none;">
                                            <label for="monthDate" class="input-group-addon">
                                                <span><i class="fa fa-calendar"></i></span>
                                            </label>
                                            <input id="monthDate" type="text" class="form-control"/>
                                        </div>

                                        <div class="input-group date" id="yearDatepicker" style="display:none;">
                                            <label for="yearDate" class="input-group-addon">
                                                <span><i class="fa fa-calendar"></i></span>
                                            </label>
                                            <input id="yearDate" type="text" class="form-control"/>
                                        </div>

                                        <div class="input-group date" id="rangeDatepicker" style="display:none;">
                                            <label for="rangeDate" class="input-group-addon">
                                                <span><i class="fa fa-calendar"></i></span>
                                            </label>
                                            <input id="rangeDate" type="text" class="form-control"/>
                                        </div>

                                        <input type="hidden" name="startDate" id="startDate">
                                        <input type="hidden" name="endDate" id="endDate" />

                                        <%--<input name="startDate" id="startDate">--%>
                                        <%--<input name="endDate" id="endDate" />--%>

                                        <div class="control-inline pt5 mr0" id="div_searchArea" style="display: none;">
                                            <span id="search_platform_aria" style="display: none"></span>
                                            <span id="search_aria"></span>
                                            <label><input type="text" class="form-control" id="txt_search" name="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                        </div>

                                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                        <div class="input-group" id="div_stepButtonArea">
                                            <a href="javascript://" class="_prevSearch">[이전]</a>
                                            <a href="javascript://" class="_todaySearch">[오늘]</a>
                                            <a href="javascript://" class="_nextSearch">[다음]</a>
                                        </div>

                                        <label class="control-inline fancy-checkbox custom-color-green pl5 pt5">
                                            <input type="checkbox" name="search_testId" id="search_testId" value="1">
                                            <span>테스트 아이디 제외</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 검색조건 > -->


                <div class="tab-content">
                    <div class="tab-pane fade in active" id="clipInfo"><jsp:include page="clipInfo.jsp"/></div>      <!-- 상세정보 -->
                    <div class="tab-pane fade" id="listen"><jsp:include page="listen.jsp"/></div>      <!-- 청취자 내역 -->
                    <div class="tab-pane fade" id="good"><jsp:include page="good.jsp"/></div>      <!-- 좋아요 내역 -->
                    <div class="tab-pane fade" id="gift"><jsp:include page="gift.jsp"/></div>    <!-- 선물 내역 -->
                    <div class="tab-pane fade" id="reply"><jsp:include page="reply.jsp"/></div>    <!-- 댓글 내역 -->
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

        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType_clipDetail));
        $("#txt_search").val("");
        $("p[name=headerInfo]").html("");
        $("p[name=headerInfo]").hide();
        $("#divSearchArea").show();

        if(tabId == 'tab_clipInfo'){         //클립 상세
            $("input:radio[name='slctType']:radio[value='-1']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#divSearchArea").hide();
            $("#isChoiceDateArea").hide();
            $("#div_searchArea").show();
            $(".date").hide();
            $("#div_stepButtonArea").hide();
        }else if(tabId == 'tab_listen'){    // 클립 청취
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_listen_searchType_clipDetail));
            $("input:radio[name='slctType']:radio[value='3']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").show();
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
        }else if(tabId == 'tab_good'){      // 클립 좋아요 내역
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_listen_searchType_clipDetail));
            $("input:radio[name='slctType']:radio[value='3']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").show();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
        }else if(tabId == 'tab_gift'){      // 클립 선물내역
            $("#search_aria").html(util.getCommonCodeSelect(-1, clip_gift_searchType_clipDetail));
            $("input:radio[name='slctType']:radio[value='3']").prop('checked', true);  // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").show();
            $("#slctTypeArea").hide();
            $("#div_searchArea").hide();
        }else if(tabId == 'tab_reply'){     // 클립 댓글내역
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
        if(tabId == 'tab_clipInfo'){
            getClipDetailInfo();
        }else if(tabId == 'tab_listen'){
            getClipDetailListen();
        }else if(tabId == 'tab_good'){
            getClipDetailGood();
        }else if(tabId == 'tab_gift'){
            getClipDetailGift();
        }else if(tabId == 'tab_reply'){
            getClipDetailReply();
        }
    });

</script>