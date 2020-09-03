<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object in_memNo = request.getParameter("memNo");
    Object in_memNick = request.getParameter("memNick");
%>

<div class="pt10">
    <div class="tab-content">
        <div class="col-md-12 no-padding">
            <span id="memNick" class="font-bold" style="color: #1f3b73;font-size: 16px;"></span>
        </div>
        <div class="row col-md-12">
            <table class="table table-bordered table-dalbit">
                <colgroup>
                    <col width="20%"><col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>메시지 제목</th>
                    <td colspan="11" style="width:50%;">
                        <input type="text" class="form-control" name="subject" id="noticeSend-subject" placeholder="제목을 입력해주세요." maxlength="30">
                    </td>
                </tr>
                <tr>
                    <th>메시지 내용</th>
                    <td colspan="11">
                        <div>
                            <textarea class="form-control" name="msg_body" id="noticeSend-msg_body" rows="8" cols="30" placeholder="방송 시스템에 적용되는 내용을 작성해 주세요" style="resize: none" maxlength="1000" ></textarea>
                            <span style="color: red; font-size:0.9em">* 메시지 내용은 10자~150자(한글) 입력 가능합니다.</span><br>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="col-md-12" style="text-align: center">
                <button class="btn btn-default" type="button" id="closeBtn" onclick="javascript:window.close();">창닫기</button>
                <button class="btn btn-primary" type="button" id="insertBtn" onclick="sendMsg();">보내기</button>
            </div>
        </div>
    </div>
</div>

<script>
    var memNo = "<%=in_memNo%>";
    var memNick = "<%=in_memNick%>";

    $(document).ready(function(){
        init();
    });

    function init(){
        console.log(memNick);
        $("#memNick").text("* " + memNick);
    }

    function sendMsg(){
        if(confirm(memNick + "에게 알림을 보내시겠습니까?")){
            var obj = {};
            obj.image_type = "101";
            obj.is_all = "7";
            obj.is_direct = "0";
            obj.mem_nos = memNo;
            obj.platform =  "111";
            obj.push_idx = "";
            obj.send_cnt = 1;
            obj.send_cont = $("textarea[name=msg_body]").val();
            obj.send_title = $("input[name=subject]").val();
            obj.send_type = "01";
            obj.slct_push = "2";
            obj.send_datetime = moment().format("YYYYMMDDHHmm");
            obj.status = 0;
            obj.target_mem_no = "10000000000001";
            obj.timeHour =  moment().format("HH");
            obj.timeMinute = moment().format("mm");
            obj.msg_type = 0;

            util.getAjaxData("insert", "/rest/content/push/insert", obj, fn_notice_add_success);
        }else{ return false ;}
    }

    function fn_notice_add_success(dst_id,response){
        if(response.code == "0"){
            alert("메시지 발송 성공");
            javascript:window.close();
        }else{
            alert("메시지 발송 실패 [" +response.code + "]");
        }
    }


</script>


