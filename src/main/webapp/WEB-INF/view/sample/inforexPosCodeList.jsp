<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<div class="main-header">
    <h3>인포렉스 API 조회 페이지</h3>
</div>

<hr />

<button type="button" class="btn _inforexApiBtn" data-url="http://admin.inforex.co.kr/dalbit/getPosCodeList.php">직급 코드 가져오기</button>
<button type="button" class="btn _inforexApiBtn" data-url="http://admin.inforex.co.kr/dalbit/getDutyCodeList.php">직책 코드 가져오기</button>
<button type="button" class="btn _inforexApiBtn" data-url="http://admin.inforex.co.kr/dalbit/getDeptCodeList.php">부서 코드 가져오기</button>
<button type="button" class="btn _inforexApiBtn" data-url="http://admin.inforex.co.kr/dalbit/getUserList.php">임직원 목록 가져오기</button>

<hr />
<div>
    <h4>API 조회 결과 [JSON]</h4>
    <textarea  id="apiResult" style="width:100%;height: 1000px">API 조회 결과가 여기에 노출됩니다.</textarea>
</div>
<script type="text/javascript">

    $('._inforexApiBtn').on('click', function(e){
        apiCall($(this).data('url'));
    });


    function apiCall(url){
        var option = {
            type : 'GET'
            , dataType : 'json'
        };
        util.getAjaxData("menu", url, null, apiSuccess, null, option);
    }
    function apiSuccess(dst_id, data){
        dalbitLog('success');
        dalbitLog(data);
        $("#apiResult").val(JSON.stringify(data));
    }
</script>