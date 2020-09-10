<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<form id="eventAnnounceForm"></form>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script type="text/javascript">

    function initWinnerAnnounce() {
        getWinnerAnnouncement();
    }

    function getWinnerAnnouncement() {
        var data = {
            eventIdx : $('#eventidx').val()
        };
        util.getAjaxData("eventWinnerAnnouncement", "/rest/content/event/management/announcement/info", data, function fn_eventAnnouncementInfo_success(dst_id, response) {
            var template = $('#tmp_eventAnnounceForm').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);


            $('#eventAnnounceForm').html(html);
            util.editorInit("content-event");
        });
    }

    $(document).on('click', '#bt_announcementRegister', function() {
        if(confirm('당첨자 발표 리스트를 등록하시겠습니까?')) {
            var data = {
                eventIdx: $('#eventidx').val()
                , winnerContents: $("#announcement_editor").summernote('code')
            };
            util.getAjaxData("eventWinnerAnnouncementEdit", "/rest/content/event/management/announcement/edit", data, function fn_eventAnnouncementEdit_success(dst_id, response) {
                alert(response.message);
                $('#tab_eventWinnerAnnounce').click();
                initWinnerAnnounce();
            });
        }
    });

    function mobileBtnClick(){
        if($("#mobileBtn").text() == "모바일 형태보기"){
            $("#mobileBtn").text("PC형태보기");
            $('#div_editor').css({ width: 360});
        }else{
            $("#mobileBtn").text("모바일 형태보기");
            $('#div_editor').css({ width: ''});
        }
    }

    $(document).on('click', '#bt_deleteEditor', function(){
        if(confirm('내용을 삭제하시겠습니까?')) {
            $('.note-editable').empty();
        }
    });

</script>

<script id="tmp_eventAnnounceForm" type="text/x-handlebars-template">
    <div class="row col-lg-12 form-inline" style="width: 1050px">
        <div class="widget" id="div_editor" style="border-color: black">
            <div class="widget-header" style="border-color: black">
                <h3><i class="fa fa-user"></i> 내용 </h3>
            </div>
            <div class="widget-content no-padding">
                <div class="_editor" id="announcement_editor" name="announcement_editor">
                    {{{replaceHtml winnerContents.winnerContents}}}
                    {{#equal winnerContents.winnerContents ''}}
                        {{#each ../this.defaultList as |data|}}
                        <div class="form-inline mt15">
                            < {{data.prizeRank}}등 ({{data.prizeCnt}}명) : {{data.prizeName}} >
                        </div>
                        {{/each}}
                    {{/equal}}
                </div>
            </div>
        </div>
    </div>
    <div class="row col-md-12" style="width: 1050px">
        <span class="pull-left">
            <button class="btn btn-danger" type="button" id="bt_deleteEditor">내용삭제</button>
            <%--<button class="btn btn-default" type="button" id="bt_announcementList">불러오기</button>--%>
        </span>
        <span class="pull-right">
            <button class="btn btn-default" type="button" id="mobileBtn" onclick="mobileBtnClick();">모바일 형태보기</button>
            <button class="btn btn-default" type="button" id="bt_announcementRegister">등록하기</button>
            <%--<button class="btn btn-default" type="button" id="bt_announcementUpdate">수정하기</button>--%>
        </span>
    </div>
</script>