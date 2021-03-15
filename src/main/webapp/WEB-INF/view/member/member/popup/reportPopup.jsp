<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<%
    String in_memNo = request.getParameter("memNo");
    String in_fnCallBack = request.getParameter("fnCallBack") == null ? "" : request.getParameter("fnCallBack");
%>

<div class="col-md-12 no-padding" id="report_detail">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">경고/정지</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="col-lg-12 no-padding">
                <label id="report_title"></label>
            </div>

            <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
                <colgroup>
                    <col width="15%"/><col width="22%"/><col width="15%"/><col width="22%"/><col width="15%"/><col width="21%"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th colspan="6">대상자</th>
                    <tr>
                        <th>아이디</th>
                        <td style="text-align: left" id="td_memId"></td>
                        <th>닉네임</th>
                        <td style="text-align: left" id="td_memNick"></td>
                        <th>성별</th>
                        <td style="text-align: left" id="td_memSex"></td>
                    </tr>
                    <tr>
                        <th>신고사유</th>
                        <td style="text-align: left"><span id="declaration_reason"></span></td>

                        <th>조치범위</th>
                        <td colspan="3" style="text-align: left"><span id="blockScope_area"></span></td>
                    </tr>
                    <tr>
                        <th>제재조치</th>
                        <td colspan="5" style="text-align: left"><span id="member_declaration_slctType"></span></td>
                    </tr>
                    <tr>
                        <th>조치사항 선택</th>
                        <td colspan="5" style="text-align: left;height: 142px;">
                            <span id="declaration_Message"></span>
                            <input type="text" id="txt_declaration_message" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <th>운영자 메모</th>
                        <td colspan="5" style="text-align: left;height: 142px;">
                            <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 100%;height: 100%"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>등록/처리일시</th>
                        <td colspan="5" style="text-align: left" id="td_date"></td>
                    </tr>
                    <tr>
                        <th>운영자명</th>
                        <td colspan="5" style="text-align: left" id="td_adminName"></td>
                    </tr>
                </tbody>
            </table>

            <div class="col-md-12 no-padding mt10" style="text-align: center">
                <button type="button" id="bt_complet" class="btn btn-default btn-sm">처리완료</button>
                <button type="button" id="bt_close" class="btn btn-default btn-sm" onclick="window.close();" >취소</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/message/customer/declarationMessage.js?${dummyData}"></script>

