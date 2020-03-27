package com.dalbit.util;

import com.dalbit.inforex.vo.InforexPosCode;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Slf4j
@Component
public class InforexApiUtil {
    @Autowired
    HttpSession httpSession;

    public InforexPosCode[] getInforexPosCode(){
        InforexPosCode[] inforexPosCodes = (InforexPosCode[])httpSession.getAttribute(DalbitUtil.getProperty("inforex.posCode.key"));
        if(DalbitUtil.isEmpty(inforexPosCodes)){
            String result = RestApiUtil.sendGet(DalbitUtil.getProperty("inforex.api.posCode.url"));
            inforexPosCodes = new Gson().fromJson(result, InforexPosCode[].class);
            httpSession.setAttribute(DalbitUtil.getProperty("inforex.posCode.key"), inforexPosCodes);
        }
        return inforexPosCodes;
    }
}
