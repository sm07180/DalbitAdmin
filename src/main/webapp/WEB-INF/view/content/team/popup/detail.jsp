<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<style>
    .basic table td {
        text-align: left;
        padding-left: 5px;
    }

    .table-badge .borderd {border: 1px solid #dddddd;}
    .table-badge .title {background: #f2f2f2; font-weight: bold; padding: 5px}
    .table-badge .content {padding: 5px}
</style>

<div class="basic container mb10">
    <h5 class="font-bold">기본정보</h5>
    <div class="container-fluid row">
        <div class="col-sm-3">

        </div>
        <div class="col-sm-9">
            <table class="table table-bordered">
                <colgroup>
                    <col width="15%"/>
                    <col width="35%"/>
                    <col width="15%"/>
                    <col width="35%"/>
                </colgroup>
                <tbody>
                <tr>
                    <th>팀이름</th>
                    <td></td>
                    <th>팀번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th>팀소개</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <th>생성일시</th>
                    <td></td>
                    <th>삭제일시</th>
                    <td></td>
                </tr>
                <tr>
                    <th>선물달</th>
                    <td></td>
                    <th>받은별</th>
                    <td></td>
                </tr>
                <tr>
                    <th>최근 7일<br>방송시간</th>
                    <td colspan="3">
                        adfasdf
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container mb10">
    <div class="row">
        <div class="col-sm-6">
            <h5 class="font-bold">활동중인 맴버</h5>
        </div>
        <div class="col-sm-6 text-right">
            <button type="button" class="btn btn-sm btn-warning">탈퇴멤버</button>
        </div>
    </div>
    <div class="container-fluid row">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>회원번호</th>
                <th>닉네임</th>
                <th>기여도</th>
                <th>가입일</th>
                <th>받은별</th>
                <th>선물달</th>
                <th>최근 7일<br>방송시간</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>회원번호</td>
                <td>닉네임</td>
                <td>기여도</td>
                <td>가입일</td>
                <td>받은별</td>
                <td>선물달</td>
                <td>방송시간</td>
                <td>[강퇴]</td>
            </tr>
            <tr>
                <td>회원번호</td>
                <td>닉네임</td>
                <td>기여도</td>
                <td>가입일</td>
                <td>받은별</td>
                <td>선물달</td>
                <td>방송시간</td>
                <td>[강퇴]</td>
            </tr>
            <tr>
                <td>회원번호</td>
                <td>닉네임</td>
                <td>기여도</td>
                <td>가입일</td>
                <td>받은별</td>
                <td>선물달</td>
                <td>방송시간</td>
                <td>[강퇴]</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="container mb10">
    <div class="row">
        <div class="col-sm-6">
            <h5 class="font-bold">활동배지</h5>
        </div>
    </div>
    <div class="container-fluid row">
        <div class="col-sm-6 table-badge">
            <div class="row">
                <div class="col-sm-3 borderd title">배지이름</div>
                <div class="col-sm-9 borderd content">점수</div>
            </div>
        </div>
    </div>
</div>

<script>
    let teamNo = ${param.teamNo};

    const teamDetail = (function () {
      function getTeam() {
        let data = {
          teamNo: teamNo
        };
        let apiURL = '/rest/content/team/detail';
        util.getAjaxData("getTeamDetail", apiURL, data, function(id, response, params) {

        }, null, {type: 'GET'});
      }

      return {
        getTeam: getTeam
      };
    }());

    $(document).ready(function () {
      teamDetail.getTeam();
    });
</script>