<script>

    var memNo =  '${param.memNo}';
    var memId =  '';
    var memNick =  '';
    var memSex =  '';
    var deviceUuid =  '';
    var ip =  '';
    var fnCallBack =  '${param.fnCallBack}';

    $(document).ready(function() {

        getMemberInfo();

        $('#report_title').html("ㆍ운영자에 의해 경고 또는 정지/강제탈퇴 등의 처리가 가능합니다.<br/>ㆍ해당 유저를 제외한 경고/정지/탈퇴 처리 시 사유를 메모에 남겨주세요.");
        $("#declaration_reason").html(util.getCommonCodeSelect(-1, declaration_reason,"Y"));
        $("#blockScope_area").html(util.getCommonCodeCheck(-1, block_scope,"Y"));
        $("#member_declaration_slctType").html(util.getCommonCodeRadio(2, member_declaration_slctType));
        $("#declaration_Message").html(util.getCommonCodeCheck(-1, declaration_Message,"Y"));

    });

    $('#bt_complet').on('click', function() {           //운영자 메모 등록
        bt_complet_click(this.id);
    });

    function getMemberInfo(){
        var data = {
            mem_no : memNo
        }
        util.getAjaxData("info", "/rest/member/member/info", data, function(dist_id, response){

            var resData = response.data;
            memId = resData.userId;
            memNick = resData.nickName;
            memSex = resData.memSex;
            deviceUuid = resData.deviceUuid;
            ip = resData.ip;

            $('#td_memId').html(memId);
            $('#td_memNick').html(memNick);
            if(memSex == "m")
                $('#td_memSex').html("<label style=\"color: blue\">남</label>");
            else if(memSex == "f")
                $('#td_memSex').html("<label style=\"color: red\">여</lable>");
            else
                $('#td_memSex').html("미선택");
        });
    }

    //아이디, 디바이스 아이디 default로 check한다.
    $("#blockScope_3").attr({
        'checked' : 'checked'
        , 'disabled' : 'disabled'
    });
    $("#blockScope_1").attr('checked', 'checked');




    function bt_complet_click(){
        // if (common.isEmpty($("#txt_adminMemo").val())) {
        //     alert("등록할 운영자 메모를 입력해 주십시오.");
        //     return;
        // }
        var reportMessage ="";
        $('input:checkbox[name="declaration_Message"]').each(function() {
            if(this.checked){           //checked 처리된 항목의 값
                if(this.id == "declaration_Message99" ){
                    reportMessage = reportMessage + " - " + this.value + " : " + $("#txt_declaration_message").val() + "\n";
                }else {
                    reportMessage = reportMessage + " - " + this.value + "\n";
                }
            }
        });
        if($("#declaration_Message99").prop('checked')){
            if($("#txt_declaration_message").val().length < 1){
                alert("기타 사유를 입력해 주십시오.");
                return;
            }
        }
        if(reportMessage == ""){
            alert("조치사항을 선택해 주십시오.");
            return;
        }

        var strName = ADMIN_NICKNAME;
        var date = new Date();
        var timestamp = date.getFullYear() + "-" +
            common.lpad(date.getMonth() + 1,2,"0") + "-" +
            common.lpad(date.getDate(),2,"0");
            + " " +
            common.lpad(date.getHours(),2,"0") + "." +
            common.lpad(date.getMinutes(),2,"0") + "." +
            common.lpad(date.getSeconds(),2,"0");

        var msgValue;
        var msgTitle;
        var radioValue = $('input:radio[name="slctType"]:checked').val();
        var blockDay = 0;
        if(radioValue == 6 || radioValue == 7){
            msgValue = declarationMessage.out;
            msgTitle = declarationMessage.outTitle;
        } else if(radioValue == 8) {
            msgValue = declarationMessage.pause;
            msgTitle = declarationMessage.pauseTitle;

        } else if(radioValue == 3 || radioValue == 4 || radioValue ==5){
            if(radioValue == 3){blockDay = 1;}
            if(radioValue == 4){blockDay = 3;}
            if(radioValue == 5){blockDay = 7;}
            msgValue = declarationMessage.stop;
            msgTitle = declarationMessage.stopTitle;
        } else if(radioValue == 2) {
            msgValue = declarationMessage.warning;
            msgTitle = declarationMessage.warningTitle;
        }

        msgValue = msgValue.replace(/{{name}}/gi, strName)
            .replace(/{{nickName}}/gi, memNick)
            .replace(/{{message}}/gi, reportMessage)
            .replace(/{{timestamp}}/gi, timestamp)
            .replace(/{{blockDay}}/gi, blockDay)

        msgTitle = msgTitle.replace(/{{name}}/gi, strName)
            .replace(/{{nickName}}/gi, memNick)
            .replace(/{{message}}/gi, reportMessage.replace(/\-/gi, "<br>-"))
            .replace(/{{timestamp}}/gi, timestamp)
            .replace(/{{blockDay}}/gi, blockDay)

        if(confirm("신고 하시겠습니까?")) {
            var obj = new Object();
            obj.mem_no = memNo;             // 신고자 대상 ID검색용
            obj.slctReason = $('#slctReason').val();
            obj.slctType = $('input:radio[name="slctType"]:checked').val();
            obj.memo = $("#txt_adminMemo").val();
            obj.notiContents = msgValue;
            obj.notimemo = msgTitle;
            //obj.blockScope = $("blockScope_deviceUuid").
            obj.blockScope = $("#blockScope_1").prop('checked')+','+$("#blockScope_2").prop('checked')+','+$("#blockScope_3").prop('checked');

            obj.blockScopeText = deviceUuid +','+ ip + ',' + memNo;

            util.getAjaxData("report", "/rest/member/member/report", obj, update_success);
        }return false;

    }

    function update_success(dst_id, response) {
        if(!common.isEmpty(fnCallBack)){
            eval("window.opener." + fnCallBack + "(memNo)");
        }else{
            window.opener.getMemNo_info_reload(memNo);
        }
        alert(response.message);
        window.close();
    }
</script>