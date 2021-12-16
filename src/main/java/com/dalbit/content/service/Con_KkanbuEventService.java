package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_KkanbuProc;
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
public class Con_KkanbuEventService {
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Event_KkanbuProc event_kkanbuProc;

    /**
     * 깐부 베팅 내역
     * @param p_kkanbuListInputVo
     * @return
     */
    public String callKkanbuBetList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuBetList(p_kkanbuListInputVo);
        List<P_KkanbuBetListOutputVo> list = DBUtil.getList(getList, P_KkanbuBetListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        P_KkanbuBetTotalOutputVo sectionData = DBUtil.getData(getList, P_KkanbuBetTotalOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("sectonData", sectionData);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 구슬 주머니 -  내역
     * @param p_kkanbuListInputVo
     * @return
     */
    public String callKkanbuMarbleList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuMarbleList(p_kkanbuListInputVo);
        List<P_KkanbuMarbleListOutputVo> list = DBUtil.getList(getList, P_KkanbuMarbleListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 구슬 주머니 - 점수
     * @param p_kkanbuListInputVo
     * @return
     */
    public String callKkanbuMarblePointList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuMarblePointList(p_kkanbuListInputVo);
        List<P_KkanbuMarblePointListOutputVo> list = DBUtil.getList(getList, P_KkanbuMarblePointListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        P_KkanbuMarblePointTotalOutputVo sectionData = DBUtil.getData(getList, P_KkanbuMarblePointTotalOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("sectonData", sectionData);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 깐부게임 - 신청내역
     * @param p_kkanbuListInputVo
     * @return
     */
    public String callKkanbuList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuReqList(p_kkanbuListInputVo);

        List<P_KkanbuReqListOutputVo> list = DBUtil.getList(getList, P_KkanbuReqListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 깐부순위
     * @param p_kkanbuListInputVo
     * @return
     */
    public String callKkanbuRankList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuRankList(p_kkanbuListInputVo);

        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_KkanbuRankListOutputVo> list = DBUtil.getList(getList, P_KkanbuRankListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 깐부 회원내역 - tabSlct: m(구슬)
     *
     * @param p_kkanbuMemSelInputVo
     * @return
     */
    public String callKkanbuMemSelMarbleList(P_KkanbuMemSelInputVo p_kkanbuMemSelInputVo) {
        p_kkanbuMemSelInputVo.setTabSlct("m");
        List<Object> getList = event_kkanbuProc.getKkanbuMemSelMarbleList(p_kkanbuMemSelInputVo);

        P_KkanbuMemSelOutputVo memData = DBUtil.getData(getList, P_KkanbuMemSelOutputVo.class);
        P_KkanbuMemSelTotalOutputVo sectionData = DBUtil.getData(getList, P_KkanbuMemSelTotalOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_KkanbuMemSelMarbleListOutputVo> list = DBUtil.getList(getList, P_KkanbuMemSelMarbleListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("memData", memData);
        resHashMap.put("sectionData", sectionData);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    /**
     * 깐부 회원내역 - tabSlct: p(주머니)
     *
     * @param p_kkanbuMemSelInputVo
     * @return
     */
    public String callKkanbuMemSelMarblePointList(P_KkanbuMemSelInputVo p_kkanbuMemSelInputVo) {
        p_kkanbuMemSelInputVo.setTabSlct("p");
        List<Object> getList = event_kkanbuProc.getKkanbuMemSelMarbleList(p_kkanbuMemSelInputVo);

        P_KkanbuMemSelOutputVo memData = DBUtil.getData(getList, P_KkanbuMemSelOutputVo.class);
        P_KkanbuMemSelTotalOutputVo sectionData = DBUtil.getData(getList, P_KkanbuMemSelTotalOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_KkanbuMemSelMarbleListOutputVo> list = DBUtil.getList(getList, P_KkanbuMemSelMarbleListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("memData", memData);
        resHashMap.put("sectionData", sectionData);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
}
