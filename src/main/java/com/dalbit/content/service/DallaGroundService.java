package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_dallGroundProc;
import com.dalbit.content.vo.GroundInputVo;
import com.dalbit.content.vo.GroundListVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class DallaGroundService {
    @Autowired GsonUtil gsonUtil;
    @Autowired Event_dallGroundProc event_dallGroundProc;

    /**
     * ##### 달라그라운드 순위내역(어드민)
     */
    public String dallaGroundPage(GroundInputVo groundInputVo) {
        Map<String, Object> result = new HashMap<>();
        try {
            List<Object> procResult = event_dallGroundProc.teamGroundRankList(groundInputVo);
            Integer cnt = DBUtil.getData(procResult, Integer.class, true);
            List<GroundListVo> list = DBUtil.getList(procResult, GroundListVo.class);

            result.put("cnt", cnt != null ? cnt : 0);
            result.put("list", list);
        } catch (Exception e) {
            log.error("DallaGroundService dallaGroundPage error => ", e);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
