<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>공통함수 샘플</h2>
    </div>

    <div class="row">
        <div class="widget">
            <div class="widget-header">
                <h3>팝업 띄우기</h3>
            </div>
            <div class="widget-content">
                <div>
                    class에 _openPop 추가. <br />
                    [필수] data-url="https://www.naver.com"; <br /><br />

                    data-width="1000" 넓이 <br />
                    data-height="700" 높이<br />
                    name="newPop" 팝업명<br />
                </div>
                <button class="btn btn-primary btn-lg _openPop" data-url="https://www.naver.com">팝업띄우기</button>
            </div>
        </div>
    </div>
</div>
