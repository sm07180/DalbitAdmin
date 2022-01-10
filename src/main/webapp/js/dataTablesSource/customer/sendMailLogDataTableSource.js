var SendMailLogDataTableSource = {

    'sendMailLogList': {
        'url': '/rest/customer/send/mail/log/list'
        , 'columns': [
            {'title': '발송 시도 일시', 'data': 'ins_date', 'width':'110px', 'render': function(data) {
                return common.convertToDate(data);
              }}
            ,{'title': '수신 메일 주소', 'data': 'parents_mem_email', 'width':'110px'}
            ,{'title': '미성년자 회원번호', 'data': 'mem_no', 'width':'110px', 'render': function (data, type, row) {
                return util.memNoLink(data, row.mem_no);
            }}
            ,{'title': '메일 구분', 'data': 'mail_slct_name', 'width':'110px'}
            ,{'title': '내용', 'data': 'mem_no', 'width':'110px', 'render': function(data, type, row) {
              const mailEtc = encodeURIComponent(row.mail_etc);
              if(row.mail_slct === 'a') {
                return '<a href="javascript://" class="_openMailAgreePop" data-mail-etc="' + mailEtc +'" style="cursor: pointer;">조회</a>'
              }else if(row.mail_slct === 'p') {
                return '<a href="javascript://" class="_openMailPayPop" data-mail-etc="' + mailEtc +'" style="cursor: pointer;">조회</a>'
              }else {
                return '<a href="javascript://" class="_openMailCancelPop" data-mail-etc="' + mailEtc +'" style="cursor: pointer;">조회</a>'
              }
            }}
        ]
        ,'createdRow' : function( row, data, dataIndex ) {
            if (data.inner == 1) {    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },
}
