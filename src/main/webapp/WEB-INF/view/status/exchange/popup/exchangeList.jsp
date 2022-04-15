<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal"/>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget-table mb10">
    <div class="col-md-12" style="background-color: #fbe5d6;padding:7px;margin-top: 8px">
        <span class="font-bold" id="sp_type" style="color: #7792c9;"></span><span class="font-bold">&nbsp;상세내역</span>
    </div>
    <div class="widget-content mt10">
        <div class="col-md-6 no-padding">
            <div class="col-md-3 no-padding">
                <span id="exchangeSort" onchange="exchangeSort_click();"></span>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="dataTables_paginate paging_full_numbers mt15" id="list_info_paginate_top"></div>
            <div class="col-lg-12 no-padding">
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <colgroup>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="6%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="4%"/>
                        <col width="4%"/>
                        <col width="5%"/>
                    </colgroup>

                    <thead id="tableTop">
                    <tr>
                        <th>No</th>
                        <th>상태</th>
                        <th>프로필</th>
                        <c:if test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
                            <th>신분증</th>
                        </c:if>
                        <th>회원번호</th>
                        <th>닉네임</th>
                        <th>성별</th>
                        <th>가입시<br/>생년월일</th>
                        <th>미성년자<br/>여부</th>
                        <th>예금주</th>
                        <th>신청금액</th>
                        <th>스페셜DJ<br/>혜택</th>
                        <th>실수령액</th>
                        <th>신청 별 수</th>
                        <th>현재 별 수</th>
                        <th>테스트ID<br/>등록이력</th>
                        <th>환전횟수</th>
                        <th>환전<br/>누적금액</th>
                        <th>신청일자</th>
                        <th>처리일자</th>
                        <th>처리현황</th>
                        <th>처리자</th>
                        <th>상세</th>
                    </tr>
                    </thead>
                    <tbody id="tableBody"></tbody>
                </table>
            </div>
            <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
        </div>
    </div>
</div>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal"
        style="display:none;">레이어팝업오픈버튼
</button>

<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel"
     aria-hidden="true"></div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>

<script type="text/javascript">

  var month = '${param.month}';
  var day = '${param.day}';
  var user = '${param.user}';
  var gender = '${param.gender}';
  var exchangePagingInfo = new PAGING_INFO(0, 1, 50);
  var limitDay;

  $(function () {
    $("#exchangeSort").html(util.getCommonCodeSelect('', exchange_sort));
    getExchangeList();
  });

  function getParameter() {
    var isSpecial;
    if (user == "playmaker") {
      isSpecial = 2;
    } else if (user == "special") {
      isSpecial = 1;
    } else {
      isSpecial = 0;
    }
    if (gender == "undefined") {
      gender = 0;
    }
    return data = {
      isSpecial: isSpecial
      , search_year: month.substring(0, 4)
      , search_month: month.substring(5, 7)
      , search_day: day
      , search_state: 1
      , exchange_sort: $("#exchange_sort").val()
      , gender: gender
      , pageStart: exchangePagingInfo.pageNo
      , pageCnt: exchangePagingInfo.pageCnt
      , limitDay: limitDay
      , search_testId: 0
      , slctType: 1
      , end_year: month.substring(0, 4)
      , end_month: month.substring(5, 7)
      , end_day: day
      , baseDay: "opdate"
    };
  }

  function getExchangeList() {
    console.log(getParameter());
    util.getAjaxData("select", "/rest/money/exchange/list", getParameter(), fn_succ_list);

  }

  function fn_succ_list(dst_id, response) {
    limitDay = moment(new Date()).format('YYYYMMDD');

    response.data.limitDay = limitDay;

    var template = $('#tmp_exchangeList').html();
    var templateScript = Handlebars.compile(template);
    var context = response.data;
    var html = templateScript(context);
    $("#tableBody").html(html);

    exchangePagingInfo.totalCnt = response.data.exchangeCnt;
    util.renderPagingNavigation("list_info_paginate_top", exchangePagingInfo);
    util.renderPagingNavigation("list_info_paginate", exchangePagingInfo);

  }

  function exchangeSort_click() {
    getExchangeList("button");
  }

  function gender_click() {
    getExchangeList("button");
  }

  $(document).on('click', '._layerOpen', function (title, content) {

    var detailData = getParameter();
    detailData.idx = $(this).data('exchangeidx');

    util.getAjaxData("select", "/rest/money/exchange/detail", detailData, fn_succ_detail);
  });

  function fn_succ_detail(dist_id, response) {
    var template = $('#tmp_layer_detail').html();
    var templateScript = Handlebars.compile(template);
    var context = response.data;
    var html = templateScript(context);
    $("#detailView").html(html);

    ui.paintColor();
    showModal();
  }

  function showModal() {
    $("#showModal").click();
  }

  function closeModal() {
    $("#layerCloseBtn").click();
  }


