package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberConnectOutputVo extends SearchVo {

    private Date connectDate;
    private String connectDateFormat;
    private String appVersion;
    private String Browser;
    private String Device;
    private String deviceUUID;
    private String adID;
    private String ip;

    public void setConnectDate(Date connectDate){
        this.connectDate = connectDate;
        this.connectDateFormat = DalbitUtil.convertDateFormat(connectDate, "yyyy.MM.dd HH:mm:ss");
    }
}
