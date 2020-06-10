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
        messageTab = "broadcast";
        var roomNo =  <%=in_roomNo%>;
        var djMemNo =  <%=in_djMemNo%>;

        $("#tab_messageDetail").click();

        fnc_messageDetail.room_no = roomNo;
        fnc_messageDetail.dj_mem_no = djMemNo;
        fnc_messageDetail.popup = true;
    }

    var choiceDataInfo = null;
    function initSelectDataInfo() {
        choiceDataInfo = {};
    }

    function setSelectDataInfo(key, data){
        if(common.isEmpty(choiceDataInfo)){
            initSelectDataInfo();
        }
        choiceDataInfo[key] = data;
    }

    function getSelectDataInfo() {
        if(common.isEmpty(choiceDataInfo) || jQuery.isEmptyObject(choiceDataInfo)){
            return null;
        }

        return choiceDataInfo;
    }
</script>