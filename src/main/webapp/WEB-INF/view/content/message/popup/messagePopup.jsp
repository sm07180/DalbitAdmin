<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_roomNo = request.getParameter("roomNo");
    String in_djMemNo = request.getParameter("djmemno");
%>

<div class="col-md-12 no-padding">
    <div class="widget-content">
        <div class="tab-pane fade in active" id="memberDetail"><jsp:include page="/WEB-INF/view/content/message/messageTab.jsp"/></div>     <!-- 상세 -->
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    init();
    function init() {
        var roomNo =  <%=in_roomNo%>;
        var djMemNo =  <%=in_djMemNo%>;

        fnc_messageDetail.room_no = roomNo;
        fnc_messageDetail.dj_mem_no = djMemNo;
        fnc_messageDetail.popup = true;

        $("#tab_messageDetail").click();
    }

    var choiceDataInfo = null;
    function initSelectDataInfo() {
        choiceDataInfo = {};
    }

    function setSelectDataInfo(key, data){
        opener.setSelectDataInfo(key, data);
    }

    function getSelectDataInfo() {
        if(common.isEmpty(opener.getSelectDataInfo)){
            if(common.isEmpty(fnc_messageDetail.room_no) || common.isEmpty(fnc_messageDetail.dj_mem_no)){
                alert("방송방 번호 or DJ 회원번호가 존재하지 않습니다.");
                window.close();
            }else{
                fnc_messageDetail.isTarget = true;
                return null;
            }
        }else{
            fnc_messageDetail.isTarget = false;
            if(common.isEmpty(opener.getSelectDataInfo()) || jQuery.isEmptyObject(opener.getSelectDataInfo())){
                return null;
            }

            return opener.getSelectDataInfo();
        }
    }
</script>