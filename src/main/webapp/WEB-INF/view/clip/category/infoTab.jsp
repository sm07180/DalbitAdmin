<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 form-inline no-padding" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <div class="row col-lg-12" id="tabContainer">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                        <li class="active"><a href="#clipList" role="tab" data-toggle="tab" id="tab_hot">인기 클립</a></li>
                        <li><a href="#clipList" role="tab" data-toggle="tab" id="tab_new">최신 클립</a></li>
                        <li><a href="#category" role="tab" data-toggle="tab" id="tab_category">주제 관리</a></li>
                    </ul>
                </div>
                <div class="tab-content col-lg-12">
                    <div class="tab-pane fade in active" id="clipList"><jsp:include page="clipList.jsp"/></div>      <!-- 인기 클립 -->
                    <div class="tab-pane fade" id="category"><jsp:include page="clipCategoryList.jsp"/></div>      <!-- 주제 관리 -->
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

        $("#page-wrapper").show();
        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType));
        $("#search_aria").hide();
        $("#txt_search").val("");
        $("#headerInfo").html("");
        $("#headerInfo").hide();


        if(tabId == 'tab_hot'){         //인기 클립
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true); // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $(".date").hide();
            $("#div_stepButtonArea").hide();

        }else if(tabId == 'tab_new'){     //최신 클립
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true); // 날짜 선택 구분 (전체(-1), 시간별(0), 일별(1), 월별(2), 기간(3))
            $("input:radio[name='isChoiceDate']:radio[value='-1']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $(".date").hide();
            $("#div_stepButtonArea").hide();

        }else if(tabId == 'tab_category'){    // 카테고리
            $("#page-wrapper").hide();
        }
        radioChange();
        $(".searchDate").html($("#onedayDate").val());
        $("#bt_search").click();
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        }
        if(tabId == 'tab_hot'){
            initClipHotList();
            getClipList();
        }else if(tabId == 'tab_new'){
            initClipNewList();
            getClipList();
        }else if(tabId == 'tab_category'){
            getClipCategory();
        }
    });

</script>