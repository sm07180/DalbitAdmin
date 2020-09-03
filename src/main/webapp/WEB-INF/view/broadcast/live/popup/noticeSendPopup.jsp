<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object in_memNo = request.getParameter("memNo");
%>

<div class="pt10">
    <div class="tab-content">
        <div class="row col-md-12">
            <table class="table table-bordered table-dalbit">
                <colgroup>
                    <col width="20%"><col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>제목</th>
                    <td colspan="11" style="width:50%;">
                        <input type="text" class="form-control" name="subject" id="noticeSend-subject" placeholder="LMS 발송 제목을 입력해주세요." maxlength="30">
                        <span style="color: red; font-size:0.9em">* LMS 제목은 한글 최대 30자까지 입력 가능합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="11">
                        <div>
                            <textarea class="form-control" name="msg_body" id="noticeSend-msg_body" rows="8" cols="30" placeholder="SMS/LMS 발송 문자 내용을 입력해 주세요." style="resize: none" maxlength="1000" ></textarea>
                            <span style="color: red; font-size:0.9em">* SMS 최대 40자(한글) / LMS 최대 1000자(한글)까지 입력 가능합니다.</span><br>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="col-md-6 pull-left pl0">
                <button class="btn btn-default" type="button" id="closeBtn" onclick="javascript:window.close();">닫기</button>
            </div>
            <div class="col-md-6 pull-right pr0">
                <button class="btn btn-primary" type="button" id="insertBtn">발송</button>
            </div>
        </div>
    </div>
</div>

<script>
    var memNo = "<%=in_memNo%>";

    $(document).ready(function(){
    });

    function init(){
    }

</script>


