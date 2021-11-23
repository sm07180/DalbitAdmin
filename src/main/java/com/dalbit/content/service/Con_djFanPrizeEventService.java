package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_djFanProc;
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
public class Con_djFanPrizeEventService {
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Event_djFanProc eventDjFanProc;

    public String callDjFanPrizeEventFanList(P_DjFanPrizeFanListInputVo pDjFanPrizeFanListInputVo) {
        List<Object> getList = eventDjFanProc.getDjFanPrizeFanList(pDjFanPrizeFanListInputVo);
        List<P_DjFanPrizeFanListOutputVo> list = DBUtil.getList(getList, P_DjFanPrizeFanListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        P_DjFanPrizeFanSectionOutputVo sectionData = DBUtil.getData(getList, P_DjFanPrizeFanSectionOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("sectonData", sectionData);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callDjFanPrizeEventFanTotalList(P_DjFanPrizeFanTotalListInputVo pDjFanPrizeFanTotalListInputVo) {
        List<Object> getList = eventDjFanProc.getDjFanPrizeFanTotalList(pDjFanPrizeFanTotalListInputVo);
        List<P_DjFanPrizeFanTotalListOutputVo> list = DBUtil.getList(getList, P_DjFanPrizeFanTotalListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callDjFanPrizeEventDjList(P_DjFanPrizeDjListInputVo pDjFanPrizeDjListInputVo) {
        List<Object> getList = eventDjFanProc.getDjFanPrizeDjList(pDjFanPrizeDjListInputVo);
        List<P_DjFanPrizeDjListOutputVo> list = DBUtil.getList(getList, P_DjFanPrizeDjListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
}
