<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i><span id="title"/></h3>
                    <div>
                        <span id="broadTip_objType"></span>
                        <span id="broadTip_viewType"></span>
                        <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                    </div>
                </div>
            </div>
            <div class="col-md-12 no-padding">
                <hr class="one">
                <div class="col-md-6 no-padding">
                    <span class="font-bold" style="font-size: 26px">방송TIP 관리</span><br/>
                    <span style="font-size: 14px">방송에서 DJ 및 청취자에게 보여지는 방송 TIP 메시지입니다.</span>
                </div>
                <div class="col-md-6 no-padding">
                    <button type="button" class="btn btn-default btn-sm pull-right">등록</button>
                </div>
            </div>
            <div class="col-md-12 no-padding">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table class="table table-sorting table-hover table-bordered datatable">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>노출 대상</th>
                                    <th>TIP 내용</th>
                                    <th>노출 여부</th>
                                    <th>최종 수정일시</th>
                                    <th>최종 수정자</th>
                                </tr>
                            </thead>
                            <tbody id="broadCastTip_list">

                            </tbody>
                        </table>
                    </div>
                </div>
                <button type="button" class="btn btn-default btn-sm pull-left">선택삭제</button>
            </div>
            <div class="col-md-12 no-padding">
                <hr class="one">
                <span class="font-bold" style="font-size: 26px">방송 TIP 상세</span>
                <button type="button" class="btn btn-default btn-sm pull-right">저장</button>
            </div>
            <div class="col-md-12 no-padding">
                <div id="broadCastTip_detail"></div>
            </div>
        </div>
        <!-- //serachBox -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $("#broadTip_objType").html(util.getCommonCodeSelect(-1,broadTip_objType));
        $("#broadTip_viewType").html(util.getCommonCodeSelect(-1,broadTip_viewType));
        init()
    });

    function init(){
        var template = $('#tmp_broadCastTip_detail').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript();
        $('#broadCastTip_detail').html(html);
    }

</script>


<script id="tmp_broadCastTip_detail" type="text/x-handlebars-template">

    <div class="widget widget-table">
        <div class="widget-content">
            <table class="table table-sorting table-hover table-bordered datatable">
                <tbody>
                    <tr>
                        <th>노출 대상</th>
                        <td>{{check}}</td>
                        <th>노출여부</th>
                        <td>{{radio}}</td>
                        <th>최종수정일시</th>
                        <th>{{lastDate}}</th>
                        <th>최종수정자</th>
                        <th>{{opName}}</th>
                    </tr>
                    <tr>
                        <th>메시지 내용</th>
                        <th>
                            <textarea type="textarea" class="form-control" id="content" name="content" style="width: 100%; height: 100px">{{content}}</textarea>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


</script>