package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_KkanbuProc;
import com.dalbit.content.vo.procedure.P_KkanbuBetListInputVo;
import com.dalbit.content.vo.procedure.P_KkanbuBetListOutputVo;
import com.dalbit.content.vo.procedure.P_KkanbuBetTotalOutputVo;
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

    public String callKkanbuRankList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuBetList(p_kkanbuBetListInputVo);
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

    public String callKkanbuBetList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuBetList(p_kkanbuBetListInputVo);
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

    public String callKkanbuMarbleList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuBetList(p_kkanbuBetListInputVo);
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

    public String callKkanbuList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        List<Object> getList = event_kkanbuProc.getKkanbuBetList(p_kkanbuBetListInputVo);
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
}
