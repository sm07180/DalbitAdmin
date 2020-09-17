package com.dalbit.money.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.money.service.Mon_ExchangeService;
import com.dalbit.money.service.Mon_ResourceService;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.money.vo.procedure.P_ResourceDetailInPutVo;
import com.dalbit.money.vo.procedure.P_ResourceInfoInPutVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/money/resource")
public class Mon_ResourceRestController {

    @Autowired
    Mon_ResourceService mon_ResourceService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("info")
    public String list(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        String result = mon_ResourceService.resourceInfo(pResourceInfoInPutVo);
        return result;
    }

    @PostMapping("memberDataList")
    public String memberDataList(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        String result = mon_ResourceService.memberDataList(pResourceInfoInPutVo);
        return result;
    }

    @PostMapping("buyDalList")
    public String buyDalList(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        String result = mon_ResourceService.buyDalList(pResourceInfoInPutVo);
        return result;
    }

    @PostMapping("useDalList")
    public String useDalList(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        String result = mon_ResourceService.useDalList(pResourceInfoInPutVo);
        return result;
    }

    @PostMapping("live")
    public String live(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        String result = mon_ResourceService.resourceLive(pResourceInfoInPutVo);
        return result;
    }
}
