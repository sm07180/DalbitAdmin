<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_top">
                    <li class="active"><a href="#join" role="tab" data-toggle="tab" id="tab_join">가입 현황</a></li>
                    <li><a href="/enter/newJoin2/withdrawal/info" id="tab_withdraral">탈퇴 현황</a></li>
                </ul>
                <div class="col-md-12 no-padding mt10 ">
                    <span>* 20.10.12 이 후 성별과 연령을 제외한 가입 현황 수치가 반영되었습니다.</span>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="join"><jsp:include page="infoTab_bottom.jsp"/></div>       <!-- 하단 텝 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">

</script>