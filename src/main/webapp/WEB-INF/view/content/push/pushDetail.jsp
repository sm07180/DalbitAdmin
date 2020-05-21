<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_pushDetail.init();
    });


    var fnc_pushDetail = {
//=------------------------------ Init / Event / UI--------------------------------------------
        "targetId": "pushDetail",
        "formId" : "pushDetailForm",

        init() {
            this.target = $("#"+this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_pushDetail.insertDetail();
            }else{
                var data = new Object();
                data.push_idx = getSelectDataInfo().data.push_idx;

                util.getAjaxData(fnc_pushDetail.targetId, "/rest/content/push/detail",data, fnc_pushDetail.fn_detail_success, fnc_pushDetail.fn_fail);
            }

            // this.initDetail();
            // this.initDetailEvent();
        },


        // 초기 설정
        initDetail() {
            // 캘린더
            this.target.find('.input-group.date').datetimepicker({
                format: 'L'
                , date: new Date()
            });

            // 시간 Select CSS 적용
            this.target.find("#timeHour").attr("class", "select-time");
            this.target.find("#timeMinute").attr("class", "select-time");
        },

        // 이벤트 적용
        initDetailEvent()
        {

            //수신대상 선택
            /*this.target.find("input[name='is_all']").change(function () {
                if ($(this).val() == "7") { //지정 회원
                    fnc_pushDetail.target.find("#btn_selectMember").prop("disabled", false);
                    fnc_pushDetail.target.find("#div_selectTarget").show();
                } else {
                    fnc_pushDetail.target.find("#btn_selectMember").prop("disabled", true);
                    fnc_pushDetail.target.find("#div_selectTarget").hide();
                    fnc_pushDetail.target.find("#div_selectTarget").empty();
                }
            });*/


            //OS 구분
            this.target.find("input[name='platform']").change(function () {
                if ($(this).val() == "-1") {
                    if ($(this).is(":checked")) {
                        fnc_pushDetail.target.find("input[name='platform']").each(function () {
                            this.checked = true;
                        });
                    } else {
                        fnc_pushDetail.target.find("input[name='platform']").each(function () {
                            this.checked = false;
                        });
                    }
                } else {
                    if ($(this).is(":checked")) {
                        var cntTotal = fnc_pushDetail.target.find("input[name='platform']").length;
                        var cntChecked = fnc_pushDetail.target.find("input[name='platform']:checked").length;
                        if ((cntTotal) == (cntChecked + 1)) {
                            fnc_pushDetail.target.find("input[name='platform'][value='-1']").prop("checked", true);
                        }
                    } else {
                        fnc_pushDetail.target.find("input[name='platform'][value='-1']").prop("checked", false);
                    }
                }
            });


            //발송여부 선택
            this.target.find("input[name='is_direct']:radio").change(function () {
                var type = this.value;

                //예약 발송 일 경우 날짜 추가
                if (type == "1") {
                    fnc_pushDetail.target.find("#push-div-sendDate").show();
                } else {
                    fnc_pushDetail.target.find("#push-div-sendDate").hide();
                }
            });

            // 지정회원 - 수신대상
            this.target.find("#btn_selectMember").on("click", function () {
                showPopMemberList(fnc_pushDetail.choiceMember);
            })


            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {
                if(!confirm("등록 하시겠습니까?")){
                    return false;
                }

                var data = fnc_pushDetail.getDetailData();

                if(!fnc_pushDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("insert", "/rest/content/push/insert", data, fnc_pushDetail.fn_insert_success, fnc_pushDetail.fn_fail);
            })


            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                if(!confirm("재발송 하시겠습니까?")){
                    return false;
                }

                var data = fnc_pushDetail.getDetailData();

                if(!fnc_pushDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("upldate", "/rest/content/push/insert", data, fnc_pushDetail.fn_update_success, fnc_pushDetail.fn_fail);
            })
        },


        //수정 데이터 조회 후 UI 처리
        initUpdateUI(){
            var detailData = getSelectDataInfo().detailData;
            console.log(detailData);


            //OS 구분
            if(detailData.platform == "111"){
                fnc_pushDetail.target.find("input[name='platform']").each(function () {
                    this.checked = true;
                });
            }else{
                fnc_pushDetail.target.find("input[name='platform']").each(function () {
                    this.checked = false;
                });

                var arrayPlatform = detailData.platform.split('');
                for(var idx in arrayPlatform){
                    if(arrayPlatform[idx] == 1){
                        var value = parseInt(idx) + 1;
                        fnc_pushDetail.target.find("input[name='platform'][value='"+ value +"']").prop("checked", true);
                    }
                }
            }


            // 지정회원일 경우 추가처리
            if(detailData.is_all == "7"){
                var selectTarget = detailData.mem_info;
                var data = {};
                for(var idx in selectTarget){
                    var data = selectTarget[idx];
                    fnc_pushDetail.choiceMember(data);
                }
            }

            //예약 발송 일 경우 날짜 데이터 추가
            if (detailData.is_direct == "1") {
                fnc_pushDetail.target.find("#push-div-sendDate").show();

                var sendDate = moment(detailData.send_datetime);

                // 캘린더 초기값
                fnc_pushDetail.target.find("#push-div-sendDate").find("#push-sendDate").val(sendDate.format('YYYY.MM.DD'));

                // 시간 Select CSS 적용
                fnc_pushDetail.target.find("#push-div-sendDate").find("#timeHour").val(sendDate.hour().toString().length == 1?("0"+sendDate.hour()):sendDate.hour());
                fnc_pushDetail.target.find("#push-div-sendDate").find("#timeMinute").val(sendDate.minute().toString().length == 1?("0"+sendDate.minute()):sendDate.minute());

            }
        },


        // 등록 화면
        insertDetail() {
            var template = $('#tmp_pushDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#"+this.formId).html(templateScript);

            this.initDetail();
            this.initDetailEvent();
        },

        // 수정 화면
        updateDetail(){
            var detailData = getSelectDataInfo().detailData;
            detailData.rowNum = getSelectDataInfo().data.rowNum;
            dalbitLog(detailData);


            // form 띄우기
            var template = $('#tmp_pushDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = detailData;
            var html = templateScript(context);
            fnc_pushDetail.target.find("#"+ fnc_pushDetail.formId).html(html);

            fnc_pushDetail.initDetail();
            fnc_pushDetail.initDetailEvent();
            fnc_pushDetail.initUpdateUI();
        },

//=------------------------------ Option --------------------------------------------

        // 상세 목록 조회 성공 시
        fn_detail_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            setSelectDataInfo("detailData", data.data);

            fnc_pushDetail.updateDetail();
        },


        // 등록 성공 시
        fn_insert_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

            fnc_pushList.selectMainList(false);

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_pushDetail.formId).empty();
        },


        // 수정 성공 시
        fn_update_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message +'\n- 성공 : ' + data.data.sucCnt + '건\n- 실패 : ' + data.data.failCnt +'건');

            fnc_pushList.selectMainList(false);

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_pushDetail.formId).empty();
        },


        // Ajax 실패
        fn_fail(data, textStatus, jqXHR){
            alert(data.message);

            console.log(data, textStatus, jqXHR);
        },

