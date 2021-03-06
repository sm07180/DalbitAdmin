<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="col-lg-12 form-inline no-padding">
            <div class="col-md-8 no-padding">
                <div class="widget widget-table searchBoxArea">
                    <table>
                        <tr>
                            <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                <i class="fa fa-search"></i><br/>검색
                            </th>
                            <th id="th_bottonList">
                                <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                <div>
                                    <div id="div_dayButton"><jsp:include page="../../searchArea/daySearchArea.jsp"/></div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <jsp:include page="../../searchArea/dateRangeSearchArea.jsp"/>

                                <input id="onedayDate" type="text" class="form-control" >

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>
                                <span id="searchMailArea" onchange="btSearchClick();"></span>
                                <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="col-md-4 no-padding">
                <span id="summaryArea"></span>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- tab -->
        <div class="col-lg-12 form-inline no-padding">
            <jsp:include page="tabList.jsp"/>
        </div>
        <!-- //tab -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $("#searchMailArea").html(util.getCommonCodeSelect(1, searchMail));

        slctType = 0;
        dateType();
    });

    function handlebarsPaging(targetId, pagingInfo) {
        if(targetId == "mailbox_paginate_top" || targetId == "mailbox_paginate"){
            mailboxPagingInfo = pagingInfo;
            mailboxList(pagingInfo.pageNo);
        }else if(targetId == "mailboxGift_paginate_top" || targetId == "mailboxGift_paginate"){
            mailboxPagingInfo = pagingInfo;
            mailboxGiftList(pagingInfo.pageNo);
        }else if(targetId == "mailboxImgList_info_paginate_top" || targetId == "mailboxImgList_info_paginate"){
            mailboxImgPagingInfo = pagingInfo;
            mailboxImgList(pagingInfo.pageNo);
        }
    }


    function btSearchClick(){
        $("#bt_search").click();
    }

    // thumbnail 명칭 겹쳐서 thumbnailImg 로 세팅
    var xOffset = 10;
    var yOffset = 30;
    var height = 0;
    $(document).on("mouseover",".thumbnailImg",function(e){ //마우스 오버
        if(common.isEmpty($(this).attr("src"))){
            return;
        }
        $("body").append("<p id='preview'><img id='previewImage' src='"+ $(this).attr("src") +"' width='300px' /></p>"); //이미지

        $("#previewImage").load(function () {
            height = $(this).height();
        });

        $("#preview")
            .css("top",(e.pageY - ((height/2) + (height/2)) + 30) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast");
    });
    $(document).on("mousemove",".thumbnailImg",function(e){ //마우스 이동
        $("#preview")
            .css("top",(e.pageY - ((height/2) + (height/2)) + 30) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
    $(document).on("mouseout",".thumbnailImg",function(){ //마우스 아웃
        $("#preview").remove();
    });
</script>