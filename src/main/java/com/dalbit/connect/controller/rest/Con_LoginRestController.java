package com.dalbit.connect.controller.rest;

import com.dalbit.common.vo.StatVo;
import com.dalbit.connect.service.Con_LoginService;
import com.dalbit.connect.vo.procedure.P_LoginTotalInPutVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/connect/login")
public class Con_LoginRestController {

    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    Con_LoginService con_LoginService;


    @PostMapping("info/live")
    public String infoLive(){
        String result = con_LoginService.callLoginLive();
        return result;
    }


    @PostMapping("info/total")
    public String total(P_LoginTotalInPutVo pLoginTotalInPutVo){
        String result = con_LoginService.callLoginTotal(pLoginTotalInPutVo);
        return result;
    }

    @PostMapping("info/age")
    public String age(P_LoginTotalInPutVo pLoginTotalInPutVo){
        String result = con_LoginService.callLoginAge(pLoginTotalInPutVo);
        return result;
    }

    @PostMapping("info/browser")
    public String browser(StatVo statVo){
        if(DalbitUtil.isEmpty(statVo.getStartDate())){
            statVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(statVo.getEndDate())){
            statVo.setEndDate(null);
        }

        String result = con_LoginService.callLoginBrowser(statVo);
        return result;
    }

    @PostMapping("total/week")
    public String totalWeek(StatVo statVo){
        if(DalbitUtil.isEmpty(statVo.getStartDate())){
            statVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(statVo.getEndDate())){
            statVo.setEndDate(null);
        }

        String result = con_LoginService.callLoginTotalWeek(statVo);
        return result;
    }
}
