<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 결제내역 검색</h3>
                        <div>
                            <span id="selJoinDate"></span>
                            <div class="input-group date" id="seldate">
                                <label for="onedayDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar" id="seldateDateBtn"></i></span>
                                </label>
                                <input type="text" class="form-control" id="onedayDate" name="onedayDate" style="width: 110px">
                            </div>
                            <input type="text" class="form-control" id="txt_search">
                            <button type="button" id="bt_search" class="btn btn-success">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
        </form>
        <div id="payList"><jsp:include page="./payList.jsp"/></div>

    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript">

    var date = new Date();
    var sDate;
    var eDate;
    var dtList_info;

    $(document).ready(function() {
    });

    $("#selJoinDate").html(util.getCommonCodeRadio(3, joinDate));
    $("#onedayDate").val(date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0") +"-"+ common.lpad(date.getDate(),2,"0"));
    sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");        //오늘
    getPayListInfo();

    $('#seldate').datetimepicker({
        format: 'L',
        maxDate:new Date(),
        format: "YYYY-MM-DD",

    });

    $('input[id="txt_search"]').keydown(function() {
        if (event.keyCode === 13) {
            getPayListInfo();
        };
    });

    $('#bt_search').click( function() {       //검색
        getPayListInfo();
    });

    $("#seldate").addClass('hide');
    $('#selJoinDate').change(function() {
        sDate = "";
        eDate = "";

        $("#seldate").addClass('hide');
        eDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");         // 오늘
        if($('input[name="joinDate"]:checked').val() == "0"){               // 월
            sDate = date.getFullYear() + common.lpad(date.getMonth(),2,"0") + common.lpad(date.getDate(),2,"0");        // 한달전
        }else if($('input[name="joinDate"]:checked').val() == "1"){               // 주
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() + common.lpad(sDate.getMonth() + 1,2,"0") + common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
        }else if($('input[name="joinDate"]:checked').val() == "2"){               // 전일
            eDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");      // 어제
            sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate()-1,2,"0");      //어제
        }else if($('input[name="joinDate"]:checked').val() == "3"){               // 당일
            sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");        //오늘
        }else if($('input[name="joinDate"]:checked').val() == "4"){               // 당일
            $("#seldate").removeClass('hide');
        }
        $("#onedayDate").val(date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0") +"-"+ common.lpad(date.getDate(),2,"0"));
        getPayListInfo();
    });

</script>