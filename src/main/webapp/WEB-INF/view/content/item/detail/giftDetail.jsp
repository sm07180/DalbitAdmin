<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>


<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_giftDetail.init();
    });


    var fnc_giftDetail = {
//=------------------------------ Init / Event--------------------------------------------
        "targetId": "giftDetail",
        "formId" : "giftDetailForm",

        init() {
            this.target = $("#"+this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_giftDetail.insertEventDetail();
            }else{
                console.log(getSelectDataInfo());

                var data = new Object();
                data.item_code = getSelectDataInfo().data.item_code;

                util.getAjaxData(fnc_giftDetail.targetId, "/rest/content/item/gift/detail",data, fnc_giftDetail.fn_detail_success, fnc_giftDetail.fn_fail);
            }

            // this.initDetail();
            // this.initEventDetail();
        },


        // 초기 설정
        initDetail() {

        },

        // 이벤트 적용
        initEventDetail(){

            //로그인 타입 선택
            this.target.find("input[name='loginType']:radio").change(function () {
                var type = this.value;

                //로그인 사용자일 경우 성별 선택 가능
                if(type == "1"){
                    this.target.find("input[name='gender']").prop("disabled",false);
                }else{
                    this.target.find("input[name='gender']").prop("disabled",true);
                    this.target.find("input[name='gender']:input[value='1']").prop("checked", true);
                }

            });


            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {
                var data = fnc_giftDetail.getDetailData();

                if(!fnc_giftDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("insert", "/rest/content/item/gift/insert", data, fnc_giftDetail.fn_insert_success, fnc_giftDetail.fn_fail);
            })


            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                var data = fnc_giftDetail.getDetailData();

                if(!fnc_giftDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("upldate", "/rest/content/item/gift/update", data, fnc_giftDetail.fn_update_success, fnc_giftDetail.fn_fail);
            })
        },


        //수정 데이터 조회 후 UI 처리
        initUpdateUI(){
            var detailData = getSelectDataInfo().detailData;

            console.log(detailData);

            //platform
            var platformCode = detailData.platform.split("");
            for(var i = 0; i < platformCode.length; i++){
                if(platformCode[i] == "1"){
                    fnc_giftDetail.target.find("#platform"+(i+1)).attr("checked", true);
                }
            }


            //item_type
            var item_typeCode = detailData.item_type.split("");
            for(var i = 0; i < item_typeCode.length; i++){
                if(item_typeCode[i] == "1"){
                    fnc_giftDetail.target.find("#item_type"+(i+1)).attr("checked", true);
                }
            }
        },


        // 등록 화면
        insertEventDetail() {
            var template = $('#tmp_chargeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            this.target.find("#"+this.formId).html(templateScript);

            this.initDetail();
            this.initEventDetail();
        },


        // 수정 화면
        updateEventDetail(){
            var detailData = getSelectDataInfo().detailData;
            detailData.rowNum = getSelectDataInfo().data.rowNum;
            dalbitLog(detailData);


            // form 띄우기
            var template = $('#tmp_giftDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = detailData;
            var html = templateScript(context);
            fnc_giftDetail.target.find("#"+ fnc_giftDetail.formId).html(html);

            fnc_giftDetail.initDetail();
            fnc_giftDetail.initEventDetail();
            fnc_giftDetail.initUpdateUI();
        },

//=------------------------------ Option --------------------------------------------

        // 상세 목록 조회 성공 시
        fn_detail_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            setSelectDataInfo("detailData", data.data);

            fnc_giftDetail.updateEventDetail();
        },


        // 등록 성공 시
        fn_insert_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_giftList.selectEventList();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_giftDetail.formId).empty();
        },


        // 수정 성공 시
        fn_update_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_giftList.selectEventList();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_giftDetail.formId).empty();
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
            var platformCnt = fnc_giftDetail.target.find("input[name=platform]").length;
            var platform = "";
            for(var i = 0; i < platformCnt; i++){
                if(fnc_giftDetail.target.find("#platform"+(i+1)).is(":checked")){
                    platform += "1";
                }else{
                    platform += "0";
                }
            }
            resultJson['platform'] = platform;

            //item_type
            var item_typeCnt = fnc_giftDetail.target.find("input[name=item_type]").length;
            var item_type = "";
            for(var i = 0; i < item_typeCnt; i++){
                if(fnc_giftDetail.target.find("#item_type"+(i+1)).is(":checked")){
                    item_type += "1";
                }else{
                    item_type += "0";
                }
            }
            resultJson['item_type'] = item_type;

            //discount_rate
            var discount_rate = fnc_giftDetail.target.find("input[name=discount_rate]:checked");
            if(discount_rate.val() == "-1"){
                resultJson['discount_rate'] = fnc_giftDetail.target.find("#inputDiscountEtc").val();
            }


            //item_price_ios TODO 알아봐야함...
            resultJson['item_price_ios'] = 0;

            dalbitLog(resultJson);
            return resultJson;
        },


        isValid(data){
            if(common.isEmpty(data.item_code)){
                alert("아이템 코드를 입력하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=item_code]").focus();
                return false;
            }

            if(common.isEmpty(data.item_name)){
                alert("아이템 명을 입력하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=item_name]").focus();
                return false;
            }

            if(common.isEmpty(data.dal)){
                alert("지급 수량(달)을 입력하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=dal]").focus();
                return false;
            }

            if(common.isEmpty(data.item_price)){
                alert("아이템 가격을 입력하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=item_price]").focus();
                return false;
            }

            if(common.isEmpty(data.discount_rate) || (data.discount_rate < 0 || data.discount_rate > 100)){
                alert("아이템 할인율을 확인하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=discount_rate]").focus();
                return false;
            }

            if(common.isEmpty(data.view_yn)){
                alert("게시 여부를 확인하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=view_yn]").focus();
                return false;
            }

            if(common.isEmpty(data.main_yn)){
                alert("메인 노출 여부를 확인하여 주시기 바랍니다.");
                fnc_giftDetail.target.find("input[name=main_yn]").focus();
                return false;
            }

            return true;
        },

    }
