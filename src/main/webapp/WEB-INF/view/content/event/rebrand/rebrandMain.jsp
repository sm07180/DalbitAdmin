<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="rebrand-main" class="searchForm mb5">
    <div class="widget widget-table searchBoxArea">
        <table>
            <tr>
                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                    <i class="fa fa-search"></i><br/>검색
                </th>
                <td style="text-align: left">
                    <label><input type="text" class="form-control" name="searchVal" placeholder="아이디 입력"></label>
                    <button type="button" class="btn btn-success">검색</button>
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
  const mainPagingInfo = new PAGING_INFO(0, 1, 50);

  $(document).ready(function () {

  });
</script>