package com.dalbit.main.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.dao.Ent_JoinDao;
import com.dalbit.enter.dao.Ent_PayDao;
import com.dalbit.enter.vo.procedure.P_JoinWithdrawOutDetailVo;
import com.dalbit.enter.vo.procedure.P_PayInfoOutVo;
import com.dalbit.enter.vo.procedure.P_StatJoinOutVo;
import com.dalbit.main.dao.Mai_MainStatusDao;
import com.dalbit.main.vo.PayStatusInputVo;
import com.dalbit.main.vo.PayStatusOutputVo;
import com.dalbit.main.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.main.vo.procedure.P_StatVo;
import java.util.ArrayList;
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

    public String getPayDayStatusInfoList(PayStatusInputVo payStatusInputVo){

        List<PayStatusOutputVo> todayList = main_JoinDao.getPayDayStatusInfoList(new PayStatusInputVo(payStatusInputVo.getToday()));
        List<PayStatusOutputVo> yesterdayList = main_JoinDao.getPayDayStatusInfoList(new PayStatusInputVo(payStatusInputVo.getYesterday()));

        List<PayStatusOutputVo> thisWeekList = main_JoinDao.getPayDayStatusWeekInfoList(new PayStatusInputVo(payStatusInputVo.getThisWeekStartDay(), payStatusInputVo.getThisWeekEndDay()));
        List<PayStatusOutputVo> prevWeekList = main_JoinDao.getPayDayStatusWeekInfoList(new PayStatusInputVo(payStatusInputVo.getPrevWeekStartDay(), payStatusInputVo.getPrevWeekEndDay()));

        var map = new HashMap<String, Object>();
        map.put("todayList", todayList);
        map.put("yesterdayList", yesterdayList);
        map.put("thisWeekList", thisWeekList);
        map.put("prevWeekList", prevWeekList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
    }

    public String getPayCancelDayStatusInfoList(PayStatusInputVo payStatusInputVo){

        List<PayStatusOutputVo> todayList = main_JoinDao.getPayCalcelDayStatusInfoList(new PayStatusInputVo(payStatusInputVo.getToday()));
        List<PayStatusOutputVo> yesterdayList = main_JoinDao.getPayCalcelDayStatusInfoList(new PayStatusInputVo(payStatusInputVo.getYesterday()));

        List<PayStatusOutputVo> thisWeekList = main_JoinDao.getPayCalcelWeekStatusInfoList(new PayStatusInputVo(payStatusInputVo.getThisWeekStartDay(), payStatusInputVo.getThisWeekEndDay()));
        List<PayStatusOutputVo> prevWeekList = main_JoinDao.getPayCalcelWeekStatusInfoList(new PayStatusInputVo(payStatusInputVo.getPrevWeekStartDay(), payStatusInputVo.getPrevWeekEndDay()));

        var map = new HashMap<String, Object>();
        map.put("todayList", todayList);
        map.put("yesterdayList", yesterdayList);
        map.put("thisWeekList", thisWeekList);
        map.put("prevWeekList", prevWeekList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
    }


    /**
     * 메인 가입현황 고정
     * @return
     */

    @Autowired
    Ent_JoinDao ent_JoinDao;
    public String callStatJoin(){
        ProcedureVo procedureVo = new ProcedureVo();
        ent_JoinDao.callStatJoin(procedureVo);
        P_StatJoinOutVo joinInfo = new Gson().fromJson(procedureVo.getExt(), P_StatJoinOutVo.class);

        ent_JoinDao.callStatWithdraw(procedureVo);
        P_StatJoinOutVo withdrawInfo = new Gson().fromJson(procedureVo.getExt(), P_StatJoinOutVo.class);

        var result = new HashMap<String, Object>();
        result.put("joinInfo", joinInfo);
        result.put("withdrawInfo", withdrawInfo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/환불 고정
     * @return
     */
    @Autowired
    Ent_PayDao ent_PayDao;
    public String callPayInfo(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ent_PayDao.callPayInfo(procedureVo);

        P_PayInfoOutVo info = new Gson().fromJson(procedureVo.getExt(), P_PayInfoOutVo.class);
        var result = new HashMap<String, Object>();

        pStatVo.setStartDate(pStatVo.getStartDate().replaceAll("\\.",""));
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(pStatVo.getStartDate());
        }else {
            pStatVo.setEndDate(pStatVo.getEndDate().replaceAll("\\.", ""));
        }

        P_PayInfoOutVo outVo = main_JoinDao.callPayCancelInfo(pStatVo);
        if(!DalbitUtil.isEmpty(outVo)) {
            info.setCancelCnt(outVo.getCancelCnt());
            info.setCancelAmt(outVo.getCancelAmt());
        }
        result.put("info", info);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

}