//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_giftDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="giftIdx" value="{{giftIdx}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 스토어 페이지에서 구매 또는 선물할 수 있는 아이템을 등록 및 관리하는 페이지입니다.
            </div>
            <div class="pull-right">
                {{^giftIdx}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/giftIdx}}
                {{#giftIdx}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/giftIdx}}
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
                    <th rowspan="2">No</th>
                    <td rowspan="2">{{giftIdx}}</td>

                    <th rowspan="2">플랫폼</th>
                    <td colspan="2" rowspan="2">{{{getCommonCodeCheck -1 'content_platform3' 'Y'}}}</td>

                    <th rowspan="2">아이템 코드</th>
                    <td colspan="3" rowspan="2"></td>

                    <th>등록/수정자</th>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th>등록/수정일시</th>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <th>아이템명</th>
                    <td colspan="8">
                        <input type="text" class="form-control" id="gift-itemNm" name="giftItemNm" placeholder="아이템명을 입력하여 주시기 바랍니다." value="{{column02}}">
                    </td>

                    <th>게시여부</th>
                    <td colspan="2">{{{getCommonCodeRadio 1 'content_viewOn'}}}</td>
                </tr>
                <tr>
                    <th>사용영역</th>
                    <td colspan="3">{{{getCommonCodeSelect 0 'item_useArea'}}}</td>

                    <th>파일등록 필드</th>
                    <td colspan="3">{{{getCommonCodeSelect 1 'item_fileField'}}}</td>

                    <th>플레이타임 제한</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="gift-playTime" name="giftPlayTime" placeholder="아이템 노출 시간" value="{{column02}}" style="width:70%;"/>
                            <span>(초)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>타입</th>
                    <td colspan="5">{{{getCommonCodeCheck 1 'item_itemType'}}}</td>

                    <th>가격 (달)</th>
                    <td colspan="5">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="gift-price" name="giftPrice" placeholder="아이템 구매 달 수량." value="{{column02}}" style="width: 70%;" onkeydown="common.inputFilterNumber(event)">
                            <span>(달)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td colspan="11">{{{getCommonCodeRadio -1 'item_discount'}}}</td>
                </tr>
                <tr>
                    <th>Webp 이미지 URL</th>
                    <td colspan="5">
                        <input type="text" id="gift-itemImg" name="giftItemImg" style="width:70%">
                        <input type="button" value="미리보기" onclick="getImg('giftItemImg')">
                    </td>

                    <th>Json 이미지 URL</th>
                    <td colspan="5">
                        <input type="text" id="gift-jsonImg" name="giftJsonImg" style="width:70%">
                        <input type="button" value="미리보기" onclick="getImg('giftJsonImg')">
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <!--미리보기-->
                        <a href="javascript:;"><img id="giftItemImgViewer" style="max-width:360px; max-height:450px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                    </td>

                    <td colspan="6">
                        <!--미리보기-->
                        <a href="javascript:;"><img id="giftJsonImgViewer" style="max-width:360px; max-height:450px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                    </td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td colspan="4">
                        <input type="text" id="gift-thumbImg" name="giftThumbImg" style="width:70%">
                        <input type="button" value="미리보기" onclick="getImg('giftThumbImg')">
                    </td>
                    <td colspan="1">
                        <!--미리보기-->
                        <a href="javascript:;"><img id="giftThumbImgViewer" style="width:70px; height:70px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                    </td>

                    <th>운영자 메모</th>
                    <td colspan="5">
                        <textarea class="form-control" name="giftNote" id="gift-note" rows="5" cols="30" placeholder="메모." style="resize: none" maxlength="200"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</script>