<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <div class="col-md-3 no-padding">
                <label>ㆍ해당 회원의 1:1문의, 전화문의, 메일 문의 전체 <br/> 내역을 리스트로 확인할 수 있습니다.</label>
            </div>
            <div class="col-md-9 no-padding pull-right">
                <div class="widget widget-table">
                    <div class="widget-content" style="border-top-width:0px;padding-bottom: 0px;">
                        <table id="top_info" class="table table-sorting table-hover table-bordered">
                            <thead id="table_Top"></thead>
                            <tbody id="table_Body"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 no-padding">
            <div class="widget widget-table">
                <div class="widget-content">
                    <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                        <thead id="tableTop_detail">
                        </thead>
                        <tbody id="tableBody_detail">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding" id="question_tab">
            <jsp:include page="questionTab.jsp"></jsp:include>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    // $('#question_tab').hide();
    function getHistory_question(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();

        var top = tmp.replace("Detail","_top");
        var source = MemberDataTableSource[top];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_info"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }

    function Question(index){

        $('#question_tab').show();
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('Question~ roomNo : ' + roomNo);
    }

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");
    $('#call_title').html("ㆍ전화문의 시 정보를 등록하고 처리 한 정보입니다.<br>ㆍ전화문의 시 회원이 문의 한 내용을 최대한 자세히 작성해 주세요.");
    $('#mail_title').html("ㆍ회원의 메일 문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

</script>
