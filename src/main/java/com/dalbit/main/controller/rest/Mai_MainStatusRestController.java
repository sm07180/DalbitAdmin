package com.dalbit.main.controller.rest;

import com.dalbit.main.service.Mai_MainStatusService;
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


}