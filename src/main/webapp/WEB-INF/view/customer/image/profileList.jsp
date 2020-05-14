
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline mb15">
            <div class="widget-content">
                <div class="row col-md-12" style="padding:5px 15px 15px 15px;">
                    <div class="pull-left">
                        •  운영정책에 어긋난 이미지는 [이미지초기화]버튼을 통해 서비스 제공 이미지로 초기화가 되고, 해당회원의 마이페이지>알림을 통해 확인이 가능합니다.<br>
                        •  PC와 Mobile 사이즈는 PC 프로필: 500px X500px /Mobile 프로필 : 120X120px (각각 1:1 비율)입니다.

                    </div>
                </div>

                <div class="dataTables_paginate paging_full_numbers" id="profileList_info_paginate_top"></div>
                <div class="row list-group king-gallery">
                <%--<div class="row list-group">--%>
                    <form id="profileListForm"></form>
                </div>
                <div class="dataTables_paginate paging_full_numbers" id="profileList_info_paginate"></div>
            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        fnc_profileList.init();
    });

var fnc_profileList = {

//=------------------------------ Init / Event--------------------------------------------
    "targetId": "profileList",
    "formId" : "profileListForm",
    "pagingInfo" : new PAGING_INFO(0, 1, 54),

    init() {
        this.target = $("#"+this.targetId);
        this.targetDataTableId = "list_info_"+this.targetId;
        this.target.find("#list_info").attr("id", this.targetDataTableId);
        this.targetDataTable = this.target.find("#"+this.targetDataTableId);
        this.divDataTable = this.targetDataTable.parent("div");


        fnc_profileList.initDataTable();
    },


    initDataTable() {
        console.log(fnc_profileList.pagingInfo)

        $("#pageStart").val(fnc_profileList.pagingInfo.pageNo);
        $("#pageCnt").val(fnc_profileList.pagingInfo.pageCnt);

        util.getAjaxData(fnc_profileList.targetId, "/rest/customer/image/profile/list", $("#searchForm").serialize(), fnc_profileList.fn_select_success, fnc_profileList.fn_fail);
    },


    // DataTable Button
    initDataTableButton() {
    },



    initEvent(){
    },


//=------------------------------ Option --------------------------------------------

    // 등록
    insertEvent() {
        //등록을 위한 데이터 초기화
        initSelectDataInfo();

        $("#tab_profileDetail").click();
    },

    // 삭제
    deleteEvent() {
        var checkDatas = fnc_profileList.dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        dalbitLog(checkDatas);
        if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){

            var itemCodes = "";
            for(var idx=0; idx < checkDatas.length; idx++){
                var dataInfo = checkDatas[idx];
                if(common.isEmpty(dataInfo.item_code)){
                    dalbitLog("[delete] Item code does not exist. : ");
                    dalbitLog(dataInfo);
                    continue;
                }

                itemCodes += "," + dataInfo.item_code;
            }
            itemCodes = itemCodes.substring(1);

            var data = new Object();
            data.item_code = itemCodes;

            util.getAjaxData(fnc_profileList.targetId, "/rest/content/item/profile/delete",data, fnc_profileList.fn_delete_success, fnc_profileList.fn_fail);
        };
    },

    // 수정
    updateData(dom) {
        var data = $(dom).data("info");
        console.log(data);

        if(common.isEmpty(data.image_profile.path)){
            alert("대상은 이미 초기이미지 입니다.");
            return false;
        }

        if(confirm("대상의 이미지를 초기화 하시겠습니까?")){
            report = "/customer/image/popup/imagePopup?memNo='" + encodeURIComponent(data.mem_no) + "'&memId='"
                                                                + encodeURIComponent(data.mem_userid) + "'&memNick='"
                                                                + encodeURIComponent(common.replaceHtml(data.mem_nick)) + "'&memSex='"
                                                                + encodeURIComponent(data.mem_sex) + "'&targetId='"
                                                                + encodeURIComponent(fnc_profileList.targetId) + "'";
            console.log(report);
            util.windowOpen(report,"600","450","경고/정지");
        }
    },

    fn_select_success(dst_id, response, dst_params){
        console.log(response.data)
        // form 띄우기
        var template = $('#tmp_profileSelectFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        fnc_profileList.target.find("#"+ fnc_profileList.formId).html(html);

        var pagingInfo = response.pagingVo;
        fnc_profileList.pagingInfo.totalCnt = pagingInfo.totalCnt;
        console.log(fnc_profileList.pagingInfo);
        util.renderPagingNavigation("profileList_info_paginate_top", fnc_profileList.pagingInfo);
        util.renderPagingNavigation("profileList_info_paginate", fnc_profileList.pagingInfo);

        fnc_profileList.initEvent();
    },


    // 삭제 성공 시
    fn_update_success(dst_id, data, dst_params){
        alert(data.message);

        // reload
        fnc_profileList.selectMainList();
    },


    // Ajax 실패
    fn_fail(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    },


    // 검색
    selectMainList(){
        fnc_profileList.initDataTable();
    },
}
</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_profileSelectFrm" type="text/x-handlebars-template">
    {{#each this as |user|}}
        <div class="item col-md-2 col-sm-6" style="padding-bottom: 25px;">
            <div>
                <label>NO.{{user.rowNum}}</label>
            </div>
            <div style="border: 1px solid #ddd; border-radius: 4px; padding: 4px;">
            <div class="thumbnail">
                <img class="list-group-image thumbnail" style="width:100%; height:100%;" src="{{user.image_profile.url}}?360x360" alt="" data-toggle="modal" data-target="#imgModal" onclick="fullSize_image('{{user.image_profile.url}}')"/>
                <div class="caption">
                    <div class="action-buttons">
                        <a href="javascript://" class="btn btn-danger btn-xs" onclick="fnc_profileList.updateData(this)" data-info="{{json user}}"><i class="fa fa-undo"></i> 초기화</a>
                    </div>
                </div>
            </div>
            <div>
                <h3 class="inner list-group-item-heading">
                    <a href="javascript://" class="_openMemberPop" data-memno="{{user.mem_no}}">
                        <h5>{{user.mem_userid}}</h5>
                    </a>
                </h3>
                <ul class="list-unstyled">
                    <li><strong>Nick:</strong> {{replaceHtml user.mem_nick}}</li>
                    <li><strong>No:</strong> {{user.mem_no}}</li>
                </ul>
            </div>
            </div>
        </div>
    {{else}}
    <div class="col-md-12" style="text-align:center">
        <label>{{isEmptyData}}</label>
    </div>
    {{/each}}
</script>
