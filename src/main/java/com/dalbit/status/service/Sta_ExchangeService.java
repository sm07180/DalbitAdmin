package com.dalbit.status.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.service.Ent_PayService;
import com.dalbit.enter.vo.procedure.P_PayTotalOutDetailVo;
import com.dalbit.enter.vo.procedure.P_PayTotalOutVo;
import com.dalbit.enter.vo.procedure.P_PayTotalWayInPutVo;
import com.dalbit.status.dao.Sta_ExchangeDao;
import com.dalbit.status.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class Sta_ExchangeService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Sta_ExchangeDao sta_ExchangeDao;
    @Autowired
    Ent_PayService ent_PayService;

    /**
     * 환전 통합현황 월간
     */
    public String callExchangeMonth(P_StatVo pStatVo){
        P_PayTotalWayInPutVo pPayTotalWayInPutVo = new P_PayTotalWayInPutVo();

        String dateListFormat = String.format("%s-%s@%s-%s", pStatVo.getBeforStartDate(), pStatVo.getBeforEndDate(), pStatVo.getStartDate(), pStatVo.getEndDate());
        pPayTotalWayInPutVo.setDateList(dateListFormat);
        pPayTotalWayInPutVo.setSlctType(1);
        pPayTotalWayInPutVo.setPaywayType("all");

        List<Map<String, Object>> resultList = new ArrayList<>();
        ent_PayService.getPayMonthWayList(pPayTotalWayInPutVo, resultList);

        P_PayTotalOutVo totalOutVo0 = (P_PayTotalOutVo) resultList.get(0).get("totalInfo");
        P_PayTotalOutVo totalOutVo1 = (P_PayTotalOutVo) resultList.get(1).get("totalInfo");
        ArrayList detailList0 = (ArrayList) resultList.get(0).get("detailList");
        ArrayList detailList1 = (ArrayList) resultList.get(1).get("detailList");

        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeTotalOutDetailVo> detailList_n = sta_ExchangeDao.callExchangeMonth(procedureVo);
        P_ExchangeTotalOutVo totalInfo_n = new Gson().fromJson(procedureVo.getExt(), P_ExchangeTotalOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        pStatVo.setStartDate(pStatVo.getBeforStartDate());
        pStatVo.setEndDate(pStatVo.getBeforEndDate());
        ProcedureVo procedureVo2 = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeTotalOutDetailVo> detailList_b = sta_ExchangeDao.callExchangeMonth(procedureVo2);
        P_ExchangeTotalOutVo totalInfo_b = new Gson().fromJson(procedureVo2.getExt(), P_ExchangeTotalOutVo.class);
        if(Integer.parseInt(procedureVo2.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        P_ExchangeTotalOutVo totalOutVo = new P_ExchangeTotalOutVo();
        totalOutVo.setTot_specialdj_succ_Cnt(totalInfo_b.getTot_specialdj_succ_Cnt());
        totalOutVo.setTot_specialdj_succ_Amt(totalInfo_b.getTot_specialdj_succ_Amt());
        totalOutVo.setTot_specialdj_succ_byeol_Cnt(totalInfo_b.getTot_specialdj_succ_byeol_Cnt());
        totalOutVo.setTot_pm_succ_Cnt(totalInfo_b.getTot_pm_succ_Cnt());
        totalOutVo.setTot_pm_succ_Amt(totalInfo_b.getTot_pm_succ_Amt());
        totalOutVo.setTot_pm_succ_byeol_Cnt(totalInfo_b.getTot_pm_succ_byeol_Cnt());
        totalOutVo.setTot_succ_Cnt(totalInfo_b.getTot_succ_Cnt());
        totalOutVo.setTot_succ_Amt(totalInfo_b.getTot_succ_Amt());
        totalOutVo.setTot_succ_byeol_Cnt(totalInfo_b.getTot_succ_byeol_Cnt());
        totalOutVo.setTot_pay_amt(totalOutVo0.getSum_succAmt());

        totalOutVo.setNTot_specialdj_succ_Cnt(totalInfo_n.getTot_specialdj_succ_Cnt());
        totalOutVo.setNTot_specialdj_succ_Amt(totalInfo_n.getTot_specialdj_succ_Amt());
        totalOutVo.setNTot_specialdj_succ_byeol_Cnt(totalInfo_n.getTot_specialdj_succ_byeol_Cnt());
        totalOutVo.setNTot_pm_succ_Cnt(totalInfo_n.getTot_pm_succ_Cnt());
        totalOutVo.setNTot_pm_succ_Amt(totalInfo_n.getTot_pm_succ_Amt());
        totalOutVo.setNTot_pm_succ_byeol_Cnt(totalInfo_n.getTot_pm_succ_byeol_Cnt());
        totalOutVo.setNTot_succ_Cnt(totalInfo_n.getTot_succ_Cnt());
        totalOutVo.setNTot_succ_Amt(totalInfo_n.getTot_succ_Amt());
        totalOutVo.setNTot_succ_byeol_Cnt(totalInfo_n.getTot_succ_byeol_Cnt());
        totalOutVo.setNTot_pay_amt(totalOutVo1.getSum_succAmt());

        List list = new ArrayList();
        for (int i=30; -1 < i; i --){
            P_ExchangeTotalOutDetailVo outVo = new P_ExchangeTotalOutDetailVo();
            outVo.setDay(Integer.toString(i+1));

            // 우측 (스폐셜, 일반)
            if(detailList_n.size() >= i+1) {
                if (detailList_n.get(i).getThe_date().substring(8).equals(DalbitUtil.lpad(Integer.toString(i+1),2,"0"))) {
                    outVo.setNSpecialdj_succ_Cnt(detailList_n.get(i).getSpecialdj_succ_Cnt());
                    outVo.setNSpecialdj_succ_Amt(detailList_n.get(i).getSpecialdj_succ_Amt());
                    outVo.setNSpecialdj_succ_byeol_Cnt(detailList_n.get(i).getSpecialdj_succ_byeol_Cnt());
                    outVo.setNPm_succ_Cnt(detailList_n.get(i).getPm_succ_Cnt());
                    outVo.setNPm_succ_Amt(detailList_n.get(i).getPm_succ_Amt());
                    outVo.setNPm_succ_byeol_Cnt(detailList_n.get(i).getPm_succ_byeol_Cnt());
                    outVo.setNSucc_Cnt(detailList_n.get(i).getSucc_Cnt());
                    outVo.setNSucc_Amt(detailList_n.get(i).getSucc_Amt());
                    outVo.setNSucc_byeol_Cnt(detailList_n.get(i).getSucc_byeol_Cnt());

                    // 우측 총계
                    if(detailList1.size() >= i+1) {
                        P_PayTotalOutDetailVo tempRight = (P_PayTotalOutDetailVo) detailList1.get(i);
                        if (tempRight.getDaily() != null) {
                            int nSum_succ_amt = detailList_n.get(i).getSpecialdj_succ_Amt() + detailList_n.get(i).getPm_succ_Amt() + detailList_n.get(i).getSucc_Amt();
                            outVo.setNSum_succ_cnt( detailList_n.get(i).getSpecialdj_succ_Cnt() + detailList_n.get(i).getPm_succ_Cnt() + detailList_n.get(i).getSucc_Cnt() );
                            outVo.setNSum_succ_amt(nSum_succ_amt);
                            int nSum_pay_amt = (int)Math.round(tempRight.getSuccAmt()/1.1);
                            outVo.setNSum_pay_amt(nSum_pay_amt);
                            outVo.setNSum_exchange_per( nSum_pay_amt == 0 ? "-" : String.format("%.2f", (nSum_succ_amt * 100.0 / nSum_pay_amt))+"%" );
                        }
                    }
                }
            }

            // 좌측 (스폐셜, 일반)
            if(detailList_b.size() >= i+1) {
                if (detailList_b.get(i).getThe_date().substring(8).equals(DalbitUtil.lpad(Integer.toString(i+1),2,"0"))) {
                    outVo.setSpecialdj_succ_Cnt(detailList_b.get(i).getSpecialdj_succ_Cnt());
                    outVo.setSpecialdj_succ_Amt(detailList_b.get(i).getSpecialdj_succ_Amt());
                    outVo.setSpecialdj_succ_byeol_Cnt(detailList_b.get(i).getSpecialdj_succ_byeol_Cnt());
                    outVo.setPm_succ_Cnt(detailList_b.get(i).getPm_succ_Cnt());
                    outVo.setPm_succ_Amt(detailList_b.get(i).getPm_succ_Amt());
                    outVo.setPm_succ_byeol_Cnt(detailList_b.get(i).getPm_succ_byeol_Cnt());
                    outVo.setSucc_Cnt(detailList_b.get(i).getSucc_Cnt());
                    outVo.setSucc_Amt(detailList_b.get(i).getSucc_Amt());
                    outVo.setSucc_byeol_Cnt(detailList_b.get(i).getSucc_byeol_Cnt());

                    // 좌측 총계
                    if(detailList0.size() >= i+1) {
                        P_PayTotalOutDetailVo tempLeft = (P_PayTotalOutDetailVo) detailList0.get(i);
                        if (tempLeft.getDaily() != null) {
                            int sum_succ_amt = detailList_b.get(i).getSpecialdj_succ_Amt() + detailList_b.get(i).getPm_succ_Amt() + detailList_b.get(i).getSucc_Amt();
                            outVo.setSum_succ_cnt( detailList_b.get(i).getSpecialdj_succ_Cnt() + detailList_b.get(i).getPm_succ_Cnt() + detailList_b.get(i).getSucc_Cnt() );
                            outVo.setSum_succ_amt(sum_succ_amt);
                            int sum_pay_amt = (int)Math.round(tempLeft.getSuccAmt()/1.1);
                            outVo.setSum_pay_amt(sum_pay_amt);
                            outVo.setSum_exchange_per( sum_pay_amt == 0 ? "-" : String.format("%.2f", (sum_succ_amt * 100.0 / sum_pay_amt))+"%" );
                        }
                    }
                }
            }
            list.add(outVo);
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalOutVo);
        result.put("detailList", list);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


    /**
     * 환전 통합현황 성별
     */
    public String callExchangeGender(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeGenderOutDetailVo> detailList_n = sta_ExchangeDao.callExchangeGender(procedureVo);
        P_ExchangeGenderOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ExchangeGenderOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        pStatVo.setStartDate(pStatVo.getBeforStartDate());
        pStatVo.setEndDate(pStatVo.getBeforEndDate());
        ProcedureVo procedureVo2 = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeGenderOutDetailVo> detailList_b = sta_ExchangeDao.callExchangeGender(procedureVo2);
        P_ExchangeGenderOutVo totalInfo_b = new Gson().fromJson(procedureVo2.getExt(), P_ExchangeGenderOutVo.class);
        if(Integer.parseInt(procedureVo2.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        totalInfo.setB_tot_specialdj_succ_mCnt(totalInfo_b.getTot_specialdj_succ_mCnt());
        totalInfo.setB_tot_specialdj_succ_mAmt(totalInfo_b.getTot_specialdj_succ_mAmt());
        totalInfo.setB_tot_specialdj_succ_byeol_mCnt(totalInfo_b.getTot_specialdj_succ_byeol_mCnt());
        totalInfo.setB_tot_specialdj_succ_fcnt(totalInfo_b.getTot_specialdj_succ_fcnt());
        totalInfo.setB_tot_specialdj_succ_fAmt(totalInfo_b.getTot_specialdj_succ_fAmt());
        totalInfo.setB_tot_specialdj_succ_byeol_fCnt(totalInfo_b.getTot_specialdj_succ_byeol_fCnt());
        totalInfo.setB_tot_specialdj_succ_nCnt(totalInfo_b.getTot_specialdj_succ_nCnt());
        totalInfo.setB_tot_specialdj_succ_nAmt(totalInfo_b.getTot_specialdj_succ_nAmt());
        totalInfo.setB_tot_specialdj_succ_byeol_nCnt(totalInfo_b.getTot_specialdj_succ_byeol_nCnt());

        totalInfo.setB_tot_pm_succ_mCnt(totalInfo_b.getTot_pm_succ_mCnt());
        totalInfo.setB_tot_pm_succ_mAmt(totalInfo_b.getTot_pm_succ_mAmt());
        totalInfo.setB_tot_pm_succ_byeol_mCnt(totalInfo_b.getTot_pm_succ_byeol_mCnt());
        totalInfo.setB_tot_pm_succ_fcnt(totalInfo_b.getTot_pm_succ_fcnt());
        totalInfo.setB_tot_pm_succ_fAmt(totalInfo_b.getTot_pm_succ_fAmt());
        totalInfo.setB_tot_pm_succ_byeol_fCnt(totalInfo_b.getTot_pm_succ_byeol_fCnt());
        totalInfo.setB_tot_pm_succ_nCnt(totalInfo_b.getTot_pm_succ_nCnt());
        totalInfo.setB_tot_pm_succ_nAmt(totalInfo_b.getTot_pm_succ_nAmt());
        totalInfo.setB_tot_pm_succ_byeol_nCnt(totalInfo_b.getTot_pm_succ_byeol_nCnt());

        totalInfo.setB_tot_succ_mCnt(totalInfo_b.getTot_succ_mCnt());
        totalInfo.setB_tot_succ_mAmt(totalInfo_b.getTot_succ_mAmt());
        totalInfo.setB_tot_succ_byeol_mCnt(totalInfo_b.getTot_succ_byeol_mCnt());
        totalInfo.setB_tot_succ_fCnt(totalInfo_b.getTot_succ_fCnt());
        totalInfo.setB_tot_succ_fAmt(totalInfo_b.getTot_succ_fAmt());
        totalInfo.setB_tot_succ_byeol_fCnt(totalInfo_b.getTot_succ_byeol_fCnt());
        totalInfo.setB_tot_succ_nCnt(totalInfo_b.getTot_succ_nCnt());
        totalInfo.setB_tot_succ_nAmt(totalInfo_b.getTot_succ_nAmt());
        totalInfo.setB_tot_succ_byeol_nCnt(totalInfo_b.getTot_succ_byeol_nCnt());

        List list = new ArrayList();
        for (int i=30; -1 < i; i --){
            P_ExchangeGenderOutDetailVo outVo = new P_ExchangeGenderOutDetailVo();
            outVo.setDay(Integer.toString(i+1));
            if(detailList_n.size() >= i+1) {
                if (detailList_n.get(i).getThe_date().substring(8).equals(DalbitUtil.lpad(Integer.toString(i+1),2,"0"))) {
                    outVo.setSpecialdj_succ_mCnt(detailList_n.get(i).getSpecialdj_succ_mCnt());
                    outVo.setSpecialdj_succ_mAmt(detailList_n.get(i).getSpecialdj_succ_mAmt());
                    outVo.setSpecialdj_succ_byeol_mCnt(detailList_n.get(i).getSpecialdj_succ_byeol_mCnt());
                    outVo.setSpecialdj_succ_fcnt(detailList_n.get(i).getSpecialdj_succ_fcnt());
                    outVo.setSpecialdj_succ_fAmt(detailList_n.get(i).getSpecialdj_succ_fAmt());
                    outVo.setSpecialdj_succ_byeol_fCnt(detailList_n.get(i).getSpecialdj_succ_byeol_fCnt());
                    outVo.setSpecialdj_succ_nCnt(detailList_n.get(i).getSpecialdj_succ_nCnt());
                    outVo.setSpecialdj_succ_nAmt(detailList_n.get(i).getSpecialdj_succ_nAmt());
                    outVo.setSpecialdj_succ_byeol_nCnt(detailList_n.get(i).getSpecialdj_succ_byeol_nCnt());
                    outVo.setPm_succ_mCnt(detailList_n.get(i).getPm_succ_mCnt());
                    outVo.setPm_succ_mAmt(detailList_n.get(i).getPm_succ_mAmt());
                    outVo.setPm_succ_byeol_mCnt(detailList_n.get(i).getPm_succ_byeol_mCnt());
                    outVo.setPm_succ_fcnt(detailList_n.get(i).getPm_succ_fcnt());
                    outVo.setPm_succ_fAmt(detailList_n.get(i).getPm_succ_fAmt());
                    outVo.setPm_succ_byeol_fCnt(detailList_n.get(i).getPm_succ_byeol_fCnt());
                    outVo.setPm_succ_nCnt(detailList_n.get(i).getPm_succ_nCnt());
                    outVo.setPm_succ_nAmt(detailList_n.get(i).getPm_succ_nAmt());
                    outVo.setPm_succ_byeol_nCnt(detailList_n.get(i).getPm_succ_byeol_nCnt());
                    outVo.setSucc_mCnt(detailList_n.get(i).getSucc_mCnt());
                    outVo.setSucc_mAmt(detailList_n.get(i).getSucc_mAmt());
                    outVo.setSucc_byeol_mCnt(detailList_n.get(i).getSucc_byeol_mCnt());
                    outVo.setSucc_fCnt(detailList_n.get(i).getSucc_fCnt());
                    outVo.setSucc_fAmt(detailList_n.get(i).getSucc_fAmt());
                    outVo.setSucc_byeol_fCnt(detailList_n.get(i).getSucc_byeol_fCnt());
                    outVo.setSucc_nCnt(detailList_n.get(i).getSucc_nCnt());
                    outVo.setSucc_nAmt(detailList_n.get(i).getSucc_nAmt());
                    outVo.setSucc_byeol_nCnt(detailList_n.get(i).getSucc_byeol_nCnt());
                }else{
                    outVo.setSpecialdj_succ_mCnt(0);
                    outVo.setSpecialdj_succ_mAmt(0);
                    outVo.setSpecialdj_succ_byeol_mCnt(0);
                    outVo.setSpecialdj_succ_fcnt(0);
                    outVo.setSpecialdj_succ_fAmt(0);
                    outVo.setSpecialdj_succ_byeol_fCnt(0);
                    outVo.setSpecialdj_succ_nCnt(0);
                    outVo.setSpecialdj_succ_nAmt(0);
                    outVo.setSpecialdj_succ_byeol_nCnt(0);
                    outVo.setPm_succ_mCnt(0);
                    outVo.setPm_succ_mAmt(0);
                    outVo.setPm_succ_byeol_mCnt(0);
                    outVo.setPm_succ_fcnt(0);
                    outVo.setPm_succ_fAmt(0);
                    outVo.setPm_succ_byeol_fCnt(0);
                    outVo.setPm_succ_nCnt(0);
                    outVo.setPm_succ_nAmt(0);
                    outVo.setPm_succ_byeol_nCnt(0);
                    outVo.setSucc_mCnt(0);
                    outVo.setSucc_mAmt(0);
                    outVo.setSucc_byeol_mCnt(0);
                    outVo.setSucc_fCnt(0);
                    outVo.setSucc_fAmt(0);
                    outVo.setSucc_byeol_fCnt(0);
                    outVo.setSucc_nCnt(0);
                    outVo.setSucc_nAmt(0);
                    outVo.setSucc_byeol_nCnt(0);
                }
            }else{
                outVo.setSpecialdj_succ_mCnt(0);
                outVo.setSpecialdj_succ_mAmt(0);
                outVo.setSpecialdj_succ_byeol_mCnt(0);
                outVo.setSpecialdj_succ_fcnt(0);
                outVo.setSpecialdj_succ_fAmt(0);
                outVo.setSpecialdj_succ_byeol_fCnt(0);
                outVo.setSpecialdj_succ_nCnt(0);
                outVo.setSpecialdj_succ_nAmt(0);
                outVo.setSpecialdj_succ_byeol_nCnt(0);
                outVo.setSucc_mCnt(0);
                outVo.setSucc_mAmt(0);
                outVo.setSucc_byeol_mCnt(0);
                outVo.setSucc_fCnt(0);
                outVo.setSucc_fAmt(0);
                outVo.setSucc_byeol_fCnt(0);
                outVo.setSucc_nCnt(0);
                outVo.setSucc_nAmt(0);
                outVo.setSucc_byeol_nCnt(0);
            }

            if(detailList_b.size() >= i+1) {
                if (detailList_b.get(i).getThe_date().substring(8).equals(DalbitUtil.lpad(Integer.toString(i+1),2,"0"))) {
                    outVo.setB_specialdj_succ_mCnt(detailList_b.get(i).getSpecialdj_succ_mCnt());
                    outVo.setB_specialdj_succ_mAmt(detailList_b.get(i).getSpecialdj_succ_mAmt());
                    outVo.setB_specialdj_succ_byeol_mCnt(detailList_b.get(i).getSpecialdj_succ_byeol_mCnt());
                    outVo.setB_specialdj_succ_fcnt(detailList_b.get(i).getSpecialdj_succ_fcnt());
                    outVo.setB_specialdj_succ_fAmt(detailList_b.get(i).getSpecialdj_succ_fAmt());
                    outVo.setB_specialdj_succ_byeol_fCnt(detailList_b.get(i).getSpecialdj_succ_byeol_fCnt());
                    outVo.setB_specialdj_succ_nCnt(detailList_b.get(i).getSpecialdj_succ_nCnt());
                    outVo.setB_specialdj_succ_nAmt(detailList_b.get(i).getSpecialdj_succ_nAmt());
                    outVo.setB_specialdj_succ_byeol_nCnt(detailList_b.get(i).getSpecialdj_succ_byeol_nCnt());
                    outVo.setB_succ_mCnt(detailList_b.get(i).getSucc_mCnt());
                    outVo.setB_succ_mAmt(detailList_b.get(i).getSucc_mAmt());
                    outVo.setB_succ_byeol_mCnt(detailList_b.get(i).getSucc_byeol_mCnt());
                    outVo.setB_succ_fCnt(detailList_b.get(i).getSucc_fCnt());
                    outVo.setB_succ_fAmt(detailList_b.get(i).getSucc_fAmt());
                    outVo.setB_succ_byeol_fCnt(detailList_b.get(i).getSucc_byeol_fCnt());
                    outVo.setB_succ_nCnt(detailList_b.get(i).getSucc_nCnt());
                    outVo.setB_succ_nAmt(detailList_b.get(i).getSucc_nAmt());
                    outVo.setB_succ_byeol_nCnt(detailList_b.get(i).getSucc_byeol_nCnt());
                }else{
                    outVo.setB_specialdj_succ_mCnt(0);
                    outVo.setB_specialdj_succ_mAmt(0);
                    outVo.setB_specialdj_succ_byeol_mCnt(0);
                    outVo.setB_specialdj_succ_fcnt(0);
                    outVo.setB_specialdj_succ_fAmt(0);
                    outVo.setB_specialdj_succ_byeol_fCnt(0);
                    outVo.setB_specialdj_succ_nCnt(0);
                    outVo.setB_specialdj_succ_nAmt(0);
                    outVo.setB_specialdj_succ_byeol_nCnt(0);
                    outVo.setB_succ_mCnt(0);
                    outVo.setB_succ_mAmt(0);
                    outVo.setB_succ_byeol_mCnt(0);
                    outVo.setB_succ_fCnt(0);
                    outVo.setB_succ_fAmt(0);
                    outVo.setB_succ_byeol_fCnt(0);
                    outVo.setB_succ_nCnt(0);
                    outVo.setB_succ_nAmt(0);
                    outVo.setB_succ_byeol_nCnt(0);
                }
            }else{
                outVo.setB_specialdj_succ_mCnt(0);
                outVo.setB_specialdj_succ_mAmt(0);
                outVo.setB_specialdj_succ_byeol_mCnt(0);
                outVo.setB_specialdj_succ_fcnt(0);
                outVo.setB_specialdj_succ_fAmt(0);
                outVo.setB_specialdj_succ_byeol_fCnt(0);
                outVo.setB_specialdj_succ_nCnt(0);
                outVo.setB_specialdj_succ_nAmt(0);
                outVo.setB_specialdj_succ_byeol_nCnt(0);
                outVo.setB_succ_mCnt(0);
                outVo.setB_succ_mAmt(0);
                outVo.setB_succ_byeol_mCnt(0);
                outVo.setB_succ_fCnt(0);
                outVo.setB_succ_fAmt(0);
                outVo.setB_succ_byeol_fCnt(0);
                outVo.setB_succ_nCnt(0);
                outVo.setB_succ_nAmt(0);
                outVo.setB_succ_byeol_nCnt(0);
            }
            list.add(outVo);
        }


        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", list);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 환전 통합현황 주별
     */
    public String callExchangeWeek(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_ExchangeWeekOutDetailVo> detailList = sta_ExchangeDao.callExchangeWeek(procedureVo);
        P_ExchangeWeekOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ExchangeWeekOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

}
