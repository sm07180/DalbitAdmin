package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_dallGroundProc;
import com.dalbit.content.vo.GroundListVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class DallaGroundService {
    @Autowired GsonUtil gsonUtil;
    @Autowired Event_dallGroundProc event_dallGroundProc;

    public String dallaGroundPage() {
        Map<String, Object> result = new HashMap<>();
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("groundNo", 1);
            param.put("pageNo", 1);
            param.put("pagePerCnt", 9999);
            List<Object> procResult = event_dallGroundProc.teamGroundRankList(param);
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
