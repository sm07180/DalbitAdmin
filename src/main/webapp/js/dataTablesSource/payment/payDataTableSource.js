var payDataTableSource = {
    'payList': {
        'url': '/rest/payment/pay/list'

        , 'columns': [
            /*{'title': '주문번호', 'data': 'order_id'}*/
             {'title': '회원번호', 'data' : 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memNo=" ' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '결제수단', 'data': 'pay_way'}
            , {'title': '결제시도일', 'data': 'pay_dt_comein'}
            , {'title': '완료', 'data': 'pay_yn', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '완료일시', 'data': '', 'render': function(data, type, row) {
                return row.pay_yn == 'y' ? row.pay_ok_date + '<br/>' + row.pay_ok_time : '-';
                }}
            , {'title': '금액', 'data': '', 'render': function(data, type, row) {
                var tmp = row.pay_slct + '<br/>' + common.addComma(Number(row.pay_amt));
                return tmp;
                }}
            , {'title': '아이템정보', 'data': 'pay_code'}
            , {'title': '구매 횟수', 'data': 'count', 'render': function(data, type, row) {
                return common.addComma(data);
                }}
            , {'title': '총 구매 금액', 'data': 'amount', 'render': function(data, type, row) {
                return common.addComma(data);
                }}
            , {'title': '직원여부', 'data': 'chrgr_yn', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '앱버전', 'data': 'app_ver', 'render': function(data, type, row) {
                    return common.isEmpty(data) ? '-' : data;
                }}
            , {'title': '최초여부', 'data': 'first_pay_yn', 'render': function(data, type, row) {
                    return data.toUpperCase();
                }}
            , {'title': '카드번호 <br/>/ 카드사명', 'data': '','render': function(data, type, row) {
                var tmp = !(common.isEmpty(row.card_no) || row.card_no == 0) ? common.cardNo(row.card_no) + '<br/>' + row.card_nm : '-';
                return tmp;
                }}
            , {'title': '휴대폰번호', 'data': 'phone_no', 'render': function(data, type, row) {
                    return common.phoneNumHyphen(data);
                }}
            , {'title': '은행코드 <br/>/ 가상계좌번호', 'data': '', 'render': function(data, type, row) {
                var tmp = row.bank_code + '<br/>' + row.account_no;
                return tmp;
                }}
            , {'title': '가상계좌번호', 'data': 'account_no'}
            , {'title': '결제완료일자', 'data': 'rcpt_dt'}
            , {'title': '결제자명', 'data': 'rcpt_nm'}
        ]
        , 'comments': ''
    },
}