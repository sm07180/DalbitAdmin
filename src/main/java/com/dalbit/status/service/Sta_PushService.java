package com.dalbit.status.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_pushDetailOutputVo;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import com.dalbit.status.dao.Sta_PushDao;
import com.dalbit.status.vo.procedure.*;
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

@Slf4j
@Service
public class Sta_PushService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Sta_PushDao sta_PushDao;

    /**
     * Push발송 현황
     */
    public String callPushTotal(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_PushTotalOutDetailVo> detailList = sta_PushDao.callPushTotal(procedureVo);
        P_PushTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PushTotalOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 알림설정 현황
     */
    public String callNotice(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_NoticeOutDetailVo> detailList = sta_PushDao.callNotice(procedureVo);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


    /**
     * PUSH 발송 내역 조회
     */
    public String callPushHistoryList(P_PushHistoryInputVo pPushHistoryInputVo) {
        String result;

        int totalCnt = sta_PushDao.callPushHistoryListCnt(pPushHistoryInputVo);
        pPushHistoryInputVo.setTotalCnt(totalCnt);
        ArrayList<P_PushHistoryOutputVo> historyList = sta_PushDao.callPushHistoryList(pPushHistoryInputVo);

        if(historyList != null && historyList.size() > 0) {
            P_PushHistoryOutputVo summary = sta_PushDao.callPushHistorySummary(pPushHistoryInputVo);

            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, historyList, new PagingVo(pPushHistoryInputVo.getTotalCnt(), pPushHistoryInputVo.getPageStart(), pPushHistoryInputVo.getPageCnt()), summary));
        }else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, new ArrayList<P_PushHistoryOutputVo>(), new PagingVo(pPushHistoryInputVo.getTotalCnt(), pPushHistoryInputVo.getPageStart(), pPushHistoryInputVo.getPageCnt())));
        }

        return result;
    }


    /** PUSH 발송 내역 상세 조회 */
    public String callPushHistoryDetail(P_PushHistoryInputVo pPushHistoryInputVo) {
        String result;

        P_pushDetailOutputVo pPushDetailOutputVo = sta_PushDao.callPushHistoryDetail(pPushHistoryInputVo);

        List<P_MemberListOutputVo> memInfo = sta_PushDao.selectTargetMemInfo(pPushHistoryInputVo);

        pPushDetailOutputVo.setMem_info(memInfo);

        if (pPushDetailOutputVo != null) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, pPushDetailOutputVo));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        return result;
    }

}
