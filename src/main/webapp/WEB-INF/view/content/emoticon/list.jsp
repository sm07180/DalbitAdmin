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
                    <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                    <div>
                        <span id="searchIsUse"></span>
                        <span id="searchCategory"></span>
                        <%--<span id="searchType"></span>--%>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
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
                                ㆍ 노출여부 및 순위 수정 시 꼭 저장을 클릭해주세요!<br>
                                ㆍ 이모티콘 등록 전, 채팅에서 테스트 후 등록 부탁드립니다.
                            </div>
                            <div class="pull-right">
                                <button type="button" class="btn btn-default btn-sm mr-10 _openCategoryListPop" id="btn_edit_category"><i class="fa fa-edit"></i>카테고리 관리</button>
                                <button type="button" class="btn btn-default btn-sm mr-10" name="btn_add_inssaticon" onclick="viewDetailinssaticon()"><i class="fa fa-plus-square"></i>등록</button>
                                <button type="button" class="btn btn-primary btn-sm" name="btn_order_save_inssaticon" onclick="orderEdit()"><i class="fa fa-floppy-o"></i>적용</button>
                            </div>
                        </div>
                        <div class="widget-content">
                            <table id="tb_inssaticonList" class="table table-sorting table-hover table-bordered no-margin">
                                <colgroup>
                                    <col width="40px"/>
                                    <col width="50px" /> <!-- No -->
                                    <col width="100px" /> <!-- 카테고리 -->
                                    <col width="70px" /> <!-- 페이지 -->
                                    <col width="1000px" /> <!-- 이모티콘 -->
                                    <col width="60px" /> <!-- 노출여부 -->
                                    <col width="120px" /> <!-- 최종수정일 -->
                                    <col width="100px" /> <!-- 최종수정자 -->
                                    <col width="140px" /> <!-- 순위조정 -->
                                </colgroup>
                                <thead>
                                    <th></th>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>페이지</th>
                                    <th>이모티콘</th>
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
                                    <button type="button" class="btn btn-default btn-sm mr-10" name="btn_add_inssaticon" onclick="viewDetailinssaticon()"><i class="fa fa-plus-square"></i>등록</button>
                                    <button type="button" class="btn btn-primary btn-sm" name="btn_order_save_inssaticon" onclick="orderEdit()"><i class="fa fa-floppy-o"></i>적용</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->
        <div class="row col-lg-12 form-inline" id="div_inssaticonAdd" style="display: none;">
            <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
                <li><a href="#inssaticonAdd" role="tab" data-toggle="tab" id="tab_inssaticonAdd">이모티콘등록</a></li>
            </ul>
        </div>
        <div class="row col-lg-12 form-inline">
            <div class="tab-pane fade" id="inssaticonAdd">       <!-- 이모티콘 등록 -->
                <div class="col-md-12 pt10 pb10">
                    <div class="pull-left">
                        ㆍ 이모티콘 신규 등록 시 페이지 단위로 총 6개의 이모티콘이 등록되어야 합니다.<br>
                        ㆍ 최초 등록 시 <span style="color:red">‘비노출’</span> 상태로 등록되니 등록 후 노출 여부를 변경하세요.
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-default btn-sm mr-10" name="btn_add_ok_inssaticon"><i class="fa fa-plus-square"></i>등록</button>
                    </div>
                </div>
                <table id="tb_inssaticonAdd" class="table table-bordered table-dalbit">
                    <colgroup>
                        <col width="20%" /> <!-- 카테고리 -->
                        <col width="80%" /> <!-- 이모티콘 -->
                    </colgroup>
                    <tbody id="addTableBody"></tbody>
                </table>
            </div>
        </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    var tabType = common.isEmpty(<%=in_tabType%>) ? 1 : <%=in_tabType%>;

    $(document).ready(function() {

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getInssaticonInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getInssaticonInfo();
        });
        <!-- 버튼 끝 -->

        $("#searchIsUse").html(util.getCommonCodeSelect(-1, inssaticon_isUse));
        $("#searchCategory").html(util.getCommonCodeSelect(-1, inssaticon_category));

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
            ,'rowNum' : "1111111"
            ,'category' : "1111111"
            ,'getOnOffSwitch' : "1111111"
            ,'last_upd_date' : "1111111"
            ,'opName' : "1111111"
            ,'page' : "1"
            ,'isUse' : "1"
            ,'inssaticon1' : '(^.^)!'
            ,'inssaticon1ClickCnt' : '100'
            ,'inssaticon2' : '(^.^)!'
            ,'inssaticon2ClickCnt' : '200'
            ,'inssaticon3' : '(^.^)!'
            ,'inssaticon3ClickCnt' : '300'
            ,'inssaticon4' : '(^.^)!'
            ,'inssaticon4ClickCnt' : '400'
            ,'inssaticon5' : '(^.^)!'
            ,'inssaticon5ClickCnt' : '500'
            ,'inssaticon6' : '(^.^)!'
            ,'inssaticon6ClickCnt' : '600'
        },{
            'idx' : '2'
            ,'rowNum' : "22"
            ,'category' : "22"
            ,'getOnOffSwitch' : "22"
            ,'last_upd_date' : "22"
            ,'opName' : "22"
            ,'page' : "1"
            ,'isUse' : "1"
            ,'inssaticon1' : '(^.^)!'
            ,'inssaticon1ClickCnt' : '100'
            ,'inssaticon2' : '(^.^)!'
            ,'inssaticon2ClickCnt' : '200'
            ,'inssaticon3' : '(^.^)!'
            ,'inssaticon3ClickCnt' : '300'
            ,'inssaticon4' : '(^.^)!'
            ,'inssaticon4ClickCnt' : '400'
            ,'inssaticon5' : '(^.^)!'
            ,'inssaticon5ClickCnt' : '500'
            ,'inssaticon6' : '(^.^)!'
            ,'inssaticon6ClickCnt' : '600'
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


    // Detail
    function viewDetailinssaticon(data){
        console.log(data);

        $("#tab_inssaticonAdd").click();
        $("#div_inssaticonAdd").show();

        var template = $('#tmp_inssaticonList_detail_Frm').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#addTableBody").html(html);
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
        <td>{{page}}</td>
        <td>
            <div class="row col-md-12">
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon1}}">
                    <span class="col-md-12">클릭수 : {{inssaticon1ClickCnt}}</span>
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon2}}">
                    <span class="col-md-12">클릭수 : {{inssaticon2ClickCnt}}</span>
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon3}}">
                    <span class="col-md-12">클릭수 : {{inssaticon3ClickCnt}}</span>
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon4}}">
                    <span class="col-md-12">클릭수 : {{inssaticon4ClickCnt}}</span>
                </div>
            </div>
            <div class="row col-md-12">
                <div class="col-md-5">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon5}}">
                    <span class="col-md-12">클릭수 : {{inssaticon5ClickCnt}}</span>
                </div>
                <div class="col-md-7">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon6}}">
                    <span class="col-md-12">클릭수 : {{inssaticon6ClickCnt}}</span>
                </div>
            </div>
        </td>
        <td>{{{getOnOffSwitch isUse 'isUse'}}}</td>
        <td>{{last_upd_date}}</td>
        <td>{{opName}}</td>
        <td>
            <button onclick="moveUp(this)">🔺</button>
            <button onclick="moveDown(this)">🔻</button>
        </td>
    </tr>
    {{/each}}
</script>


<script id="tmp_inssaticonList_detail_Frm" type="text/x-handlebars-template">
    <tr>
        <th>카테고리</th>
        <td class="pl15">{{{getCommonCodeSelect category 'inssaticon_category'}}}</td>
    </tr>
    <tr>
        <th>이모티콘</th>
        <td>
            <div class="row col-md-12 pb5 pl0">
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon1}}">
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon2}}">
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon3}}">
                </div>
                <div class="col-md-3">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon4}}">
                </div>
            </div>
            <div class="row col-md-12 pl0">
                <div class="col-md-5">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon5}}">
                </div>
                <div class="col-md-7">
                    <input type="input" class="col-md-12 form-control" style="text-align:center; width:100%" value="{{inssaticon6}}">
                </div>
            </div>
        </td>
    </tr>
</script>