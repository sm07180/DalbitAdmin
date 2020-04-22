package com.dalbit.customer.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SmsVo extends PagingVo {

    /* input */
    private String searchText;
    private String txt_startSel;
    private String txt_endSel;

    /* output */
    private String cmid;
    private String send_phone;
    private String wap_info;
    private String dest_phone;
    private String report_time;
    private String msg_body;
    private String vxml_file;
}
