<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">

                <!-- serachBox -->
                <form id="searchForm">
                    <div class="widget widget-table searchBoxArea form-inline">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> DJ 검색</h3>
                            <div>
                                <span id="searchArea"></span>
                                <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <button type="button" class="btn btn-primary pull-right" id="memSearch" name="memSearch"><i class="fa fa-search"></i>운영자 직접 등록</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- //serachBox -->

                <!-- summary -->
                <div class="widget-content">
                    <table class="table table-bordered table-summary">
                        <thead>
                        <tr>
                            <th>총 신청 달D</th>
                            <th>승인 달D</th>
                        </tr>
                        </thead>
                        <tbody id="summaryTableBody">
                        </tbody>
                    </table>
                </div>
                <!-- //summary -->

                <!-- tab -->
                <div class="no-padding" id="listTab">
                    <jsp:include page="listTab.jsp"/>
                </div>
                <!-- //tab -->

        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<jsp:include page="/WEB-INF/view/common/util/select_specialList.jsp"></jsp:include>

<script type="text/javascript">

    $(document).ready(function() {
        $('#searchArea').html(util.getCommonCodeSelect(-1, special_searchType));
        getSummary();
    });

    function getSummary(){
        util.getAjaxData("summary", "/rest/menu/special/summary", null, fn_summary_success);
    }

    function fn_summary_success(dst_id, response){
        var template = $('#tmp_summary').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#summaryTableBody").empty().append(html);
    }

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

    $('#memSearch').on('click', function() {
       showPopMemberList(choiceMember);
    });

    function choiceMember(data) {
        if(confirm('스페셜 DJ로 등록하시겠습니까?')){
            var obj = {
                mem_no : data.mem_no
                , is_force : 1
            };
            util.getAjaxData("ok", "/rest/menu/special/reqOk", obj, fn_success_ok);
        }
        return false;
    }

    function fn_success_ok(dst_id, response) {
        alert(response.message);
        getList();
    }
</script>

<script id="tmp_summary" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{addComma requestDal}}건</td> <%-- 총 신청 달D--%>
        <td>{{addComma approveDal}}건</td> <%-- 승인 달D --%>
    </tr>
    {{/data}}
</script>