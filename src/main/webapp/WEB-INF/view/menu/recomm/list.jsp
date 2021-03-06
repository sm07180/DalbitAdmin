<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-md-12 no-padding">
    <span>
        * 추천 DJ의 성별/나이는 관리자가 직접 입력한 데이터로 본인인증 정보와 다를 수 있습니다.<br/>
        * 운영자 직접 등록 후 저장을 클릭해야 추천 DJ 등록이 완료됩니다.
    </span>
</div>
<div class="col-md-1 no-padding">
    <span id="recomm_status_area" onchange="getList();"></span>
</div>
<div class="col-md-1 no-padding pull-right">
    <button type="button" class="btn btn-primary pull-right" id="memSearch" name="memSearch"><i class="fa fa-search"></i>운영자 직접 등록</button>
</div>
<div class="widget-content col-md-12 no-padding">
    <table class="table table-sorting table-hover table-bordered datatable" id="table_recomm_list">
        <thead>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<button type="button" class="btn btn-danger pull-left" id="recommDel" onclick="recommDel();">추천 DJ 삭제</button>
<div class="col-md-12 no-padding">
    <span id="recommMemberInfo" ></span>
</div>

<jsp:include page="/WEB-INF/view/common/util/select_specialList.jsp"></jsp:include>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/dataTablesSource/menu/recommDataTableSource.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        getList();

        $("#recomm_status_area").html(util.getCommonCodeSelect(0, recomm_status));
    });

    var dtList;
    const defaultImageUrl = "https://photo.dalbitlive.com/profile_3/profile_m_200327.jpg";
    function getList() {
        var dtList_info_data = function (data) {
            data.slctType = $("#recomm_status").val();
        };
        dtList = new DalbitDataTable($("#table_recomm_list"), dtList_info_data, recommDataTableSource.recommList);
        dtList.useCheckBox(true);
        dtList.useIndex(true);
        dtList.setPageLength(50);
        dtList.createDataTable();

    }

    $('#memSearch').on('click', function() {
        showPopMemberList(choiceMember);
    });

    function choiceMember(data) {
        var obj = {
            mem_no : data.mem_no
        };
        util.getAjaxData("recomm", "/rest/menu/recomm/detail", obj, fn_recommMember_success);
    }

    function fn_recommMember_success(dst_id, response, param){
        var template = $('#tmp_recommMemberInfo').html();
        var templateScript = Handlebars.compile(template);
        var data = response.data;
        var html = templateScript(data);
        $("#recommMemberInfo").html(html);
        ui.paintColor();
        if(!common.isEmpty($("#image_url").val())){
            $('._previewImage').click();
        }

        var scrollPosition = $("#recommMemberInfo").offset();
        util.scrollPostion(scrollPosition.top);

        $('#title').on('keyup', function() {
            if($(this).val().length > 95) {
                $(this).val($(this).val().substring(0, 95));
            }
        });
        $('#desc').on('keyup', function() {
            if($(this).val().length > 250) {
                $(this).val($(this).val().substring(0, 250));
            }
        });
        $('#dj_keyword').on('keyup', function() {
          const maxLength = 20;
          if($(this).val().length > maxLength) {
            $(this).val($(this).val().substring(0, maxLength));
          }
        });
    }
    function recommEdit() {
        if(confirm('추천 DJ를 저장 하시겠습니까?')) {
            var data = {
                mem_no: $("#recomm_mem_no").text()
                , memSex: $("input[name='memSex']:checked").val()
                // , ageType: $("input[name='ageType']:checked").val()
                // , ageDesc: $("#age_desc").val()
                , title: $("#title").val()
                , desc: $("#desc").val()
                , viewYn: $("input[name='view_yn']:checked").val()
                , imageUrl : $("#image_url").val()
                , djKeyword: $("#dj_keyword").val()
            };
            util.getAjaxData("recomm", "/rest/menu/recomm/edit", data, fn_recommEdit_success);
        }
    }


    function fn_recommEdit_success(dst_id, response, param){
        if(response.result != "success"){
            alert("오류");
            return;
        }
        getList();
    }

    function recommDel() {

        var checkDatas = dtList.getCheckedData();

        if(checkDatas.length == 0){
            alert('삭제할 추천 DJ를 Check 하세요.');
            return;
        }
        if(confirm('선택한 추천 DJ를 삭제 하시겠습니까?')){
            var memNoList = "";
            for(var i=0;i<checkDatas.length;i++){
                memNoList += checkDatas[i].mem_no + "@@";
            }
            var data = {
                memNoList : memNoList
            };

            util.getAjaxData("recomm", "/rest/menu/recomm/delete", data, fn_recommEdit_success);
        }
    }

    $(document).on('click', '._previewImage', function(){
      var $imageUrlTarget = $("#image_url");
      var $profileImageTarget = $("#profile_image");
      var image_url = $imageUrlTarget.val();
      var profile_image_url = $profileImageTarget.attr("src");

      if(image_url === '') {
        if(profile_image_url !== '') {
          image_url = profile_image_url;
        }else {
          image_url = defaultImageUrl;
        }
      }
      $('#image_url').val(image_url);
       var img = "<img class='thumbnail fullSize_background no-padding' src='"+image_url+"' style='height:auto; width:100%;margin-bottom: 0px' />";
       $('._previewArea').html(img);
    });