//=------------------------------ Data Handler ----------------------------------

        // 데이터 가져오기
        getDetailData(){
            var resultJson ={};

            var formArray = this.target.find("#" + this.formId).serializeArray();
            for (var i = 0; i < formArray.length; i++){
                resultJson[formArray[i]['name']] = formArray[i]['value'];
            }


            //platform
            if(fnc_pushDetail.target.find("#platform-1").is(":checked")){
                resultJson['platform'] = "111";
            }else{
                var platformCnt = fnc_pushDetail.target.find("input[name=platform]").length;
                var platform = "";
                for(var i = 1; i < platformCnt; i++){
                    if(fnc_pushDetail.target.find("#platform"+(i)).is(":checked")){
                        platform += "1";
                    }else{
                        platform += "0";
                    }
                }
                resultJson['platform'] = platform;
            }

            //Date 처리이이이~~~
            var sendDateDiv = fnc_pushDetail.target.find("#push-div-sendDate");
            resultJson['send_datetime'] = sendDateDiv.find("#push-sendDate").val().replace(/[^0-9]/gi, '') + sendDateDiv.find("#timeHour").val() + sendDateDiv.find("#timeMinute").val();

            //지정회원 parsing
            var selectTarget = [];
            var send_cnt = -1;
            if (fnc_pushDetail.target.find("input[name=is_all]:checked").val() == "7") {
                send_cnt = fnc_pushDetail.target.find("#div_selectTarget").find("p").length;
                fnc_pushDetail.target.find("#div_selectTarget").find("p").each(function () {
                    var id = $(this).prop("id");
                    selectTarget.push(id);
                })

                resultJson['mem_nos'] = selectTarget.toString().replace(/,/gi , "|");
            }

            resultJson['send_cnt'] = send_cnt;

            dalbitLog(resultJson)
            return resultJson;
        },


        isValid(data) {
            if (common.isEmpty(data.platform) || data.platform == "000") {
                alert("노출 OS 구분을 선택하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=platform]").focus();
                return false;
            }

            if (common.isEmpty(data.send_title)) {
                alert("메시지 제목을 입력하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=title]").focus();
                return false;
            }

            if (common.isEmpty(data.send_cont)) {
                alert("메시지 내용을 입력하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=send_cont]").focus();
                return false;
            }

            if (common.isEmpty(data.is_all)) {
                alert("수신대상 구분을 선택하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=is_all]").focus();
                return false;
            }

            if (data.is_all == "7") {
                if (common.isEmpty(data.mem_nos)) {
                    alert("발송 대상을 선택하여 주시기 바랍니다.");
                    fnc_pushDetail.target.find("#btn_selectMember").focus();
                    return false;
                }
            }

            if (common.isEmpty(data.msg_type)) {
                alert("메세지 구분을 선택하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=msg_type]").focus();
                return false;
            }

            if (common.isEmpty(data.is_direct)) {
                alert("발송 구분을 선택하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=is_direct]").focus();
                return false;
            }

            if (data.is_direct == "1") {
                var sendDate = common.stringToDateTime(data.send_datetime);
                if(sendDate < moment()){
                   if(!confirm("예약발송 시간이 현재 시간보다 이전 시간 입니다.\n그래도 예약발송을 진행 하시겠습니까?")){
                       return false;
                   }
                }
            }

            if (common.isEmpty(data.slct_push)) {
                alert("푸시 타입을 선택하여 주시기 바랍니다.");
                fnc_pushDetail.target.find("input[name=slct_push]").focus();
                return false;
            }


            return true;
        },


