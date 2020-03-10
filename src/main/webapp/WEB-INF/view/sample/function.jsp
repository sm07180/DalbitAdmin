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
                <button class="btn btn-primary btn-lg _openPop" data-url="https://www.naver.com">팝업띄우기(url만)</button>
                <button class="btn btn-primary btn-lg _openPop" data-url="https://www.naver.com" data-width="1000" data-height="700" name="newPop">팝업띄우기</button>
            </div>

            <div class="widget-content">
                <div>
                    class에 _openMemberPop 추가. <br />
                    [필수] data-memNo="11583121967853"; <br /><br />
                </div>
                <button class="btn btn-primary btn-lg _openMemberPop" data-memNo="11583121967853">회원팝업 띄우기</button>
            </div>

            <div class="widget-content">
                <div>
                    class에 _openBroadcastPop 추가. <br />
                    [필수] data-roomNo="91583121793753"; <br /><br />
                </div>
                <button class="btn btn-primary btn-lg _openBroadcastPop" data-roomNo="91583121793753">회원팝업 띄우기</button>
            </div>
        </div>

        <div class="widget">
            <div class="widget-header">
                <h3>공통코드</h3>
            </div>
            <div class="widget-content">
                <div>
                    <h4>select 사용하기</h4>
                    common.js => getCommonCodeSelect 함수 사용<br />
                    getCommonCodeSelect(디폴트 값, 공통코드)<br />
                    ex) getCommonCodeSelect('', platform)<br /><br />
                </div>
                <div id="selectArea"></div>


                <script type="text/javascript">
                    $("#selectArea").html(getCommonCodeSelect('', platform));
                </script>
            </div>

            <hr />

            <div class="widget-content">
                <div>
                    <h4>radio 사용하기</h4>
                    common.js => getCommonCodeRadio 함수 사용<br />
                    getCommonCodeRadio(디폴트 값, 공통코드)<br />
                    ex) getCommonCodeRadio('', platform)<br /><br />
                </div>
                <div id="radioArea"></div>

                <script type="text/javascript">
                    $("#radioArea").html(getCommonCodeRadio('', platform));
                </script>
            </div>


            <div class="widget-content">
                <div>
                    <h4>label 사용하기</h4>
                    common.js => getCommonCodeLabel 함수 사용<br />
                    getCommonCodeLabel(보낼 코드 값, 공통코드)<br />
                    ex) getCommonCodeLabel('1', platform), getCommonCodeLabel('2', platform), getCommonCodeLabel('3', platform)<br /><br />
                </div>
                <div id="labelArea1"></div>
                <div id="labelArea2"></div>
                <div id="labelArea3"></div>
                <script type="text/javascript">
                    $("#labelArea1").html(getCommonCodeLabel('1', platform));
                    $("#labelArea2").html(getCommonCodeLabel('2', platform));
                    $("#labelArea3").html(getCommonCodeLabel('3', platform));
                </script>
            </div>
        </div>
    </div>

    <style>
        /*table.table-dalbit tbody tr {align-middle}*/
        table.table-dalbit tbody tr th {background-color: #DCE6F2}
        table.table-dalbit tbody tr td {background-color: #FFFFFF}
    </style>
    <table class="table table-bordered table-dalbit">
        <tbody>
            <tr class="align-middle">
                <th>No</th>
                <td>Steve</td>

                <th>구분</th>
                <td>Steve</td>

                <th rowspan="2">제목</th>
                <td rowspan="2">Steve</td>

                <th>등록일시</th>
                <td>Steve</td>

                <th>조회수</th>
                <td>Steve</td>

                <th rowspan="2">게시상태</th>
                <td rowspan="2">Steve</td>
            </tr>
            <tr>
                <th>플랫폼</th>
                <td>Steve</td>

                <th>성별</th>
                <td>Steve</td>

                <th>게시중지일시</th>
                <td>Steve</td>

                <th>처리자</th>
                <td>Steve</td>

            </tr>
        </tbody>
    </table>
</div>
