<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#all" role="tab" data-toggle="tab" id="tab_all">클립 관리(전체)</a></li>
                    <li><a href="#all" role="tab" data-toggle="tab" id="tab_today">클립 관리(오늘)</a></li>
                    <li><a href="#member" role="tab" data-toggle="tab" id="tab_member">클립 관리(회원별)</a></li>
                    <li><a href="#listen" role="tab" data-toggle="tab" id="tab_listen">클립 청취</a></li>
                    <li><a href="#gift" role="tab" data-toggle="tab" id="tab_gift">클립 선물</a></li>
                    <li><a href="#remove" role="tab" data-toggle="tab" id="tab_remove">클립 삭제</a></li>

                    <li class="pull-right" ><a id="headerInfo" style="border:1px solid #cccccc; background-color: #ffe699; height: 30px; margin-bottom: 2px; display: none;"></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="all"><jsp:include page="history.jsp"/></div>      <!-- 클립 관리(전체/오늘) -->
                    <%--<div class="tab-pane fade" id="today"><jsp:include page="history.jsp"/></div>      <!-- 클립 관리 -->--%>
                    <div class="tab-pane fade" id="member"><jsp:include page=""/></div>      <!-- 클립 관리(회원별) -->
                    <div class="tab-pane fade" id="listen"><jsp:include page="listen.jsp"/></div>    <!-- 클립 청취 -->
                    <div class="tab-pane fade" id="gift"><jsp:include page=""/></div>    <!-- 클립 선물 -->
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
            $("input:radio[name='isChoiceDate']:radio[value='0']").prop('checked', true);  // 날짜 전체, 선택 여부
            $("#isChoiceDateArea").hide();
            // $("#div_searchArea").css('display', 'inline');
            $("#div_searchArea").show();
            $("#div_stepButtonArea").show();
            initClipHistory();
        }else if(tabId == 'tab_member'){    // 클립 관리 (회원)
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
            getNotice();
        }else if(tabId == 'tab_listen'){
            getHistoryListen();
        }else if(tabId == 'tab_gift'){
            getNotice();
        }else if(tabId == 'tab_remove'){
            getHistoryRemove();
        }
    });

    //숨기기 기능 이베트
    function updateClipHide(clipNo, hide) {
        if(confirm("클립 숨기기를 하는 경우 어드민에서 확인되지만 리스트에서는 본인외 타인에게 확인되지 않습니다. \n\n해당 클립을 숨기기 하시겠습니까?")){
            var data = {
                "castNo" : clipNo
                , "hide" : hide
            }
            util.getAjaxData("isHide", "/rest/clip/history/updateHide", data , fn_ClipUpdateHide_success, fn_fail)
        }
    }

    function fn_ClipUpdateHide_success(dst_id, response){
        alert(response.message);
        $("#bt_search").click();
    }
    function fn_fail(dst_id, response){
        alert(data.message);
        console.log(data, textStatus, jqXHR);
    };

    //클립 삭제 기능 이베트
    function deleteClip(clipNo) {
        if(confirm("해당 클립을 삭제 하시겠습니까?")){
            var data = {
                "castNo" : clipNo
            }
            util.getAjaxData("isHide", "/rest/clip/history/deleteClip", data , fn_ClipDelete_success, fn_fail)
        }
    }

    function fn_ClipDelete_success(dst_id, response){
        alert(response.message);
        $("#bt_search").click();
    }



    // 댓글 목록 리스트
    $(document).on('click', '._selectReply', function() {
        if($(this).data('reply') == 0) {
            alert('해당 클립에는 등록된 댓글이 없습니다.');
        } else if($(this).data('reply') > 0) {
            var data = {
                'castNo' : $(this).data('cast_no')
            };
            util.getAjaxData("selectReply", "/rest/clip/history/reply/list", data, fn_success_selectReply);
        }
    });

    function fn_success_selectReply(dst_id, response) {
        $('#div_reply').empty();
        for(var i=0 ; i<response.data.length; i++){
            var tmp = '<div class="col-md-12 no-padding" style="margin-bottom: 10px;">';
            tmp +=    '<div class="col-md-2">';
            tmp +=      '<form id="profileImg' + i + '" method="post" enctype="multipart/form-data">';
            tmp +=          '<img class="pull-right" id="image_section' + i + '" src="" alt="your image" style="width: 40px;height: 40px"/>';
            tmp +=      '</form>';
            tmp +=     '</div>';
            tmp +=     '<div class="col-md-10">';
            if(response.data[i].status == "2"){
                tmp +=      '<i class="fa fa-lock" style="padding-left: 3px;padding-right: 3px"></i>';
            }
            tmp +=      '<label id="nickName' + i + '"></label>';
            tmp +=      '<label id="userId' + i + '" style="color: #6e696e"></label> - <label id="writeDateFormat' + i + '"></label> <br/>';
            tmp +=      '<lable id="contents' + i + '"></label><br>';
            tmp +=     '</div>';
            tmp +=     '</div>';


            console.log(tmp)
            $('#div_reply').append(tmp);

            $('#nickName' + i).text(response.data[i].memNick);
            $('#userId' + i).text(response.data[i].memNo);
            $('#writeDateFormat' + i).text(response.data[i].writeDate);
            $('#contents' + i).text(response.data[i].contents);
            $('#image_section' + i).prop("src" ,common.profileImage(PHOTO_SERVER_URL,response.data[i].profileImage,memSex));

            $('#clipReplyModal').modal("show");
        }

    }

</script>