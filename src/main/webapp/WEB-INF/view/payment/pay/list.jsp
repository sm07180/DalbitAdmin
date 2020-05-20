<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form>

        </form> <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i>결제 내역</h3>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                            <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                        </a>
                    </div>
                </div>
                <div class="widget-content">
                    <table id="list_info" class="table table-sorting table-hover table-bordered">
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- // DATA TABLE -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->
<script type="text/javascript">

    $(document).ready(function() {
        init();
    });

    function init() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, payDataTableSource.payList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
    }

    /* 취소버튼 클릭 */
    function cancelClick(cancelData){

        var result = confirm(cancelData.memno+"님의 "+ common.addComma(cancelData.prdtprice) +"원에 대한 결제를 취소하시겠습니까?")
        if(result){
            var restUrl='';
            if(cancelData.paycd == 'CN'){
                restUrl='card'
            }else if(cancelData.paycd == 'RA'){
                restUrl='bank'
            }else if(cancelData.paycd == 'MC'){
                restUrl='phone'
            }else {
                alert("결제수단 오류 확인필요");
            }

            var data = {
                prdtprice : cancelData.prdtprice
                , mobilid : cancelData.mobilid
                , tradeid : cancelData.tradeid
                , mrchid : cancelData.storeid
            }
            util.getAjaxData("cancel", "/rest/payment/pay/cancel/"+restUrl, data, payCancelSuccess);
        }
    }

    /* 취소버튼 클릭 */
    function payCancelSuccess(response){
        dalbitLog(response);
        init();
    }


    function codeString(data) {
        var str;
        if(data == 'VA'){
            str = '가상계좌'
        } else if (data == 'CN') {
            str = '신용카드';
        } else if (data == 'MC') {
            str = '휴대폰';
        } else if (data == 'RA') {
            str = '계좌이체';
        } else {
            str = '-'
        }
        return str;
    }

    function osGubun(data) {
        var os;
        if(data == 1){
            os = 'IOS'
        } else if (data == 2) {
            os = 'AOS';
        } else if (data == 3) {
            os = 'PC';
        } else {
            str = '-'
        }
        return os;
    }

    function bankCodeToString(data) {
        var str='';
        if(data == '003'){
            str = '기업은행';
        } else if(data == '004'){
            str = '국민은행';
        } else if(data == '020'){
            str = '우리은행';
        }else if(data == '026'){
            str = '신한은행';
        }else if(data == '081'){
            str = '하나은행';
        }else if(data == '011'){
            str = '농협';
        }else if(data == '071'){
            str = '우체국';
        }else if(data == '023'){
            str = 'SC제일은행';
        }else if(data == '027'){
            str = '한국씨티은행';
        }else if(data == '007'){
            str = '수협은행';
        }else if(data == '032'){
            str = '부산은행';
        }else if(data == '034'){
            str = '광주은행';
        }else if(data == '039'){
            str = '경남은행';
        }else if(data == '031'){
            str = '대구은행';
        }
        return str;
    }

</script>