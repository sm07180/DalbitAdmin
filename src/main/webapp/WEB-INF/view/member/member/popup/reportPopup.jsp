<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_memNo = request.getParameter("memNo");
    String in_memNick = request.getParameter("memNick");
    String in_memSex = request.getParameter("memSex");
%>

<div class="col-md-12 no-padding" id="report_detail">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">경고/정지</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="col-lg-12 no-padding">
                <label id="report_title"></label>
            </div>

            <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
                <colgroup>
                    <col width="15%"/><col width="22%"/><col width="15%"/><col width="22%"/><col width="15%"/><col width="21%"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th colspan="6">대상자</th>
                    <tr>
                        <th>아이디</th>
                        <td style="text-align: left" id="td_memNo"></td>
                        <th>닉네임</th>
                        <td style="text-align: left" id="td_memNick"></td>
                        <th>성별</th>
                        <td style="text-align: left" id="td_memSex"></td>
                    </tr>
                    <tr>
                        <th>조치사유</th>
                        <td colspan="5" style="text-align: left"><span id="declaration_reason"></span></td>
                    </tr>
                    <tr>
                        <th>조치내역</th>
                        <td colspan="5" style="text-align: left"><span id="declaration_slctType"></span></td>
                    </tr>
                    <tr>
                        <th>운영자 메모</th>
                        <td colspan="5" style="text-align: left;height: 142px;">
                            <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 100%;height: 100%"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>등록/처리일시</th>
                        <td colspan="5" style="text-align: left" id="td_date"></td>
                    </tr>
                    <tr>
                        <th>운영자명</th>
                        <td colspan="5" style="text-align: left" id="td_adminName"></td>
                    </tr>
                </tbody>
            </table>

            <div class="col-md-12 no-padding" style="text-align: center">
                <button type="button" id="bt_complet" class="btn btn-default btn-sm">처리완료</button>
                <button type="button" id="bt_close" class="btn btn-default btn-sm" onclick="window.close();" >취소</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>

<script>
    $(document).ready(function() {
        $('#report_title').html("ㆍ운영자에 의해 경고 또는 정지/강제탈퇴 등의 처리가 가능합니다.<br/>ㆍ해당 유저를 제외한 경고/정지/탈퇴 처리 시 사유를 메모에 남겨주세요.");
    });
    var memNo =  <%=in_memNo%>;
    var memNick =  <%=in_memNick%>;
    var memSex =  <%=in_memSex%>;

    $("#declaration_reason").html(util.getCommonCodeSelect(-1, declaration_reason,"Y"));
    $("#declaration_slctType").html(util.getCommonCodeRadio(1, declaration_slctType,"Y"));

    init();
    function init() {
        $('#td_memNo').html(memNo);
        $('#td_memNick').html(memNick);
        if(memSex == "m"){
            $('#td_memSex').html("남");
        }else{
            $('#td_memSex').html("여");
        }
    }
</script>