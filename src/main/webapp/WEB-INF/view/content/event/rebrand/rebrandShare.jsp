<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="rebrand-share" class="searchForm mb5">
    <div class="widget widget-table">
        <table>
            <tr>
                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                    <i class="fa fa-search"></i><br/>검색
                </th>
                <td>
                    <div class="form-inline">
                        <select name="slct" class="form-control searchType">
                            <option value="1" selected="selected">회원 번호</option>
                            <option value="2">아이디</option>
                            <option value="3">회원 닉네임</option>
                            <option value="4">연락처</option>
                        </select>
                        <label><input type="text" class="form-control" name="searchVal" placeholder="검색어 입력"></label>
                        <button type="button" class="btn btn-success">검색</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>

<div class="col-lg-12 no-padding mt10 mb10">
    <div class="widget-content">
        이벤트 준비중 입니다.
    </div>
</div>

<script>
  const sharePagingInfo = new PAGING_INFO(0, 1, 50);

  $(document).ready(function () {

  });
</script>
