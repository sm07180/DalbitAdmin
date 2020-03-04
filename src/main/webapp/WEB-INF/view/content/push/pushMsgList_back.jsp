<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <div class="row col-lg-12">
        <!-- support ticket form -->
        <div class="col-md-6">
            <div class="col-md-12">
                <label for="push-no" class="col-md-1 control-label">No.</label>
                <div class="col-md-1">
                    <input type="text" class="form-control" id="push-no" placeholder="no">
                </div>
                <label for="push-send-stats" class="col-md-1 control-label">Type</label>
                <div class="col-md-9">
                    <label class="radio-inline">
                        <input type="radio" name="push-send-stats" id="push-send-stats" value="option1" checked="true">미발송
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="push-send-stats" id="push-send-stats" value="option2">발송오류
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="push-send-stats" id="push-send-stats" value="option3">발송완료
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="push-title" class="col-md-2 control-label">메세지 제목</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="push-title" placeholder="title">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">메세지 내용</label>
                <div class="col-md-10">
                    <textarea class="form-control" name="push-content" rows="5" cols="30" placeholder="Message" style="resize: none"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="push-background" class="col-md-2 control-label">배경 색</label>
                <div class="col-md-10">
                    <input type="file" id="push-background">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </div>
            </div>
            <div class="form-group">
                <label for="push-inputImage" class="col-md-2 control-label">메세지 포함 이미지</label>
                <div class="col-md-10">
                    <input type="file" id="push-inputImage">
                    <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                </div>
            </div>
        </div>
    </div>

        <div class="row col-lg-12">
            <legend>General Information</legend>
            <!-- support ticket form -->
            <form class="form-horizontal form-ticket" role="form">
                <fieldset>
                    <div class="row vertical-align">
                        <div class="form-group col-md-4 vertical-align">
                            <label for="ticket-name" class="col-md-2 control-label"><span>No.</span></label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="ticket-no" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="form-group">
                                    <label for="ticket-name" class="col-md-6 control-label">No.</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="ticket-no" placeholder="Name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="ticket-name" class="col-md-6 control-label">No.</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="ticket-no" placeholder="Name">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>


        <%--<div class="col-lg-6 no-padding">--%>
            <%--<h3><i class="fa fa-square"></i> Basic Information</h3>--%>
            <%--<p class="data-row">--%>
                <%--<span class="data-name">Username</span>--%>
                <%--<span class="data-value">jonasmith</span>--%>
            <%--</p>--%>
            <%--<p class="data-row">--%>
                <%--<span class="data-name">Birth Date</span>--%>
                <%--<span class="data-value">Nov 20, 1988</span>--%>
            <%--</p>--%>
            <%--<p class="data-row">--%>
                <%--<span class="data-name">Gender</span>--%>
                <%--<span class="data-value">Male</span>--%>
            <%--</p>--%>
        <%--</div>--%>


        <%--<div class="push-info-edit">--%>
            <%--<h3><i class="fa fa-square"></i> Basic Information</h3>--%>
            <%--<div class="col-lg-6 no-padding">--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Username</span>--%>
                    <%--<span class="data-value">jonasmith</span>--%>
                <%--</p>--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Birth Date</span>--%>
                    <%--<span class="data-value">Nov 20, 1988</span>--%>
                <%--</p>--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Gender</span>--%>
                    <%--<span class="data-value">Male</span>--%>
                <%--</p>--%>
            <%--</div>--%>
            <%--<div class="col-lg-6" no-padding>--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Username</span>--%>
                    <%--<span class="data-value">jonasmith</span>--%>
                <%--</p>--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Birth Date</span>--%>
                    <%--<span class="data-value">Nov 20, 1988</span>--%>
                <%--</p>--%>
                <%--<p class="data-row">--%>
                    <%--<span class="data-name">Gender</span>--%>
                    <%--<span class="data-value">Male</span>--%>
                <%--</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>



<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    function init_pushMsg(tab_id) {
        initEvent_pushMsg(tab_id);
    }


    function initEvent_pushMsg(tab_id){
    }

    function updataPushInfo() {
        alert("test");
    }

    // 검색
    function getPushInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();
    }

    // /*=---------- 엑셀 ----------*/
    // $('#excelDownBtn').on('click', function(){
    //     var formElement = document.querySelector("form");
    //     var formData = new FormData(formElement);
    //
    //     formData.append("search", tmp_search);
    //     formData.append("date", tmp_date);
    //     formData.append("gubun", tmp_gubun);
    //     formData.append("checkDate", tmp_checkDate);
    //     formData.append("stDate", tmp_stDate);
    //     formData.append("edDate", tmp_edDate);
    //     /*formData.append("test003", "test003");*/
    //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    // });

    // $("#excelBtn").on("click", function () {
    //     $("#list_info").table2excel({
    //         exclude: ".noExl",
    //         name: "Excel Document Name",
    //         filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
    //         fileext: ".xls",
    //         exclude_img: true,
    //         exclude_links: true,
    //         exclude_inputs: true
    //     });
    // });
    //
    // function fn_success_excel(){
    //     console.log("fn_success_excel");
    // }
    //
    // function fn_fail_excel(){
    //     console.log("fn_fail_excel");
    // }
    /*----------- 엑셀 ---------=*/
</script>