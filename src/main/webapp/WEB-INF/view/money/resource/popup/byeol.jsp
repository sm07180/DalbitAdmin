<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget-table mb10">
    <div class="col-md-12" style="background-color: #fbe5d6;padding:7px;margin-top: 8px">
        <span class="font-bold" id="sp_type" style="color: #7792c9;"></span><span class="font-bold">&nbsp;상세내역</span>
    </div>
    <div class="widget-content mt10">
        <table class="table table-bordered" id="list">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>


<script type="text/javascript">
    var dtList_info;

    var type = '${param.type}';

    getByeolist();
    function getByeolist() {
        if(type == "3"){
            $("#sp_type").text("별 교환");
        }else if(type == "5"){
            $("#sp_type").text("레벨 보상");
        }else if(type == "8"){
            $("#sp_type").text("소실금액 복구(운영자지급)");
        }else if(type == "9"){
            $("#sp_type").text("이벤트 지급(운영자지급)");
        }else if(type == "10"){
            $("#sp_type").text("테스트 지급");
        }else if(type == "11"){
            $("#sp_type").text("아이템 선물(비밀선물)");
        }else if(type == "13"){
            $("#sp_type").text("영구정지");
        }else if(type == "14"){
            $("#sp_type").text("탈퇴");
        }else if(type == "15"){
            $("#sp_type").text("테스트 회수");
        }else if(type == "16"){
            $("#sp_type").text("환전 취소");
        }else if(type == "17"){
            $("#sp_type").text("환전 승인");
        }

        var dtList_info_data = function(data) {
            data.sDate = '${param.sDate}';
            data.eDate = '${param.eDate}';
            data.type = '${param.type}';
            data.gender = '${param.gender}';
            data.slctType = '${param.slctType}';
        };

        // data-type="5"  레벨업 보상
        // data-type="11" 아이템 선물(비밀선물)
        // data-type="9"  이벤트 지급(운영자 지급)
        // data-type="16" 환전 취소
        // data-type="8"  소실금액 복구(운영자 지급)
        // data-type="10" 테스트 지급
        // data-type="17" 환전승인
        // data-type="3"  교환
        // data-type="13" 영구정지
        // data-type="18" 탈퇴
        // data-type="15" 테스트 회수

        if(type == "5" || type == "9" || type == "8" || type == "10" || type == "15"){            // 레벨업보상, 이벤트 지급(운영자 지급), 소실금액 복구(운영자 지급), 테스트 지급, 테스트 회수
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.byeolInc_detail);
        } else if(type == "11" ){                       // 아이템 선물(비밀선물)
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.byeolInc_giftList);
        } else if(type == "16" || type == "17" ){       // 환전 취소, 환전 승인
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.byeolInc_exchange);
        } else if(type == "3" ){                        // 교환
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.byeolDec_change);
        } else if(type == "13" || type == "18"){        // 영구정지, 탈퇴회원
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalDec_memState);
        }
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable();
    }


</script>


