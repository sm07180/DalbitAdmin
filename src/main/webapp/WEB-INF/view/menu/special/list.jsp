<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
                <!-- serachBox -->
                <form id="searchForm">
                    <div class="row col-lg-12 form-inline">
                        <div class="widget widget-table searchBoxArea">
                            <div class="widget-header searchBoxRow">
                                <h3 class="title"><i class="fa fa-search"></i> DJ 검색</h3>
                                <div>
                                    <span id="searchYearArea"></span>
                                    <span id="searchMonthArea"></span>
                                    <span id="searchArea"></span>
                                    <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- //serachBox -->

                <!-- tab -->
                <div class="row col-lg-12 form-inline">
                    <div class="no-padding" id="listTab">
                        <jsp:include page="listTab.jsp"/>
                    </div>
                </div>
                <!-- //tab -->
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<jsp:include page="/WEB-INF/view/common/util/select_specialList.jsp"></jsp:include>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    $(function() {
        $('#searchYearArea').html(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), special_selectYears));
        $('#searchMonthArea').html(util.getCommonCodeSelect(moment(new Date()).format('MM'), special_selectMonths));
        $('#searchArea').html(util.getCommonCodeSelect(-1, special_searchType));

        getList();
    });

    $('#bt_search').on('click', function () {
        $('#dalList, #sampleDalList, #reqDalList').empty();
        var tab = $('#tablist_con li.active');
        var tabIndex = $('#tablist_con li').index(tab);
        if (tabIndex == 0) {
            init();
        } else if (tabIndex == 1) {
            initReq();
        }
    });

    $('input[id="txt_search"]').keydown(function () {
        var tab = $('#tablist_con li.active');
        var tabIndex = $('#tablist_con li').index(tab);
        if (event.keyCode == 13) {
            $('#dalList, #sampleDalList, #reqDalList').empty();
            if (tabIndex == 0) {
                init();
            } else if (tabIndex == 1) {
                initReq();
            }
        }
    });

    function choiceMember(data) {
        if(confirm('스페셜 DJ로 등록하시겠습니까?')){
            var obj = {
                mem_no : data.mem_no
                , is_force : 1
                , select_year : $('#select_year').val()
                , select_month : $('#select_month').val()
            };
            util.getAjaxData("ok", "/rest/menu/special/reqOk", obj, fn_success_ok);
        }
        return false;
    }

    function fn_success_ok(dst_id, response) {
        alert(response.message);
        getList();
    }


    function sendPush(mem_no){
        if(common.isEmpty(mem_no)){
            console.log("[PUSH] 발송 mem_no 미존재!");
            return false;
        }

        var data = {
            mem_nos: mem_no
            ,send_cnt: 0
            ,send_title: "스페셜 DJ로 선정되었어요."
            ,send_cont: "스페셜 DJ로 선정되었습니다. 다양한 혜택을 경험해보세요."
            // ,board_idx: "102"
            ,slct_push: "7"
            ,is_all: "7"
            ,platform: "111"
            ,status: 0
            ,msg_type: 0
            ,image_type: 1
            ,is_direct: 0
        };
        dalbitLog(data);

        util.getAjaxData("insert", "/rest/content/push/insert", data, function(dst_id, data, dst_params){
            console.log("[PUSH SEND RESULT]");
            console.log(data.message);
        });
    }

</script>

<script id="tmp_summary" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{addComma approveDal}}건</td> <%-- 승인 달D --%>
        <td style="color: #ff0000;">{{addComma requestDal}}건</td> <%-- 총 신청 달D--%>
    </tr>
    {{/data}}
</script>