<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i>현재 접속자 회원 검색</h3>
                    <div>
                        <span id="searchType"></span>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="no-padding col-lg-12" id="infoTab">
            <jsp:include page="infoTab.jsp"/>
        </div>
    </div> <!-- // wrapper -->
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>

<script type="text/javascript">
    $(function() {

        //현재 접속자 통계 현황
        getLoginLiveInfo();
    });

    function getLoginLiveInfo(){
        util.getAjaxData("infoLive", "/rest/connect/login/info/live", null, fn_loginLive_success);
    }

    function fn_loginLive_success(data, response){
        $("#loginLiveTableBody").empty();

        var template = $('#tmp_loginLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#loginLiveTableBody").append(html);

    }

</script>

<script type="text/x-handlebars-template" id="tmp_loginLive">
    <tr style="color: blue">
        <th>{{{sexIcon 'm'}}}</th>
        <td>{{addComma m_now_cnt}}</td>
        <td>{{addComma m_yes_cnt}}</td>
        <td class="{{upAndDownClass m_now_inc_cnt}}"><i class="fa {{upAndDownIcon m_now_inc_cnt}}"></i> {{addComma m_now_inc_cnt}}</td>
        <td>{{addComma m_week_cnt}}</td>
        <td>{{addComma m_bweek_cnt}}</td>
        <td class="{{upAndDownClass m_week_inc_cnt}}"><i class="fa {{upAndDownIcon m_week_inc_cnt}}"></i> {{addComma m_week_inc_cnt}}</td>
        <td>{{addComma m_month_cnt}}</td>
        <td>{{addComma m_bmonth_cnt}}</td>
        <td class="{{upAndDownClass m_month_inc_cnt}}"><i class="fa {{upAndDownIcon m_month_inc_cnt}}"></i> {{addComma m_month_inc_cnt}}</td>
    </tr>
    <tr style="color: red">
        <th>{{{sexIcon 'f'}}}</th>
        <td>{{addComma f_now_cnt}}</td>
        <td>{{addComma f_yes_cnt}}</td>
        <td class="{{upAndDownClass f_now_inc_cnt}}"><i class="fa {{upAndDownIcon f_now_inc_cnt}}"></i> {{addComma f_now_inc_cnt}}</td>
        <td>{{addComma f_week_cnt}}</td>
        <td>{{addComma f_bweek_cnt}}</td>
        <td class="{{upAndDownClass f_week_inc_cnt}}"><i class="fa {{upAndDownIcon f_week_inc_cnt}}"></i> {{addComma f_week_inc_cnt}}</td>
        <td>{{addComma f_month_cnt}}</td>
        <td>{{addComma f_bmonth_cnt}}</td>
        <td class="{{upAndDownClass f_month_inc_cnt}}"><i class="fa {{upAndDownIcon f_month_inc_cnt}}"></i> {{addComma f_month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>알수없음</th>
        <td>{{addComma n_now_cnt}}</td>
        <td>{{addComma n_yes_cnt}}</td>
        <td class="{{upAndDownClass n_now_inc_cnt}}"><i class="fa {{upAndDownIcon n_now_inc_cnt}}"></i> {{addComma n_now_inc_cnt}}</td>
        <td>{{addComma n_week_cnt}}</td>
        <td>{{addComma n_bweek_cnt}}</td>
        <td class="{{upAndDownClass n_week_inc_cnt}}"><i class="fa {{upAndDownIcon n_week_inc_cnt}}"></i> {{addComma n_week_inc_cnt}}</td>
        <td>{{addComma n_month_cnt}}</td>
        <td>{{addComma n_bmonth_cnt}}</td>
        <td class="{{upAndDownClass n_month_inc_cnt}}"><i class="fa {{upAndDownIcon n_month_inc_cnt}}"></i> {{addComma n_month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>합계</th>
        <td>{{addComma t_now_cnt}}</td>
        <td>{{addComma t_yes_cnt}}</td>
        <td class="{{upAndDownClass t_now_inc_cnt}}"><i class="fa {{upAndDownIcon t_now_inc_cnt}}"></i> {{addComma t_now_inc_cnt}}</td>
        <td>{{addComma t_week_cnt}}</td>
        <td>{{addComma t_bweek_cnt}}</td>
        <td class="{{upAndDownClass t_week_inc_cnt}}"><i class="fa {{upAndDownIcon t_week_inc_cnt}}"></i> {{addComma t_week_inc_cnt}}</td>
        <td>{{addComma t_month_cnt}}</td>
        <td>{{addComma t_bmonth_cnt}}</td>
        <td class="{{upAndDownClass t_month_inc_cnt}}"><i class="fa {{upAndDownIcon t_month_inc_cnt}}"></i> {{addComma t_month_inc_cnt}}</td>
    </tr>
</script>