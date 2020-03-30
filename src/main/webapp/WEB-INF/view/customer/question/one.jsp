<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-md-12 no-padding">
            <label id="one_title"></label>
        </div>

        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
                <col width="5%">
            </colgroup>
            <tbody>
                <tr>
                    <th rowspan="2">No</th>
                    <td rowspan="2">32</td>

                    <th>문의유형</th>
                    <td>방송하기</td>

                    <th>Browser</th>
                    <td>Chrome</td>

                    <th>회원번호</th>
                    <td>123134534321</td>

                    <th rowspan="2">접수일시</th>
                    <td rowspan="2">2020.02.21 11:20:43</td>

                    <th>첨부파일</th>
                    <td>0 건</td>
                </tr>
                <tr>
                    <th>플랫폼</th>
                    <td>web-mobile</td>

                    <th>ip Address</th>
                    <td>127.0.0.1</td>

                    <th>문의자<br />User id</th>
                    <td>달나라토끼<br />(레벨/등급)</td>

                    <th>처리상태</th>
                    <td>미처리</td>
                </tr>
                <tr>
                    <th colspan="2">문의제목</th>
                    <td colspan="4"><input type="text" class="form-control fit-table" /></td>

                    <th>문의자<br />닉네임</th>
                    <td>달나라토끼</td>

                    <th>처리일시</th>
                    <td>-</td>

                    <th>처리자명</th>
                    <td>-</td>
                </tr>

                <tr>
                    <th colspan="2">문의내용</th>
                    <td colspan="6">
                        <textarea class="form-control fit-table" rows="5"></textarea>
                    </td>

                    <th>첨부파일</th>
                    <td colspan="3">첨부파일이미지</td>
                </tr>

                <tr>
                    <th colspan="2">매크로 답변하기</th>
                    <td colspan="4">
                        <select class="form-control">
                            <option>문의구분</option>
                        </select>

                        <select class="form-control">
                            <option>구분</option>
                        </select>
                    </td>

                    <th colspan="2">바로가기버튼</th>
                    <td colspan="4">
                        <button type="button" id="bt_moon" class="btn-sm btn btn-default">달결제</button>
                        <button type="button" id="bt_star" class="btn-sm btn btn-default">별환전</button>
                        <button type="button" id="bt_wallet" class="btn-sm btn btn-default">내지갑</button>
                        <button type="button" id="bt_profile" class="btn-sm btn btn-default">사진등록</button>
                        <button type="button" id="bt_broadRoot" class="btn-sm btn btn-default">방송방법</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 답변 </h3>
            </div>
            <div class="widget-content no-padding">
                <div class="_editor"></div>
            </div>
            <div class="pull-right">
                <button type="button" id="bt_operate" class="btn-sm btn btn-default">등록</button>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    util.editorInit("customer-question");
</script>
