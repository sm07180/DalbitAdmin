<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String in_tabType = request.getParameter("tabtype");
%>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i></h3>
                    <div>
                        <span id="searchCategory_1"></span>
                        <span id="searchIsUse"></span>
                        <%--<span id="searchType"></span>--%>
                        <label><input type="text" class="form-control" id="txt_search_1"></label>
                        <button type="submit" class="btn btn-success" id="bt_search_1">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
                <li><a href="#inssaticonList" role="tab" data-toggle="tab" id="tab_inssaticonList" onclick="inssaticonList(1);">이모티콘관리</a></li>
            </ul>
        </div>
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table" id="div_inssaticonList">
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active " id="inssaticonList">       <!-- 이모티콘 -->
                        <div class="col-md-12 pt10 pb10">
                            <div class="pull-left">
                                ㆍ 이모티콘은 최대 20byte까지 가능합니다. 등록 전, 채팅에서 테스트 꼭 부탁드립니다!
                            </div>
                            <br/>
                            <br/>
                            <div class="pull-left">
                                <span id="searchCategory_2"></span>
                                <label><input type="text" class="form-control" id="txt_search_2"></label>
                                <button type="button" class="btn btn-default btn-sm mr-10" name="btn_add_inssaticon" onclick="viewDetailinssaticon()"><i class="fa fa-plus-square"></i>등록</button>
                            </div>
                            <div class="pull-right">
                                <button type="button" class="btn btn-default btn-sm mr-10 _openCategoryListPop" id="btn_edit_category"><i class="fa fa-edit"></i>카테고리 관리</button>
                                <%--<button type="button" class="btn btn-default btn-sm mr-10" name="btn_add_inssaticon" onclick="viewDetailinssaticon()"><i class="fa fa-plus-square"></i>등록</button>--%>
                                <button type="button" class="btn btn-primary btn-sm" name="btn_order_save_inssaticon" onclick="orderEdit()"><i class="fa fa-floppy-o"></i>저장</button>
                            </div>
                        </div>
                        <div class="widget-content">
                            <table id="tb_inssaticonList" class="table table-sorting table-hover table-bordered no-margin">
                                <colgroup>
                                    <col width="40px"/>
                                    <col width="50px" /> <!-- No -->
                                    <col width="100px" /> <!-- 카테고리 -->
                                    <col width="250px" /> <!-- 이모티콘 -->
                                    <col width="100px" /> <!-- 등록일 -->
                                    <col width="100px" /> <!-- 클릭 수 -->
                                    <col width="100px" /> <!-- 일간 클릭 수 -->
                                    <col width="60px" /> <!-- 노출여부 -->
                                    <col width="120px" /> <!-- 최종수정일 -->
                                    <col width="100px" /> <!-- 최종수정자 -->
                                    <col width="140px" /> <!-- 순위조정 -->
                                </colgroup>
                                <thead>
                                    <th></th>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>이모티콘 내용</th>
                                    <th>등록일</th>
                                    <th>클릭 수</th>
                                    <th>일간 클릭 수</th>
                                    <th>노출여부</th>
                                    <th>최종수정일</th>
                                    <th>최종수정자</th>
                                    <th>순위조정</th>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>
                            <div class="col-md-12 pt10 pb10 pr0 pl0">
                                <div class="pull-left">
                                    <button type="button" class="btn btn-danger btn-sm mr-10" id="btn_delete_inssaticon"><i class="fa fa-edit"></i>선택 삭제</button>
                                </div>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary btn-sm" name="btn_order_save_inssaticon" onclick="orderEdit()"><i class="fa fa-floppy-o"></i>저장</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    var tabType = common.isEmpty(<%=in_tabType%>) ? 1 : <%=in_tabType%>;

    $(document).ready(function() {

        $('input[id="txt_search_1"]').keydown(function() {
            if (event.keyCode === 13) {
                getInssaticonInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search_1').click( function() {       //검색
            getInssaticonInfo();
        });

        $('#bt_search_2').click( function() {       //검색
            getInssaticonInfo();
        });
        <!-- 버튼 끝 -->

        $("#searchIsUse").html(util.getCommonCodeSelect(-1, inssaticon_isUse));
        $("#searchCategory_1").html(util.getCommonCodeSelect(-1, inssaticon_category));
        $("#searchCategory_2").html(util.getCommonCodeSelect(-1, inssaticon_category));

        getInssaticonInfo();
    });

    // list tab 선택 타입
    function inssaticonList(type){
        tabType = type;
    }

    function getInssaticonInfo() {                 // 검색
        if(tabType == "1"){       // 인싸티콘
            $("#tab_inssaticonList").click();
            //TODO 실제 사용시 ajax로 호출
            // util.getAjaxData("editor", "/rest/content/content/inssaticon/list", obj, inssaticon_list_select_success, fn_fail);
            inssaticon_list_select_success();
        }
    }

    //TODO list 호출 후 데이터 처리 필요
    function inssaticon_list_select_success(dst_id, response){
        // dalbitLog(response);
        // dalbitLog(response.data);
        var data = [{
            'idx' : '1'
            ,'rowNum' : "1"
            ,'category' : "기쁨"
            ,'inssaticon' : '(^.^)!'
            ,'reqDate' : "1111.11.11"
            ,'inssaticonClickCnt' : '10'
            ,'inssaticonDayClickCnt' : '10'
            ,'getOnOffSwitch' : "1"
            ,'last_upd_date' : "1234.12.12"
            ,'opName' : "관리자"
            ,'isUse' : "1"
        },{
            'idx' : '2'
            ,'rowNum' : "2"
            ,'category' : "슬픔"
            ,'inssaticon' : 'ㅠㅠㅠㅠ!'
            ,'reqDate' : "1111.11.11"
            ,'inssaticonClickCnt' : '100'
            ,'inssaticonDayClickCnt' : '10'
            ,'getOnOffSwitch' : "2"
            ,'last_upd_date' : "1234.12.12"
            ,'opName' : "관리자"
            ,'isUse' : "1"
        }];

        console.log(data);

        var template = $('#tmp_inssaticonList_view_Frm').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#tableBody").html(html);
    }


    // 순서변경 적용
    function orderEdit(memNo) {
        if(confirm("순서를 변경 하시겠습니까?")) {
            var obj = new Object();
            obj.mem_no = memNo;
            util.getAjaxData("editor", "/rest/content/inssaticon/order/edit", obj, state_edit_success, fn_fail);
        }return false;
    }

    function state_edit_success(dst_id, response) {
        getInssaticonInfo();
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

    function moveUp(el){
        var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
        $tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
    }

    function moveDown(el){
        var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
        $tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
    }
</script>


<script id="tmp_inssaticonList_view_Frm" type="text/x-handlebars-template">
    {{#each this as |data|}}
    <tr>
        <td><input type="checkbox" class="_banwordChk" data-idx="{{idx}}"/></td>
        <td>{{rowNum}}</td>
        <td>{{category}}</td>
        <td>
            <div class="row col-md-12">
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:200px" value="{{inssaticon}}">
                </div>
            </div>
        </td>
        <td>{{reqDate}}</td>
        <td>{{inssaticonClickCnt}}</td>
        <td>{{inssaticonDayClickCnt}}</td>
        <td>{{{getOnOffSwitch isUse 'isUse'}}}</td>
        <td>{{last_upd_date}}</td>
        <td>{{opName}}</td>
        <td>
            <button onclick="moveDown(this)" style="background-color: aqua">🔻</button>
            <button onclick="moveUp(this)" style="background-color: white">🔺</button>
        </td>
    </tr>
    {{/each}}
</script>