<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <form id="targetForm"></form>
</div>




<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function () {
        fnc_exchangeDetail.init();
    });


    var fnc_exchangeDetail = {
//=------------------------------ Init / Event--------------------------------------------
        "targetId": "exchangeDetail",
        "formId" : "exchangeDetailForm",

        init() {
            this.target = $("#"+this.targetId);
            this.target.find("#targetForm").attr("id", this.targetId + "Form");
            this.formId = this.targetId + "Form";

            if(common.isEmpty(getSelectDataInfo())){
                fnc_exchangeDetail.insertDetail();
            }else{
                console.log(getSelectDataInfo());

                var data = new Object();
                data.item_code = getSelectDataInfo().data.item_code;

                util.getAjaxData(fnc_exchangeDetail.targetId, "/rest/content/item/exchange/detail",data, fnc_exchangeDetail.fn_detail_success, fnc_exchangeDetail.fn_fail);
            }

            // this.initDetail();
            // this.initDetailEvent();
        },


        // 초기 설정
        initDetail() {

        },

        // 이벤트 적용
        initDetailEvent(){

            //플랫폼 IOS일 경우 코드 수기 입력
            this.target.find("input[name='platform']:radio").change(function () {
                var type = this.value;

                if(type == "001"){
                    fnc_exchangeDetail.target.find("input[name=item_code]").show();
                }else{
                    fnc_exchangeDetail.target.find("input[name=item_code]").hide();
                    fnc_exchangeDetail.target.find("input[name=item_code]").val("");
                }
            });


            // 등록 버튼
            this.target.find("#insertBtn").on("click", function () {
                var data = fnc_exchangeDetail.getDetailData();

                if(!fnc_exchangeDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("insert", "/rest/content/item/exchange/insert", data, fnc_exchangeDetail.fn_insert_success, fnc_exchangeDetail.fn_fail);
            })


            // 수정 버튼
            this.target.find("#updateBtn").on("click", function () {
                var data = fnc_exchangeDetail.getDetailData();

                if(!fnc_exchangeDetail.isValid(data)){
                    return false;
                }

                util.getAjaxData("upldate", "/rest/content/item/exchange/update", data, fnc_exchangeDetail.fn_update_success, fnc_exchangeDetail.fn_fail);
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
                    if(i == 0 || i == 1)    // 110
                    {
                        fnc_exchangeDetail.target.find("#platform1").attr("checked", true);
                        fnc_exchangeDetail.target.find("input[name=item_code]").hide();
                    }

                    if(i == 2){             //001
                        fnc_exchangeDetail.target.find("#platform2").attr("checked", true);
                        fnc_exchangeDetail.target.find("input[name=item_code]").show();
                    }
                }
            }


            //item_type
            var item_typeCode = detailData.item_type.split("");
            for(var i = 0; i < item_typeCode.length; i++){
                if(item_typeCode[i] == "1"){
                    fnc_exchangeDetail.target.find("#item_type"+(i+1)).attr("checked", true);
                }
            }
        },


        // 등록 화면
        insertDetail() {
            var template = $('#tmp_exchangeDetailFrm').html();
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
            var template = $('#tmp_exchangeDetailFrm').html();
            var templateScript = Handlebars.compile(template);
            var context = detailData;
            var html = templateScript(context);
            fnc_exchangeDetail.target.find("#"+ fnc_exchangeDetail.formId).html(html);

            fnc_exchangeDetail.initDetail();
            fnc_exchangeDetail.initDetailEvent();
            fnc_exchangeDetail.initUpdateUI();
        },

//=------------------------------ Option --------------------------------------------

        // 상세 목록 조회 성공 시
        fn_detail_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            setSelectDataInfo("detailData", data.data);

            fnc_exchangeDetail.updateDetail();
        },


        // 등록 성공 시
        fn_insert_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_exchangeList.selectMainList();

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_exchangeDetail.formId).empty();
        },


        // 수정 성공 시
        fn_update_success(dst_id, data, dst_params){
            if(data.result == "fail"){
                alert(data.message);
                return false;
            }

            alert(data.message);

            fnc_exchangeList.selectMainList();

            //하위 탭 초기화
            initContentTab();
            //상단 이동
            $('html').animate({scrollTop : 0}, 100);
            $("#"+fnc_exchangeDetail.formId).empty();
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

            //item_type
            var item_typeCnt = fnc_exchangeDetail.target.find("input[name=item_type]").length;
            var item_type = "";
            for(var i = 0; i < item_typeCnt; i++){
                if(fnc_exchangeDetail.target.find("#item_type"+(i+1)).is(":checked")){
                    item_type += "1";
                }else{
                    item_type += "0";
                }
            }
            resultJson['item_type'] = item_type;

            //discount_rate
            var discount_rate = fnc_exchangeDetail.target.find("input[name=discount_rate]:checked");
            if(discount_rate.val() == "-1"){
                resultJson['discount_rate'] = fnc_exchangeDetail.target.find("#inputDiscountEtc").val();
            }


            //item_price_ios TODO 알아봐야함...
            resultJson['item_price_ios'] = 0;

            dalbitLog(resultJson);
            return resultJson;
        },


        isValid(data){

            if(common.isEmpty(data.platform) || data.platform == "000"){
                alert("플랫폼을 선택하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=platform]").focus();
                return false;
            }

            if(data.platform == "001" && common.isEmpty(data.item_code)){
                alert("아이템 코드를 입력하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=item_code]").focus();
                return false;
            }

            if(common.isEmpty(data.item_name)){
                alert("아이템 명을 입력하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=item_name]").focus();
                return false;
            }

            if(common.isEmpty(data.dal)){
                alert("지급 수량(달)을 입력하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=dal]").focus();
                return false;
            }

            if(common.isEmpty(data.item_price)){
                alert("아이템 가격을 입력하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=item_price]").focus();
                return false;
            }

            if(common.isEmpty(data.discount_rate) || (data.discount_rate < 0 || data.discount_rate > 100)){
                alert("아이템 할인율을 확인하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=discount_rate]").focus();
                return false;
            }

            if(common.isEmpty(data.view_yn)){
                alert("게시 여부를 확인하여 주시기 바랍니다.");
                fnc_exchangeDetail.target.find("input[name=view_yn]").focus();
                return false;
            }

            return true;
        },

    }
