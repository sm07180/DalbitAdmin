package com.dalbit.main.controller.rest;

import com.dalbit.main.service.Mai_MainStatusService;
import com.dalbit.main.vo.PayStatusInputVo;
import com.dalbit.main.vo.procedure.P_ChartStatusInputVo;
import com.dalbit.main.vo.procedure.P_StatVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
@RequestMapping("rest/mainStatus")
public class Mai_MainStatusRestController {


    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Mai_MainStatusService mai_MainStatusService;

    @PostMapping("total/status/list")
    public String total(){
        String result = mai_MainStatusService.callTotalStatusList();
        return result;
    }

    @PostMapping("join/status/list")
    public String join(){
        String result = mai_MainStatusService.callJoinStatusList();
        return result;
    }

    @PostMapping("join/status/withdraw")
    public String withdraw(){
        String result = mai_MainStatusService.callWithdrawStatusList();
        return result;
    }

    @PostMapping("broad/status/info")
    public String broad(){
        String result = mai_MainStatusService.callBroadStatusInfoList();
        return result;
    }

    @PostMapping("chart/status/info")
    public String chart(P_ChartStatusInputVo pChartStatusInputVo){
        String result = mai_MainStatusService.callChartStatusInfoList(pChartStatusInputVo);
        return result;
    }

    @PostMapping("item/status/info")
    public String item(){
        String result = mai_MainStatusService.callItemStatusInfoList();
        return result;
    }

    @PostMapping("pay/status/info")
    public String pay(PayStatusInputVo payStatusInputVo){
        String result = mai_MainStatusService.getPayDayStatusInfoList(payStatusInputVo);
        return result;
    }

    @PostMapping("payCancel/status/info")
    public String payCancel(PayStatusInputVo payStatusInputVo){
        String result = mai_MainStatusService.getPayCancelDayStatusInfoList(payStatusInputVo);
        return result;
    }




    @PostMapping("new/main/stat/join")
    public String statJoin(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callStatJoin(pStatVo);
        return result;
    }

    @PostMapping("new/main/stat/login")
    public String statLogin(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callStatLogin(pStatVo);
        return result;
    }

    @PostMapping("new/main/stat/broadCast")
    public String statBroadCast(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callStatBroadCast(pStatVo);
        return result;
    }

    @PostMapping("new/main/stat/pay")
    public String payInfo(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callPayInfo(pStatVo);
        return result;
    }

    @PostMapping("new/main/stat/login/total")
    public String loginTotal(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callLoginTotal(pStatVo);
        return result;
    }

    @PostMapping("new/main/stat/login/age")
    public String loginAge(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callLoginAge(pStatVo);
        return result;
    }

    // ??????/???????????? ????????? ???
    @PostMapping("new/main/stat/join/platform")
    public String statJoinPlatform(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = mai_MainStatusService.callStatJoinPlatform(pStatVo);
        return result;
    }
}
