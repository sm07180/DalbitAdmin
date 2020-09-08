<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//    Object in_memNo = request.getParameter("memNo");
%>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content mt15">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#gift" role="tab" data-toggle="tab" id="tab_gift">일반</a></li>
                <li><a href="#combo" role="tab" data-toggle="tab" id="tab_combo">콤보</a></li>
                <li><a href="#emotion" role="tab" data-toggle="tab" id="tab_emotion">감정</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="gift">
                    <table class="table table-bordered _tableHeight" data-height="23px">
                        <colgroup>
                            <col width="10%"/><col width="30%"/><col width="30%"/><col width="30%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>NO</th>
                            <th>이미지</th>
                            <th>아이템명</th>
                            <th>순서</th>
                        </tr>
                        </thead>
                        <tbody id="giftBody">
                        </tbody>
                    </table>
                </div>
                <button class="btn btn-primary" type="button" id="giftBtn" onclick="setGiftOrder();">적용하기</button>
                <div class="tab-pane fade" id="combo">

                </div>
                <div class="tab-pane fade" id="emotion">

                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-default" type="button" id="closeBtn" onclick="javascript:window.close();">창닫기</button>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script>
    <%--var memNo = "<%=in_memNo%>";--%>

    $(document).ready(function(){
        init();
    });

    function init(){
        util.getAjaxData("itemList", "/rest/content/item/giftList", "", fn_giftList_success);
    }
    function fn_giftList_success(dst_id,response){
        var template = $('#tmp_giftList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data;
        var html=templateScript(detailContext);
        $("#giftBody").append(html);
    }

    function setGiftOrder(){
        util.getAjaxData("setGiftOrder", "/rest/content/item/set/giftList", obj, fn_set_giftList_success);
    }

    function fn_set_giftList_success(dst_id,response){
    }


</script>

<script type="text/x-handlebars-template" id="tmp_giftList">
    {{#each this as |data|}}
    <tr>
        <td>{{rowNum}}</td>
        <td>{{image}}</td>
        <td>{{giftName}}</td>
        <td>{{order}}</td>
    </tr>
    {{/each}}
</script>

