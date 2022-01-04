package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_tothemoonProc;
import com.dalbit.content.vo.procedure.P_ToTheMoonInputVo;
import com.dalbit.content.vo.procedure.P_ToTheMoonListOutputVo;
import com.dalbit.content.vo.procedure.P_ToTheMoonStatusVo;
import com.dalbit.content.vo.procedure.P_WelcomeInputVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_ToTheMoonEventService {
    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Event_tothemoonProc Event_tothemoonProc;

    /**
     * 캐릭터보상 목록
     *
     * @param pToTheMoonInputVo
     * @return
     */
    public String callToTheMoonList(P_ToTheMoonInputVo pToTheMoonInputVo) {
        List<Object> getList = Event_tothemoonProc.getToTheMoonList(pToTheMoonInputVo);
        P_ToTheMoonStatusVo pToTheMoonStatusVo = DBUtil.getData(getList, P_ToTheMoonStatusVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_ToTheMoonListOutputVo> list = DBUtil.getList(getList, P_ToTheMoonListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("rewordData", pToTheMoonStatusVo);
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
}
