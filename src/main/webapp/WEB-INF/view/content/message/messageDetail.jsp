<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_messageDetail.init();
    });


    var fnc_messageDetail = {}
//=------------------------------ Init / Event / UI--------------------------------------------
    fnc_messageDetail.targetId= "messageDetail";
    fnc_messageDetail.formId= "messageDetailForm";

    fnc_messageDetail.init= function() {
        fnc_messageDetail.target = $("#"+fnc_messageDetail.targetId);
        fnc_messageDetail.target.find("#targetForm").attr("id", fnc_messageDetail.targetId + "Form");
        fnc_messageDetail.formId = fnc_messageDetail.targetId + "Form";

        if(common.isEmpty(getSelectDataInfo())){
            fnc_messageDetail.insertDetail();
        }else{
            var data = new Object();
            data.message_idx = getSelectDataInfo().data.message_idx;

            util.getAjaxData(fnc_messageDetail.targetId, "/rest/content/message/detail",data, fnc_messageDetail.fn_detail_success, fnc_messageDetail.fn_fail);
        }

        // this.initDetail();
        // this.initDetailEvent();
    };


    // 초기 설정
    fnc_messageDetail.initDetail= function() {
        // 캘린더
        fnc_messageDetail.target.find('.input-group.date').datetimepicker({
            format: 'L'
            , date: new Date()
        });

        // 시간 Select CSS 적용
        fnc_messageDetail.target.find("#timeHour").attr("class", "select-time");
        fnc_messageDetail.target.find("#timeMinute").attr("class", "select-time");
    };

    // 이벤트 적용
    fnc_messageDetail.initDetailEvent= function()
    {
        // 발송 버튼
        fnc_messageDetail.target.find("#insertBtn").on("click", function () {
            if(!confirm("발송 하시겠습니까?")){
                return false;
            }

            var data = fnc_messageDetail.getDetailData();

            if(!fnc_messageDetail.isValid(data)){
                return false;
            }

            util.getAjaxData("insert", "/rest/content/message/insert", data, fnc_messageDetail.fn_insert_success, fnc_messageDetail.fn_fail);
        })


        // 재발송 버튼
        fnc_messageDetail.target.find("#updateBtn").on("click", function () {
            if(!confirm("재발송 하시겠습니까?")){
                return false;
            }

            var data = fnc_messageDetail.getDetailData();

            if(!fnc_messageDetail.isValid(data)){
                return false;
            }

            util.getAjaxData("upldate", "/rest/content/message/insert", data, fnc_messageDetail.fn_update_success, fnc_messageDetail.fn_fail);
        })
    };


    //수정 데이터 조회 후 UI 처리
    fnc_messageDetail.initUpdateUI= function(){
        var detailData = getSelectDataInfo().detailData;
        console.log(detailData);

        util.textareaResize(document.getElementById("message-send_cont"));
    };


    // 등록 화면
    fnc_messageDetail.insertDetail= function() {
        var template = $('#tmp_messageDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        fnc_messageDetail.target.find("#" + this.formId).html(templateScript);

        fnc_messageDetail.initDetail();
        fnc_messageDetail.initDetailEvent();

        var scrollPosition = $("#tab_"+fnc_messageDetail.targetId).offset();
        util.scrollPostion(scrollPosition.top);
    };

    // 수정 화면
    fnc_messageDetail.updateDetail= function(){
        var detailData = getSelectDataInfo().detailData;
        var sendTargetList = getSelectDataInfo().sendTargetList;
        detailData.rowNum = getSelectDataInfo().data.rowNum;
        dalbitLog(detailData);

        // form 띄우기
        var template = $('#tmp_messageDetailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = detailData;
        var html = templateScript(context);
        fnc_messageDetail.target.find("#"+ fnc_messageDetail.formId).html(html);

        // target RoomList 띄우기
        var template = $('#tmp_sendTargetList').html();
        var templateScript = Handlebars.compile(template);
        var context = sendTargetList;
        var html = templateScript(context);
        fnc_messageDetail.target.find("#div_targetList").html(html);


        fnc_messageDetail.initDetail();
        fnc_messageDetail.initDetailEvent();
        fnc_messageDetail.initUpdateUI();

        var scrollPosition = $("#tab_"+fnc_messageDetail.targetId).offset();
        util.scrollPostion(scrollPosition.top);
    };

//=------------------------------ Option --------------------------------------------

    // 상세 목록 조회 성공 시
    fnc_messageDetail.fn_detail_success= function(dst_id, data, dst_params){
        if(data.result == "fail"){
            alert(data.message);
            return false;
        }

        setSelectDataInfo("detailData", data.data);
        setSelectDataInfo("sendTargetList", data.summary);

        fnc_messageDetail.updateDetail();
    };


    // 등록 성공 시
    fnc_messageDetail.fn_insert_success= function(dst_id, data, dst_params){
        if(data.result == "fail"){
            alert(data.message);
            return false;
        }

        alert(data.message);
        // alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

        // popup일 경우 창 닫기
        if(fnc_messageDetail.popup){
            opener.fnc_messageList.selectMainList(false);
            window.close();
            return false;
        }

        fnc_messageList.selectMainList(false);

        //하위 탭 초기화
        initContentTab();
        //상단 이동
        $('html').animate({scrollTop : 0}, 100);
        $("#"+fnc_messageDetail.formId).empty();
    };


    // 수정 성공 시
    fnc_messageDetail.fn_update_success= function(dst_id, data, dst_params){
        if(data.result == "fail"){
            alert(data.message);
            return false;
        }

        alert(data.message);
        // alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

        // popup일 경우 창 닫기
        if(fnc_messageDetail.popup){
            opener.fnc_messageList.selectMainList(false);
            window.close();
            return false;
        }

        fnc_messageList.selectMainList(false);

        //하위 탭 초기화
        initContentTab();
        //상단 이동
        $('html').animate({scrollTop : 0}, 100);
        $("#"+fnc_messageDetail.formId).empty();
    };


    // Ajax 실패
    fnc_messageDetail.fn_fail= function(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    };

//=------------------------------ Data Handler ----------------------------------

    // 데이터 가져오기
    fnc_messageDetail.getDetailData= function(){
        var resultJson ={};
        var targetRooms = [];

        var formArray = fnc_messageDetail.target.find("#" + this.formId).serializeArray();
        for (var i = 0; i < formArray.length; i++){
            resultJson[formArray[i]['name']] = formArray[i]['value'];
        }

        if(!common.isEmpty(fnc_messageDetail.room_no && !common.isEmpty(fnc_messageDetail.bj_mem_no))){
            targetRooms.push(fnc_messageDetail.room_no.toString());
            resultJson["send_all"] = "1";
        }else{
            resultJson["send_all"] = "0";
        }

        resultJson["target_rooms"] = targetRooms.toString().replace(/,/gi , "|");
        dalbitLog(resultJson)
        return resultJson;
    };


    fnc_messageDetail.isValid= function(data) {

        if (common.isEmpty(data.title)) {
            alert("제목을 입력하여 주시기 바랍니다.");
            fnc_messageDetail.target.find("input[name=title]").focus();
            return false;
        }

        if (common.isEmpty(data.send_cont)) {
            alert("메시지 내용을 입력하여 주시기 바랍니다.");
            fnc_messageDetail.target.find("input[name=send_cont]").focus();
            return false;
        }

        return true;
    };


//=------------------------------ Modal ----------------------------------
</script>






<!-- =------------------ Handlebars ---------------------------------- -->

<script id="tmp_sendTargetList" type="text/x-handlebars-template">
    <table class="table table-sorting table-hover table-bordered dataTable no-footer">
        <thead>
            <tr>
                <th>No.</th>
                <th>방송 제목</th>
                <th>DJ 아이디</th>
                <th>DJ 닉네임</th>
                <th>성별</th>
            </tr>
        </thead>
        <tbody>
            {{#each this}}
                <tr>
                    <td>{{rowNum}}</td>
                    <td>
                        <a href="javascript://" class="_openBroadcastPop" data-roomNo="{{this.room_no}}">{{this.title}}</a>
                    </td>
                    <td>
                        <a href="javascript://" class="_openMemberPop" data-memNo="{{this.dj_mem_no}}">{{this.dj_mem_no}}</a>
                        <p class="no-margin">{{this.dj_level}} / {{this.dj_grade}}</p>
                    </td>
                    <td>{{this.dj_nickname}}</td>
                    <td>{{{sexIcon this.dj_memSex}}}</td>
                </tr>
            {{/each}}
        </tbody>
    </table>
</script>

<script id="tmp_messageDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="message_idx" value="{{message_idx}}" />
    <div class="row col-lg-12">
        <div class="col-md-12 no-padding">
            <div class="pull-left pb15">
                {{#evalJS_isEmpty 'fnc_messageDetail.room_no'}}
                    {{^message_idx}}ㆍ 방송방 메시지 발송 시 <span style="color:red;">'현재 Live 방송 중인 모든방'</span>에 발송됩니다.{{/message_idx}}
                    {{#message_idx}}
                    ㆍ 재발송 버튼으로 동일한 내용이나 수정한 내용으로 발송이 가능 합니다.<br>
                    ㆍ 재발송 시 하위 '[메시지 발송 방송방 리스트]'가 아닌 <span style="color:red;">'현재 Live 방송 중인 모든방'</span>에 발송됩니다.
                    {{/message_idx}}
                {{else}}
                    ㆍ 발송 버튼으로 입력한 내용을 <span style="color:red;">'해당 방송방'</span>에 운영자 메시지로 발송이 가능 합니다.
                {{/evalJS_isEmpty}}
            </div>
            <div class="pull-right">
                {{^message_idx}}<button class="btn btn-default" type="button" id="insertBtn">발송</button>{{/message_idx}}
                {{#message_idx}}<button class="btn btn-default" type="button" id="updateBtn">재발송</button>{{/message_idx}}
            </div>
        </div>
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
                <col width="8%" />
            </colgroup>
            <tbody>
            <tr>
                <th style="width:16%">제목<br>(Admin 관리용)</th>
                <td style="width:84%" colspan="8"><input type="text" class="form-control" name="title" id="title" placeholder="Admin 관리용 제목입니다." value="{{replaceHtml title}}"></td>
            </tr>
            <tr>
                <th style="width:16%">메시지 내용</th>
                <td style="width:84%" colspan="8">
                    <div>
                        <textarea class="form-control" name="send_cont" id="message-send_cont" rows="8" cols="30" oninput="util.textareaResize(this)" placeholder="전체 방송방에 전달할 메시지 내용을 작성해주세요." style="resize: none" maxlength="300">{{replaceHtml send_cont}}</textarea>
                        <span style="color: red">* 메시지 내용은 300자(한글) 입력 가능합니다.</span>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        {{#message_idx}}
            <div class="col-md-12 no-padding" style="padding-bottom: 15px">
                <div class="pull-left" style="padding-bottom:4px;">
                    <h5><b>[메시지 발송 방송방 리스트]</b></h5><br>
                    ㆍ 메시지를 발송한 방송방 리스트 입니다. <br>
                </div>
                <div class="dataTables_wrapper pb10" id="div_targetList"></div>
            </div>
        {{/message_idx}}
    </div>
</script>