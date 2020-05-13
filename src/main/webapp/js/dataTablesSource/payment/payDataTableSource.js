var payDataTableSource = {
    'payList': {
        'url': '/rest/payment/pay/list'

        , 'columns': [
            {'title': '주문번호', 'data': 'order_id'}
            , {'title': '회원번호', 'data' : 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memNo=" ' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '결제수단', 'data': 'pay_way'}
            , {'title': '결제시도일', 'data': 'pay_dt_comein'}
            , {'title': '결제완료여부', 'data': 'pay_yn'}
            , {'title': '결제완료일자 <br/>/ 시간', 'data': '', 'render': function(data, type, row) {
                var tmp = row.pay_ok_date + '<br/>' + row.pay_ok_time;
                return tmp;
                }}
            , {'title': '결제구분 <br/>/ 금액', 'data': '', 'render': function(data, type, row) {
                var tmp = row.pay_slct + '<br/>' + row.pay_amt;
                return tmp;
                }}
            , {'title': '결제금액', 'data': 'pay_amt'}
            , {'title': '결제아이템정보', 'data': 'pay_code'}
            , {'title': '직원여부', 'data': 'chrgr_yn'}
            , {'title': '어플버전', 'data': 'app_ver'}
            , {'title': '최초결제여부', 'data': 'first_pay_yn'}
            , {'title': '카드번호 <br/>/ 카드사명', 'data': '','render': function(data, type, row) {
                var tmp = row.card_no + '<br/>' + row.card_nm;
                return tmp;
                }}
            , {'title': '휴대폰번호', 'data': 'phone_no'}
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