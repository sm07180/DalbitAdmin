package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberConnectOutputVo extends SearchVo {

    private String connectDate;
    private String appVersion;
    private String Browser;
    private String Device;
    private String deviceUUID;
    private String adID;
    private String ip;
}
