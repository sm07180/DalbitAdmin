package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_drawProc;
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
public class Con_drawEventService {
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Event_drawProc eventDrawProc;

    public String callDrawEventList(P_DrawEventListInputVo pDrawEventListInputVo) {
        List<Object> getList = eventDrawProc.getDrawList(pDrawEventListInputVo);
        List<P_DrawEventListOutputVo> list = DBUtil.getList(getList, P_DrawEventListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
}
