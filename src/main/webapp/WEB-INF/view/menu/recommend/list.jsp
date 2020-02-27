
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table" style="margin-bottom: 10px;">
                        <div class="widget-header" style="border-bottom-width:0px;">
                            <h3><i class="fa fa-search"></i> 추천/인기DJ 검색</h3>
                            <div>
                                <select class="form-control" name="selectGubun" style="margin-left:10px;background:#ffffff;">
                                    <option value="" selected="selected">전체</option>
                                    <option value="1">User ID</option>
                                    <option value="2">User 닉네임</option>
                                    <option value="3">연락처</option>
                                    <option value="4">이름</option>
                                </select>
                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="submit" class="btn btn-success" id="bt_search">검색</button>

                                <%--<div class="btn-group widget-header-toolbar">
                                    <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                        <i class="fa fa-chevron-up" id=""></i>
                                    </a>
                                </div>--%>
                            </div>
                        </div>
                    </div>



                    <%--<div class="col-md-12" style="background: #DCE6F2;height: 40px;padding-top: 4px;">
                        <i class="fa fa-search"></i>
                        <label style="font-weight: bold;color: #000000;padding-right: 10px;" class="no-margin">추천/인기DJ 검색</label>

                        <select class="form-control" name="selectGubun">
                            <option value="" selected="selected">전체</option>
                            <option value="1">User ID</option>
                            <option value="2">User 닉네임</option>
                            <option value="3">연락처</option>
                            <option value="4">이름</option>
                        </select>

                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                    </div>--%>
                </div>
                <!-- DATA TABLE -->
                <div class="row col-lg-12 form-inline">

                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li class="active"><a href="#colored21" role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-home"></i> 추천DJ</a></li>
                        <li class=""><a href="#colored22" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-user"></i> 인기DJ</a></li>
                    </ul>
                    <div class="widget widget-table">
                        <%--<div class="widget-header">
                            <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                    <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                                </a>
                            </div>
                        </div>--%>
                        <div class="widget-content" style="border-top-width:0px;">
                            <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" />
                                        </th>
                                        <th>순위</th>
                                        <th>Main<br />추천상태</th>
                                        <th>레벨/등급</th>
                                        <th>프로필 이미지</th>
                                        <th>User ID</th>
                                        <th>User 닉네임</th>
                                        <th>보유결제<br />금액</th>
                                        <th>보낸<br />선물 수</th>
                                        <th>방송방 당<br />평균 받은 선물</th>
                                        <th>누적<br />방송 횟수</th>
                                        <th>최초<br />방송 시작일</th>
                                        <th>최근<br />방송 일시</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <%--<tr>
                                        <td>
                                            <input type="checkbox" />
                                        </td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                        <td>1</td>
                                    </tr>--%>
                                   </tbody>
                            </table>
                            <span>
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>선택삭제</button>
                                <button class="btn btn-default print-btn pull-right" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                            </span>
                        </div>
                    </div>
                </div>
                <!-- DATA TABLE END -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menuDataTableSource.js"></script>
<script type="text/javascript">

    $('#bt_search').on('click', function(){
        getSearch();
    });
    $('#tab_recommend').on('click', function(){
        getHistoryDetail(this.id);
    });
    $('#tab_broadDetail').on('click',function(){
        getHistoryDetail(this.id);
    });

    var memNo = "";
    var dtList_info="";
    function init(){

        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, MenuDataTableSource.recommend);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        // dtList_info.setEventClick(test01,0);
        dtList_info.createDataTable();
    }

    init();

    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();
    }
</script>