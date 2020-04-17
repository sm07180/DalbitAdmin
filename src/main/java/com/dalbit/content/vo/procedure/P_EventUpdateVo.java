package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EventUpdateVo extends BaseVo {

    private int idx;
    private String event_title;
    private String start_datetime;
    private String end_datetime;
    private String view_start_datetime;
    private String view_end_datetime;
    private String platform;
    private String loginType;
    private String viewType;
    private String viewYn;
    private String pc_img_url;
    private String pc_link_url;
    private String mobile_img_url;
    private String mobile_link_url;
    private String thumb_img_url;
    private String desc;

}