</script>

<script id="tmp_recommMemberInfo" type="text/x-handlebars-template">

    <button type="button" class="btn btn-success pull-right" id="recommEdit" onclick="recommEdit();">저장</button>

    <table class="table table-bordered table-summary pull-right no-margin" style="width: 100%">
        <colgroup>
            <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
            <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
        </colgroup>
        <tr>
            <th class="_bgColor" data-bgcolor="#c6d9f1">No</th>
            <td>{{idx}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">회원번호</th>
            <td><a href="javascript://" class="_openMemberPop" data-memno="{{mem_no}}" id="recomm_mem_no">{{mem_no}}</a></td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">닉네임</th>
            <td>{{memNick}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">등록일시<br/>최종수정일시</th>
            <td>{{regDate}}<br/>{{updDate}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">등록자<br/>최종수정자</th>
            <td>{{reg_opName}}<br/>{{upd_opName}}</td>
        </tr>
        <tr>
            <th colspan="6" class="_bgColor" data-bgcolor="#c6d9f1">추천 DJ 정보</th>
            <th class="_bgColor" data-bgcolor="#c6d9f1">성별</th>
            <td>{{{getCommonCodeRadio memSex 'memSex'}}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">게시여부</th>
            <td>{{{getCommonCodeRadio viewYn 'content_viewOn' 'N' 'view_yn'}}}</td>
        </tr>
        <tr>
            <th colspan="2" class="_bgColor" data-bgcolor="#c6d9f1">방송정보</th>
            <td colspan="4"><input type="text" class="form-control" name="title" id="title" value="{{broadcastTitle}}"></td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">최근 방송일시</th>
            <td>{{last_broadcast}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">추천 팬 등록수</th>
            <td>{{addComma fanCnt}} 명</td>
        </tr>
        <tr>
            <th rowspan="2" colspan="2" class="_bgColor" data-bgcolor="#c6d9f1">이미지 등록</th>
            <td rowspan="2" colspan="3">
                <input type="text" class="form-control" name="image_url" id="image_url" value="{{imageUrl}}">
            </td>
            <td rowspan="2"><button type="button" class="btn btn-default btn-sm _previewImage">미리보기</button></td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">최근 3개월 방송시간</th>
            <td>{{timeStampDay broadcastTime}}</td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">최근 3개월 방송횟수</th>
            <td>{{addComma broadcastCnt}} 회</td>
        </tr>
        <tr>
            <th class="_bgColor" data-bgcolor="#c6d9f1">미리보기</th>
            <td class="_previewArea">
                {{^equal imageUrl ''}}
                    <img class="thumbnail fullSize_background no-padding" src="{{imageUrl}}" style='height:auto; width:100%;margin-bottom: 0px' />
                {{/equal}}
            </td>
            <th class="_bgColor" data-bgcolor="#c6d9f1">프로필 이미지</th>
            <td>
                <img id="profile_image" class="thumbnail fullSize_background no-padding" src="{{renderProfileImage profileImage}}" style='height:auto; width:100%;margin-bottom: 0px' />
            </td>
        </tr>
        <tr>
            <th colspan="2" class="_bgColor" data-bgcolor="#c6d9f1">소개문구</th>
            <td colspan="8"><textarea type="textarea" class="form-control" id="desc" name="desc" style="width: 100%; height: 200px">{{replaceTextarea desc}}</textarea></td>
        </tr>
        <tr>
            <th colspan="2" class="_bgColor" data-bgcolor="#c6d9f1">키워드</th>
            <td colspan="8">
                <textarea type="textarea" class="form-control" id="dj_keyword" name="dj_keyword"
                          placeholder="여기에 작성된 문구는 신규회원 대상 추천DJ 팬등록 유도 페이지에 노출됩니다. (최대 20자)"
                          style="width: 100%; height: 50px">{{replaceTextarea djKeyword}}</textarea>
            </td>
        </tr>
    </table>
</script>