//=------------------------------ Modal ----------------------------------



</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_exchangeDetailFrm" type="text/x-handlebars-template">
    <input type="hidden" name="item_code" value="{{item_code}}" />
    <div class="row col-lg-12">
        <div class="row col-md-12" style="padding-bottom: 15px">
            <div class="pull-left">
                • 별을 달로 교환하는 아이템을 등록 및 관리하는 페이지입니다.
                <br>
                • 각 서비스 내 적용사항만 입력하세요.
            </div>
            <div class="pull-right">
                {{^item_code}}<button class="btn btn-default" type="button" id="insertBtn">등록하기</button>{{/item_code}}
                {{#item_code}}<button class="btn btn-default" type="button" id="updateBtn">수정하기</button>{{/item_code}}
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
                    <td rowspan="2">{{item_code}}</td>

                    <th rowspan="2">플랫폼</th>
                    <td colspan="2" rowspan="2">{{{getCommonCodeRadio platform 'content_platform3' 'Y' 'platform'}}}</td>

                    <th rowspan="2">아이템 코드</th>
                    <td colspan="3" rowspan="2">
                        {{^item_code}}<input type="text" class="form-control" id="exchange-item_code" name="item_code" placeholder="아이템코드를 입력하여 주시기 바랍니다." style="display:none;">{{/item_code}}
                        {{#item_code}}{{this}}{{/item_code}}
                    </td>

                    <th>등록/수정자</th>
                    <td colspan="2">{{opName}}</td>
                </tr>
                <tr>
                    <th>등록/수정일시</th>
                    <td colspan="2">{{lastupdDate}}</td>
                </tr>
                <tr>
                    <th>아이템명</th>
                    <td colspan="3">
                        <input type="text" class="form-control" id="exchange-item_name" name="item_name" placeholder="아이템명을 입력하여 주시기 바랍니다." value="{{item_name}}">
                    </td>

                    <th>지급 수량 (달)</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="exchange-dal" name="dal" placeholder="지급될 달 수량." value="{{dal}}" style="width: 70%;" onkeydown="common.inputFilterNumber(event)">
                            <span>(달)</span>
                        </div>
                    </td>

                    <th>가격</th>
                    <td colspan="3">
                        <div class="form-inline">
                            <input type="text" class="form-control" id="exchange-item_price" name="item_price" placeholder="아이템 구매 별 수량." value="{{item_price}}" style="width:70%;" onkeydown="common.inputFilterNumber(event)">
                            <span>(별)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>할인율</th>
                    <td colspan="3">{{{getCommonCodeRadio discount_rate 'item_discount'}}}</td>

                    <th>타입</th>
                    <td colspan="3">{{{getCommonCodeHorizontalCheck item_type 'item_itemType'}}}</td>

                    <th>게시여부</th>
                    <td colspan="3">{{{getCommonCodeRadio view_yn 'content_viewOn' 'N' 'view_yn'}}}</td>
                </tr>
                <tr>
                    <th>아이템 이미지 URL</th>
                    <td colspan="5">
                        <input type="text" id="exchange-item_image" name="item_image" style="width:70%" value="{{item_image}}">
                        <input type="button" value="미리보기" onclick="getImg('exchange-item_image')">
                    </td>

                    <th>썸네일 (공통)</th>
                    <td colspan="4">
                        <input type="text" id="exchange-item_thumbnail" name="item_thumbnail" style="width:70%" value="{{item_thumbnail}}">
                        <input type="button" value="미리보기" onclick="getImg('exchange-item_thumbnail')">
                    </td>
                    <td colspan="1">
                        <!--미리보기-->
                        <a href="javascript:;"><img id="exchange-item_thumbnailViewer" style="width:70px; height:70px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <!--미리보기-->
                        <a href="javascript:;"><img id="exchange-item_imageViewer" style="max-width:360px; max-height:450px;" src="" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/></a>
                    </td>

                    <th>상품상세 설명</th>
                    <td colspan="5">
                        <textarea class="form-control" name="desc" id="exchange-desc" rows="5" cols="30" placeholder="아이템 상세 내용을 입력하여 주시기 바랍니다." style="resize: none" maxlength="200">{{desc}}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</script>