<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">리브랜딩 이벤트</h4>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#rebrandMain" role="tab" data-toggle="tab">달라졌어요이벤트</a></li>
                    <li><a href="#rebrandComment" role="tab" data-toggle="tab" onclick="initCommentEvent()">댓글이벤트</a>
                    </li>
                    <li><a href="#rebrandShare" role="tab" data-toggle="tab">공유이벤트</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="rebrandMain">
                        <jsp:include page="rebrandMain.jsp"/>
                    </div>
                    <div class="tab-pane fade" id="rebrandComment">
                        <jsp:include page="rebrandComment.jsp"/>
                    </div>
                    <div class="tab-pane fade" id="rebrandShare">
                        <jsp:include page="rebrandShare.jsp"/>
                    </div>
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script>
  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'comment-paginate-top':
      case 'comment-paginate-bottom':
        commentPagingInfo.pageNo = pagingInfo.pageNo;
        commentEventData.callList();
        break;
    }
  }
</script>