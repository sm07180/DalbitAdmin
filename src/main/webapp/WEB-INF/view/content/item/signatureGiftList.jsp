<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline mb10">
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                </div>
                <div class="widget-content">

                    <!-- 상단 -->
                    <div class="dataTable-top">
                        <div class="top-left pull-left dataTable-div">
                            <div class="comments">
                                <div>• 방송 중 DJ 또는 게스트에게 선물할 수 있는 아이템을 등록 및 관리할 수 있습니다.</div>
                                <div> ※ 선물아이템 영역 : 기본, 1번-파티클, 2번-콤보, 3번-상단, 4번-우측, 5번-전체</div>
                            </div>
                            <input type="button" value="아이템순서변경" class="btn btn-success btn-sm" style="margin-top:5px"
                                   onclick="sgnt_itemOrder()"
                            />
                        </div>
                        <div class="top-right pull-right dataTable-div">

                            <div id="div_summary" style="float:left">
                                <table class="table table-sorting table-hover table-bordered dataTable" style="width:100px;">
                                    <tbody>
                                    <tr class="align-middle">
                                        <th class="no-padding no-margin" colspan="1">총 선물현황</th>
                                    </tr>
                                    <tr>
                                        <td id="summary_data" class="no-padding no-margin" style="text-align:center;" colspan="12">0건</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <input type="button" value="등록" id="btn_insert" class="btn btn-success btn-sm" style="margin-left: 3px; margin-top:6px"
                                   onclick="sgnt_insertBtnEvent()"
                            ></div>
                    </div>

                    <!-- 페이징 -->
                    <div class="dataTable-top-page  col-md-12">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_giftList_paginate1">
                        </div>
                    </div>


                    <!-- 테이블 : 아이템 리스트, 회원의 아이템 리스트-->
                    <table id="table_sgnt_all_list" class="table table-sorting table-hover table-bordered">
                        <thead><th></th><th></th></thead>
                        <tbody><tr><td></td></tr></tbody>
                    </table>
                    <table id="table_sgnt_mem_list" class="table table-sorting table-hover table-bordered">
                        <thead></thead>
                        <tbody></tbody>
                    </table>

                    <!-- 페이징 -->
                    <div class="dataTable-top-page  col-md-12">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_giftList_paginate2">
                        </div>
                    </div>

                    <!-- 하단-->
                    <div class="dataTable-footer">
                        <div class="footer-left pull-left dataTable-div">
                            <input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"
                                   onclick="sgnt_deleteBtnEvent()"
                            >
                        </div>
                        <div class="footer-right pull-right dataTable-div">
                            <input type="button" value="네이티브 전송" class="btn btn-success btn-sm" id="btn_changeItem" style="margin-left: 3px;"
                                   onclick="changeItemEvent()"
                            >
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

