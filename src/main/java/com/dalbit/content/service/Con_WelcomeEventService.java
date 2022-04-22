package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_welcomeProc;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
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
     * 웰컴 설정 상세
     * @return
     */
    public String callWelcomeSetting() {
        String welcome_set = event_welcomeProc.getSetting();

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("welcomeSet", welcome_set);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 웰컴 설정 수정
     * @param pWelcomeSetInputVo
     * @return
     */
    public String callWelcomeModifySetting(P_WelcomeSetInputVo pWelcomeSetInputVo) {
        pWelcomeSetInputVo.setChrgrName(MemberVo.getMyMemNo());
        int result = event_welcomeProc.modifySetting(pWelcomeSetInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("s_return", result);
        String s_return = gsonUtil.toJson(resHashMap);
        return s_return;
    }

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
    public String callModifyWelcomeGift(P_WelcomeUserGiftInputVo pWelcomeGiftInputVo) {
        HashMap resHashMap = new HashMap();
        try {
            for (P_WelcomeUserGiftInputVo item : pWelcomeGiftInputVo.getList()) {
                item.setChrgrName(MemberVo.getMyMemNo());
                event_welcomeProc.modifyWelcomeUserGift(item);
            }
            resHashMap.put("result", new JsonOutputVo(Status.처리완료));
        } catch (Exception e) {
            resHashMap.put("result", new JsonOutputVo(Status.파라미터오류));
        }
        return gsonUtil.toJson(resHashMap);
    }

    /**
     * 상품 목록 - 사용월
     *
     * @param pWelcomeGiftInputVo
     * @return
     */
    public String callGiftList(P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeGiftList(pWelcomeGiftInputVo);
        List<P_WelcomeGiftOutputVo> list = DBUtil.getList(getList, P_WelcomeGiftOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 상품 목표 등록/수정
     *
     * @param pWelcomeQualifyInputVo
     * @return
     */
    public String callCreateGiftAdminGoals(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo) {
        HashMap resHashMap = new HashMap();
        int result = 0;
        try {
            for (P_WelcomeQualifyInputVo item : pWelcomeQualifyInputVo.getList()) {
                item.setChrgrName(MemberVo.getMyMemNo());
                if (item.getQualifyNo() > 0) { // 등록
                    int modifyCnt = event_welcomeProc.modifyWelcomeGiftQualify(item);
                    if (modifyCnt < 0) modifyCnt = 0;
                    result += modifyCnt;
                } else { // 수정
                    result += event_welcomeProc.createWelcomeGiftQualify(item);
                }
            }
            resHashMap.put("applyCnt", result);
            resHashMap.put("result", new JsonOutputVo(Status.처리완료));
        } catch (Exception e) {
            resHashMap.put("applyCnt", result);
            resHashMap.put("result", new JsonOutputVo(Status.파라미터오류));
        }
        return gsonUtil.toJson(resHashMap);
    }

    /**
     * 단계별 조건 목록 - 사용월
     *
     * @param pWelcomeQualifyInputVo
     * @return
     */
    public String callGiftQualifyList(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo) {
        List<Object> getList = event_welcomeProc.getWelcomeGifQualifyList(pWelcomeQualifyInputVo);
        List<P_WelcomeQualifyOutputVo> list = DBUtil.getList(getList, P_WelcomeQualifyOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 상품 목록 등록/수정
     *
     * @param pWelcomeGiftInputVo
     * @return
     */
    public String callCreateGiftAdminSections(P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        HashMap resHashMap = new HashMap();
        int result = 0;
        try {
            for (P_WelcomeGiftInputVo item : pWelcomeGiftInputVo.getList()) {
                item.setChrgrName(MemberVo.getMyMemNo());
                if ("n".equals(item.getModifyYn())) { // 등록
                    result += event_welcomeProc.createWelcomeGift(item);
                } else { // 수정
                    result += event_welcomeProc.modifyWelcomeGift(item);
                }
            }
            resHashMap.put("applyCnt", result);
            resHashMap.put("result", new JsonOutputVo(Status.처리완료));
        } catch (Exception e) {
            resHashMap.put("applyCnt", result);
            resHashMap.put("result", new JsonOutputVo(Status.파라미터오류));
        }
        return gsonUtil.toJson(resHashMap);
    }
}
