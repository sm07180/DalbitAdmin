<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_noticeIdx = request.getParameter("noticeIdx");
    String in_rowNum = request.getParameter("rowNum");
%>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#" role="tab" data-toggle="tab">공지 상세내용</a></li>
            </ul>
            <form id="noticeForm"></form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script>
    $(document).ready(function() {
        getNoticeDetail();
    });
    var noticeIdx = <%=in_noticeIdx%>;
    var rowNum = <%=in_rowNum%>;

    function getNoticeDetail(){
        var obj = {};
        obj.noticeIdx = Number(noticeIdx);
        obj.rowNum = Number(rowNum);
        util.getAjaxData("detail", "/rest/content/notice/detail", obj, fn_detail_success);
    }

    function fn_detail_success(dst_id, response, params) {
        response.data["rowNum"] = rowNum;
        var template = $('#tmp_noticeFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#noticeForm").html(html);

    }

    $(document).on('click', '#updateBtn', function(){
        location.href = "/content/notice/noticeEdit?noticeIdx="+ noticeIdx + "&rowNum=" + rowNum;
    });

    $(document).on('click', '#listBack', function(){
        location.href = "/content/notice/list";
    });

    function mobileBtnClick(tmp){
        if($("#mobileBtn").text() == "모바일형태"){
            $("#mobileBtn").text("PC형태");
            $('#div_editor').css({ width: 360});
        }else{
            $("#mobileBtn").text("모바일형태");
            $('#div_editor').css({ width: ''});
        }
    }

</script>

<script id="tmp_noticeFrm" type="text/x-handlebars-template">
    <input type="hidden" name="noticeIdx" value="{{noticeIdx}}" />
    <div class="row col-lg-12 mt15" style="width: 1050px">
        <div class="col-md-12 no-padding">
            <label id="notice_title">ㆍ공지내용 수정 시 [수정하기]버튼을 통하여 에디터 수정이 가능합니다.<br>
                                     ㆍ게시상태는 ON으로 선택한 경우만 서비스 페이지에서 확인이 가능합니다.</label>
            <span class="pull-right">
                <button class="btn btn-default" type="button" id="mobileBtn" onclick="mobileBtnClick();">모바일형태</button>
                {{#noticeIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/noticeIdx}}
                <button class="btn btn-default" type="button" id="listBack">목록보기</button>
            </span>
        </div>
        <table class="table table-bordered table-dalbit mb0" style="border-color: black">
            <colgroup>
                <col width="4%" />
                <col width="4%" />
                <col width="6%" />
                <col width="4%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
            </colgroup>
            <tbody>
                <tr class="align-middle">
                    <th style="border-color: black">No</th>
                    <td style="border-color: black">{{rowNum}}</td>

                    <th style="border-color: black">공지번호</th>
                    <td style="border-color: black">{{noticeIdx}}</td>

                    <th style="border-color: black">구분</th>
                    <td style="border-color: black">{{{getCommonCodeLabel slctType 'notice_slctType' 'Y' ''}}}</td>

                    <th style="border-color: black">제목</th>
                    <td colspan="5" style="border-color: black">{{{title}}}</td>

                    <th style="border-color: black">조회수</th>
                    <td style="border-color: black">{{addComma viewCnt}}</td>
                </tr>
                <tr>
                    <th colspan="2" style="border-color: black">플랫폼</th>
                    <td colspan="2" style="border-color: black">{{{getCommonCodeLabel platform 'platform'}}}</td>

                    <th style="border-color: black">성별</th>
                    <td style="border-color: black">{{{getCommonCodeLabel gender 'gender'}}}</td>

                    <th style="border-color: black">등록일시</th>
                    <td style="border-color: black">{{writeDate}}</td>

                    <th style="border-color: black">게시중지일시</th>
                    <td style="border-color: black">
                        {{offDate}}
                        {{#equal offDate ''}}-{{/equal}}
                    </td>

                    <th style="border-color: black">처리자</th>
                    <td style="border-color: black">{{opName}}</td>
                    <th style="border-color: black">게시상태</th>
                    <td style="border-color: black">
                        {{{getCommonCodeLabel viewOn 'viewOn'}}}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="row col-lg-12 form-inline" style="width: 1050px">
        <div class="widget" id="div_editor" style="border-color: black">
            <div class="widget-header" style="border-color: black">
                <h3><i class="fa fa-user"></i> 내용 </h3>
            </div>
            <div class="widget-content no-padding">
                <div class="_editor" id="editor" name="editor">{{{replaceHtml contents}}}</div>
            </div>
        </div>
    </div>

</script>