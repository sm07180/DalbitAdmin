<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="rebrand-main" class="searchForm mb5" onsubmit="return false;">
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

        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone_con">
            <li class="active"><a href="#stone1st" role="tab" data-toggle="tab" data-seq-no="1">1회차</a></li>
            <li><a href="#stone2st" role="tab" data-toggle="tab" data-seq-no="2">2회차</a></li>
            <li><a href="#stoneTotal" role="tab" data-toggle="tab" data-seq-no="3">종합</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="stone1st">
                <h5><strong>진행기간: 3/8 ~ 3/17</strong></h5>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone1st-inner">
                    <li class="active"><a href="#stone1st-rank" role="tab" data-toggle="tab" data-type="1">순위</a></li>
                    <li><a href="#stone1st-collect" role="tab" data-toggle="tab" data-type="2">다시뽑기</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="stone1st-rank">
                        이벤트 작업중입니다. (rank1)
                    </div>
                    <div class="tab-pane fade" id="stone1st-collect">
                        이벤트 작업중입니다. (collect1)
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="stone2st">
                <h5><strong>진행기간: 3/18 ~ 3/27</strong></h5>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone2st-inner">
                    <li class="active"><a href="#stone2st-rank" role="tab" data-toggle="tab" data-type="1">순위</a></li>
                    <li><a href="#stone2st-collect" role="tab" data-toggle="tab" data-type="2">다시뽑기</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="stone2st-rank">
                        이벤트 작업중입니다. (rank2)
                    </div>
                    <div class="tab-pane fade" id="stone2st-collect">
                        이벤트 작업중입니다. (collect2)
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="stoneTotal">
                <h5><strong>진행기간: 3/8 ~ 3/27</strong></h5>

                이벤트 작업중입니다. (stoneTotal)
            </div>
        </div>
    </div>
</div>

<script>
  let $mainRoot = null;
  const mainSearch = {
    seqNo: 1,
    type: 1,
    searchData: ''
  }
  const mainPagingInfo = new PAGING_INFO(0, 1, 50);
  const mainEventData = (function () {
    function getRankList() {

    }

    function getCollectList() {

    }

    function getTotalCollectList() {

    }

    function callList() {
      switch(mainSearch.seqNo) {
        case 1:
        case 2:
          break;
        case 3:
          break;
      }
    }

    function intSearchForm() {
      mainSearch.seqNo = 1;
      mainSearch.type = 1;
      mainSearch.searchData = '';
      $mainRoot.find('input[name="searchVal"]').val(mainSearch.searchData);
    }

    return {
      intSearchForm,
      callList
    }
  }());

  // 달라졌어요 이벤트~
  function initStoneEvent() {
    setTimeout(function() {
      mainEventData.intSearchForm();
      mainEventData.callList();
    }, 0);
  }

  $(document).ready(function () {
    $mainRoot = $('#rebrand-main');
    $mainRoot.find('input[name="searchVal"]').on('change', function () {
      mainSearch.searchData = this.value;
    });
    $mainRoot.find('input[name="searchVal"]').on('keypress', function (e) {
      var keycode = e.keyCode ? e.keyCode : e.which;
      if(keycode == '13'){
        mainPagingInfo.pageNo = 1;
        mainEventData.callList();
      }
      e.stopPropagation();
    });

    // 메인이벤트: 회차탭 클릭이벤트
    $('#stone_con > li > a').on('click', function(e) {
        var $this = $(this);
        mainSearch.seqNo = parseInt($this.data('seq-no'), 10);
        mainSearch.type = 1;
        mainPagingInfo.pageNo = 1;

        if (mainSearch.seqNo === 1 || mainSearch.seqNo === 2) {
          $('#stone' + mainSearch.seqNo + 'st-inner > li > a').eq(0).click();
        } else {
          mainEventData.callList();
        }
    });

    // 1회차 하위탭
    $('#stone1st-inner > li > a').on('click', function(e) {
      var $this = $(this);
      mainSearch.type = parseInt($this.data('type'), 10);
      mainPagingInfo.pageNo = 1;
      mainEventData.callList();
    });

    // 2회차 하위탭
    $('#stone2st-inner > li > a').on('click', function(e) {
      var $this = $(this);
      mainSearch.type = parseInt($this.data('type'), 10);
      mainPagingInfo.pageNo = 1;
      mainEventData.callList();
    });
  });
</script>