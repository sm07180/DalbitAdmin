package com.dalbit.common.vo;

import com.dalbit.util.DalbitUtil;
import com.google.gson.Gson;
import lombok.Getter;
import lombok.Setter;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Getter
@Setter
public class DeviceVo {
    private int os;
    private String deviceUuid;
    private String deviceToken;
    private String appVersion;
    private String adId;
    private String ip;

    public DeviceVo(HttpServletRequest request){
        String customHeader = request.getHeader(DalbitUtil.getProperty("rest.custom.header.name"));
        this.os = DalbitUtil.convertRequestParamToInteger(request,"os");
        this.deviceUuid = DalbitUtil.convertRequestParamToString(request,"deviceId");
        this.deviceToken = DalbitUtil.convertRequestParamToString(request,"deviceToken");
        this.appVersion = DalbitUtil.convertRequestParamToString(request,"appVer");
        this.adId = DalbitUtil.convertRequestParamToString(request,"appAdId");
        this.ip = DalbitUtil.getIp(request);

        if(customHeader != null && !"".equals(customHeader.trim())){

            customHeader = java.net.URLDecoder.decode(customHeader);
            HashMap<String, Object> headers = new Gson().fromJson(customHeader, HashMap.class);

            if(headers.get("os") != null && headers.get("deviceId") != null ){
//                os = (int)DalbitUtil.getDoubleMap(headers, "os");
                deviceUuid = DalbitUtil.getStringMap(headers, "deviceId");
                deviceToken = DalbitUtil.getStringMap(headers, "deviceToken");
                appVersion = DalbitUtil.getStringMap(headers, "appVer");
                adId = DalbitUtil.getStringMap(headers, "appAdId");
                deviceToken = deviceToken == null ? "" : deviceToken.trim();
                appVersion = appVersion == null ? "" : appVersion.trim();
                adId = adId == null ? "" : adId.trim();
            }
        }
    }
}
