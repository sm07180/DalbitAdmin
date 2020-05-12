package com.dalbit.main.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.main.dao.Mai_MainStatusDao;
import com.dalbit.main.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Mai_MainStatusService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Mai_MainStatusDao main_JoinDao;

    /**
     * Total 메인
     * @param
     * @return
     */
    public String callTotalStatusList(){
        ProcedureVo procedureVo = new ProcedureVo();
        main_JoinDao.callTotalStatusList(procedureVo);
        P_TotalStatusOutVo totalStatus = new Gson().fromJson(procedureVo.getExt(), P_TotalStatusOutVo.class);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, totalStatus));
    }

    /**
     * 회원가입 메인
     * @param
     * @return
     */
    public String callJoinStatusList(){
        ProcedureVo procedureVo = new ProcedureVo();
        main_JoinDao.callJoinStatusList(procedureVo);
        P_JoinStatusOutVo joinStatus = new Gson().fromJson(procedureVo.getExt(), P_JoinStatusOutVo.class);
        var result = new HashMap<String, Object>();
        result.put("joinStatus", joinStatus);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 회원탈퇴 메인
     * @param
     * @return
     */
    public String callWithdrawStatusList(){
        ProcedureVo procedureVo = new ProcedureVo();
        main_JoinDao.callWithdrawStatusList(procedureVo);
        P_JoinStatusOutVo withdrawStatus = new Gson().fromJson(procedureVo.getExt(), P_JoinStatusOutVo.class);
        var result = new HashMap<String, Object>();
        result.put("withdrawStatus", withdrawStatus);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 방송정보 메인
     * @param
     * @return
     */
    public String callBroadStatusInfoList(){
        ProcedureVo procedureVo = new ProcedureVo();
        main_JoinDao.callBroadStatusInfoList(procedureVo);
        P_BroadStatusOutVo broadStatus = new Gson().fromJson(procedureVo.getExt(), P_BroadStatusOutVo.class);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, broadStatus));
    }

    /**
     * 차트 메인
     * @param
     * @return
     */
    public String callChartStatusInfoList(P_ChartStatusInputVo pChartStatusInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pChartStatusInputVo);
        List<P_ChartStatusOutVo> chartList = main_JoinDao.callChartStatusInfoList(procedureVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, chartList));
    }

    /**
     * 아이템 Top5 메인
     * @param
     * @return
     */
    public String callItemStatusInfoList() {
        ProcedureVo procedureVo = new ProcedureVo();
        List<P_ItemTopFiveOutputVo> itemList = main_JoinDao.callItemStatusInfoList(procedureVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, itemList));
    }

}
