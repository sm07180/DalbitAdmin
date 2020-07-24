package com.dalbit.main.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.connect.dao.Con_LoginDao;
import com.dalbit.connect.vo.procedure.P_LoginAgeOutDetailVo;
import com.dalbit.connect.vo.procedure.P_LoginAgeOutVo;
import com.dalbit.connect.vo.procedure.P_LoginTotalOutDetailVo;
import com.dalbit.connect.vo.procedure.P_LoginTotalOutVo;
import com.dalbit.enter.dao.Ent_JoinDao;
import com.dalbit.enter.dao.Ent_PayDao;
import com.dalbit.enter.vo.procedure.*;
import com.dalbit.main.dao.Mai_MainStatusDao;
import com.dalbit.main.vo.PayStatusInputVo;
import com.dalbit.main.vo.PayStatusOutputVo;
import com.dalbit.main.vo.procedure.*;
import com.dalbit.status.dao.Sta_ExchangeDao;
import com.dalbit.status.vo.procedure.P_ExchangeTotalOutDetailVo;
import com.dalbit.status.vo.procedure.P_ExchangeTotalOutVo;
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


    @Autowired
    Ent_JoinDao ent_JoinDao;
    @Autowired
    Con_LoginDao con_LoginDao;
    @Autowired
    Ent_PayDao ent_PayDao;
    @Autowired
    Sta_ExchangeDao sta_ExchangeDao;

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
    public String callStatJoin(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_JoinTotalOutDetailVo> detailList =  ent_JoinDao.callJoinTotal(procedureVo);

        P_JoinTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_JoinTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        List<P_JoinWithdrawOutDetailVo> detailList2 =  ent_JoinDao.callJoinWithdraw(procedureVo);
        P_JoinWithdrawOutVo totalInfo2 = new Gson().fromJson(procedureVo.getExt(), P_JoinWithdrawOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);
        result.put("withdrawTotalInfo", totalInfo2);
        result.put("withdrawDetailList", detailList2);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 메인 로그인현황 고정
     * @return
     */
    public String callStatLogin(P_StatVo pStatVo){

        // PV
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotalAll(procedureVo);
        P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        //UV
        procedureVo = new ProcedureVo(pStatVo);
        List<P_LoginTotalOutDetailVo> detailList2 =  con_LoginDao.callLoginTotal(procedureVo);
        P_LoginTotalOutVo totalInfo2 = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("overTotalInfo", totalInfo);
        result.put("overDetailList", detailList);
        result.put("totalInfo", totalInfo2);
        result.put("detailList", detailList2);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/환불 고정
     * @return
     */
    public String callPayInfo(P_StatVo pStatVo){
        // 결제/취소/환불
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayTotalOutDetailVo> detailList =  ent_PayDao.callPayTotal(procedureVo);
        P_PayTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        // 환전
        procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeTotalOutDetailVo> detailList2 = sta_ExchangeDao.callExchangeTotal(procedureVo);
        P_ExchangeTotalOutVo totalInfo2 = new Gson().fromJson(procedureVo.getExt(), P_ExchangeTotalOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);
        result.put("totalInfo2", totalInfo2);
        result.put("detailList2", detailList2);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 로그인 성별 현황
     * @return
     */
    public String callLoginTotal(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotal(procedureVo);
        P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 로그인 연령별 현황
     * @return
     */
    public String callLoginAge(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_LoginAgeOutDetailVo> detailList =  con_LoginDao.callLoginAge(procedureVo);
        P_LoginAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

}