</script>


<script type="text/x-handlebars-template" id="tmp_exchangeList">
    {{#each this.exchangeList as |data|}}
    <tr {{#dalbit_if inner '==' 1}} style="background-color: #dae3f3" {{/dalbit_if}}>
    <td>
        {{indexDesc ../exchangeCnt data.rowNum}}
    </td>
    <td>
        {{{getMemStateName data.mem_state}}}
    </td>
    <td>
        <form id="profileImg" method="post" enctype="multipart/form-data">
            <img id="image_section" class="thumbnail fullSize_background no-padding"
                 src="{{renderProfileImage data.image_profile data.mem_sex}}" alt="your image"
                 style="width: 50px;height: 50px;margin-bottom: 0px;"/>
        </form>
    </td>
    <c:if test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
        <td>
            <img src="{{renderImage data.add_file1}}" style="max-width:50px;max-height:50px;"
                 class="thumbnail fullSize_background no-padding no-margin"/>
        </td>
    </c:if>
    <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_no}}</a></td>
    <td>{{data.mem_nick}}</td>
    <td>{{{sexIcon data.mem_sex data.mem_birth_year}}}</td>

    <td>{{data.birth}}</td>
    <td>{{{calcAge data.birth}}}{{#equal data.recant_yn 'y'}}<br/><span style='font-weight:bold'>[철회됨]</span>{{/equal}}
    </td>

    <td>{{data.account_name}}</td>
    <td>{{addComma data.cash_basic}}원</td>
    <td>{{addComma data.benefit}}원</td>
    <td>{{addComma data.cash_real}}원</td>
    <td>{{addComma data.byeol}}별</td>
    <td>{{addComma data.gold}}별</td>
    <td>{{data.testid_history}}</td>
    <td>{{addComma data.exchangeCnt}}번</td>
    <td>{{addComma data.totalCashReal}}원</td>
    <td>{{convertToDate data.reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
    <td>{{convertToDate data.op_date 'YYYY-MM-DD HH:mm:ss'}}</td>
    <td>{{{stateName data.state}}}</td>
    <td>{{data.op_name}}</td>
    <td>
        <button type="button" class="btn btn-primary btn-sm _layerOpen" data-exchangeidx='{{data.idx}}'>보기</button>
    </td>
    </tr>

    {{else}}
    <tr>
        <c:choose>
            <c:when test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
                <td colspan="24">{{isEmptyData}}</td>
            </c:when>
            <c:otherwise>
                <td colspan="23">{{isEmptyData}}</td>
            </c:otherwise>
        </c:choose>
    </tr>
    {{/each}}
</script>


<script type="text/x-handlebars-template" id="tmp_layer_detail">
    <form id="exchangeForm">
        <input type="hidden" name="idx" value="{{detail.idx}}"/>
        <div class="modal-dialog"
             style="{{#if parentInfo.parents_name}}{{/if}}width:900px{{^if parentInfo.parents_name}}width:600px{{/if}}">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="layerCloseBtn">
                        &times;
                    </button>
                    <h4 class="modal-title" id="_layerTitle">상세보기</h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12 form-inline block _modalLayer">
                        <div class="{{#if parentInfo.parents_name}}col-lg-8{{/if}}{{^if parentInfo.parents_name}}col-lg-12{{/if}}">
                            <%--<div class="col-lg-12">--%>
                            <table id="list_info" class="table table-sorting table-hover table-bordered">
                                <tbody id="tableBody">
                                <tr>
                                    <th>신청금액</th>
                                    <td colspan="3" style="font-weight:bold; color: #ff5600">
                                        {{addComma detail.cash_basic}}원
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        {{{getCommonCodeSelect detail.bank_code 'inforex_bank_code' 'Y' ''}}}
                                    </td>

                                    <th>계좌번호</th>
                                    <td>
                                        <input type="text" class="form-control" id="account_no" name="account_no"
                                               maxlength="25" value="{{detail.account_no}}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>예금주</th>
                                    <td>
                                        <input type="text" class="form-control" id="account_name" name="account_name"
                                               maxlength="25" value="{{detail.account_name}}"/>
                                    </td>
                                    <th>주민번호</th>
                                    <td>
                                        <input type="text" class="form-control" id="social_no" name="social_no"
                                               maxlength="13" value="{{detail.social_no}}"/>
                                        <br/>
                                        [{{convertJumin detail.social_no}}]
                                    </td>
                                </tr>

                                <tr>
                                    <th>세금신고<br/>대상자</th>
                                    <td>
                                        {{#equal detail.prevAccountName ''}}
                                        <span class="_fontColor" data-fontcolor="red">이전 환전승인내역이 없습니다.</span>
                                        {{/equal}}
                                        {{detail.prevAccountName}}
                                    </td>
                                    <th>세금신고<br/>주민번호</th>
                                    <td>
                                        {{convertJumin detail.prevSocialNo}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>가입시<br/>생년월일</th>
                                    <td>
                                        {{detail.birth}}
                                    </td>
                                    <th>미성년자<br/>여부</th>
                                    <td>
                                        {{{calcAge detail.birth}}}
                                        {{#isChild detail.birth}}
                                        {{^if parentInfo.parents_name}}
                                        <br/>
                                        <span style="font-weight:bold;">법정대리인 보호자 동의 정보가 없습니다.</span>
                                        {{/if}}
                                        {{/isChild}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>주소</th>
                                    <td colspan="3">
                                        <input type="text" class="form-control _fullWidth" id="address_1"
                                               name="address_1" value="{{detail.address_1}}"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th>상세주소</th>
                                    <td colspan="3">
                                        <input type="text" class="form-control _fullWidth" id="address_2"
                                               name="address_2" value="{{detail.address_2}}"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th>전화번호</th>
                                    <td colspan="3">
                                        <input type="hidden" name="phone_no"
                                               value="{{phoneNumHyphen detail.phone_no}}"/>
                                        {{phoneNumHyphen detail.phone_no}}
                                        / {{phoneNumHyphen detail.mem_phone}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>접수서류</th>
                                    <td colspan="3">
                                        <div class="col-lg-6" style="border:solid 1px black">
                                            <a href="javascript://">
                                                <img src="{{renderImage detail.add_file1}}"
                                                     style="max-width:100px;max-height:150px;"
                                                     class="_fullWidth _openImagePop thumbnail"/>
                                            </a>
                                            {{#equal detail.state '0'}}<input id="files1" type="file"
                                                                              onchange="photoSubmit($(this))">{{/equal}}
                                            <input type="hidden" class="_hidden_filename" name="add_file1"
                                                   id="add_file1" value="{{detail.add_file1}}"/>
                                        </div>
                                        <div class="col-lg-6" style="border:solid 1px black">
                                            <a href="javascript://">
                                                <img src="{{renderImage detail.add_file2}}"
                                                     style="max-width:100px;max-height:150px;"
                                                     class="_fullWidth _openImagePop thumbnail"/>
                                            </a>
                                            {{#equal detail.state '0'}}<input id="files2" type="file"
                                                                              onchange="photoSubmit($(this))"/>{{/equal}}
                                            <input type="hidden" class="_hidden_filename" name="add_file2"
                                                   id="add_file2" value="{{detail.add_file2}}"/>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th>신청일자</th>
                                    <td>
                                        {{convertToDate detail.reg_date 'YYYY-MM-DD HH:mm:ss'}}
                                    </td>

                                    <th>완료일자</th>
                                    <td>
                                        {{#equal detail.op_date ''}}
                                        -
                                        {{else}}
                                        {{convertToDate ../detail.op_date 'YYYY-MM-DD HH:mm:ss'}}
                                        {{/equal}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        미처리 사유
                                    </th>
                                    <td colspan="3">
                                        <input type="hidden" id="send_title" name="send_title">
                                        {{{getCommonCodeSelect detail.send_type 'exchange_cancel_type'}}} <label
                                            id="label_send_title">{{detail.send_title}}</label>
                                        <p class="no-margin no-padding" style="font-size:0.9em; color:red;">* 사유 선택 후 취소
                                            처리 시 회원에게 푸시 메시지, SMS로 발송됩니다</p>
                                    </td>
                                </tr>

                                {{#dalbit_if detail.send_type "==" "0"}}
                                <tr id="tr_send_cont" style="display:none;">
                                    {{else}}
                                <tr id="tr_send_cont">
                                    {{/dalbit_if}}
                                    <th>
                                        미처리 사유<br>내용
                                    </th>
                                    <td colspan="3">
                                        <textarea class="form-control" name="send_cont" id="send_cont"
                                                  oninput="util.textareaResize(this)" placeholder=""
                                                  style="width:100%; height:90px; resize: none">{{replaceHtml detail.send_cont}}</textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <th>메모</th>
                                    <td colspan="3">
                                        <input type="text" class="form-control _fullWidth" id="op_msg" name="op_msg"
                                               maxlength="1000" value="{{detail.op_msg}}"/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        {{#if parentInfo.parents_name}}
                        <div class="col-lg-4">
                            <div class="mb10">법정대리인 (보호자) 동의 정보</div>
                            <table id="parentTable" class="table table-sorting table-hover table-bordered">
                                <tbody>
                                <tr>
                                    <th>
                                        보호자 이름
                                    </th>
                                    <td>
                                        {{parentInfo.parents_name}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        성별
                                    </th>
                                    <td>
                                        {{{sexIcon parentInfo.parents_sex parentInfo.mem_birth_year}}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        생년월일
                                    </th>
                                    <td>
                                        {{parentInfo.parents_birth_year}}{{parentInfo.parents_birth_month}}{{parentInfo.parents_birth_day}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        통신사
                                    </th>
                                    <td>
                                        {{parentInfo.parents_comm_company}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        휴대폰번호
                                    </th>
                                    <td>
                                        {{parentInfo.parents_phone}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        내/외국인
                                    </th>
                                    <td>
                                        {{parentInfo.parents_foreign_yn}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>철회 여부</th>
                                    <td>
                                        {{#equal parentInfo.recant_yn 'n'}}
                                        <label style="font-weight: bold">No</label>
                                        {{else}}
                                        <label style="color: red; font-weight: bold">Yes</label>
                                        {{/equal}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        가족관계<br/>증명서류
                                    </th>
                                    <td>
                                        {{#if parentInfo.add_file}}
                                        <img src="{{renderImage parentInfo.add_file}}"
                                             style="max-width:100px;max-height:150px;"
                                             class="_fullWidth _openImagePop thumbnail"/>
                                        {{else}}
                                        가족관계 증명서류가 없습니다.
                                        {{/if}}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {{/if}}
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal"><i
                            class="fa fa-times-circle"></i> 닫기
                    </button>

                    {{#equal detail.state '0'}}
                    {{#adultStatusCheck ../detail.birth ../parentInfo.recant_yn}}
                    <button type="button" class="btn btn-custom-primary _updateBtn"><i class="fa fa-times-circle"></i>
                        수정
                    </button>
                    <button type="button" class="btn btn-danger _rejectBtn"><i class="fa fa-times-circle"></i> 취소
                    </button>
                    <button type="button" class="btn btn-success _completeBtn"><i class="fa fa-check-circle"></i> 완료
                    </button>
                    {{else}}
                    <span class="exchange_complete_txt">법정대리인 보호자 정보동의 철회로 처리 할 수 없습니다.</span>
                    {{/adultStatusCheck}}
                    {{/equal}}

                    {{#equal detail.state '1'}}
                    <span class="exchange_complete_txt">완료되었습니다.</span>
                    {{/equal}}

                    {{#equal detail.state '2'}}
                    <span class="exchange_reject_txt">취소처리 되었습니다.</span>
                    {{/equal}}

                </div>
            </div>
        </div>
    </form>
</script>