var payDataTableSource = {
    'payList': {
        'url': '/rest/payment/pay/list'

        , 'columns': [
            /*{'title': '주문번호', 'data': 'order_id'}*/
             {'title': '회원번호', 'data' : 'mem_no', 'render': function(data, type, row) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo=" ' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '결제<br />수단', 'data': 'pay_way', 'width':'60px', 'render': function(data, type, row) {
                    return codeString(data);
                }}
            , {'title': '결제<br />정보', 'data': 'data', 'width':'60px', 'render': function(data, type, row) {
                    var info="";
                    if(row.pay_way == 'MC'){
                        info = common.phoneNumHyphen(row.pay_info_no);
                    } else if(row.pay_way == 'CN'){
                        info = common.cardNo(row.pay_info_no) + '<br/>' + row.pay_info_nm;
                    } else if(row.pay_way == 'VA'){
                        info = row.pay_info_no + '<br/>' + row.pay_info_nm;
                    } else {
                        info = '-'
                    }
                    return info;
                }}
            , {'title': '결제시도일', 'data': 'pay_dt_comein', 'width':'80px', 'render': function(data, type, row) {
                    return common.convertToDate(data, 'YYYY.MM.DD HH:mm:ss');
                }}
            , {'title': '결제상태', 'data': 'pay_yn', 'width':'50px', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '완료일시', 'data': '', 'width':'80px', 'render': function(data, type, row) {
                    return row.pay_yn == 'y' ? row.pay_ok_date + '<br/>' + row.pay_ok_time : '-';
                }}
            , {'title': '금액', 'data': '', 'width':'80px', 'render': function(data, type, row) {
                    var tmp = row.pay_slct + '<br/>' + (row.pay_slct == 'KRW') ? common.addComma(row.pay_amt.split(".")[0]) + '원' : row.pay_amt.split(".")[0];
                    return tmp;
                }}
            , {'title': '아이템<br />정보', 'data': 'pay_code', 'width':'60px'}
            , {'title': '구매<br />횟수', 'data': 'count', 'width':'55px', 'render': function(data, type, row) {
                    return common.addComma(String(data));
                }}
            , {'title': '총 구매<br />금액', 'data': 'amount', 'width':'80px', 'render': function(data, type, row) {
                    return common.addComma(data) + '원';
                }}
            , {'title': '직원<br />여부', 'data': 'chrgr_yn', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '플랫폼', 'data': 'os', 'render': function(data, type, row) {
                    return osGubun(data);
                }}
            , {'title': '최초여부', 'data': 'first_pay_yn', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            /*, {'title': '카드번호 <br/>/ 카드사명', 'data': '','render': function(data, type, row) {
                    var tmp = !(common.isEmpty(row.card_no) || row.card_no == 0) ? common.cardNo(row.card_no) + '<br/>' + row.card_nm : '-';
                    return tmp;
                }}
            , {'title': '휴대폰<br />번호', 'data': 'phone_no', 'render': function(data, type, row) {
                    return common.phoneNumHyphen(data);
                }}*/
            /*, {'title': '은행코드 <br/>/ 가상계좌번호', 'data': '', 'render': function(data, type, row) {
                    var tmp = row.bank_code + '<br/>' + row.account_no;
                    return tmp;
                }}*/
            , {'title': '결제자', 'data': 'rcpt_nm'}
            , {'title': '취소일시', 'data': '', 'render': function(data, type, row) {
                    return row.cancel_state == 'y' ? row.cancel_dt : '-';
                }}
            , {'title': '취소상태', 'data': 'cancel_state', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '취소실패사유', 'data': 'fail_msg', 'render': function(data, type, row) {
                    return !common.isEmpty(row.fail_msg) ? row.fail_msg : '-';
                }}
            , {'title': '처리자', 'data': 'op_name'}
            , {'title': '취소', 'data': '', 'render': function(data, type, row) {

                return (row.pay_way == 'VA' || row.pay_yn == 'n' || row.cancel_state != 'n') ? '-' : '<button type="button" class="btn btn-default cancelBtn" ' +
                    'data-paycd="'+ row.pay_way+'" ' +
                    'data-tradeid="'+row.order_id+'" ' +
                    'data-mobilid="'+row.bill_id+'" ' +
                    'data-prdtprice="'+row.pay_amt.split(".")[0]+'" ' +
                    'data-storeid="'+row.store_id+'" ' +
                    'onclick="cancelClick($(this).data())">취소</button>'
            }}
        ]
        , 'comments': ''
    },
}