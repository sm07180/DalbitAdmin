package com.dalbit.enter.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.dao.Ent_PayDao;
import com.dalbit.enter.vo.procedure.P_PayInfoOutVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Ent_PayService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Ent_PayDao ent_PayDao;

    /**
     * 결제/환불 고정
     * @return
     */
    public String callStatPayInfo(){
        P_PayInfoOutVo payInfoList = ent_PayDao.callStatPayInfo();

        P_PayInfoOutVo joinInfo = new P_PayInfoOutVo();
        joinInfo.setTotalPayAmt(payInfoList.getTotalPayAmt());
        joinInfo.setTotalVaAmt(payInfoList.getTotalVaAmt());
        joinInfo.setTotalCnAmt(payInfoList.getTotalCnAmt());
        joinInfo.setTotalMCAmt(payInfoList.getTotalMCAmt());
        joinInfo.setTotalRAAmt(payInfoList.getTotalRAAmt());
        joinInfo.setTotalAppleAmt(payInfoList.getTotalAppleAmt());

        var result = new HashMap<String, Object>();
        result.put("joinInfo", joinInfo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
