package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_welcomeProc;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_WelcomeEventService {
    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Event_welcomeProc event_welcomeProc;

    /**
     * 청취자 전체 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    public String callWelcomeListenerList(P_WelcomeInputVo pWelcomeInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeListenerList(pWelcomeInputVo);
        List<P_WelcomeTotalListOutputVo> list = DBUtil.getList(getList, P_WelcomeTotalListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 청취자 단계별 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    public String callWelcomeListenerStepList(P_WelcomeInputVo pWelcomeInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeListenerStepList(pWelcomeInputVo);
        List<P_WelcomeListenersStepOutputVo> list = DBUtil.getList(getList, P_WelcomeListenersStepOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_WelcomeStatusOutputVo> sectionList = DBUtil.getList(getList, P_WelcomeStatusOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("sectionList", sectionList);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * DJ 전체 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    public String callWelcomeDjList(P_WelcomeInputVo pWelcomeInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeDjList(pWelcomeInputVo);
        List<P_WelcomeTotalListOutputVo> list = DBUtil.getList(getList, P_WelcomeTotalListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * DJ 단계별 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    public String callWelcomeDjStepList(P_WelcomeInputVo pWelcomeInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeDjStepList(pWelcomeInputVo);
        List<P_WelcomeDjStepOutputVo> list = DBUtil.getList(getList, P_WelcomeDjStepOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_WelcomeStatusOutputVo> sectionList = DBUtil.getList(getList, P_WelcomeStatusOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("sectionList", sectionList);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 지급완료 설정
     *
     * @param pWelcomeGiftInputVo
     * @return
     */
    public String callModifyWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        String result;
        HashMap resHashMap = new HashMap();

        P_WelcomeGiftInputVo CwelcomeGiftInputVo = new P_WelcomeGiftInputVo();
        try {
            CwelcomeGiftInputVo.setGiftSlct(pWelcomeGiftInputVo.getGiftSlct());
            CwelcomeGiftInputVo.setStepNo(pWelcomeGiftInputVo.getStepNo());
            CwelcomeGiftInputVo.setDelChrgrName(pWelcomeGiftInputVo.getDelChrgrName());

            String[] memNoList = pWelcomeGiftInputVo.getMemNo().split(",");
            for (int i = 0; i < memNoList.length; i++) {
                CwelcomeGiftInputVo.setMemNo(memNoList[i]);
                event_welcomeProc.modifyWelcomeGift(CwelcomeGiftInputVo);
            }
            result = gsonUtil.toJson(new JsonOutputVo(Status.처리완료));
        } catch (Exception e) {
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
        }
        result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
