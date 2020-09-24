<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="div_payY">
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

    getDalIncList();
    function getDalIncList() {
        var dtList_info_data = function(data) {
            data.sDate = '${param.sDate}';
            data.eDate = '${param.eDate}';
            data.type = '${param.type}';
            data.gender = '${param.gender}';
            data.slctType = '${param.slctType}';
        };
        if(type == "1"){            // 달결제
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalInc_payDetail);
        }else if(type == "2-1" || type == "2-2"){    // 달 직접 선물(달증가)/(달감소)
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalInc_giftDirect);
        }else if(type == "3"){      // 달 교환
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalInc_dalChange);
        }else if(type == "4" || type == "5" || type == "6" || type == "7"               // 가입보상, 레벨보상, 랭킹보상, 출석이벤트,
                || type == "8" || type == "9-1" || type == "9-2"  || type == "10"       // 소실금액 복구(운영자지급), 이벤트 지급(자동/운영자지급), 테스트 지급
                || type == "15"        ){                                               // 테스트 회수

            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalInc_joinReward);
        }else if(type == "11"){     // 아이템 사용
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalDec_gift);
        }else if(type == "12"){     // 결제 취소
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalDec_payDetail);
        }else if(type == "13" || type == "14"){     // 영구정지, 탈퇴회원
            dtList_info = new DalbitDataTable($("#list"), dtList_info_data, resourceDataTableSource.dalDec_memState);
        }
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable();
    }

    function sel_change_pay(){
    }


</script>