//=------------------------------ Modal ----------------------------------

        // [수신대상 선택 - 지정회원] 회원 추가
        choiceMember(data) {
            var html = '<p id="' + data.mem_no + '">' + data.mem_nick + '(' +data.mem_userid+ ') <a style="cursor: pointer;" onclick="fnc_pushDetail.delMember($(this))">[X]</a></p>'

            if(fnc_pushDetail.target.find("#div_selectTarget").find("p").length >= 20){
                alert("수신대상자는 최대 20명까지 지정 가능합니다.");
                return false;
            }

            fnc_pushDetail.target.find("#div_selectTarget").append(html);
        },

        // [수신대상 선택 - 지정회원] 회원 삭제
        delMember(dom) {
            dom.parent("p").remove();
        },

    }
</script>






<!-- =------------------ Handlebars ---------------------------------- -->

<script id="tmp_pushDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="push_idx" value="{{push_idx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                ㆍ <b>*</b> 는 필수 입력사항 입니다. <br>
                ㆍ 발송 상태를 확인하시고 미발송 또는 발송오류 시 해당 정보가 맞는지 확인한 후 수정완료를 하시면 재발송이 가능합니다.
            </div>
            <div class="pull-right">
                {{^push_idx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/push_idx}}
                {{#push_idx}}<button class="btn btn-default" type="button" id="updateBtn">재발송</button>{{/push_idx}}
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
            <tr class="align-middle">
                <th>No</th>
                <td>{{rowNum}}</td>

                <th>발송상태</th>
                <td colspan="3">
                    {{^push_idx}}
                        {{{getCommonCodeLabelAndHidden 0 'push_snedStatus' 'status'}}}
                    {{/push_idx}}
                    {{#push_idx}}
                        {{{getCommonCodeLabelAndHidden ../status 'push_snedStatus' 'status'}}}
                    {{/push_idx}}
                </td>

                <th>노출 OS구분</th>
                <%--<td colspan="5">{{{getCommonCodeRadio -1 'push_platform'}}}</td>--%>
                <td colspan="5">
                    <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform-1" value="-1" checked="true"><span>전체</span> </label>
                    <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform1" value="1" checked="true"><span>PC</span></label>
                    <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform2" value="2" checked="true"><span>Android</span></label>
                    <label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="platform" id="platform3" value="3" checked="true"><span>IOS</span></label>
                </td>
            </tr>
            <tr>
                <th>메세지 제목</th>
                <td colspan="5"><input type="text" class="form-control" name="send_title" id="push-send_title" placeholder="제목을 입력해주세요." value="{{send_title}}"></td>

                <th rowspan="2">수신대상 선택</th>
                <td colspan="5" rowspan="2">
                    <div>
                        <label class="control-inline fancy-radio custom-color-green"><input type="radio" value="11" id="is_all11" name="is_all" class="form-control"><span><i></i>전체</span> </label>
                        <%--<label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="is_all" value="1" checked="true"><span>생방송</span></label>--%>
                        <%--<label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="is_all" value="2" checked="true"><span>여자</span></label>--%>
                        <%--<label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="is_all" value="3" checked="true"><span>남자</span></label>--%>
                        <%--<label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="is_all" value="4" checked="true"><span>로그인</span></label>--%>
                        <%--<label class="control-inline fancy-checkbox custom-color-green"><input type="checkbox" name="is_all" value="5" checked="true"><span>비로그인</span></label>--%>
                        <div>
                            <label class="control-inline fancy-radio custom-color-green"><input type="radio" value="7" id="is_all7" name="is_all" class="form-control" checked="checked"><span><i></i>지정 회원 </span></label>
                            <input type="button" value="회원검색" class="btn btn-success btn-xs" id="btn_selectMember"/>
                        </div>
                    </div>
                    <div id="div_selectTarget" style="padding-left: 30px;">
                    </div>
                </td>
            </tr>
            <tr>
                <th rowspan="2">메세지 내용</th>
                <td colspan="5" rowspan="2">
                    <div>
                        <textarea class="form-control" name="send_cont" id="push-send_cont" rows="5" cols="30" placeholder="방송 시스템에 적용되는 내용을 작성해주세요." style="resize: none" maxlength="40">{{send_cont}}</textarea>
                        <span style="color: red">* 메시지 내용은 10자~40자(한글) 입력 가능합니다.</span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>메세지 구분</th>
                <td colspan="5">{{{getCommonCodeRadio msg_type 'push_messageType' 'N' 'msg_type'}}}</td>
            </tr>
            <tr>
                <th>이동 링크</th>
                <td colspan="5"><input type="text" class="form-control _trim" name="link_url" id="push-link_url" placeholder="푸시 클릭 시 이동 URL을 입력해주세요." value="{{link_url}}"></td>

                <th>발송여부</th>
                <td colspan="5">
                    <div>
                        {{{getCommonCodeRadio is_direct 'push_sendType' 'N' 'is_direct'}}}
                    </div>
                    <div class="input-group date" id="push-div-sendDate" style="display:none;">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" class="form-control" id="push-sendDate" style="width:100px">
                        {{{getCommonCodeSelect 00 'timeHour'}}}
                        <span> : </span>
                        {{{getCommonCodeSelect 00 'timeMinute'}}}
                    </div>
                </td>
            </tr>
            <tr>
                <!--
                <th>메세지 포함 이미지</th>
                <td colspan="5">
                    <div>
                        <input type="file" id="push-inputImg">
                        <p class="help-block"><em>Valid file type: .jpg, .png, .txt, .pdf. File size max: 1 MB</em></p>
                    </div>
                </td>
                -->
                <th>푸시 타입</th>
                <td colspan="5">{{{getCommonCodeRadio slct_push 'push_slctPush2' 'N' 'slct_push'}}}</td>

                <th>등록일</th>
                <td colspan="5">{{regDate}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</script>